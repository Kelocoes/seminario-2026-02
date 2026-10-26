import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/exercise.dart';
import 'package:seminario_2026_02/model/mock_data.dart';
import 'package:seminario_2026_02/widgets/exercise_tile.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Exercise> _filteredExercises = List<Exercise>.from(availableExercises);

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
