# Portal de Agentes - Seminario de Ingenieria de Software (`seminario_2026_02`)

Este archivo es el **punto de entrada principal (entrypoint)** para los agentes de Inteligencia Artificial (como Antigravity, Cursor, Copilot u otros asistentes autonomos de codificacion) que operan en este repositorio. Proporciona una estructura clara y referencias relativas hacia los componentes clave del sistema de agentes: memoria persistente y convenciones de desarrollo.

---

## Mapa de Estructura de Agentes

El directorio [`.agents/`](./.agents/) organiza el conocimiento operativo y las directrices del proyecto en las siguientes areas:

*   **[Memoria (`./.agents/memory/`)](./.agents/memory/)**  
    Espacio dedicado al almacenamiento de contexto persistente entre sesiones de trabajo, notas sobre decisiones tomadas, estado evolutivo de tareas y lecciones aprendidas por el agente.

*   **[Convenciones (`./.agents/conventions/`)](./.agents/conventions/)**  
    Espacio reservado para definir los lineamientos arquitectonicos, estandares de codigo para Flutter y Dart, buenas practicas de desarrollo, manejo de estado, pruebas y politicas de control de versiones.

---

## Directrices de Operacion para Agentes

1. **Consulta Previa**: Antes de realizar modificaciones sustanciales o estructurar nuevas funcionalidades, revisa las directrices y reglas establecidas en [convenciones](./.agents/conventions/).
2. **Persistencia y Contexto**: Documenta cualquier decision arquitectonica relevante o hallazgo tecnico en [memoria](./.agents/memory/) para asegurar la continuidad entre sesiones.
3. **Respeto a la Estructura**: Manten la separacion de responsabilidades entre el codigo fuente del proyecto (`lib/`, `test/`) y la configuracion operativa de agentes (`.agents/`).
