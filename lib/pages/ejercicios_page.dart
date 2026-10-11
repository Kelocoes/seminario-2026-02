import 'package:flutter/material.dart';

class Ejercicio {
  final String nombre;
  final String tipo;
  const Ejercicio({required this.nombre, required this.tipo});
}

class EjerciciosPage extends StatefulWidget {
  const EjerciciosPage({super.key});

  @override
  State<EjerciciosPage> createState() => _EjerciciosPageState();
}

class _EjerciciosPageState extends State<EjerciciosPage> {
  final _nombreController = TextEditingController();
  final _tipos = const ['Fuerza', 'Cardio', 'Flexibilidad'];
  String _tipoSeleccionado = 'Fuerza';

  final List<Ejercicio> _ejercicios = [
    const Ejercicio(nombre: 'Sentadillas', tipo: 'Fuerza'),
  ];

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  void _agregarEjercicio() {
    final nombre = _nombreController.text.trim();
    if (nombre.isEmpty) return;

    setState(() {
      _ejercicios.add(Ejercicio(nombre: nombre, tipo: _tipoSeleccionado));
      _nombreController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Formulario
          TextField(
            controller: _nombreController,
            decoration: const InputDecoration(
              labelText: 'Nombre del ejercicio',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _tipoSeleccionado,
            decoration: const InputDecoration(
              labelText: 'Tipo',
              border: OutlineInputBorder(),
            ),
            items: _tipos
                .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                .toList(),
            onChanged: (val) => setState(() => _tipoSeleccionado = val!),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: _agregarEjercicio,
            icon: const Icon(Icons.add),
            label: const Text('Agregar Ejercicio'),
          ),
          const SizedBox(height: 24),

          // 2. Lista de Cards con .map()
          const Text(
            'Lista de Ejercicios:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ..._ejercicios.map(
            (e) => Card(
              child: ListTile(
                leading: const Icon(Icons.fitness_center),
                title: Text(e.nombre),
                subtitle: Text('Tipo: ${e.tipo}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
