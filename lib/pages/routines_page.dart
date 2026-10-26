import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/mock_data.dart';
import 'package:seminario_2026_02/model/routine.dart';
import 'package:seminario_2026_02/routes/app_routes.dart';
import 'package:seminario_2026_02/widgets/routine_card.dart';

class RoutinesPage extends StatefulWidget {
  const RoutinesPage({super.key});

  @override
  State<RoutinesPage> createState() => _RoutinesPageState();
}

class _RoutinesPageState extends State<RoutinesPage> {
  final List<Routine> _routines = List<Routine>.from(initialRoutines);

  void _openDetail(Routine routine) {
    Navigator.pushNamed(context, AppRoutes.routineDetail, arguments: routine);
  }

  void _createRoutine() async {
    final result = await Navigator.pushNamed(context, AppRoutes.createRoutine);

    if (!mounted) return;

    if (result is Routine) {
      setState(() {
        _routines.add(result);
      });

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('Rutina "${result.name}" creada con éxito')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _createRoutine,
              icon: const Icon(Icons.add),
              label: const Text('Crear Nueva Rutina'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: _routines.isEmpty
              ? const Center(
                  child: Text('No tienes rutinas registradas aún.'),
                )
              : ListView.builder(
                  itemCount: _routines.length,
                  itemBuilder: (context, index) {
                    final routine = _routines[index];
                    return RoutineCard(
                      name: routine.name,
                      description: routine.description,
                      onTap: () => _openDetail(routine),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
