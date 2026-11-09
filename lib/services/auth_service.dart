import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  GoTrueClient get _auth => Supabase.instance.client.auth;

  // Hay alguien con sesion? null = nadie.
  Session? get sesion => _auth.currentSession;

  // Correo del usuario con sesion (null si no hay).
  String? get email => _auth.currentUser?.email;

  // Avisa cada vez que alguien inicia o cierra sesion.
  Stream<AuthState> get cambios => _auth.onAuthStateChange;

  Future<void> registrar(String email, String password) async {
    await _auth.signUp(email: email, password: password);
  }

  Future<void> iniciarSesion(String email, String password) async {
    await _auth.signInWithPassword(email: email, password: password);
  }
}
