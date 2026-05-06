# Prompt Maestro para Generación del Blog: Efecto Cuello de Botella

Copia y pega el siguiente texto en tu LLM de preferencia (o aquí mismo si deseas que yo lo genere en el futuro) para obtener un blog post con calidad académica y estilo periodístico de datos (Data Journalism).

***

**Rol:** 
Actúa como un Criminólogo Ambiental Cuantitativo y Redactor de Datos Senior. Escribes con un tono académico, directo, riguroso e incisivo. Odias la paja y los adjetivos vacíos ("mucho", "bastante"); en su lugar, usas datos duros, porcentajes y evidencia econométrica.

**Contexto:** 
Hemos completado un análisis espacial e inferencial sobre 148,431 carpetas de investigación de robo a transeúnte en la CDMX (2019-2022) cruzadas con las estaciones del Metro. 
Descubrimos dos cosas fundamentales:
1. **El Efecto Cuello de Botella:** El crimen rastrea el volumen peatonal. El 35.3% de los asaltos ocurre a menos de 500m de una estación. Los robos sin violencia ocurren a 0 metros (andenes/torniquetes), mientras que los asaltos con violencia se concentran a 100-300 metros (calles aledañas).
2. **El Experimento Natural (Cierre L12):** Para ver si el Metro *crea* crimen o solo lo *concentra*, usamos el cierre exógeno de la Línea 12. Al correr un modelo de Series de Tiempo Interrumpido (ITS) aislando estaciones puras de L12 y controlando por la tendencia secular (el crimen ya venía a la baja) y estacionalidad, descubrimos que la caída en asaltos post-cierre no fue estadísticamente significativa ($p=0.575$). La caída era solo la continuación ininterrumpida de una tendencia estructural a la baja. Esto demuestra causalmente que el Metro **no genera crimen a nivel macro**, sino que funge como un embudo aglutinador que concentra espacialmente el delito preexistente.

**Tarea:** 
Redacta el artículo completo para un blog de investigación titulado: *"Análisis Espacial del Delito a Transeúnte: La Relación entre la Red del Metro y la Incidencia Criminal en la CDMX"*.

**Estructura y Formato Exigidos:**
Usa Markdown (##) para los títulos. Debes incluir explícitamente en el texto los *placeholders* exactos para las imágenes en el formato: `*(Inserta aquí la gráfica `NombreDeArchivo.png`)*` debajo de cada título relevante.

1.  **Introducción:** Plantea el problema y la hipótesis de criminología ambiental (Brantingham & Brantingham).
2.  **Sección 1: Patrones de Aglomeración y Distancia:** Explica la concentración espacial. Usa los datos del 35.3% a 500m y la diferencia entre robo con violencia vs sin violencia. *Inserta aquí: `Figure1_Crime_Decay.png`, `Figure5_ECDF.png` y `Figure4_Violence_Decay.png`*.
3.  **Sección 2: Mapa de Densidad Criminal:** Explica la dispersión espacial. *Inserta aquí: `Figure2_Map.png`*.
4.  **Sección 3: Experimento Natural: El Cierre de la Línea 12:** Cuenta el hallazgo contraintuitivo del modelo ITS y la tendencia secular. Explica cómo esto prueba que es un "embudo" y no una fábrica de crimen. *Inserta aquí: `ITS_Analysis/Figure6_ITS_L12_Closure.png`*.
5.  **Conclusión:** Recomendaciones de política pública. Redirigir el patrullaje a radios inmediatos.
6.  **Referencias:** (Solo cita a FGJ, OpenStreetMap y Brantingham 1993).

**Restricciones de Estilo:**
- Sé conciso.
- Transmite urgencia e intelecto.
- Usa voz activa.
- Concluye de forma contundente.
