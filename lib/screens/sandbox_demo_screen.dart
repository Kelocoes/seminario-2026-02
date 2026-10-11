import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/contador_page.dart';
import 'package:seminario_2026_02/pages/ejercicios_page.dart';

/// ============================================================================
/// CONVENCIÓN SCREEN frente a PAGE:
/// ============================================================================
/// - Una SCREEN representa la pantalla completa a nivel de ruta y navegación.
///   Es la encargada de proveer el "andamiaje" visual mediante un [Scaffold]
///   (con AppBar, BottomNavigationBar o TabBar, Drawer, etc.).
/// - Una PAGE representa el contenido específico que se hospeda dentro del
///   `body` de una Screen. Una Page NUNCA debe llevar su propio Scaffold.
class SandboxDemoScreen extends StatelessWidget {
  const SandboxDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sandbox & Estado'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            ContadorPage(),
            EjerciciosPage(),
          ],
        ),
        bottomNavigationBar: const Material(
          color: Colors.white,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.touch_app_outlined), text: 'Contador'),
              Tab(icon: Icon(Icons.fitness_center_outlined), text: 'Ejercicios'),
            ],
          ),
        ),
      ),
    );
  }
}
