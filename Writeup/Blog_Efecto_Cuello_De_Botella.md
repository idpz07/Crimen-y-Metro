# La Aritmética del Despojo: El Efecto Cuello de Botella y la Concentración Espacial del Delito en la CDMX

**Autor:** Sergio Iván De Pozo Uriza

***

Caminar por las inmediaciones de una estación del Metro en la Ciudad de México es, para millones de capitalinos, un acto cotidiano que esconde una vulnerabilidad silenciosa. Es sumergirse en una marea humana donde la urgencia de llegar a casa se mezcla con la constante vigilancia del entorno. ¿Por qué, a pesar de ser las arterias que mantienen viva a la ciudad, estas infraestructuras operan también como imanes para el despojo? La respuesta no yace en la casualidad, sino en el diseño urbano. La convergencia masiva de personas no solo facilita la movilidad; también organiza la geografía del delito. Este ensayo explora la hipótesis de que la red de transporte masivo no engendra el crimen de la nada, sino que actúa como un concentrador espacial de oportunidades delictivas, un fenómeno que Brantingham y Brantingham (1993) han conceptualizado dentro de la criminología ambiental.

Para desentrañar esta disonancia entre la necesidad de movilidad y la falencia en la seguridad pública, se procesaron 148,431 carpetas de investigación por robo a transeúnte reportadas por la Fiscalía General de Justicia (FGJCDMX, 2023). Al cruzar estos incidentes con las coordenadas del Sistema de Transporte Colectivo (OpenStreetMap Contributors, 2023), los datos revelan una correlación innegable. La proximidad a estos nodos y la probabilidad de un evento criminal están estructuradas por la misma lógica espacial.

## 1. Patrones de Aglomeración y Distancia

El análisis de proximidad euclidiana entre los puntos de incidencia y las estaciones revela que el peligro no se distribuye de manera aleatoria en el vacío. Se arraiga en la infraestructura misma que utilizamos para desplazarnos.

*(Inserta aquí la gráfica `Figure1_Crime_Decay.png`)*

### Decaimiento Espacial del Delito
*(Inserta aquí la gráfica `Figure5_ECDF.png`)*

Las cifras desmontan cualquier percepción de anarquía espacial. De los 148,431 delitos analizados, el 35.3% ocurre en un radio de apenas 500 metros alrededor de alguna estación de la red. La mediana de distancia para cualquier asalto respecto a la estación más cercana es de 771.76 metros, mientras que la media se ubica en 1,546.62 metros. Estos datos no son meros registros administrativos; representan la vulnerabilidad cuantificada del ciudadano. Demuestran cómo el riesgo se intensifica abruptamente en los trayectos de aproximación. Al igual que en la teoría política de Hobbes, donde la simple concentración de individuos requiere un contrato social para evitar el caos generalizado, en nuestra realidad urbana la aglomeración de transeúntes sin una contención institucional adecuada facilita la explotación de los más débiles.

### Tipología del Delito según la Distancia
*(Inserta aquí la gráfica `Figure4_Violence_Decay.png`)*

¿Acaso todos los robos operan bajo la misma lógica territorial? Al segmentar la incidencia entre robos con y sin violencia, descubrimos una clara especialización operativa. La mayor densidad del robo sin violencia —el sigiloso carterismo— ocurre exactamente a 0 metros de distancia. Su ecosistema ideal son los torniquetes y andenes, donde la fricción de los cuerpos enmascara la extracción de pertenencias. Por el contrario, el robo con violencia alcanza su pico entre los 100 y 300 metros de la estación. En este rango geográfico, el flujo peatonal sigue siendo constante, pero la "vigilancia natural" de la multitud comienza a diluirse, creando el escenario propicio para la intimidación directa.

## 2. Mapa de Densidad Criminal

*(Inserta aquí el mapa `Figure2_Map.png`)*

La cartografía de los datos confirma nuestras sospechas. Los clústeres de alta incidencia (conocidos analíticamente como "hotspots") calcan casi a la perfección el trazado del Metro. Esta concentración no es fruto de una desgracia azarosa; obedece a una decisión calculada por parte de los infractores para maximizar sus oportunidades frente a la negligencia en la planeación urbana de seguridad. Esta dinámica espacial valida de forma contundente lo que aquí denominamos el "Efecto Cuello de Botella".

## 3. Experimento Natural: El Cierre de la Línea 12

Resulta tentador asumir que el Metro crea, per se, la criminalidad que lo rodea. ¿Es la infraestructura ferroviaria una incubadora de delincuentes o simplemente el escenario óptimo para su operación? Para distinguir entre una simple correlación espacial y una verdadera causalidad, la suspensión del servicio de la Línea 12 en mayo de 2021 nos ofreció un experimento natural sin precedentes. A través de un riguroso diseño econométrico de Series de Tiempo Interrumpido (ITS), aislamos exclusivamente el comportamiento de las estaciones puras de Iztapalapa y Tláhuac, descartando nodos de transferencia que pudieran contaminar el efecto de la pérdida total de afluencia.

*(Inserta aquí la gráfica `ITS_Analysis/Figure6_ITS_L12_Closure.png`)*

Al evaluar el comportamiento delictivo mediante una regresión de Poisson —controlando internamente tanto por la estacionalidad como por la tendencia secular previa— el resultado desafía la intuición superficial: el cese de operaciones del Metro carece de significancia estadística sobre la disminución de los asaltos. 

¿Qué nos dice esta aparente contradicción? La creencia inicial de que el cierre había pacificado la zona padecía de un grave sesgo analítico por variable omitida. Dicha percepción ignoraba que el robo a transeúnte ya mostraba una tendencia a la baja continua desde años atrás. Nuestro modelo demuestra que la aparente reducción posterior a mayo de 2021 no es un mérito del cierre de las estaciones, sino la simple inercia de una tendencia estructural preexistente. Esta evidencia nos empuja hacia un hallazgo contundente: la movilidad masiva no engendra nuevos delitos a nivel macro. Su verdadera función criminológica es la de un embudo aglutinador. Reorganiza el mapa delictivo de la ciudad al concentrar espacialmente las oportunidades de despojo.

## 4. Conclusión

La intersección de las bases de la FGJCDMX y OpenStreetMap trasciende el ejercicio académico para exponer una falla sistemática en la gestión de nuestra infraestructura. El hecho de que un 35.3% de los asaltos se concentre a menos de 500 metros de una estación —con una mediana de proximidad de 771.76 metros— ilustra que la criminalidad no obedece a fuerzas misteriosas, sino a la aritmética predecible del flujo peatonal. Ignorar esta realidad es apostar por la impunidad. Estos hallazgos exigen al Estado abandonar los despliegues de seguridad reactivos y ciegos, obligando a rediseñar políticas de prevención enfocadas quirúrgicamente en los radios inmediatos de la movilidad masiva. Solo a través de esta precisión analítica lograremos proteger a quienes sostienen, con sus trayectos diarios, el pulso de la metrópoli.

## 5. Referencias

Brantingham, P. L., & Brantingham, P. J. (1993). Nodes, paths and edges: Considerations on the complexity of crime and the physical environment. *Journal of Environmental Psychology*, 13(1), 3-28.

Fiscalía General de Justicia de la Ciudad de México [FGJCDMX]. (2023). *Carpetas de Investigación*. Portal de Datos Abiertos de la Ciudad de México.

OpenStreetMap Contributors. (2023). *Planet dump*. Recuperado de https://planet.osm.org
