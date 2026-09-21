import 'package:flutter/material.dart';
import 'package:seminario_2026_02/widgets/notification_banner.dart';
import 'package:seminario_2026_02/widgets/status_badge.dart';
import 'package:seminario_2026_02/widgets/user_profile_card.dart';

/// ============================================================================
/// PÁGINA 2: CONTAINER Y COMPOSICIÓN DE COMPONENTES PROPIOS
/// ============================================================================
/// Conceptos clave:
/// 1. [Container]: La navaja suiza de Flutter. Combina dimensiones (width/height),
///    espaciado externo (margin), espaciado interno (padding) y estilo visual
///    (BoxDecoration: colores, bordes redondeados, sombras).
/// 2. [Padding]: Provee separación consistente y legible.
/// 3. COMPOSICIÓN: Principio fundamental de Flutter. En lugar de escribir
///    un árbol gigante de cientos de líneas en una sola pantalla, componemos la
///    interfaz ensamblando componentes pequeños, modulares e independientes
///    (como UserProfileCard, StatusBadge y NotificationBanner).
class BoxCompositionPage extends StatelessWidget {
  const BoxCompositionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // PADDING general para que el contenido no pegue contra los bordes de la pantalla
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CONTAINER: Demostración de personalización visual con BoxDecoration
          Container(
            width: double.infinity, // Ocupa todo el ancho disponible
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.deepPurple.shade200, width: 1.5),
            ),
            child: Row(
              children: [
                Icon(Icons.palette_outlined, color: Colors.deepPurple.shade700),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Container estilizado con BoxDecoration (color, borde y radio)',
                    style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Text(
            'Composición con Widgets Propios:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // COMPOSICIÓN 1: Reutilizamos UserProfileCard
          const Center(
            child: UserProfileCard(
              imageUrl: 'https://picsum.photos/200',
              name: 'Sofia Martinez',
              description: 'Monitora SIS - Flutter GDE',
              state: 'En línea',
              icon: Icon(Icons.chat_outlined, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 16),

          // COMPOSICIÓN 2: Reutilizamos StatusBadge
          const Center(
            child: StatusBadge(
              state: 'En progreso',
              dotColor: Colors.green,
              label: 'Sprint Actual',
            ),
          ),
          const SizedBox(height: 16),

          // COMPOSICIÓN 3: Reutilizamos NotificationBanner
          const Center(
            child: NotificationBanner(
              icon: Icon(Icons.notifications_active, color: Colors.white),
              title: 'Aviso de Entrega',
              description: 'El taller de Layout y Composición se entrega este viernes.',
            ),
          ),
        ],
      ),
    );
  }
}
