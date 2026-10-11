# Constitución del Proyecto: Plataforma de Actividad Física - Universidad Icesi

## 1. Visión y Contexto General
En el marco del bienestar universitario y el fomento de hábitos saludables, la Universidad Icesi busca fortalecer su oferta de espacios, actividades y programas relacionados con la actividad física. Actualmente, muchos estudiantes y colaboradores realizan rutinas de ejercicio en el campus, pero carecen de una plataforma centralizada que permita:
- Monitorear el progreso físico individual.
- Diseñar y personalizar rutinas de entrenamiento.
- Facilitar la comunicación y retroalimentación directa entre entrenadores certificados y la comunidad universitaria.
- Mantenerse informados sobre la disponibilidad de espacios e instalaciones deportivas en tiempo real.

El propósito de la solución es integrar tecnología, salud y comunidad mediante una plataforma moderna, responsiva y accesible que motive una vida universitaria activa y conectada.

---

## 2. Roles del Sistema
1. **Usuario (Estudiante / Colaborador)**: Persona que consulta rutinas, registra entrenamientos, monitoriza su avance físico y participa en eventos deportivos.
2. **Entrenador**: Profesional certificado que asigna planes de entrenamiento, evalúa el progreso de sus asesorados, provee recomendaciones y publica rutinas modelo.
3. **Administrador**: Gestor de la plataforma encargado de controlar el acceso, dar de alta entrenadores, vincularlos con usuarios y administrar los catálogos maestros de ejercicios y eventos.

---

## 3. Especificación de Características y Requerimientos Funcionales

### RF-01: Autenticación Institucional y Control de Acceso
- Inicio de sesión único mediante cuentas institucionales de la Universidad Icesi.
- Control de acceso y permisos basado en roles (Usuario, Entrenador, Administrador).
- Protección integral de los datos personales y registros de salud de los miembros de la comunidad.

### RF-02: Gestión de Rutinas de Entrenamiento
- Creación, edición y eliminación de rutinas personalizadas por parte del usuario.
- Selección de ejercicios a partir de una base predefinida o incorporación de ejercicios personalizados propios.
- Exploración y adopción de rutinas prediseñadas sugeridas por entrenadores institucionales.

### RF-03: Catálogo y Base de Datos de Ejercicios
- Repositorio centralizado de ejercicios con metadatos descriptivos:
  - Nombre del ejercicio.
  - Clasificación de tipo: Cardio, Fuerza o Movilidad.
  - Descripción técnica de ejecución.
  - Duración recomendada y nivel de dificultad.
  - Recursos multimedia (videos demostrativos y guías de postura).

### RF-04: Registro y Seguimiento de Progreso
- Bitácora diaria o semanal para registrar métricas de ejecución:
  - Número de repeticiones y series.
  - Tiempo transcurrido y duración.
  - Percepción subjetiva del esfuerzo (escala RPE).
- Historial accesible de actividades previas y entrenamientos completados.

### RF-05: Módulo de Entrenadores y Asesoría
- Visualización de la lista de estudiantes o colaboradores asignados a cada entrenador.
- Inspección detallada de las rutinas activas y del historial de progreso de los usuarios a cargo.
- Emisión de retroalimentación, ajustes de carga y recomendaciones personalizadas según la evolución del usuario.
- Publicación de rutinas institucionales abiertas a la comunidad.

### RF-06: Eventos y Reserva de Espacios Deportivos
- Cartelera informativa de eventos universitarios (torneos, talleres, clases grupales como yoga o spinning).
- Publicación y consulta de horarios de operación y aforo del gimnasio y escenarios deportivos.

### RF-07: Panel de Administración del Sistema
- Módulo de gestión de entrenadores: altas, bajas y modificación de credenciales.
- Asignación manual o automatizada de usuarios a entrenadores específicos.
- Administración del catálogo global de ejercicios, categorías y agendas de eventos institucionales.

### RF-08: Estadísticas y Reportes de Rendimiento
- Visualización gráfica de estadísticas de rendimiento (avance semanal y mensual).
- Generación y descarga de informes personales de progreso en formato PDF.

---

## 4. Requerimientos Extras y de Tiempo Real

### RX-01: Notificaciones en Tiempo Real
- Notificaciones automáticas (vía WebSockets) cuando se aperture un nuevo evento, torneo o espacio deportivo en el campus.

### RX-02: Mensajería y Alertas Directas
- Canal directo de comunicación en tiempo real para que los entrenadores envíen alertas, observaciones y mensajes instantáneos a sus alumnos asignados.

---

## 5. Requerimientos No Funcionales
- **Responsividad y Accesibilidad**: La interfaz de usuario debe adaptarse fluidamente a dispositivos móviles, tablets y escritorios, cumpliendo estándares de usabilidad.
- **Seguridad**: Cifrado de datos en tránsito y en reposo, con aislamiento de privilegios estricto entre roles.
- **Rendimiento**: Tiempos de carga reducidos y sincronización eficiente de datos en tiempo real.
