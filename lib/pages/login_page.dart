import 'package:flutter/material.dart';
import 'package:seminario_2026_02/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _servicio = AuthService();
  bool _cargando = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _enviar({required bool registro}) async {
    setState(() => _cargando = true);
    try {
      final email = _usernameController.text.trim();
      final password = _passwordController.text;
      if (registro) {
        await _servicio.registrar(email, password);
      } else {
        await _servicio.iniciarSesion(email, password);
      }
      // Sin Navigator: AuthGate cambia sola de pantalla.
    } on AuthException catch (e) {
      debugPrint('Error de autenticación: ${e.message}');
    } catch (e) {
      debugPrint('Error inesperado: $e');
    } finally {
      if (mounted) setState(() => _cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32.0),
          const Icon(
            Icons.fitness_center,
            size: 80.0,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 16.0),
          Text(
            'Bienvenido a Rutinas App',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Inicia sesión para gestionar tus entrenamientos',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32.0),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Correo',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24.0),
          if (_cargando)
            const Center(child: CircularProgressIndicator())
          else ...[
            ElevatedButton(
              onPressed: () => _enviar(registro: false),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
              child: const Text('Ingresar', style: TextStyle(fontSize: 16.0)),
            ),
            TextButton(
              onPressed: () => _enviar(registro: true),
              child: const Text('Crear cuenta'),
            ),
          ],
        ],
      ),
    );
  }
}
