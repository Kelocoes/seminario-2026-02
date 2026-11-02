import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/routine.dart';
import 'package:seminario_2026_02/routes/app_routes.dart';
import 'package:seminario_2026_02/services/routine_service.dart';
import 'package:seminario_2026_02/widgets/routine_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoutinesPage extends StatefulWidget {
  const RoutinesPage({super.key});

  @override
  State<RoutinesPage> createState() => _RoutinesPageState();
}

class _RoutinesPageState extends State<RoutinesPage> {
  final _service = RoutineService();
  bool _loading = true;
  String? _error;
  List<Routine> _routines = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final routines = await _service.list();
      if (!mounted) return;
      setState(() => _routines = routines);
    } on PostgrestException catch (e) {
      if (!mounted) return;
      setState(() => _error = e.message);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = 'Sin conexión');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

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
        Expanded(child: _body()),
      ],
    );
  }

  Widget _body() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!),
            const SizedBox(height: 12.0),
            FilledButton(onPressed: _load, child: const Text('Reintentar')),
          ],
        ),
      );
    }
    if (_routines.isEmpty) {
      return const Center(child: Text('No tienes rutinas registradas aún.'));
    }
    return RefreshIndicator(
      onRefresh: _load,
      child: ListView.builder(
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
    );
  }
}
