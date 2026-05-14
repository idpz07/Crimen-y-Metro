# La Aritmética del Despojo: El Efecto Cuello de Botella y la Concentración Espacial del Delito en la CDMX

**Autor:** Sergio Iván De Pozo Uriza

***

El tránsito diario hacia una estación de transporte masivo es un ejercicio cotidiano de vulnerabilidad calculada. Un ciudadano camina por las calles de su colonia asimilando el entorno: evalúa la iluminación, ajusta el ritmo de sus pasos y asegura sus pertenencias conforme se aproxima a los andenes. Este trayecto, que representa un acto indispensable para la productividad económica de la urbe, se convierte sistemáticamente en un punto de fricción. La infraestructura pública, diseñada para la conectividad y el progreso, exhibe una dualidad operativa: facilita el movimiento legítimo al tiempo que centraliza la oportunidad criminal. La narrativa del despojo no opera en un vacío geográfico. Rastrear su ubicación evidencia que explota la infraestructura de movilidad más importante de la capital. La concentración de personas en torno al Metro de la Ciudad de México carece de neutralidad; funge como un catalizador estructural de la incidencia delictiva, transformando el derecho al transporte en un riesgo probabilístico predecible.

## 1. Patrones de Aglomeración y Distancia

El análisis de proximidad euclidiana entre los puntos de incidencia de robos y las estaciones revela que el peligro no se distribuye de manera uniforme o aleatoria en el espacio urbano. Se arraiga en la infraestructura que utilizamos para desplazarnos, demostrando una relación directa entre aglomeración peatonal y oportunidad criminal.

*(Inserta aquí la gráfica `Figure1_Crime_Decay.png`)*

### Decaimiento Espacial del Delito
*(Inserta aquí la gráfica `Figure5_ECDF.png`)*

Las cifras desmontan cualquier percepción de anarquía espacial o caos desorganizado. De los 148,431 delitos analizados, el 35.3% ocurre en un radio de apenas 500 metros alrededor de alguna estación de la red. La mediana de distancia para cualquier asalto respecto a la estación más cercana es de 771.76 metros, mientras que la media se ubica en 1,546.62 metros. Estos datos representan la vulnerabilidad cuantificada del ciudadano y demuestran cómo el riesgo se intensifica abruptamente en los trayectos de aproximación. Al igual que en la teoría política donde la simple concentración de individuos requiere un andamiaje institucional para evitar la anomia, en la realidad urbana la aglomeración de transeúntes sin una contención adecuada facilita la explotación sistemática de los individuos. El infractor racional se instala en las arterias donde el flujo garantiza una provisión constante de oportunidades, transformando la eficiencia del transporte público en eficiencia delictiva.

### Tipología del Delito según la Distancia
*(Inserta aquí la gráfica `Figure4_Violence_Decay.png`)*

Al segmentar la incidencia entre robos con y sin violencia, los datos evidencian una clara especialización operativa por parte de los infractores. La mayor densidad del robo sin violencia —el sigiloso carterismo— ocurre a 0 metros de distancia. Su ecosistema ideal son los torniquetes, los pasillos y los andenes. En estos espacios confinados, la fricción física de los cuerpos enmascara la extracción de pertenencias, diluyendo la responsabilidad individual en el anonimato de la masa.

El robo con violencia presenta una dinámica espacial distinta. Alcanza su pico entre los 100 y 300 metros de la estación. En este rango geográfico, el flujo peatonal sigue siendo constante, alimentando la disponibilidad de objetivos, pero la vigilancia natural provista por la multitud comienza a fragmentarse. Es en estos tramos intersticiales donde se crea el escenario propicio para la intimidación directa, demostrando una adaptación táctica a la geografía del entorno y explotando los puntos ciegos de la transición peatonal.

## 2. Mapa de Densidad Criminal

*(Inserta aquí el mapa `Figure2_Map.png`)*

La cartografía de los datos confirma esta falencia estructural. Los clústeres de alta incidencia, identificados analíticamente como "hotspots", calcan de forma precisa el trazado del Metro. Esta concentración obedece a una decisión espacial calculada para maximizar el beneficio económico frente a la negligencia en la planeación de la seguridad perimetral. La visualización de estas aglomeraciones consolida la evidencia de lo que aquí denominamos el "Efecto Cuello de Botella": el transporte público actúa como un embudo que concentra a la población en puntos geográficos específicos, atrayendo simultáneamente a la actividad criminal que parasita dicho flujo masivo. La ciudad, vista desde esta óptica, se revela como un tablero donde la distribución del delito es una función directa de la infraestructura de movilidad.

## 3. Experimento Natural: El Cierre de la Línea 12

Resulta metodológicamente necesario cuestionar si el Metro crea, de manera inherente, la criminalidad que lo rodea. ¿Es la infraestructura ferroviaria una incubadora de infractores o el escenario óptimo para su operación? Para distinguir entre correlación espacial y causalidad, es imperativo aislar el efecto de la infraestructura frente al flujo de personas que la utiliza. 

La suspensión del servicio de la Línea 12 en mayo de 2021 ofreció un experimento natural inusual. Mediante un diseño econométrico de Series de Tiempo Interrumpido (ITS), aislamos el comportamiento de las estaciones puras de Iztapalapa y Tláhuac, descartando sistemáticamente los nodos de transferencia que pudieran contaminar el impacto de la pérdida total de afluencia, garantizando así una medición precisa del choque exógeno.

*(Inserta aquí la gráfica `ITS_Analysis/Figure6_ITS_L12_Closure.png`)*

Al evaluar el comportamiento delictivo mediante una regresión de Poisson —controlando por la estacionalidad y la tendencia secular previa— el resultado desafía la intuición superficial: el cese de operaciones del Metro carece de significancia estadística sobre la disminución de los asaltos en la zona inmediata.

¿Qué revela esta disonancia? La creencia de que el cierre pacificó la zona adolece de un sesgo analítico por variable omitida. Dicha percepción ignoraba que el robo a transeúnte mostraba una tendencia a la baja continua desde años atrás. El modelo demuestra que la reducción posterior a mayo de 2021 no es resultado derivado de la clausura de las estaciones, sino la simple inercia de una tendencia estructural preexistente. Esta evidencia empuja hacia un hallazgo concluyente: la movilidad masiva no engendra nuevos delitos a nivel macro. Su función criminológica es la de un embudo aglutinador. Reorganiza el mapa delictivo de la ciudad al concentrar espacialmente las oportunidades de despojo, sin aumentar el volumen total del crimen en la jurisdicción.

## 4. Notas Metodológicas y Limitaciones (Caveats)

Todo análisis empírico debe documentar sus fronteras de validez para garantizar el rigor científico. Los hallazgos presentados deben interpretarse bajo las siguientes precisiones metodológicas:

1. **Rango Temporal Estricto:** El análisis comprende de manera exclusiva los datos registrados entre enero de 2019 y diciembre de 2022. Este periodo fue seleccionado deliberadamente para capturar la dinámica pre-pandemia, el choque exógeno del confinamiento derivado de la crisis sanitaria y el experimento natural del cierre de la Línea 12, permitiendo aislar variables de confusión temporales.
2. **Sesgo de Denuncia (Cifra Negra):** Los datos provienen de las carpetas de investigación de la FGJCDMX. Existe un subreporte sustancial inherente a los delitos patrimoniales debido a la desconfianza institucional y los costos de transacción para la víctima. El análisis asume que dicho sesgo se distribuye de manera sistemática a través del espacio, lo que permite mantener la validez de las magnitudes relativas en las comparaciones espaciales entre las estaciones de la red.
3. **Endogeneidad de Ubicación Espacial:** Se reconoce una correlación estructural entre la ubicación de la infraestructura de transporte y la densidad demográfica; el Metro se planifica e instala en zonas de alta demanda poblacional. Para controlar este sesgo de endogeneidad, el análisis de la Línea 12 emplea un diseño de Series de Tiempo Interrumpido (ITS). Este enfoque compara a cada estación contra su propio registro histórico, neutralizando los factores geográficos invariantes y aislando únicamente la variable de interés: la eliminación abrupta del flujo peatonal.
4. **Transparencia y Uso de Inteligencia Artificial:** Este trabajo empírico fue desarrollado por el autor principal con la asistencia técnica integral de la Inteligencia Artificial (Antigravity/Gemini 3.1 Pro). Su integración abarcó el procesamiento de bases de datos crudas, la estructuración de los modelos econométricos en R y la posterior articulación discursiva del presente documento mediante el agente especializado (`@/escritor`). Esta colaboración mantuvo en todo momento el rigor metodológico y la dirección analítica bajo la supervisión humana directa.

## 5. Conclusión

La intersección analítica de los registros de la FGJCDMX y la cartografía de OpenStreetMap trasciende el ejercicio descriptivo para evidenciar una falla sistémica en la gestión de la seguridad urbana. El hecho incontrovertible de que el 35.3% de los asaltos ocurran en un radio menor a 500 metros de una estación ilustra que la concentración criminal no responde a fenómenos inescrutables, sino a la aritmética predecible del flujo peatonal y la omisión institucional en su resguardo perimetral. 

Ignorar esta dinámica espacial perpetúa la vulnerabilidad de la población usuaria y sostiene la viabilidad de la impunidad operativa. Los datos exigen al aparato estatal reestructurar las estrategias de intervención, transitando del despliegue reactivo y generalizado hacia políticas de prevención focalizadas en los micro-espacios que concentran el riesgo. Solo a través de esta precisión en el diseño de la política pública será posible proteger los trayectos diarios de la ciudadanía, mitigando el efecto aglutinador de un sistema concebido para movilizar, pero que, ante la falta de planeación integral, opera colateralmente como el principal nodo de despojo en la capital.

## 6. Referencias

Brantingham, P. L., & Brantingham, P. J. (1993). Nodes, paths and edges: Considerations on the complexity of crime and the physical environment. *Journal of Environmental Psychology*, 13(1), 3-28.

Fiscalía General de Justicia de la Ciudad de México [FGJCDMX]. (2023). *Carpetas de Investigación*. Portal de Datos Abiertos de la Ciudad de México.

OpenStreetMap Contributors. (2023). *Planet dump*. Recuperado de https://planet.osm.org
