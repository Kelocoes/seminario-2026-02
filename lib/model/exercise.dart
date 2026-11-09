class Exercise {
  final int? id;
  final String name;
  final String type;
  final int durationMinutes;

  const Exercise({
    this.id,
    required this.name,
    required this.type,
    required this.durationMinutes,
  });

  factory Exercise.fromMap(Map<String, dynamic> map) => Exercise(
    id: map['id'] as int,
    name: map['name'] as String,
    type: map['type'] as String,
    durationMinutes: map['duration_minutes'] as int,
  );
}
