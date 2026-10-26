import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/exercises_page.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Ejercicios'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: ExercisesPage(),
      ),
    );
  }
}
