import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/exercise.dart';
import 'package:seminario_2026_02/model/routine.dart';
import 'package:seminario_2026_02/services/exercise_service.dart';
import 'package:seminario_2026_02/services/routine_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateRoutinePage extends StatefulWidget {
  const CreateRoutinePage({super.key});

  @override
  State<CreateRoutinePage> createState() => _CreateRoutinePageState();
}

class _CreateRoutinePageState extends State<CreateRoutinePage> {
  final _exerciseService = ExerciseService();
  final _routineService = RoutineService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Exercise> _selectedExercises = [];

  bool _loadingExercises = true;
  String? _exercisesError;
  List<Exercise> _availableExercises = [];
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _loadExercises() async {
    setState(() {
      _loadingExercises = true;
      _exercisesError = null;
    });
    try {
      final exercises = await _exerciseService.list();
      if (!mounted) return;
      setState(() => _availableExercises = exercises);
    } on PostgrestException catch (e) {
      if (!mounted) return;
      setState(() => _exercisesError = e.message);
    } catch (e) {
      if (!mounted) return;
      setState(() => _exercisesError = 'Sin conexión');
    } finally {
      if (mounted) setState(() => _loadingExercises = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _saveRoutine() async {
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();

    if (name.isEmpty) {
      _showMessage('Por favor ingresa un nombre para la rutina.');
      return;
    }

    setState(() => _saving = true);
    try {
      final created = await _routineService.create(
        Routine(
          name: name,
          description: description,
          exercises: List<Exercise>.from(_selectedExercises),
        ),
      );
      if (!mounted) return;
      Navigator.pop(context, created);
    } on PostgrestException catch (e) {
      if (!mounted) return;
      _showMessage('No se pudo guardar: ${e.message}');
    } catch (e) {
      if (!mounted) return;
      _showMessage('No se pudo guardar: sin conexión');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Nombre de la Rutina',
            hintText: 'Ej. Pierna Intensa, Abdominales Pro',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _descriptionController,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Descripción',
            hintText: 'Describe el objetivo o enfoque de la sesión',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24.0),
        Text(
          'Agregar Ejercicios Existentes',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8.0),
        ..._exerciseList(),
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: _saving ? null : _saveRoutine,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
          ),
          child: _saving
              ? const SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                )
              : const Text('Guardar Rutina', style: TextStyle(fontSize: 16.0)),
        ),
      ],
    );
  }

  List<Widget> _exerciseList() {
    if (_loadingExercises) {
      return const [Center(child: CircularProgressIndicator())];
    }
    if (_exercisesError != null) {
      return [
        Text(_exercisesError!),
        const SizedBox(height: 8.0),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton(
            onPressed: _loadExercises,
            child: const Text('Reintentar'),
          ),
        ),
      ];
    }
    return [
      for (final exercise in _availableExercises)
        CheckboxListTile(
          value: _selectedExercises.contains(exercise),
          title: Text(exercise.name),
          subtitle: Text('${exercise.type} • ${exercise.durationMinutes} min'),
          onChanged: (bool? value) {
            setState(() {
              if (value == true) {
                _selectedExercises.add(exercise);
              } else {
                _selectedExercises.remove(exercise);
              }
            });
          },
        ),
    ];
  }
}
