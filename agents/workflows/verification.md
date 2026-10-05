# Flujo de Trabajo: Validación de Calidad

Este documento define el protocolo obligatorio de verificación de calidad técnica que debe ejecutarse antes de dar por terminada cualquier modificación, creación de componentes o preparación de confirmaciones (*commits*) en el repositorio `seminario_2026_02`.

---

## Procedimiento Paso a Paso

### Paso 1: Ejecutar análisis estático con `flutter analyze` y asegurar cero advertencias
1. Ejecutar en la terminal el comando de análisis del proyecto:
   ```bash
   flutter analyze
   ```
2. **Criterio de Aceptación**:
   - La salida debe finalizar con `No issues found!`.
3. **Manejo de Errores Comunes**:
   - Si se reporta `avoid_print`: Reemplazar llamadas a `print()` por callbacks delegados en el consumidor del widget o por `debugPrint()` si es meramente diagnóstico.
   - Si se reporta `prefer_const_constructors`: Agregar la palabra clave `const` al constructor o a la invocación del widget en el árbol.
   - Si se reporta `unused_import`: Eliminar las importaciones no referenciadas en el código.

---

### Paso 2: Ejecutar la suite de pruebas unitarias con `flutter test`
1. Ejecutar todas las pruebas del repositorio:
   ```bash
   flutter test
   ```
2. **Criterio de Aceptación**:
   - Todas las pruebas deben pasar exitosamente (`All tests passed!`) con código de salida `0`.
3. **Manejo de Errores Comunes**:
   - Si una prueba de widget falla por widgets no encontrados (`Actual: Found 0 widgets with text ...`), verificar si el texto o widget esperado cambió en la implementación real o si la prueba busca elementos de plantillas obsoletas (como el contador por defecto).
   - Comprobar que no existan excepciones no controladas durante el ciclo de renderizado (`pumpWidget`).

---

### Paso 3: Verificar que no queden archivos temporales sin seguimiento en Git
1. Inspeccionar el estado de los archivos en el repositorio:
   ```bash
   git status
   ```
2. **Criterio de Aceptación**:
   - No deben existir archivos de depuración temporal, volcados de texto intermedios, carpetas `.dart_tool` no ignoradas o residuos de pruebas sin clasificar.
   - Todo archivo nuevo debe pertenecer explícitamente al código fuente (`lib/`), pruebas (`test/`) o configuración operativa de agentes (`agents/`).
3. **Acción de Limpieza**:
   - Si existen archivos temporales o accidentales, eliminarlos antes de proceder al commit o staging.
   - Verificar que `.gitignore` esté cubriendo correctamente los artefactos de compilación (`build/`, `.dart_tool/`).

---

## Criterio de Éxito del Flujo
Una tarea se considera técnicamente válida cuando los tres pasos han sido completados en orden y sin advertencias pendientes.
