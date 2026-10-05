# Flujo de Trabajo: Implementación de una Funcionalidad

Este documento define la secuencia metodológica obligatoria para la conceptualización, desarrollo, validación y registro de cualquier nueva funcionalidad en el proyecto `seminario_2026_02`.

---

## Procedimiento Paso a Paso

### Paso 1: Lectura de requerimientos y verificación en convenciones
1. **Identificar la Historia de Usuario**:
   - Consultar [`agents/memory/constitution.md`](../memory/constitution.md) y [`agents/memory/epics.md`](../memory/epics.md) para ubicar el alcance, los criterios de aceptación y el rol beneficiario de la HU a implementar.
2. **Revisar Lineamientos Técnicos**:
   - Consultar [`agents/conventions/component_hierarchy.md`](../conventions/component_hierarchy.md) para determinar si la funcionalidad requiere una Screen (andamiaje con `Scaffold`), una Page (contenido interno) o Widgets reutilizables.
   - Consultar [`agents/conventions/flutter_rules.md`](../conventions/flutter_rules.md) para garantizar constructores `const`, inmutabilidad y tipado adecuado.
3. **Preparar la Rama de Trabajo**:
   - Asegurarse de estar en una rama acorde a las políticas de [`agents/conventions/git_conventions.md`](../conventions/git_conventions.md) (formato: `week-<numero>/<nombre-tarea>`).

---

### Paso 2: Creación o edición de archivos fuente
1. **Desarrollar la Capa de Datos / Modelos** (si aplica):
   - Definir clases inmutables con métodos de serialización (`fromJson`, `toJson`) y validaciones de tipos.
2. **Construir la Interfaz de Usuario**:
   - Si se requieren componentes nuevos, seguir el flujo [`agents/workflows/create_widget.md`](./create_widget.md).
   - Ensamblar las vistas respetando la separación entre Screen y Page.
3. **Integrar Lógica de Negocio y Servicios**:
   - Conectar con los clientes de servicio (ej. `Supabase` para autenticación y persistencia).
   - Manejar estados de carga, éxito y captura de excepciones en la interfaz.

---

### Paso 3: Ejecución de pruebas y documentación de la decisión tomada en la memoria
1. **Verificación Automatizada**:
   - Ejecutar el flujo completo de [`agents/workflows/verification.md`](./verification.md):
     - `flutter analyze` con 0 advertencias.
     - `flutter test` con 100% de éxito en pruebas unitarias y de widgets.
2. **Actualización de la Memoria del Proyecto**:
   - **Checklist de Épicas**: En [`agents/memory/epics.md`](../memory/epics.md), marcar con `[x]` las historias de usuario completadas.
   - **Estado del Proyecto**: En [`agents/memory/project_state.md`](../memory/project_state.md), registrar los nuevos módulos, pantallas y dependencias añadidas.
   - **Lecciones y Hallazgos**: Si durante el desarrollo se resolvieron incidencias técnicas o se adoptaron patrones clave, documentar el aprendizaje en [`agents/memory/lessons_learned.md`](../memory/lessons_learned.md).
3. **Preparación del Commit**:
   - Redactar el mensaje de commit siguiendo el formato de Conventional Commits definido en [`agents/conventions/git_conventions.md`](../conventions/git_conventions.md) (ej. `feat(auth): implement login page with institutional credentials`).
