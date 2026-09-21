import 'package:flutter/material.dart';
import 'package:seminario_2026_02/widgets/action_button.dart';
import 'package:seminario_2026_02/widgets/notification_banner.dart';
import 'package:seminario_2026_02/widgets/user_profile_card.dart';

/// ============================================================================
/// PÁGINA 3: SAFEAREA Y SINGLECHILDSCROLLVIEW (Control de Desborde y Scroll)
/// ============================================================================
/// Conceptos clave:
/// 1. [SafeArea]: Añade el padding necesario para que el contenido no quede
///    obstruido por hardware intrusivo (el notch, la cámara perforada, la isla
///    dinámica, la barra de estado superior o la barra de gestos de navegación).
/// 2. [SingleChildScrollView]: Provee una vista desplazable vertical (o horizontal)
///    para un único widget hijo (comúnmente un Column).
///    ¡Es la solución directa al temido error amarillo y negro:
///    "A RenderFlex overflowed by X pixels"!
class ScrollSafePage extends StatelessWidget {
  const ScrollSafePage({super.key});

  @override
  Widget build(BuildContext context) {
    // SAFEAREA: Asegura que todo el contenido interior respete los límites seguros
    // del dispositivo físico.
    return SafeArea(
      // SINGLECHILDSCROLLVIEW: Permite hacer scroll cuando el contenido de la
      // pantalla supera la altura disponible de la pantalla del usuario.
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner explicativo sobre el desborde (Overflow)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber.shade700),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.amber.shade900),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Sin SingleChildScrollView, una Column con muchos elementos '
                      'generaría el error de desborde (rayas amarillas y negras).',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Lista de elementos apilados en Scroll:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Apilamos varios widgets para forzar que el contenido sea más largo
            // que la pantalla física y demostrar el scroll fluido.
            const UserProfileCard(
              imageUrl: 'https://picsum.photos/200?random=1',
              name: 'Andrés Morales',
              description: 'Estudiante - Monitor Flutter',
              state: 'Activo',
              icon: Icon(Icons.star_border, color: Colors.amber),
            ),
            const SizedBox(height: 12),

            const NotificationBanner(
              icon: Icon(Icons.code, color: Colors.white),
              title: 'Taller 1: Scaffold & Layout',
              description: 'Construcción modular de pantallas y jerarquía de widgets.',
            ),
            const SizedBox(height: 12),

            const NotificationBanner(
              icon: Icon(Icons.rule, color: Colors.white),
              title: 'Regla de Oro en Flutter',
              description: 'Nunca anides un Scaffold dentro de una Page. Mantén el Scaffold en la Screen.',
            ),
            const SizedBox(height: 12),

            const UserProfileCard(
              imageUrl: 'https://picsum.photos/200?random=2',
              name: 'Camila Ospina',
              description: 'Docente de Arquitectura de Software',
              state: 'En reunión',
              icon: Icon(Icons.work_outline, color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),

            // Botón de acción al final de la página desplazable
            const Center(
              child: ActionButton(
                icon: Icon(Icons.arrow_upward),
                text: 'Volver arriba',
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
