import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/routine.dart';
import 'package:seminario_2026_02/widgets/exercise_tile.dart';

class RoutineDetailPage extends StatelessWidget {
  final Routine routine;

  const RoutineDetailPage({
    super.key,
    required this.routine,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  routine.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  routine.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    const Icon(Icons.fitness_center, size: 18.0, color: Colors.deepPurple),
                    const SizedBox(width: 6.0),
                    Text(
                      '${routine.exercises.length} ejercicios incluidos',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            'Ejercicios de la Rutina',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 8.0),
        if (routine.exercises.isEmpty)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text('Esta rutina aún no tiene ejercicios asignados.'),
            ),
          )
        else
          ...routine.exercises.map(
            (exercise) => ExerciseTile(exercise: exercise),
          ),
      ],
    );
  }
}
