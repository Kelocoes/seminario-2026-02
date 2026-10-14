# Convenciones de Código

- **Nomenclatura de archivos:**
  - Los archivos en la carpeta `screens` deben tener el sufijo `_screen` (ej. `login_screen.dart`).
  - Los archivos en la carpeta `pages` deben tener el sufijo `_page` (ej. `login_page.dart`).
  - Los nombres compuestos de archivos deben estar en snake_case (separados con `_` y siempre en minúscula).

- **Nomenclatura en código:**
  - Variables y atributos: `camelCase`.
  - Clases: `PascalCase`.
  - Los nombres deben ser descriptivos y dicientes de su comportamiento.

- **Diseño de funciones y métodos:**
  - Deben cumplir el principio de responsabilidad única (hacer solo una cosa). Si realizan múltiples tareas, su comportamiento debe dividirse en funciones más pequeñas.
  - Las funciones que validen una condición siempre deben comenzar con el prefijo `is` (ej. `isEmailValid`).

- **Comentarios:**
  - Evitar el uso de comentarios; el código debe ser autoexplicativo por su diseño y nomenclatura.
