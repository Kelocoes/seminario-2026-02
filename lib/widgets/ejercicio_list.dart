import 'package:flutter/material.dart';
import '../models/ejercicio.dart';

class EjercicioList extends StatelessWidget {
  final List<Ejercicio> ejercicios;

  const EjercicioList({
    super.key,
    required this.ejercicios,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Lista de Ejercicios:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...ejercicios.map(
          (e) => Card(
            child: ListTile(
              leading: const Icon(Icons.fitness_center),
              title: Text(e.nombre),
              subtitle: Text('Tipo: ${e.tipo}'),
            ),
          ),
        ),
      ],
    );
  }
}
