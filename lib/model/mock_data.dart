import 'package:seminario_2026_02/model/exercise.dart';
import 'package:seminario_2026_02/model/routine.dart';

const List<Exercise> availableExercises = [
  Exercise(name: 'Sentadillas', type: 'Fuerza', durationMinutes: 15),
  Exercise(name: 'Flexiones de pecho', type: 'Fuerza', durationMinutes: 10),
  Exercise(name: 'Burpees', type: 'Cardio', durationMinutes: 12),
  Exercise(name: 'Plancha abdominal', type: 'Core', durationMinutes: 8),
  Exercise(name: 'Zancadas con salto', type: 'Cardio', durationMinutes: 10),
  Exercise(name: 'Estiramientos dinámicos', type: 'Flexibilidad', durationMinutes: 5),
];

const List<Routine> initialRoutines = [
  Routine(
    name: 'Pierna y Glúteo',
    description: 'Enfoque en tren inferior con ejercicios de alta intensidad.',
    exercises: [
      Exercise(name: 'Sentadillas', type: 'Fuerza', durationMinutes: 15),
      Exercise(name: 'Zancadas con salto', type: 'Cardio', durationMinutes: 10),
    ],
  ),
  Routine(
    name: 'Torso y Fuerza',
    description: 'Trabajo integral de pecho, espalda y core.',
    exercises: [
      Exercise(name: 'Flexiones de pecho', type: 'Fuerza', durationMinutes: 10),
      Exercise(name: 'Plancha abdominal', type: 'Core', durationMinutes: 8),
    ],
  ),
  Routine(
    name: 'Cardio HIIT Express',
    description: 'Sesión rápida para elevar pulsaciones y quemar calorías.',
    exercises: [
      Exercise(name: 'Burpees', type: 'Cardio', durationMinutes: 12),
      Exercise(name: 'Estiramientos dinámicos', type: 'Flexibilidad', durationMinutes: 5),
    ],
  ),
];
