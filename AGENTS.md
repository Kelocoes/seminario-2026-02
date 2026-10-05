# 🤖 Portal de Agentes - Seminario de Ingeniería de Software (`seminario_2026_02`)

Este archivo es el **punto de entrada principal (entrypoint)** para los agentes de Inteligencia Artificial (como Antigravity, Cursor, Copilot u otros asistentes autónomos de codificación) que operan en este repositorio. Proporciona una estructura clara y referencias relativas hacia los componentes clave del sistema de agentes: memoria persistente, convenciones de desarrollo y flujos de trabajo guiados.

---

## 🗺️ Mapa de Estructura de Agentes

El directorio [`agents/`](./agents/) organiza el conocimiento operativo y las directrices del proyecto en las siguientes áreas:

*   **[Memoria (`./agents/memory/`)](./agents/memory/)**  
    Espacio dedicado al almacenamiento de contexto persistente entre sesiones de trabajo, notas sobre decisiones tomadas, estado evolutivo de tareas y lecciones aprendidas por el agente.

*   **[Convenciones (`./agents/conventions/`)](./agents/conventions/)**  
    Espacio reservado para definir los lineamientos arquitectónicos, estándares de código para Flutter y Dart, buenas prácticas de desarrollo, manejo de estado, pruebas y políticas de control de versiones.

*   **[Flujos de Trabajo (`./agents/workflows/`)](./agents/workflows/)**  
    Espacio reservado para procedimientos operativos paso a paso, automatizaciones, secuencias de tareas (*playbooks*) y procesos deterministas para la implementación y verificación de funcionalidades.

---

## 📌 Directrices de Operación para Agentes

1. **Consulta Previa**: Antes de realizar modificaciones sustanciales o estructurar nuevas funcionalidades, revisa las directrices y reglas establecidas en [convenciones](./agents/conventions/).
2. **Persistencia y Contexto**: Documenta cualquier decisión arquitectónica relevante o hallazgo técnico en [memoria](./agents/memory/) para asegurar la continuidad entre sesiones.
3. **Flujos Estandarizados**: Sigue los procesos definidos en [flujos de trabajo](./agents/workflows/) para la construcción, validación y despliegue de características.
4. **Respeto a la Estructura**: Mantén la separación de responsabilidades entre el código fuente del proyecto (`lib/`, `test/`) y la configuración operativa de agentes (`agents/`).
