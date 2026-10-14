# AGENTS.md — Punto de Acceso y Diccionario de `.agents`

Este archivo actúa como el índice principal y punto de acceso al conocimiento, reglas y memoria del agente dentro del directorio `.agents`.

---

## Estructura y Rutas Relativas de `.agents`

```
.agents/
└── memory/
    ├── ARCHITECTURAL_SPINE.md   # Columna vertebral de la arquitectura de la aplicación
    └── CONVENTIONS.md           # Reglas de estilo, nomenclatura y diseño de código
```

---

## Diccionario de Archivos y Responsabilidades

### 1. [`.agents/memory/ARCHITECTURAL_SPINE.md`](.agents/memory/ARCHITECTURAL_SPINE.md)
- **Propósito:** Define la arquitectura base y la estructura de directorios del diseño detallado.
- **Puntos Clave:**
  - Elementos de la arquitectura: Repositorio en Flutter y backend en Supabase.
  - `screens/`: Layouts del apartado visual; **únicos widgets con `Scaffold`**.
  - `pages/`: Widgets que organizan componentes reutilizables (sin `Scaffold`).
  - `widgets/`: Componentes reutilizables (botones, cards, carruseles, etc.).

---

### 2. [`.agents/memory/CONVENTIONS.md`](.agents/memory/CONVENTIONS.md)
- **Propósito:** Especifica las convenciones de nomenclatura, estilo de código y buenas prácticas.
- **Puntos Clave:**
  - **Archivos:** Sufijo `_screen` en `screens/`, sufijo `_page` en `pages/`, y nombres compuestos en `snake_case` minúscula.
  - **Nombres en código:** Variables/atributos en `camelCase`, clases en `PascalCase`. Nombres dicientes de su comportamiento.
  - **Funciones/Métodos:** Principio de responsabilidad única. Funciones de validación deben iniciar con el prefijo `is` (ej. `isEmailValid`).
  - **Comentarios:** Evitar el uso de comentarios; el código debe ser autoexplicativo.
