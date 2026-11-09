import 'package:flutter/material.dart';
import 'package:seminario_2026_02/services/foto_service.dart';

class RoutineCard extends StatelessWidget {
  final String name;
  final String description;
  final String? fotoPath;
  final VoidCallback? onTap;

  const RoutineCard({
    super.key,
    required this.name,
    required this.description,
    this.fotoPath,
    this.onTap,
  });

  // Sin foto (o si falla la descarga) se muestra un icono.
  Widget _buildFoto() {
    const icono = CircleAvatar(child: Icon(Icons.fitness_center));
    final ruta = fotoPath;
    if (ruta == null) return icono;

    return ClipOval(
      child: Image.network(
        FotoService().urlPublica(ruta),
        width: 40.0,
        height: 40.0,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stack) => icono,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: _buildFoto(),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(description),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
        onTap: onTap,
      ),
    );
  }
}
