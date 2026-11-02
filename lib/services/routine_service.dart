import 'package:seminario_2026_02/model/routine.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoutineService {
  final _db = Supabase.instance.client;
  static const _table = 'routines';
  static const _linkTable = 'routine_exercises';

  Future<List<Routine>> list() async {
    final rows = await _db
        .from(_table)
        .select('*, $_linkTable(exercises(*))')
        .order('created_at');
    return rows.map(Routine.fromMap).toList();
  }

  Future<Routine> create(Routine routine) async {
    final row = await _db
        .from(_table)
        .insert(routine.toMap())
        .select()
        .single();
    final id = row['id'] as int;

    if (routine.exercises.isNotEmpty) {
      await _db.from(_linkTable).insert([
        for (final exercise in routine.exercises)
          {'routine_id': id, 'exercise_id': exercise.id},
      ]);
    }

    return Routine(
      id: id,
      name: routine.name,
      description: routine.description,
      exercises: routine.exercises,
    );
  }
}
