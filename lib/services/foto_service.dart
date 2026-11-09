import 'package:supabase_flutter/supabase_flutter.dart';

class FotoService {
  final _bucket = Supabase.instance.client.storage.from('fotos');

  /// Arma la URL publica de una ruta del bucket. No usa la red.
  String urlPublica(String ruta) => _bucket.getPublicUrl(ruta);
}
