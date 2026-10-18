class Ejercicio {
  final String id;
  final String nombre;
  final String tipo;

  const Ejercicio({
    required this.id,
    required this.nombre,
    required this.tipo,
  });

  Ejercicio copyWith({
    String? id,
    String? nombre,
    String? tipo,
  }) {
    return Ejercicio(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      tipo: tipo ?? this.tipo,
    );
  }
}
