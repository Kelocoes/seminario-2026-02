import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/routines_page.dart';

class RoutinesScreen extends StatelessWidget {
  const RoutinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Rutinas'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: RoutinesPage(),
      ),
    );
  }
}
