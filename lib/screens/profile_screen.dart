import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/profile_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: ProfilePage(),
      ),
    );
  }
}
