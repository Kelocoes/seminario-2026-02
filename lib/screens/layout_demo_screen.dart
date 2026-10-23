import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/agenda_contactos.dart';
import 'package:seminario_2026_02/pages/linear_layout_page.dart';
import 'package:seminario_2026_02/pages/box_composition_page.dart';

/// ============================================================================
/// CONVENCIÓN SCREEN frente a PAGE:
/// ============================================================================
/// - Una SCREEN representa la pantalla completa a nivel de ruta y navegación.
///   Es la encargada de proveer el "andamiaje" visual mediante un [Scaffold]
///   (con AppBar, BottomNavigationBar o TabBar, Drawer, etc.).
/// - Una PAGE representa el contenido específico que se hospeda dentro del
///   `body` de una Screen. Una Page NUNCA debe llevar su propio Scaffold.
///
/// Este widget es 100% STATELESS: usamos [DefaultTabController] para cambiar
/// de página sin necesidad de manejar estado mutable ni StatefulWidget.
class LayoutDemoScreen extends StatelessWidget {
  const LayoutDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DefaultTabController coordina las pestañas y las vistas de forma declarativa y stateless.
    return DefaultTabController(
      length: 3,
      // Scaffold: Provee la estructura visual de la pantalla (AppBar, BottomNavigationBar, Drawer, etc.)
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Layout & Andamiaje'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            ContactAgenda(),
            LinearLayoutPage(),
            BoxCompositionPage(),
          ],
        ),
        bottomNavigationBar: const Material(
          color: Colors.white,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.table_rows_outlined), text: 'Lineal'),
              Tab(icon: Icon(Icons.border_all), text: 'Box'),
              Tab(icon: Icon(Icons.arrow_circle_down_outlined), text: 'Scroll'),
            ],
          ),
        ),
      ),
    );
  }
}
