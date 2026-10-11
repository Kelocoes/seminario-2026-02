import 'package:flutter/material.dart';

// 1. CLASE WIDGET (Inmutable y ligada a su State)
class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  State<ContadorPage> createState() => _ContadorPageState();
}

// 2. CLASE STATE (Persistente en memoria y mutable)
class _ContadorPageState extends State<ContadorPage> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  void _reiniciarContador() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // EXPERIMENTO: Se ejecuta cada vez que el nodo se marca como dirty
    debugPrint('--> [FRAME RENDER] build() ejecutado. Valor actual: $_contador');

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Widget CONST: Flutter lo reutiliza y no gasta CPU recalculándolo
          const Text(
            'Número de Clics Realizados:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Text(
            '$_contador',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5454E9),
            ),
          ),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: _incrementarContador,
            icon: const Icon(Icons.add),
            label: const Text('Incrementar Contador'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _reiniciarContador,
            icon: const Icon(Icons.refresh),
            label: const Text('Reiniciar a Cero'),
          ),
        ],
      ),
    );
  }
}
