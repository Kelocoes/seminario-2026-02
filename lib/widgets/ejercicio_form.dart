import 'package:flutter/material.dart';
import '../models/ejercicio.dart';

class EjercicioForm extends StatefulWidget {
  final void Function(Ejercicio nuevoEjercicio) onAgregar;

  const EjercicioForm({
    super.key,
    required this.onAgregar,
  });

  @override
  State<EjercicioForm> createState() => _EjercicioFormState();
}

class _EjercicioFormState extends State<EjercicioForm> {
  final _nombreController = TextEditingController();
  final _tipos = const ['Fuerza', 'Cardio', 'Flexibilidad'];
  String _tipoSeleccionado = 'Fuerza';

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  void _agregarEjercicio() {
    final nombre = _nombreController.text.trim();
    if (nombre.isEmpty) return;

    final nuevo = Ejercicio(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nombre: nombre,
      tipo: _tipoSeleccionado,
    );

    widget.onAgregar(nuevo);
    _nombreController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
          onChanged: (val) {
            if (val != null) {
              setState(() => _tipoSeleccionado = val);
            }
          },
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: _agregarEjercicio,
          icon: const Icon(Icons.add),
          label: const Text('Agregar Ejercicio'),
        ),
      ],
    );
  }
}
