import 'package:flutter/material.dart';
import 'package:seminario_2026_02/screens/login_screen.dart';
import 'package:seminario_2026_02/screens/main_screen.dart';
import 'package:seminario_2026_02/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Decide que pantalla mostrar segun haya sesion o no.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final servicio = AuthService();
    return StreamBuilder<AuthState>(
      stream: servicio.cambios,
      builder: (context, snapshot) {
        final sesion = snapshot.data?.session ?? servicio.sesion;
        return sesion == null ? const LoginScreen() : const MainScreen();
      },
    );
  }
}
