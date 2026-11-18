import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/exercise.dart';
import 'package:seminario_2026_02/model/mock_data.dart';
import 'package:seminario_2026_02/services/exercise_service.dart';
import 'package:seminario_2026_02/widgets/exercise_tile.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final TextEditingController _searchController = TextEditingController();
  final ExerciseService _exerciseService = ExerciseService();
  List<Exercise> _filteredExercises = List<Exercise>.from(availableExercises);
  bool _loadingResume = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterExercises(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredExercises = List<Exercise>.from(availableExercises);
      } else {
        _filteredExercises = availableExercises
            .where((exercise) =>
                exercise.name.toLowerCase().contains(query.toLowerCase()) ||
                exercise.type.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> _showResumeDialog() async {
    setState(() => _loadingResume = true);
    try {
      final data = await _exerciseService.typeResume();
      final porTipo = Map<String, dynamic>.from(data['porTipo'] as Map);

      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Resumen de ejercicios'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total: ${data['totalEjercicios']} ejercicios'),
              Text('Duración total: ${data['totalMinutos']} min'),
              const SizedBox(height: 12),
              for (final entry in porTipo.entries)
                Text('${entry.key}: ${entry.value}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceFirst('Exception: ', ''))),
      );
    } finally {
      if (mounted) setState(() => _loadingResume = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Buscar ejercicios',
              hintText: 'Ej. Sentadillas, Cardio...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _filterExercises('');
                      },
                    )
                  : null,
              border: const OutlineInputBorder(),
            ),
            onChanged: _filterExercises,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _loadingResume ? null : _showResumeDialog,
              icon: const Icon(Icons.analytics_outlined),
              label: Text(
                _loadingResume ? 'Cargando...' : 'Ver resumen',
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: _filteredExercises.isEmpty
              ? const Center(
                  child: Text('No se encontraron ejercicios con ese criterio.'),
                )
              : ListView.builder(
                  itemCount: _filteredExercises.length,
                  itemBuilder: (context, index) {
                    return ExerciseTile(exercise: _filteredExercises[index]);
                  },
                ),
        ),
      ],
    );
  }
}
