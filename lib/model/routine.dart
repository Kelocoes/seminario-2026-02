import 'package:seminario_2026_02/model/exercise.dart';

class Routine {
  final String name;
  final String description;
  final List<Exercise> exercises;

  const Routine({
    required this.name,
    required this.description,
    this.exercises = const [],
  });
}
