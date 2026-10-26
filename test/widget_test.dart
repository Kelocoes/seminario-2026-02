import 'package:flutter_test/flutter_test.dart';
import 'package:seminario_2026_02/main.dart';

void main() {
  testWidgets('MyApp smoke test', (WidgetTester tester) async {
    // Construir la aplicación y procesar un frame.
    await tester.pumpWidget(const MyApp());

    // Verificar que la pantalla inicial cargue el título de Login.
    expect(find.text('Iniciar Sesión'), findsOneWidget);
    expect(find.text('Ingresar'), findsOneWidget);
  });
}
