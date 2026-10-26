# Estado Actual del Proyecto

## 1. Resumen Ejecutivo
- **Nombre del Proyecto**: `seminario_2026_02` (Aplicación de Actividad Física - Universidad Icesi)
- **Rama Actual de Trabajo**: `week-13/navigation-start`
- **Plataforma Objetivo**: Flutter (Soporte multiplataforma: Móvil, Web y Escritorio)
- **Estado General**: Preparación del proyecto base para la sesión de navegación imperativa con Navigator 1.0 (rutas nombradas, paso de argumentos, retorno de resultados y purge de pila). Nomenclatura 100% en inglés en código, modelos, pantallas, páginas y widgets.

---

## 2. Dependencias y Configuración Clave
- **SDK**: Dart ^3.12.2 / Flutter SDK
- **Análisis de Código**: `flutter_lints: ^6.0.0` activo con 0 advertencias
- **Auditoría de Arquitectura**: 100% de cumplimiento en jerarquía Screen (Scaffold) vs Page (sin Scaffold) vs Widget

---

## 3. Estructura de UI y Modelos Implementada

### Modelos (`lib/model/`)
- `Exercise` (`lib/model/exercise.dart`): Representa un ejercicio con `name`, `type` y `durationMinutes`.
- `Routine` (`lib/model/routine.dart`): Representa una rutina con `name`, `description` y `exercises`.
- `mock_data.dart` (`lib/model/mock_data.dart`): Catálogo inicial de ejercicios preexistentes (`availableExercises`) y rutinas (`initialRoutines`).

### Pantallas y Andamiaje (`lib/screens/` y `lib/pages/`)
- **Login**:
  - `LoginScreen` (`lib/screens/login_screen.dart`): Provee `Scaffold` y `AppBar`.
  - `LoginPage` (`lib/pages/login_page.dart`): Formulario de ingreso sin Scaffold.
- **Lista de Rutinas**:
  - `RoutinesScreen` (`lib/screens/routines_screen.dart`): Provee `Scaffold`, `AppBar` y `FloatingActionButton`.
  - `RoutinesPage` (`lib/pages/routines_page.dart`): Lista visual de rutinas con `RoutineCard` y botón para crear rutina.
- **Detalle de Rutina**:
  - `RoutineDetailScreen` (`lib/screens/routine_detail_screen.dart`): Provee `Scaffold` y `AppBar`.
  - `RoutineDetailPage` (`lib/pages/routine_detail_page.dart`): Muestra la información de la rutina y la lista de ejercicios asignados con `ExerciseTile`.
- **Creación de Rutina**:
  - `CreateRoutineScreen` (`lib/screens/create_routine_screen.dart`): Provee `Scaffold` y `AppBar`.
  - `CreateRoutinePage` (`lib/pages/create_routine_page.dart`): Formulario para crear rutina y seleccionar ejercicios existentes.

### Catálogo de Widgets Reutilizables (`lib/widgets/`)
- `RoutineCard` (`lib/widgets/routine_card.dart`): Tarjeta para visualizar `name` y `description` de una rutina con evento `onTap`.
- `ExerciseTile` (`lib/widgets/exercise_tile.dart`): Componente de lista que muestra `durationMinutes`, `name` y `type` de un ejercicio.

---

## 4. Estado de Pruebas y Calidad
- `flutter test`: 100% pasando (smoke test de arranque en `test/widget_test.dart`).
- `flutter analyze`: 0 problemas.
- Auditoría de arquitectura y linter: Todo conforme con las reglas del repositorio.
