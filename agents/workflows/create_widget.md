# Flujo de Trabajo: Creación de un Nuevo Widget

Este documento establece el procedimiento operativo estándar paso a paso para diseñar, construir, documentar y verificar un nuevo componente visual reutilizable en el proyecto `seminario_2026_02`.

---

## Prerrequisitos
- Consultar [`agents/conventions/component_hierarchy.md`](../conventions/component_hierarchy.md) para confirmar que el componente corresponde al nivel de Widget (pieza atómica) y no a una Screen o Page.
- Consultar [`agents/conventions/flutter_rules.md`](../conventions/flutter_rules.md) para revisar estándares de nomenclatura y uso de `const`.

---

## Procedimiento Paso a Paso

### Paso 1: Definir los parámetros requeridos y opcionales en `lib/widgets/`
1. Crear el archivo en `lib/widgets/<nombre_widget>.dart` utilizando nomenclatura `snake_case`.
2. Estructurar la clase heredando de `StatelessWidget` con nombre en `PascalCase`.
3. Declarar todas las propiedades como inmutables (`final`).
4. Proporcionar un constructor `const` con parámetros nombrados:
   - Marcar con `required` únicamente aquellos datos indispensables para el renderizado del widget.
   - Definir parámetros opcionales para configuraciones visuales secundarias o callbacks de eventos (`onTap`, `onPressed`).
   - Evitar valores quemados (*hardcoded*) que restrinjan la reutilización.

```dart
// Ejemplo de estructura inicial
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ...
  }
}
```

---

### Paso 2: Implementar el árbol de widgets respetando `Theme.of(context)` y accesibilidad
1. Extraer los colores y tipografía directamente desde el tema de la aplicación:
   ```dart
   final theme = Theme.of(context);
   final primaryColor = theme.colorScheme.primary;
   ```
2. Garantizar adaptabilidad y prevención de desbordamientos:
   - Envolver textos extensos o títulos horizontales en `Expanded` o `Flexible` dentro de `Row`.
   - Usar `BoxConstraints` o límites de altura/ancho seguros cuando aplique.
3. Incorporar retroalimentación táctil:
   - Si el widget responde a clics, utilizar `InkWell` o `GestureDetector` respetando el radio de curvatura (`borderRadius`) de la tarjeta o contenedor.
4. Asegurar contraste accesible de color entre fondos y textos.

---

### Paso 3: Registrar una instancia de demostración en `page_example.dart`
1. Abrir [`lib/pages/page_example.dart`](../../lib/pages/page_example.dart).
2. Importar el nuevo widget en la cabecera del archivo.
3. Agregar al menos una instancia de ejemplo dentro de la columna del `PageExample`:
   - Una instancia representativa con todos los parámetros completos.
   - Opcionalmente, una instancia mínima con sólo los campos requeridos para comprobar su comportamiento por defecto.
4. Verificar visualmente que no genere saltos de maquetación ni errores de desbordamiento en el sandbox.

---

### Paso 4: Crear la prueba de widget en `test/` validando renderizado e interacción
1. Crear el archivo de prueba correspondiente en `test/<nombre_widget>_test.dart`.
2. Escribir pruebas automatizadas con `testWidgets`:
   - **Prueba de Renderizado**: Verificar que los textos principales, iconos o badges se dibujen correctamente en el árbol con `find.text()` o `find.byIcon()`.
   - **Prueba de Interacción**: Si el widget tiene callbacks (`onTap`, `onPressed`), simular el toque con `tester.tap()`, procesar el frame con `tester.pump()` y comprobar que el callback se haya ejecutado.

```dart
// Ejemplo de prueba
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seminario_2026_02/widgets/custom_card.dart';

void main() {
  testWidgets('CustomCard renderiza titulo y descripcion', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomCard(title: 'Titulo', description: 'Descripcion'),
        ),
      ),
    );

    expect(find.text('Titulo'), findsOneWidget);
    expect(find.text('Descripcion'), findsOneWidget);
  });
}
```

---

## Verificación de Cierre
- Ejecutar el flujo [`agents/workflows/verification.md`](./verification.md) para confirmar que no existan advertencias de linter y que todas las pruebas pasen al 100%.
