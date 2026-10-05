# Épicas e Historias de Usuario (HUs)

Este documento desglosa los requerimientos del proyecto en épicas e historias de usuario con criterios de aceptación en formato de checklist, reflejando el progreso del desarrollo en la aplicación Flutter.

---

## Estado Global de Épicas

- [ ] Épica 1: Autenticación Institucional y Control de Roles
- [ ] Épica 2: Catálogo y Base de Datos de Ejercicios
- [ ] Épica 3: Creación y Gestión de Rutinas
- [ ] Épica 4: Registro de Actividad, Progreso y Métricas
- [ ] Épica 5: Asesoría, Seguimiento y Rol Entrenador
- [ ] Épica 6: Eventos y Disponibilidad de Espacios Deportivos
- [ ] Épica 7: Panel de Administración del Sistema
- [ ] Épica 8: Comunicación en Tiempo Real y Alertas (Extras)
- [x] Base Técnica: Andamiaje de UI, Layouts y Componentes Reutilizables

---

## Detalle de Historias de Usuario

### Épica 1: Autenticación Institucional y Control de Roles
- [ ] **HU-01: Inicio de sesión con cuenta institucional**
  - Como estudiante o colaborador quiero autenticarme con mis credenciales universitarias para ingresar de forma segura a la plataforma.
  - Criterios: Soporte OAuth / SSO institucional, persistencia de sesión segura en Supabase/Auth.
- [ ] **HU-02: Control de acceso basado en roles**
  - Como sistema quiero validar el rol del usuario (usuario, entrenador, administrador) para restringir el acceso a vistas y funciones no autorizadas.
  - Criterios: Rutas protegidas y validación de permisos en cliente y backend.

### Épica 2: Catálogo y Base de Datos de Ejercicios
- [ ] **HU-03: Visualización del catálogo de ejercicios**
  - Como usuario quiero ver un listado de ejercicios categorizados por tipo (cardio, fuerza, movilidad) para seleccionar los que mejor se adapten a mi meta.
  - Criterios: Búsqueda por texto, filtrado por dificultad y visualización de duración estimada.
- [ ] **HU-04: Ficha técnica y video demostrativo de ejercicio**
  - Como usuario quiero abrir el detalle de un ejercicio para ver su descripción de postura y reproducir el video explicativo.
  - Criterios: Reproducción de video responsiva y descripción clara de técnica.
- [ ] **HU-05: Creación de ejercicios personalizados**
  - Como usuario quiero dar de alta un ejercicio personalizado para incluir actividades particulares en mis rutinas.
  - Criterios: Formulario con nombre, tipo, descripción y tiempo/repeticiones.

### Épica 3: Creación y Gestión de Rutinas
- [ ] **HU-06: Construcción de rutina personalizada**
  - Como usuario quiero armar una rutina agrupando múltiples ejercicios para organizar mis sesiones semanales.
  - Criterios: Selección múltiple, ordenamiento de ejercicios y configuración de series/repeticiones.
- [ ] **HU-07: Edición y eliminación de rutinas**
  - Como usuario quiero editar o retirar ejercicios de una rutina existente para mantener actualizado mi plan.
  - Criterios: Modificación en vivo y confirmación de borrado.
- [ ] **HU-08: Adopción de rutinas prediseñadas**
  - Como usuario quiero explorar rutinas recomendadas por entrenadores y copiarlas a mi perfil para comenzar de inmediato.
  - Criterios: Botón de importación a mis rutinas y vista previa del plan.

### Épica 4: Registro de Actividad, Progreso y Métricas
- [ ] **HU-09: Registro de sesión de entrenamiento diaria**
  - Como usuario quiero registrar los datos de mi sesión (repeticiones logradas, tiempo empleado y nivel de esfuerzo RPE) para medir mi constancia.
  - Criterios: Formulario ágil al finalizar cada ejercicio o rutina completa.
- [ ] **HU-10: Consulta del historial de entrenamientos**
  - Como usuario quiero revisar mi historial cronológico de rutinas realizadas para evaluar mi disciplina.
  - Criterios: Vista de lista paginada u ordenada por fecha con detalles de cada sesión.
- [ ] **HU-11: Gráficos de estadísticas de rendimiento**
  - Como usuario quiero visualizar gráficas semanales y mensuales de mi rendimiento físico para comprobar mis avances.
  - Criterios: Gráficos de barras o líneas con métricas de tiempo, repeticiones y regularidad.
- [ ] **HU-12: Descarga de reporte de progreso en PDF**
  - Como usuario quiero exportar un documento PDF con el resumen de mi progreso para tener un registro personal descargable.
  - Criterios: Generación de archivo PDF con tablas y gráficas de métricas del período seleccionado.

### Épica 5: Asesoría, Seguimiento y Rol Entrenador
- [ ] **HU-13: Panel de usuarios asignados al entrenador**
  - Como entrenador quiero consultar la lista de estudiantes y colaboradores a mi cargo para darles seguimiento oportuno.
  - Criterios: Listado con foto, nombre, última fecha de actividad y estado actual.
- [ ] **HU-14: Inspección de rutinas y progreso por parte del entrenador**
  - Como entrenador quiero entrar al perfil de un usuario asesorado para revisar sus rutinas activas y métricas de esfuerzo.
  - Criterios: Visualización en tiempo de lectura de bitácoras y valoraciones.
- [ ] **HU-15: Envío de recomendaciones técnicas**
  - Como entrenador quiero dejar retroalimentación y sugerencias sobre las rutinas de mis alumnos para corregir sobrecargas o malas posturas.
  - Criterios: Registro de notas con fecha asociadas al plan del usuario.
- [ ] **HU-16: Publicación de rutinas institucionales oficiales**
  - Como entrenador quiero publicar rutinas predefinidas con sello institucional para que cualquier usuario de la universidad las utilice.
  - Criterios: Formulario de publicación con asignación de etiquetas y visibilidad pública.

### Épica 6: Eventos y Disponibilidad de Espacios Deportivos
- [ ] **HU-17: Cartelera de eventos y torneos universitarios**
  - Como miembro de la comunidad quiero enterarme de clases grupales (yoga, funcional), torneos y talleres para inscribirme.
  - Criterios: Lista de eventos con fecha, hora, lugar, cupo y descripción.
- [ ] **HU-18: Consulta de horarios y aforo del gimnasio**
  - Como usuario quiero revisar los horarios disponibles de las salas de pesas y canchas para planificar mis visitas al campus.
  - Criterios: Indicadores de estado de disponibilidad y horarios de apertura/cierre.

### Épica 7: Panel de Administración del Sistema
- [ ] **HU-19: Gestión administrativa de entrenadores**
  - Como administrador quiero dar de alta, desactivar o modificar perfiles de entrenadores certificados en la plataforma.
  - Criterios: CRUD completo con validación de credenciales profesionales.
- [ ] **HU-20: Asignación de usuarios a entrenadores**
  - Como administrador quiero asociar usuarios a entrenadores específicos para balancear la carga de asesorías.
  - Criterios: Selector interactivo de asignación y reasignación.
- [ ] **HU-21: Mantenimiento del catálogo maestro y eventos**
  - Como administrador quiero gestionar los ejercicios oficiales y la agenda de eventos para mantener la información vigente.
  - Criterios: Creación y moderación de contenido institucional.

### Épica 8: Comunicación en Tiempo Real y Alertas (Extras)
- [ ] **HU-22: Notificaciones push/WebSocket de aperturas de espacios**
  - Como usuario quiero recibir una alerta instantánea cuando se publique un nuevo evento o se liberen cupos en el gimnasio.
  - Criterios: Conexión mediante WebSockets y banners emergentes en la interfaz.
- [ ] **HU-23: Mensajería directa e inmediata entrenador-alumno**
  - Como usuario o entrenador quiero enviar y recibir mensajes directos para resolver dudas rápidas sobre el entrenamiento.
  - Criterios: Canal bidireccional en tiempo real con confirmación de entrega.

---

## Base Técnica Implementada (Componentes y UI)

- [x] **Arquitectura y Andamiaje de Pantallas**: Separación didáctica entre `Screen` (con Scaffold) y `Page` (dentro de Scaffold) demostrada en `LayoutDemoScreen`.
- [x] **Componente DescriptionCard**: Tarjeta reutilizable con título, descripción, icono, badge, acción y soporte de navegación táctil.
- [x] **Componente UserProfileCard**: Tarjeta de perfil con avatar, estado de conexión (en línea/ausente) e ícono de interacción.
- [x] **Componente NotificationBanner**: Banner destacado para avisos y alertas institucionales con acción de cierre.
- [x] **Componente StatusBadge**: Indicador de estado con punto cromático para seguimiento de procesos.
- [x] **Componente ActionButton**: Botón de acción con soporte de ícono y texto.
- [x] **Showcase de Componentes**: Página interactiva `PageExample` con vista previa de todos los widgets.
- [x] **Suite de Pruebas Automatizadas**: Pruebas de widget para `DescriptionCard` y prueba de humo para la aplicación en `test/`.
