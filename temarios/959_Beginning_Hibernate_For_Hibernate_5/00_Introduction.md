# Introduction

Hibernate es una increíble pieza de software. Con un poco de experiencia y el poder de las anotaciones, puede crear un sistema complejo respaldado por una base de datos con una facilidad inquietante. Una vez que haya construido un sistema utilizando Hibernate, nunca querrá volver a los enfoques tradicionales.

Si bien Hibernate es increíblemente poderoso, presenta una curva de aprendizaje empinada cuando lo encuentra por primera vez; las curvas de aprendizaje empinadas son en realidad algo bueno porque brindan una visión profunda una vez que las ha escalado. Sin embargo, obtener esa percepción requiere algo de perseverancia y ayuda.

Nuestro objetivo en este libro es ayudarlo a escalar esa curva de aprendizaje al presentarle los requisitos mínimos de una aplicación discreta de Hibernate, explicar la base de esos requisitos y guiarlo a través de una aplicación de ejemplo que se crea con ellos. Luego proporcionamos material adicional para ser digerido una vez que se comprendan firmemente los fundamentos. En todo momento, proporcionamos ejemplos en lugar de confiar en el discurso puro. Esperamos que siga encontrando este libro útil como texto de referencia mucho después de que se haya convertido en un experto en el tema.

### Para quien es este libro

Este libro asume una buena comprensión de los fundamentos de Java y cierta familiaridad con la programación de bases de datos utilizando la API de conectividad de base de datos de Java (JDBC). No esperamos que sepa nada acerca de Hibernate, pero si compra este libro, probablemente será porque estuvo expuesto al doloroso proceso de construir un gran sistema basado en una base de datos.

Todos nuestros ejemplos utilizan software de código abierto, principalmente la propia API de Hibernate, por lo que no necesitará comprar ningún software para comenzar con el desarrollo de Hibernate. Este libro no es un texto académico. Nuestro enfoque es, en cambio, proporcionar ejemplos extensos y adoptar un enfoque pragmático de la tecnología que cubre.

Para los verdaderos recién llegados a la API de Hibernate, recomendamos que lean al menos los primeros tres capítulos en orden antes de sumergirse en los jugosos temas de los capítulos posteriores. Los desarrolladores muy experimentados o aquellos con experiencia con herramientas similares a Hibernate querrán hojear la segunda mitad del libro para ver capítulos interesantes.

### Cómo está estructurado este libro

Este libro se divide informalmente en tres partes. Los capítulos 1 a 8 describen ***los fundamentos de Hibernate***, incluida la configuración, la creación de archivos de mapeo y las API básicas. Los capítulos 9 a 11 describen ***el uso de consultas, criterios y filtros*** para acceder a la información persistente de formas más sofisticadas. El Capítulo 12 aborda el uso de Hibernate para hablar con almacenes de datos no relacionales, lo que proporciona un fácil ***acceso a NoSQL***.

Finalmente, los apéndices discuten las ***funciones que usará con menos frecuencia*** o que son secundarias a la funcionalidad principal de Hibernate. La siguiente lista describe más detalladamente el contenido de cada capítulo:

El **Capítulo 1** describe el propósito de las herramientas de persistencia y presenta extractos de una aplicación de ejemplo simple para mostrar cómo se puede aplicar Hibernate. También introduce la terminología y los conceptos básicos.

El **Capítulo 2** analiza los fundamentos de la configuración de una aplicación de Hibernate. Presenta la arquitectura básica de Hibernate y explica cómo se integra una aplicación de Hibernate en una aplicación.

El **Capítulo 3** presenta una aplicación de ejemplo, guiándolo a través del proceso completo de creación y ejecución de la aplicación. Luego analiza un ejemplo un poco más complejo e introduce la noción de generar el esquema de la base de datos directamente desde las anotaciones de Hibernate.

El **Capítulo 4** cubre el ciclo de vida de Hibernate en profundidad. Analiza el ciclo de vida en el contexto de los métodos disponibles en las interfaces principales. También presenta terminología clave y analiza la necesidad de carga diferida y en cascada.

El **Capítulo 5** explica por qué Hibernate debe retener la información de mapeo y demuestra los diversos tipos de asociaciones que pueden ser representadas por una base de datos relacional. Describe brevemente la otra información que se puede mantener dentro de un mapeo de Hibernate.

El **Capítulo 6** explica cómo Hibernate le permite usar las anotaciones para representar información de mapeo. Proporciona ejemplos detallados de las anotaciones más importantes y analiza las diferencias entre las anotaciones JPA 2 estándar y las propietarias de Hibernate.

El **Capítulo 7** explica algunos de los usos de la API de persistencia de Java (a diferencia de la API nativa de Hibernate), así como el ciclo de vida y la validación de los objetos persistentes.

El **Capítulo 8** revisa el objeto Sesión de Hibernate en detalle, explicando los diversos métodos que proporciona. El capítulo también analiza el uso de transacciones, el bloqueo y el almacenamiento en caché, así como también cómo utilizar Hibernate en un entorno multiproceso.

El **Capítulo 9** analiza cómo se puede usar Hibernate para realizar consultas sofisticadas en la base de datos relacional subyacente utilizando el Lenguaje de consulta de Hibernate (HQL) incorporado.

El **Capítulo 10** presenta la API de Criterios, que es un análogo programático del lenguaje de consulta discutido en el Capítulo 9.

El **Capítulo 11** analiza cómo se puede usar la Filter API para restringir los resultados de las consultas presentadas en los Capítulos 9 y 10 .

El **Capítulo 12** presenta Hibernate OGM, que asigna objetos a almacenes de datos no relacionales como Infinispan y MongoDB, entre otros. Muestra algunos de los usos de Hibernate Search para proporcionar una función de búsqueda común para NoSQL, además de ofrecer compatibilidad con consultas de texto completo.

El **Capítulo 13** cubre Hibernate Envers, que es una biblioteca que proporciona datos versionados para entidades almacenadas a través de Hibernate.

