import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/exercise.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final Widget? trailing;

  const ExerciseTile({
    super.key,
    required this.exercise,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            '${exercise.durationMinutes}\'',
            style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(exercise.name),
        subtitle: Text('${exercise.type} • ${exercise.durationMinutes} min'),
        trailing: trailing,
      ),
    );
  }
}
