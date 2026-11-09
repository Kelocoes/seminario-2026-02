import 'package:seminario_2026_02/model/exercise.dart';

class Routine {
  final int? id;
  final String name;
  final String description;
  final List<Exercise> exercises;

  const Routine({
    this.id,
    required this.name,
    required this.description,
    this.exercises = const [],
  });

  factory Routine.fromMap(Map<String, dynamic> map) {
    final links = map['routine_exercises'] as List<dynamic>;
    return Routine(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      exercises: [
        for (final link in links) Exercise.fromMap(link['exercises']),
      ],
    );
  }

  Map<String, dynamic> toMap() => {'name': name, 'description': description};
}
