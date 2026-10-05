# Lecciones Aprendidas y Aspectos a Considerar

Este documento consolida correcciones técnicas, hallazgos y buenas prácticas identificadas durante el desarrollo en este repositorio, para servir de guía en futuras implementaciones.

---

## 1. Calidad de Código y Reglas de Linter (`flutter_lints`)

### Uso de `print` frente a `debugPrint` o Callbacks
- **Problema detectado**: Varios componentes iniciales (`action_button.dart`, `notification_banner.dart`) invocaban directamente la función `print`, lo cual dispara la advertencia de linter `avoid_print` en el análisis estático.
- **Directriz para nuevas implementaciones**:
  - En componentes visuales reutilizables, evitar imprimir directamente en consola dentro de los controladores de eventos (`onPressed`, `onTap`).
  - En su lugar, exponer callbacks opcionales (ej. `final VoidCallback? onPressed;`) para que el consumidor del widget decida la acción.
  - Si es estrictamente necesario registrar eventos en desarrollo, emplear `debugPrint` o un servicio de logging configurado.

### Constructores `const` y Rendimiento de Renderizado
- **Directriz**:
  - Todo widget que no mantenga estado mutable directo debe definir constructores `const`.
  - En los árboles de widgets (dentro del método `build`), anteponer `const` en los nodos que no dependan de variables dinámicas para evitar reconstrucciones innecesarias y optimizar el rendimiento.

---

## 2. Pruebas Automatizadas y Verificación

### Sincronización de la Prueba de Humo (`widget_test.dart`)
- **Problema detectado**: Al modificar la pantalla de inicio (`MyApp` apuntando a `LayoutDemoScreen`), la prueba por defecto de Flutter (`Counter increments smoke test`) falló al buscar un contador inexistente.
- **Directriz para nuevas implementaciones**:
  - Al cambiar la pantalla raíz o el flujo de navegación principal, actualizar de inmediato la prueba de humo en `test/widget_test.dart` verificando elementos visuales reales (como el título del `AppBar` o la presencia del `Scaffold`).
  - Para cada nuevo widget significativo creado en `lib/widgets/`, crear su archivo de pruebas dedicado en `test/` (ej. `test/description_card_test.dart`) validando tanto el renderizado básico como las interacciones táctiles y ramas condicionales.

---

## 3. Jerarquía y Andamiaje de la Interfaz

### Regla Estricta: Screen frente a Page
- **Definición**:
  - **Screen**: Widget que representa una ruta o pantalla completa y es responsable exclusivo de proporcionar el `Scaffold` (con su `AppBar`, `BottomNavigationBar`, `Drawer` o pestañas).
  - **Page**: Widget que representa el contenido particular alojado dentro del `body` de una `Screen`.
- **Directriz**:
  - Ninguna `Page` debe declarar su propio `Scaffold` anidado. La duplicación de `Scaffold` causa problemas de superposición de barras de navegación, dobles sombras y cálculos incorrectos del área segura (`SafeArea`).

### Prevención de Desbordamientos de Layout (`RenderFlex Overflow`)
- **Directriz**:
  - Al colocar títulos y textos descriptivos dentro de `Row` horizontales, envolver siempre los textos en `Expanded` o `Flexible`. De lo contrario, textos con cadenas largas generarán el error de desbordamiento visual de Flutter (*overflow by X pixels*).
  - En vistas de formulario o contenidos largos, encapsular la columna principal en un `SingleChildScrollView` o lista deslizable.

---

## 4. Persistencia y Gestión del Contexto de Agentes
- **Directriz**:
  - Mantener actualizada la carpeta `agents/memory/` tras cada sprint o cambio estructural significativo.
  - Toda nueva funcionalidad debe registrarse en `epics.md` como una historia de usuario y actualizar el checklist de avance.
  - Mantener un estilo sobrio, formal y libre de emojis en la documentación técnica para garantizar legibilidad profesional y compatibilidad en cualquier terminal o lector de texto.
