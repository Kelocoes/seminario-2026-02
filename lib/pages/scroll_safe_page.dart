import 'package:flutter/material.dart';
import 'package:seminario_2026_02/pages/agenda_contactos.dart';
import 'package:seminario_2026_02/widgets/action_button.dart';
import 'package:seminario_2026_02/widgets/contador_widget.dart';
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
            ContadorWidget(),
          ],
        ),
      ),
    );
  }
}
