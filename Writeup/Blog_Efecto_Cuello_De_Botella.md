# Análisis Espacial del Delito a Transeúnte: La Relación entre la Red del Metro y la Incidencia Criminal en la CDMX

**Autor:** Sergio Iván De Pozo Uriza

***

El diseño de la infraestructura urbana de movilidad concentra diariamente el flujo de millones de personas. Este texto examina cómo dicha convergencia determina la distribución geográfica del delito a transeúnte en la Ciudad de México. A partir de un análisis cuantitativo y geoespacial, se evalúa la hipótesis de que la red de transporte público masivo actúa como los principales focos de atracción para la incidencia criminal, un fenómeno ampliamente estudiado en la criminología ambiental (Brantingham & Brantingham, 1993).

Para el desarrollo del presente análisis, se procesaron 148,431 carpetas de investigación correspondientes a robos a transeúnte reportadas por la Fiscalía General de Justicia (FGJCDMX, 2023). Estos incidentes se cruzaron con las coordenadas espaciales de las estaciones del Sistema de Transporte Colectivo (Metro), extraídas de las bases de datos de OpenStreetMap (OpenStreetMap Contributors, 2023). Los resultados demuestran una correlación espacial entre la proximidad a estos nodos y la probabilidad de un evento delictivo.

## 1. Patrones de Aglomeración y Distancia

El análisis de proximidad euclidiana entre los puntos de incidencia delictiva y las estaciones del Metro revela una concentración significativa del delito en las inmediaciones de la infraestructura de transporte.

*(Inserta aquí la gráfica `Figure1_Crime_Decay.png`)*

### Decaimiento Espacial del Delito
*(Inserta aquí la gráfica `Figure5_ECDF.png`)*

De los 148,431 delitos analizados, el 35.3% de los incidentes se registra en un radio de apenas 500 metros alrededor de alguna estación de la red. La mediana de distancia para cualquier robo a transeúnte respecto a la estación de Metro más cercana es de 771.76 metros, mientras que la media se ubica en 1,546.62 metros. Estos indicadores demuestran estadísticamente que el riesgo para el peatón se incrementa de forma pronunciada en los trayectos directos de acceso y salida de los puntos de abordaje.

### Tipología del Delito según la Distancia
*(Inserta aquí la gráfica `Figure4_Violence_Decay.png`)*

Al segmentar la base de datos por tipología penal (robo con violencia frente a robo sin violencia), se identifica una variación en las distancias de operación. La mayor densidad de robos sin violencia (extracción de pertenencias o carterismo) ocurre a 0 metros de distancia, localizándose en las zonas de más alta congestión física como torniquetes, andenes y escaleras. Por el contrario, la incidencia de robos con violencia presenta su densidad más alta en un rango de 100 a 300 metros de la estación, registrándose en las calles aledañas donde el flujo peatonal continúa, pero la concentración de usuarios es menor.

## 2. Mapa de Densidad Criminal

*(Inserta aquí el mapa `Figure2_Map.png`)*

La visualización espacial de los datos confirma que los clústeres de alta incidencia ("hotspots") se alinean geográficamente con el trazado de la red del Metro. La dispersión espacial del crimen no se comporta de manera aleatoria, sino que obedece a la distribución de estos nodos de transporte, validando el fenómeno cuantitativo del "Efecto Cuello de Botella".

## 3. Experimento Natural: El Cierre de la Línea 12

Para probar causalidad y validar si el Metro es un "generador" intrínseco de crimen o meramente un "concentrador" espacial, se aprovechó el cierre exógeno de la Línea 12 (mayo de 2021) como un experimento natural. Utilizando un diseño econométrico de Series de Tiempo Interrumpido (ITS), se aisló la muestra exclusivamente a las estaciones puras de Iztapalapa y Tláhuac que perdieron su afluencia total, descartando nodos de transferencia que contaminarían el efecto.

*(Inserta aquí la gráfica `ITS_Analysis/Figure6_ITS_L12_Closure.png`)*

Al someter los datos a una regresión de Poisson rigurosa —controlando internamente por la estacionalidad del año y la tendencia secular (la trayectoria temporal preexistente del delito)—, los resultados revelaron un hallazgo contraintuitivo: la "caída de escalón" atribuida directamente al cierre carece de significancia estadística. 

¿Qué significa esto? La percepción inicial de un desplome criminal post-cierre obedecía a un sesgo por variable omitida: ignoraba que el robo a transeúnte *ya experimentaba una tendencia a la baja* continua en esos años. El modelo demuestra que la caída tras mayo de 2021 es simplemente la continuación ininterrumpida de dicha tendencia estructural. En términos de criminología ambiental, esta evidencia confirma que la infraestructura de movilidad masiva **no "crea" nuevos delitos a nivel macro**, sino que funciona como un embudo aglutinador que concentra espacialmente las oportunidades delictivas en la urbe.

## 4. Conclusión

La intersección de las bases de datos de la FGJ y OpenStreetMap proporciona evidencia rigurosa sobre cómo la red del Metro estructura la distribución espacial del crimen a transeúnte en la Ciudad de México. El hecho de que un 35.3% de los asaltos ocurra en un radio de 500 metros (con una mediana de proximidad de 771.76 metros) demuestra que la incidencia criminal rastrea matemáticamente el volumen peatonal. Estos hallazgos recomiendan redirigir las estrategias de seguridad pública para priorizar la contención en los radios inmediatos de los nodos de movilidad masiva.

## 5. Referencias

Brantingham, P. L., & Brantingham, P. J. (1993). Nodes, paths and edges: Considerations on the complexity of crime and the physical environment. *Journal of Environmental Psychology*, 13(1), 3-28.

Fiscalía General de Justicia de la Ciudad de México [FGJCDMX]. (2023). *Carpetas de Investigación*. Portal de Datos Abiertos de la Ciudad de México.

OpenStreetMap Contributors. (2023). *Planet dump*. Recuperado de https://planet.osm.org
