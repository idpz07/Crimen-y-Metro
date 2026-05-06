# Análisis Retrospectivo y Prompt Maestro de Ciencia de Datos

## 1. Análisis del Proceso y Lecciones Aprendidas

El proyecto *"Efecto Tacos de Canasta"* (que mutó al *"Efecto Cuello de Botella"*) fue una clase magistral en la realidad del análisis empírico. Aquí desglosamos lo ocurrido:

### Lo que aprendimos (Aciertos)
*   **Estructura Implacable:** Mantener un ecosistema estricto (`Data storage/Raw/`, `Created/`, `Data codes/`, `Writeup/`) garantizó que nunca perdiéramos el control sobre qué era un dato original y qué era un dato procesado.
*   **"Raw is Raw":** Al no sobrescribir nunca los datos brutos, pudimos pivotar todo el proyecto y recalcular millones de filas en segundos sin tener que volver a descargar 500 MB de datos de la Fiscalía.
*   **Reproducibilidad Absoluta:** Integrar APIs en tiempo real (`osmdata`) y automatizar la descarga de shapefiles (`geodata`) asegura que cualquier persona en el mundo puede correr el script `00_Master.R` y obtener los mismos mapas.

### Errores Cometidos y Cómo los Arreglamos
1.  **Sesgo de Escala (Efecto Poblacional):**
    *   *Error:* Medir totales absolutos. Al principio, el Centro dominaba todas las gráficas porque simplemente es más grande y tiene más gente.
    *   *Solución:* Cambiar la técnica a "Proporciones" (porcentaje de asaltos nocturnos) para aislar el comportamiento del tamaño de la población.
2.  **Sesgo de Selección / Endogeneidad:**
    *   *Error:* Confiar en datos de reportes ciudadanos (SUAC). Nos dimos cuenta de que la gente reporta focos fundidos según su nivel de educación y civismo, no solo según la oscuridad real.
    *   *Solución:* El gran pivote. Desechamos los datos sesgados por humanos y pasamos a un análisis puramente espacial/matemático (distancia euclidiana a las estaciones del Metro).
3.  **Falacia Ecológica (Evitada):**
    *   *Error a punto de cometerse:* Intentar cruzar educación vs crimen geográficamente.
    *   *Solución:* Entender el *Spatial Mismatch* (los asaltantes viajan a zonas ricas/educadas para robar). Desechamos la idea antes de programarla.
4.  **Errores Técnicos en Código (Fechas y Paquetes):**
    *   *Error:* Intentar parsear fechas con formato Europeo (`dmy`) cuando la base del gobierno venía en formato ISO (`ymd`), lo que vació la gráfica temporal. También olvidar cargar librerías (`tidyverse`) en scripts individuales creyendo que el script maestro las heredaría.
    *   *Solución:* Revisar el output crudo con `head()`, corregir a `ymd()` y asegurar que cada script sea independiente y cargue sus propias librerías.

---

## 2. El Prompt Maestro

*Copia y pega este prompt cuando inicies un nuevo proyecto de análisis de datos con una IA. Está diseñado para forzar a la IA a pensar con rigor econométrico y estructural.*

***

**[INICIO DEL PROMPT MAESTRO]**

Actúa como un Científico de Datos Senior y Econometrista Estricto. Vamos a iniciar un proyecto de análisis empírico desde cero. Quiero que seas implacable con la calidad de la metodología y del código. Antes de escribir una sola línea de código, debes seguir estas reglas de oro:

### 1. Estructura y Regla "Raw is Raw"
*   Diseña el proyecto separando el código de los datos y los reportes (`Data codes/`, `Data storage/Raw/`, `Data storage/Created/`, `Writeup/`).
*   Los datos originales JAMÁS se modifican, sobrescriben o alteran manualmente. Toda limpieza debe ocurrir vía código y exportarse a la carpeta `Created`.
*   Usa un archivo `00_Master.R` (o `main.py`) que ejecute todos los scripts en orden. El análisis debe ser 100% reproducible con un solo clic.

### 2. Rigor Empírico y Pensamiento Crítico
Antes de aceptar mis hipótesis o bases de datos, actúa como un crítico revisor de un *journal* académico y evalúa si estamos cayendo en:
*   **Falacia Ecológica:** ¿Estamos asumiendo que el comportamiento de una zona aplica a los individuos de esa zona?
*   **Sesgo de Variable Omitida / Endogeneidad:** ¿Estamos correlacionando A y B cuando en realidad la "Riqueza", "Densidad" o "Civismo" están moviendo ambas variables?
*   **Sesgo de Escala (Efecto Poblacional):** Si comparamos regiones, ¿estamos usando totales en lugar de tasas per cápita o proporciones? No quiero mapas de calor que solo sean mapas de dónde vive más gente.

### 3. Código y Visualización (Data-to-Ink Ratio)
*   Programa de manera modular y robusta. Prefiere conectar APIs o descargar datos crudos automáticamente vía código antes que usar archivos Excel manuales.
*   En las gráficas (ej. `ggplot2` o `seaborn`), elimina la basura visual (chartjunk). Usa fondos blancos, paletas de colores legibles para daltónicos (ej. `viridis`), y NUNCA uses los nombres técnicos de las variables en los ejes.
*   El título de la gráfica no debe describir las variables (ej. "Y vs X"); debe describir el *hallazgo empírico* (ej. "El crimen se concentra a 200m del transporte").

Si entiendes estas reglas, responde preguntándome de qué trata el proyecto y cuáles son nuestras bases de datos disponibles para someterlas a tu evaluación crítica.

**[FIN DEL PROMPT MAESTRO]**
