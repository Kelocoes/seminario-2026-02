import 'package:flutter/material.dart';
import 'package:seminario_2026_02/widgets/stat_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _logout() {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        const SizedBox(height: 16.0),
        const Center(
          child: CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.deepPurple,
            child: Icon(
              Icons.person,
              size: 60.0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Esteban Romero',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'esteban.romero@u.icesi.edu.co',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 32.0),
        const Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatItem(label: 'Rutinas', value: '3'),
                StatItem(label: 'Ejercicios', value: '6'),
                StatItem(label: 'Nivel', value: 'Intermedio'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32.0),
        OutlinedButton.icon(
          onPressed: _logout,
          icon: const Icon(Icons.logout, color: Colors.red),
          label: const Text(
            'Cerrar Sesión',
            style: TextStyle(color: Colors.red),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            padding: const EdgeInsets.symmetric(vertical: 14.0),
          ),
        ),
      ],
    );
  }
}
