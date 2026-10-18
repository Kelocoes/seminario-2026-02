import 'package:flutter/material.dart';
import '../models/ejercicio.dart';
import '../widgets/ejercicio_form.dart';
import '../widgets/ejercicio_list.dart';

class EjerciciosPage extends StatefulWidget {
  const EjerciciosPage({super.key});

  @override
  State<EjerciciosPage> createState() => _EjerciciosPageState();
}

class _EjerciciosPageState extends State<EjerciciosPage> {
  final List<Ejercicio> _ejercicios = [
    const Ejercicio(id: '1', nombre: 'Sentadillas', tipo: 'Fuerza'),
  ];

  void _agregarEjercicio(Ejercicio nuevo) {
    setState(() {
      _ejercicios.add(nuevo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EjercicioForm(onAgregar: _agregarEjercicio),
          const SizedBox(height: 24),
          EjercicioList(ejercicios: _ejercicios),
        ],
      ),
    );
  }
}
