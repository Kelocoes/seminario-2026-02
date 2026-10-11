# Portal de Agentes - Seminario de Ingenieria de Software (`seminario_2026_02`)

Este archivo es el **punto de entrada principal (entrypoint)** para los agentes de Inteligencia Artificial (como Antigravity, Cursor, Copilot u otros asistentes autonomos de codificacion) que operan en este repositorio. Proporciona una estructura clara y referencias relativas hacia los componentes clave del sistema de agentes: memoria persistente, convenciones de desarrollo y habilidades operativas.

---

## Mapa de Estructura de Agentes

El directorio [`.agents/`](./.agents/) organiza el conocimiento operativo y las directrices del proyecto en las siguientes areas:

*   **[Habilidades y Skills (`./.agents/skills/`)](./.agents/skills/)**  
    Paquetes de capacidades procedimentales cargadas bajo demanda para auditoria de arquitectura, linter y buenas practicas en Flutter.

*   **[Memoria (`./.agents/memory/`)](./.agents/memory/)**  
    Espacio dedicado al almacenamiento de contexto persistente entre sesiones de trabajo, notas sobre decisiones tomadas, estado evolutivo de tareas y lecciones aprendidas por el agente.

*   **[Convenciones (`./.agents/conventions/`)](./.agents/conventions/)**  
    Espacio reservado para definir los lineamientos arquitectonicos, estandares de codigo para Flutter y Dart, buenas practicas de desarrollo, manejo de estado, pruebas y politicas de control de versiones.

---

## Directrices de Operacion para Agentes

1. **Consulta Previa**: Antes de realizar modificaciones sustanciales o estructurar nuevas funcionalidades, revisa las directrices y reglas establecidas en [convenciones](./.agents/conventions/).
2. **Persistencia y Contexto**: Documenta cualquier decision arquitectonica relevante o hallazgo tecnico en [memoria](./.agents/memory/) para asegurar la continuidad entre sesiones.
3. **Uso de Habilidades**: Invoca o consulta las [habilidades](./.agents/skills/) bajo demanda cuando la tarea requiera revisiones de arquitectura o analisis estatico de codigo.
4. **Respeto a la Estructura**: Manten la separacion de responsabilidades entre el codigo fuente del proyecto (`lib/`, `test/`) y la configuracion operativa de agentes (`.agents/`).
