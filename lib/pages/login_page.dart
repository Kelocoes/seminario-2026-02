import 'package:flutter/material.dart';

/// ============================================================================
/// PÁGINA: LOGIN (lib/pages/login_page.dart)
/// ============================================================================
/// Siguiendo las reglas arquitectónicas del proyecto:
/// - Esta vista es una PAGE: NUNCA incluye Scaffold propio (lo provee LoginScreen).
/// - Diseñada con SingleChildScrollView para evitar desbordamientos (RenderFlex overflow)
///   cuando aparece el teclado virtual en pantalla.
/// - Contiene los campos de usuario (o correo), contraseña y la acción de recuperación.
class LoginPage extends StatefulWidget {
  final VoidCallback? onLoginSuccess;
  final VoidCallback? onForgotPassword;

  const LoginPage({
    super.key,
    this.onLoginSuccess,
    this.onForgotPassword,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // Simulación pedagógica de inicio de sesión
      final username = _usernameController.text.trim();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Iniciando sesión con el usuario: $username'),
          backgroundColor: Colors.deepPurple,
        ),
      );
      widget.onLoginSuccess?.call();
    }
  }

  void _handleForgotPassword() {
    if (widget.onForgotPassword != null) {
      widget.onForgotPassword!();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Navegando a la recuperación de contraseña...'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // SingleChildScrollView previene que el teclado de Android/iOS genere un RenderFlex Overflow
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Encabezado visual
            Icon(
              Icons.lock_person_outlined,
              size: 80,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Bienvenido de nuevo',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ingresa tus credenciales para continuar',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 36),

            // Campo de Usuario / Email
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Usuario o Correo Electrónico',
                hintText: 'ejemplo@correo.com',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Por favor ingresa tu usuario o correo';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Campo de Contraseña
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: '••••••••',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Por favor ingresa tu contraseña';
                }
                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),

            // Enlace: Olvidaste tu contraseña
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _handleForgotPassword,
                child: const Text('¿Olvidaste tu contraseña?'),
              ),
            ),
            const SizedBox(height: 24),

            // Botón de Iniciar Sesión
            FilledButton(
              onPressed: _handleLogin,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
