import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/login_page.dart';
import 'package:seminario_2026_02/screens/layout_demo_screen.dart';

/// ============================================================================
/// SCREEN: LOGIN (lib/screens/login_screen.dart)
/// ============================================================================
/// Siguiendo las directrices arquitectónicas:
/// - Esta SCREEN es la encargada de proveer el Scaffold (AppBar, fondo, navegación).
/// - Aloja a [LoginPage] en su `body`.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Ir a Demo de Layouts',
            icon: const Icon(Icons.dashboard_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LayoutDemoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: LoginPage(
          onLoginSuccess: () {
            // Ejemplo pedagógico: Navegar a la pantalla principal tras iniciar sesión
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LayoutDemoScreen(),
              ),
            );
          },
          onForgotPassword: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Recuperar Contraseña'),
                content: const Text(
                  'Se enviarán instrucciones de recuperación al correo registrado.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Entendido'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
