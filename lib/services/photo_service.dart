import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PhotoService {
  final _bucket = Supabase.instance.client.storage.from('ejercicios');

  Future<String> subir(XFile foto) async {
    final bytes = await foto.readAsBytes();
    final ruta =
        '${DateTime.now().millisecondsSinceEpoch}_${foto.name}';
    await _bucket.uploadBinary(ruta, bytes);
    return ruta;
  }

  /// Arma la URL publica de una ruta del bucket. No usa la red.
  String urlPublica(String ruta) => _bucket.getPublicUrl(ruta);
}
