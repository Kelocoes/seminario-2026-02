# Arquitectura de la Aplicación

La arquitectura de esta aplicación se compone de dos elementos:
1. Este repositorio en Flutter.
2. Supabase como backend y servicios en la nube.

---

## Diseño Detallado: Estructura de Carpetas

A nivel de diseño detallado crearemos la siguiente estructura de carpetas:

- **`screens/`**: Se almacenarán los archivos que representan el layout del apartado visual. Solamente estos widgets tendrán el `Scaffold`.
- **`pages/`**: Almacenaremos los widgets que organizarán los widgets más pequeños reutilizables (sin `Scaffold`).
- **`widgets/`**: Almacenaremos los componentes reutilizables como botones, cards, carruseles, entre otros.
