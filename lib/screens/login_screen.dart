import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/login_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: LoginPage(),
      ),
    );
  }
}
