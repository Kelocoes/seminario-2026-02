# Estado Actual del Proyecto

## 1. Resumen Ejecutivo
- **Nombre del Proyecto**: `seminario_2026_02` (Aplicación de Actividad Física - Universidad Icesi)
- **Rama Actual de Trabajo**: `week-13/navigation-start`
- **Plataforma Objetivo**: Flutter (Soporte multiplataforma: Móvil, Web y Escritorio)
- **Estado General**: Preparación del proyecto base para las sesiones de navegación imperativa (Navigator 1.0 con pila y rutas nombradas) y navegación horizontal por pestañas (NavigationBar / IndexedStack). Nomenclatura 100% en inglés en código, modelos, pantallas, páginas y widgets.

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

### Páginas (`lib/pages/` - Cuerpos sin Scaffold, listas para Pestañas / IndexedStack)
- `LoginPage` (`lib/pages/login_page.dart`): Formulario de ingreso de credenciales.
- `RoutinesPage` (`lib/pages/routines_page.dart`): Lista visual de rutinas con `RoutineCard` y botón para crear rutina.
- `ExercisesPage` (`lib/pages/exercises_page.dart`): Catálogo filtrable de ejercicios con `TextField` interactivo (ideal para comprobar preservación de estado con `IndexedStack`).
- `ProfilePage` (`lib/pages/profile_page.dart`): Perfil de usuario con avatar, métricas y botón de cerrar sesión.
- `RoutineDetailPage` (`lib/pages/routine_detail_page.dart`): Detalle de la rutina y sus ejercicios.
- `CreateRoutinePage` (`lib/pages/create_routine_page.dart`): Formulario para crear rutina con selección de ejercicios.

### Pantallas (`lib/screens/` - Con Scaffold para previsualización independiente o rutas)
- `LoginScreen` (`lib/screens/login_screen.dart`): Pantalla de login.
- `RoutinesScreen` (`lib/screens/routines_screen.dart`): Pantalla de lista de rutinas.
- `ExercisesScreen` (`lib/screens/exercises_screen.dart`): Pantalla del catálogo de ejercicios.
- `ProfileScreen` (`lib/screens/profile_screen.dart`): Pantalla de perfil de usuario.
- `RoutineDetailScreen` (`lib/screens/routine_detail_screen.dart`): Pantalla de detalle jerárquico.
- `CreateRoutineScreen` (`lib/screens/create_routine_screen.dart`): Pantalla de creación de rutina.

### Catálogo de Widgets Reutilizables (`lib/widgets/`)
- `RoutineCard` (`lib/widgets/routine_card.dart`): Tarjeta para visualizar `name` y `description` de una rutina.
- `ExerciseTile` (`lib/widgets/exercise_tile.dart`): Ficha de lista para un ejercicio con avatar de duración.
- `StatItem` (`lib/widgets/stat_item.dart`): Indicador de métricas (número y etiqueta) para perfil.

---

## 4. Estado de Pruebas y Calidad
- `flutter test`: 100% pasando (smoke test de arranque en `test/widget_test.dart`).
- `flutter analyze`: 0 problemas.
- Auditoría de arquitectura y linter: Todo conforme con las reglas del repositorio.
