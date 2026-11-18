import 'package:seminario_2026_02/model/exercise.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExerciseService {
  final _db = Supabase.instance.client;
  static const _table = 'exercises';

  Future<List<Exercise>> list() async {
    final rows = await _db.from(_table).select().order('name');
    return rows.map(Exercise.fromMap).toList();
  }

  Future<Map<String, dynamic>> typeResume() async {
    try {
      final res = await _db.functions.invoke('resumen-ejercicios');
      return Map<String, dynamic>.from(res.data as Map);
    } on FunctionException catch (e) {
      final d = e.details;
      throw Exception(
        d is Map
            ? (d['message'] ?? d['error'] ?? 'Error en la función')
            : 'Sin conexión',
      );
    }
  }
}
