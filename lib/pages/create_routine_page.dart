import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/exercise.dart';
import 'package:seminario_2026_02/model/mock_data.dart';
import 'package:seminario_2026_02/model/routine.dart';

class CreateRoutinePage extends StatefulWidget {
  const CreateRoutinePage({super.key});

  @override
  State<CreateRoutinePage> createState() => _CreateRoutinePageState();
}

class _CreateRoutinePageState extends State<CreateRoutinePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Exercise> _selectedExercises = [];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveRoutine() {
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa un nombre para la rutina.')),
      );
      return;
    }

    final newRoutine = Routine(
      name: name,
      description: description,
      exercises: List<Exercise>.from(_selectedExercises),
    );

    debugPrint('Rutina guardada: ${newRoutine.name}');

    Navigator.pop(context, newRoutine);
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
        ...availableExercises.map((exercise) {
          final isSelected = _selectedExercises.contains(exercise);
          return CheckboxListTile(
            value: isSelected,
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
          );
        }),
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: _saveRoutine,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
          ),
          child: const Text('Guardar Rutina', style: TextStyle(fontSize: 16.0)),
        ),
      ],
    );
  }
}
