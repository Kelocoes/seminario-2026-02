import 'package:flutter/material.dart';
import 'package:seminario_2026_02/widgets/action_button.dart';

/// ============================================================================
/// PÁGINA 1: LAYOUT LINEAL (Column, Row, Expanded, Padding)
/// ============================================================================
/// Notar que esta clase es una PAGE:
/// - NO tiene un Scaffold propio (lo hospeda [LayoutDemoScreen]).
/// - Se enfoca exclusivamente en organizar los elementos visuales.
/// - Es 100% Stateless.
class LinearLayoutPage extends StatelessWidget {
  const LinearLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // PADDING: Widget estructural que añade margen/espacio interior alrededor
    // de su hijo. A diferencia de Container con padding, este widget es liviano
    // y tiene una única responsabilidad.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // COLUMN: Organiza sus hijos de forma vertical (uno debajo del otro).
        // - mainAxisAlignment: Alineación a lo largo del eje principal (vertical).
        // - crossAxisAlignment: Alineación a lo largo del eje secundario (horizontal).
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '1. Demostración de Row + Expanded',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // ROW: Organiza sus hijos de forma horizontal (uno al lado del otro).
          Row(
            children: [
              // Caja con ancho fijo de 70px
              Container(
                width: 70,
                height: 50,
                color: Colors.indigo.shade300,
                alignment: Alignment.center,
                child: const Text('Fijo\n70px', textAlign: TextAlign.center),
              ),
              const SizedBox(width: 8),

              // EXPANDED: Fuerza al hijo a ocupar TODO el espacio restante disponible
              // en el eje principal (en este caso, el ancho libre del Row).
              // Evita tener que calcular porcentajes o anchos manuales para cada pantalla.
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.amber.shade400,
                  alignment: Alignment.center,
                  child: const Text(
                    'Expanded (toma todo el espacio libre)',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Otra caja fija al final
              Container(
                width: 70,
                height: 50,
                color: Colors.indigo.shade300,
                alignment: Alignment.center,
                child: const Text('Fijo\n70px', textAlign: TextAlign.center),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            '2. Proporciones con flex (Expanded)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Varios Expanded con distinto factor 'flex' para dividir proporcionalmente
          Row(
            children: [
              Expanded(
                flex: 1, // Ocupa 1 parte del total (1 de 3 = 33%)
                child: Container(
                  height: 40,
                  color: Colors.teal.shade300,
                  alignment: Alignment.center,
                  child: const Text('flex: 1 (33%)'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2, // Ocupa 2 partes del total (2 de 3 = 66%)
                child: Container(
                  height: 40,
                  color: Colors.teal.shade700,
                  alignment: Alignment.center,
                  child: const Text(
                    'flex: 2 (66%)',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            '3. Integrando componentes en Row',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Reutilizamos el widget existente ActionButton dentro de un Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: ActionButton(
                  icon: Icon(Icons.check_circle_outline),
                  text: 'Aceptar',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ActionButton(
                  icon: Icon(Icons.cancel_outlined),
                  text: 'Cancelar',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
