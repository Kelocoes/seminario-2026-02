import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/create_routine_page.dart';

class CreateRoutineScreen extends StatelessWidget {
  const CreateRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Rutina'),
      ),
      body: const SafeArea(
        child: CreateRoutinePage(),
      ),
    );
  }
}
