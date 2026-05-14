# La Aritmética del Despojo: El Efecto Cuello de Botella y la Concentración Espacial del Delito en la CDMX

**Autor:** Sergio Iván De Pozo Uriza

***

El presente análisis comprende las carpetas de investigación generadas exclusivamente en el periodo de enero de 2019 a diciembre de 2022. La narrativa del despojo no es estática; rastrea la infraestructura de movilidad más importante de la capital.

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

## 4. Notas Metodológicas y Limitaciones (Caveats)

Todo análisis empírico debe reconocer sus fronteras. Los hallazgos aquí presentados deben interpretarse bajo las siguientes salvedades:

1. **Rango Temporal:** El análisis comprende datos de enero de 2019 a diciembre de 2022. Este periodo permite capturar la dinámica pre-pandemia, el choque del confinamiento y el experimento natural del cierre de la Línea 12.
2. **Sesgo de Denuncia (Cifra Negra):** Los datos provienen de carpetas de investigación de la FGJCDMX. Reconocemos que existe un subreporte significativo (cifra negra) de delitos que no llegan a denunciarse. Sin embargo, asumimos que el sesgo es sistemático y no invalida las comparaciones espaciales entre estaciones.
3. **Endogeneidad de Ubicación:** Existe una correlación intrínseca entre la ubicación del Metro y la densidad urbana. El Metro se construye donde hay gente. Para mitigar este sesgo, el análisis de la Línea 12 utiliza un diseño de Series de Tiempo Interrumpido (ITS) que compara la estación contra sí misma, manteniendo constantes los factores geográficos invariantes y aislando únicamente el choque del flujo peatonal.
4. **Transparencia en el Uso de IA:** Este trabajo fue desarrollado por Sergio Iván De Pozo Uriza, con la asistencia técnica de la IA Antigravity para el procesamiento de datos y modelos econométricos en R. Adicionalmente, la prosa y el estilo narrativo de este documento fueron generados utilizando el agente especializado definido en `.agents/workflows/academicwriter.md`.

## 5. Conclusión

La intersección de las bases de la FGJCDMX y OpenStreetMap trasciende el ejercicio académico para exponer una falla sistemática en la gestión de nuestra infraestructura. El hecho de que un 35.3% de los asaltos se concentre a menos de 500 metros de una estación —con una mediana de proximidad de 771.76 metros— ilustra que la criminalidad no obedece a fuerzas misteriosas, sino a la aritmética predecible del flujo peatonal. Ignorar esta realidad es apostar por la impunidad. Estos hallazgos exigen al Estado abandonar los despliegues de seguridad reactivos y ciegos, obligando a rediseñar políticas de prevención enfocadas quirúrgicamente en los radios inmediatos de la movilidad masiva. Solo a través de esta precisión analítica lograremos proteger a quienes sostienen, con sus trayectos diarios, el pulso de la metrópoli.

## 6. Referencias

Brantingham, P. L., & Brantingham, P. J. (1993). Nodes, paths and edges: Considerations on the complexity of crime and the physical environment. *Journal of Environmental Psychology*, 13(1), 3-28.

Fiscalía General de Justicia de la Ciudad de México [FGJCDMX]. (2023). *Carpetas de Investigación*. Portal de Datos Abiertos de la Ciudad de México.

OpenStreetMap Contributors. (2023). *Planet dump*. Recuperado de https://planet.osm.org
