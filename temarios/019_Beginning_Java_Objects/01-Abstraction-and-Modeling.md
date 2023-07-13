# 1. Abstracción y Modelado

* Simplification Through Abstraction
* Generalization Through Abstraction
* Organizing Abstractions into Classification Hierarchies
* Abstraction as the Basis for Software Development
* Reuse of Abstractions
* Inherent Challenges
* What Does It Take to Be a Successful Object Modeler?
* Summary

Como seres humanos, estamos inundados de información todos los días de nuestras vidas. Incluso si pudiéramos apagar temporalmente todas las fuentes de "información electrónica" que nos bombardean constantemente (correos electrónicos, mensajes de voz, podcasts, tweets y similares), solo nuestros cinco sentidos recopilan millones de bits de información por día solo de nuestro alrededores. Sin embargo, logramos dar sentido a toda esta información, por lo general sin abrumarnos. Nuestros cerebros simplifican naturalmente los detalles de todo lo que observamos para que estos detalles sean manejables a través de un proceso conocido como **abstracción**.

En este capítulo, aprenderá

* Cómo la abstracción sirve para simplificar nuestra visión del mundo
* Cómo organizamos nuestro conocimiento jerárquicamente para minimizar la cantidad de información que tenemos que hacer malabarismos mentalmente en un momento dado
* La relevancia de la abstracción para el desarrollo de software
* Los desafíos inherentes que enfrentamos como desarrolladores de software cuando intentamos modelar una situación real en el software

## Simplificación a través de la abstracción

Tómate un momento para mirar alrededor de la habitación en la que estás leyendo este libro. Al principio, puede pensar que realmente no hay muchas cosas para observar: algunos muebles, lámparas, tal vez algunas plantas, obras de arte, incluso algunas otras personas o mascotas. Tal vez hay una ventana por la que mirar que abre el mundo exterior a la observación.

Ahora mira de nuevo. Para cada cosa que ves, hay una miríada de detalles para observar: su tamaño, su color, su propósito, los componentes a partir de los cuales está ensamblado (las patas de una mesa, las bombillas de una lámpara), etc. Además, cada uno de estos componentes a su vez tiene detalles asociados: el tipo de material utilizado para hacer las patas de la mesa (madera o metal), la potencia de las bombillas, etc. Ahora tenga en cuenta sus otros sentidos: el sonido de alguien roncando (¡esperemos que no mientras lee este libro!), el olor a palomitas de maíz que sale del horno de microondas al final del pasillo, etc. Finalmente, piensa en todos los detalles ocultos de estos objetos: quién los fabricó o cuál es su composición química, molecular o genética.

Está claro que la cantidad de información que debe procesar nuestro cerebro es realmente abrumadora. Sin embargo, para la gran mayoría de las personas, esto no representa un problema, porque tenemos una habilidad innata para la **abstracción**, un proceso que implica reconocer y enfocarse en las características importantes de una situación u objeto y filtrar o ignorar todas las detalles no esenciales.

Un ejemplo familiar de una abstracción es un mapa de carreteras. Como abstracción, un mapa de carreteras representa aquellas características de un área geográfica dada que son relevantes para alguien que intenta navegar con el mapa, quizás en automóvil: carreteras principales y lugares de interés, obstáculos tales como grandes masas de agua, etc. Por necesidad, el mapa de carreteras no puede incluir todos los edificios, árboles, letreros de calles, vallas publicitarias, semáforos, restaurantes de comida rápida, etc. que existen físicamente en el mundo real. Si lo hiciera, entonces estaría tan desordenado que sería prácticamente inutilizable; ninguna de las características importantes se destacaría. Comparar un mapa de carreteras a un mapa topográfico, un mapa climatológico y un mapa de densidad de población de la misma región: cada uno abstrae diferentes características del mundo real, es decir, aquellas relevantes para el usuario previsto del mapa en cuestión.

Como otro ejemplo, considere un paisaje. Un artista puede mirar el paisaje desde la perspectiva de los colores, las texturas y las formas como posible tema para una pintura. Un constructor de viviendas puede mirar el mismo paisaje desde la perspectiva de dónde puede estar el mejor sitio de construcción en la propiedad, evaluando cuántos árboles deberán talarse para dar paso a un proyecto de construcción. Un ecologista puede estudiar de cerca las especies individuales de árboles y otra vida vegetal/animal en busca de su biodiversidad, con miras a preservarlos y protegerlos, mientras que un niño puede simplemente estar mirando todos los árboles en busca del mejor sitio para un árbol. Algunos elementos son comunes a las abstracciones del paisaje de los cuatro observadores (los tipos, tamaños y ubicaciones de los árboles, por ejemplo), mientras que otros no son relevantes para todas las abstracciones.

## Generalización a través de la abstracción

Si eliminamos suficientes detalles de una abstracción, se vuelve lo suficientemente genérico como para aplicarlo a una amplia gama de situaciones o instancias específicas. Tales abstracciones genéricas a menudo pueden ser muy útiles. Por ejemplo, un diagrama de una célula genérica en el cuerpo humano, como el de la Figura 1-1 , podría incluir solo algunas características de las estructuras que se encuentran en una célula real.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/5b07c608-2933-425d-b52f-19cacf3df1cf)

**Figura 1-1 Una abstracción genérica de una celda.**

Este diagrama demasiado simplificado no parece una célula nerviosa real, una célula muscular real o una célula sanguínea real; y, sin embargo, todavía se puede usar en un entorno educativo para describir ciertos aspectos de la estructura y función de todos estos tipos de células, es decir, aquellas características que los diversos tipos de células tienen en común.

Cuanto más simple es una abstracción, es decir, cuantas menos características presenta, más general es y más versátil es para describir una variedad de situaciones del mundo real. Cuanto más compleja es una abstracción, más restrictiva es y, por lo tanto, menos situaciones es útil para describir.

### Organización de abstracciones en jerarquías de clasificación

Aunque nuestros cerebros son expertos en abstraer conceptos como mapas de carreteras y paisajes, eso nos deja millones de abstracciones separadas con las que lidiar a lo largo de nuestras vidas. Para hacer frente a este aspecto de la complejidad, los seres humanos organizan sistemáticamente la información en categorías de acuerdo con criterios establecidos; este proceso se conoce como **clasificación**.

Por ejemplo, la ciencia clasifica todos los objetos naturales como pertenecientes al reino animal, vegetal o mineral. Para que un objeto natural sea clasificado como animal, debe cumplir con las siguientes reglas:

* Debe ser (o haber sido alguna vez) un ser vivo.
* Debe ser capaz de movimiento espontáneo.
* Debe ser capaz de una respuesta motora rápida a la estimulación.

Las reglas de lo que constituye una planta, por otro lado, son diferentes:

* Debe ser un ser vivo (lo mismo que para un animal).
* Debe carecer de un sistema nervioso evidente.
* Debe poseer paredes celulares de celulosa.

Dadas reglas claras como estas, colocar un objeto en la categoría o clase apropiada es bastante sencillo. Luego podemos "profundizar", especificando reglas adicionales que diferencian varios tipos de animales, por ejemplo, hasta que hayamos construido una jerarquía de abstracciones cada vez más complejas de arriba a abajo. En la Figura 1-2 se muestra un ejemplo simple de una jerarquía de abstracción de este tipo .

![image](https://github.com/adolfodelarosades/Java/assets/23094588/6009fa50-e122-49a7-9fca-597b7c6262da)

**Figura 1-2 Una simple jerarquía de abstracción de objetos naturales.**

Cuando pensamos en una jerarquía de abstracción como la que se muestra en la Figura 1-2 , mentalmente subimos y bajamos la jerarquía, concentrándonos automáticamente en solo la capa o subconjunto de la jerarquía (conocido como **subárbol**) que es importante para nosotros. en un momento dado. Por ejemplo, es posible que solo nos interesen los mamíferos y, por lo tanto, podemos centrarnos en el subárbol de mamíferos, que se muestra en la Figura 1-3 , ignorando temporalmente el resto de la jerarquía.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/7ff7b158-6f2f-4763-a63c-51f5ca803a9c)

**Figura 1-3 Centrarse en un pequeño subconjunto de la jerarquía es menos abrumador**

Al hacerlo, reducimos automáticamente la cantidad de conceptos que necesitamos mentalmente para hacer malabarismos en un momento dado a un subconjunto manejable de la jerarquía de abstracción general; en nuestro ejemplo simplista, ahora estamos tratando con solo cuatro conceptos en lugar de los 13 originales. No importa cuán compleja se vuelva una jerarquía de abstracción, no tiene por qué abrumarnos si está organizada correctamente.

Determinar con precisión qué reglas son necesarias para clasificar correctamente un objeto dentro de una jerarquía de abstracción no siempre es fácil. Tomemos, por ejemplo, las reglas que podríamos definir para lo que constituye un pájaro: a saber, algo que

* Tiene plumas
* Tiene alas
* Pone huevos
* Es capaz de volar

Dadas estas reglas, ni un avestruz ni un pingüino podrían clasificarse como aves (aunque ambos deberían serlo), porque ninguno puede volar (ver Figura 1-4 ).

![image](https://github.com/adolfodelarosades/Java/assets/23094588/de0109b6-d3ac-4e70-8404-53e0fbeb7dbb)

**Figura 1-4 Derivar las reglas de clasificación correctas puede ser difícil**

Si intentamos hacer que el conjunto de reglas sea menos restrictivo eliminando la regla "Es capaz de volar", nos quedamos con

* Tiene plumas
* Tiene alas
* Pone huevos

De acuerdo con este conjunto de reglas, ahora podemos clasificar correctamente tanto al avestruz como al pingüino como aves, como se muestra en la figura 1-5 .


![image](https://github.com/adolfodelarosades/Java/assets/23094588/eab284bd-7d81-49bf-827e-c18e128cd0d3)

**Figura 1-5 Se han establecido reglas de clasificación adecuadas.**

Este conjunto de reglas sigue siendo innecesariamente complicado, porque resulta que la regla de "pone huevos" es redundante: ya sea que la mantengamos o la eliminemos, no cambia nuestra decisión de lo que constituye un ave frente a una no ave. Por lo tanto, simplificamos el conjunto de reglas una vez más:

* Tiene plumas
* Tiene alas

Sintiéndonos particularmente atrevidos(!), tratamos de llevar nuestro proceso de simplificación un paso más allá eliminando otra regla más, definiendo un pájaro como algo que

* Tiene alas

Como muestra la Figura 1-6 , hemos ido demasiado lejos esta vez: ¡la abstracción de un pájaro ahora es tan general que incluiríamos aviones, insectos y todo tipo de otras cosas que no son pájaros en la mezcla!

![image](https://github.com/adolfodelarosades/Java/assets/23094588/9fa9fbd3-45be-421a-86ad-43b5980d78a0)

**Figura 1-6 Un conjunto de reglas demasiado relajado es tan problemático como un conjunto de reglas demasiado restrictivo.**

El proceso de definición de reglas con fines de categorización implica seleccionar el conjunto correcto de reglas (no demasiado generales, no demasiado restrictivas y que no contengan redundancias) para definir la pertenencia correcta a una clase en particular.

### La abstracción como base para el desarrollo de software

Cuando determinamos los requisitos para un proyecto de desarrollo de sistemas de información, generalmente comenzamos recopilando detalles sobre la situación del mundo real en la que se basará el sistema. Estos detalles suelen ser una combinación de
Aquellos que se nos ofrecen explícitamente cuando entrevistamos a los usuarios previstos del sistema.

Los que de otra manera observamos

Debemos juzgar cuál de estos detalles es relevante para el propósito final del sistema. Esto es esencial, ya que no podemos automatizarlos todos. Incluir demasiados detalles es complicar demasiado el sistema resultante, haciéndolo mucho más difícil de diseñar, programar, probar, depurar, documentar, mantener y ampliar en el futuro.

Al igual que con todas las abstracciones, todas nuestras decisiones de inclusión frente a eliminación al construir un sistema de software deben tomarse dentro del contexto del propósito general y el dominio , o el enfoque de la materia, del futuro sistema. Al representar a una persona en un sistema de software , por ejemplo, ¿es importante el color de sus ojos? ¿Qué hay de su perfil genético? ¿Salario? ¿Aficiones? La respuesta es que cualquiera de estas características de una persona puede ser relevante o irrelevante, dependiendo de si el sistema a desarrollar es un
Sistema de nómina

Sistema de datos demográficos de marketing

Base de datos de pacientes del optometrista

El sistema de seguimiento de los "más buscados" del FBI

Una vez que hayamos determinado los aspectos esenciales de una situación, algo que exploraremos en la Parte 2 de este libro, podemos preparar un modelo de esa situación. El modelado es el proceso mediante el cual desarrollamos un patrón para hacer algo. Un plano para una casa personalizada, un diagrama esquemático de un circuito impreso y un cortador de galletas son ejemplos de tales patrones. Como veremos en las Partes 2 y 3, un modelo de objeto de un sistema de software es un patrón de este tipo. El modelado y la abstracción van de la mano, porque un modelo es esencialmente una representación física o gráfica de una abstracción; antes de que podamos modelar algo de manera efectiva, debemos haber determinado los detalles esenciales del tema a modelar.

Reutilización de abstracciones
Cuando aprendemos sobre algo nuevo, buscamos automáticamente en nuestro archivo mental otras abstracciones/modelos que hemos construido y dominado previamente, para buscar similitudes sobre las que podamos construir. Al aprender a andar en bicicleta de dos ruedas por primera vez, por ejemplo, es posible que haya recurrido a las lecciones que aprendió sobre andar en triciclo cuando era niño (vea la Figura 1-7 ) . Ambos tienen manubrios que se usan para conducir; ambos tienen pedales que se utilizan para impulsar la bicicleta hacia adelante. Aunque las abstracciones no encajaban a la perfección: se presentó una bicicleta de dos ruedasel nuevo desafío de tener que mantener el equilibrio: había suficiente similitud para permitirle aprovechar la experiencia de dirección y pedaleo que ya dominaba y concentrarse en aprender la nueva habilidad de cómo mantener el equilibrio sobre dos ruedas.

Figura 1-7El cerebro humano es experto en aprender basándose en abstracciones ya establecidas.
Esta técnica de comparar características para encontrar una abstracción que sea lo suficientemente similar para ser reutilizada con éxito se conoce como coincidencia de patrones y reutilización . Como veremos más adelante en el libro, la reutilización de patrones también es una técnica importante para el desarrollo de software orientado a objetos, porque nos evita tener que reinventar la rueda con cada nuevo proyecto. Si podemos reutilizar una abstracción o un modelo de un proyecto anterior, podemos centrarnos en aquellos aspectos del nuevo proyecto que difieren del anterior, ganando una enorme cantidad de productividad en el proceso.

Desafíos inherentes
A pesar de que la abstracción es un proceso tan natural para los seres humanos, desarrollar un modelo apropiado para un sistema de software es quizás el aspecto más difícil de la ingeniería de software , porque
Hay un número ilimitado de posibilidades. La abstracción está, hasta cierto punto, en el ojo del espectador: casi se garantiza que varios observadores diferentes que trabajan de forma independiente lleguen a modelos diferentes. ¿De quién es el mejor? ¡Se han producido discusiones apasionadas !

Para complicar aún más las cosas, prácticamente nunca hay un solo modelo "mejor" o "correcto" , solo modelos "mejores" o "peores" en relación con el problema a resolver. La misma situación se puede modelar en una variedad de formas igualmente válidas. Cuando comencemos a hacer algunos modelos en la Parte 2 de este libro, veremos una serie de abstracciones alternativas válidas para nuestro estudio de caso del Sistema de registro de estudiantes (SRS) que se presentó al final de la Introducción.

Tenga en cuenta, sin embargo, que existe un modelo incorrecto: es decir, uno que tergiversa la situación del mundo real (por ejemplo, modelar a una persona con dos tipos de sangre diferentes).

No existe una prueba de fuego para determinar si un modelo ha capturado adecuadamente todos los requisitos de un usuario. La evidencia final de si una abstracción fue apropiada o no está en cuán exitoso resulta ser el sistema de software resultante. Debido a esto, es fundamental que aprendamos formas de comunicar nuestro modelo de manera concisa y sin ambigüedades con frecuencia a lo largo del ciclo de vida del desarrollo Agile para

Los futuros usuarios previstos de nuestra aplicación, para que puedan proporcionar una verificación de cordura para nuestra comprensión del problema a resolver antes de embarcarnos en el desarrollo de software.

Nuestros colegas ingenieros de software, para que los miembros del equipo puedan compartir una visión común de lo que debemos construir en colaboración.

A pesar de todos estos desafíos, es fundamental obtener la abstracción inicial "correcta" antes de comenzar a construir un sistema. Cuanto más tarde en el ciclo de vida del software se detecta un error de modelado, más costoso es corregirlo por órdenes de magnitud. Esto no quiere decir que una abstracción deba ser rígida, ¡todo lo contrario! El arte y la ciencia del modelado de objetos, cuando se aplica correctamente, produce un modelo que es lo suficientemente flexible para soportar una amplia variedad de cambios funcionales. Además, las propiedades especiales de los objetos de software se prestan aún más a soluciones de software flexibles, como aprenderá a lo largo del resto del libro.

¿Qué se necesita para ser un modelador de objetos exitoso?
Llegar a una abstracción adecuada como base para un modelo de sistema de software requiere
Información sobre el dominio del problema : idealmente, podremos aprovechar nuestras propias experiencias del mundo real, como la experiencia anterior o actual como estudiante, que será útil al determinar los requisitos para el Sistema de registro de estudiantes (SRS ) , la base de nuestros esfuerzos de modelado y codificación en las Partes 2 y 3 del libro.

Creatividad : debemos ser capaces de pensar “fuera de la caja”, en caso de que los futuros usuarios a los que estamos entrevistando hayan estado inmersos en el área del problema durante tanto tiempo que no vean las innovaciones que podrían realizarse.

Buenas habilidades para escuchar : Estas serán útiles a medida que los futuros usuarios del sistema describan cómo hacen su trabajo actualmente o cómo imaginan hacer su trabajo en el futuro, con la ayuda del sistema que estamos a punto de desarrollar.

Buenas habilidades de observación : las acciones a menudo hablan más que las palabras. Con solo observar a los usuarios en sus actividades diarias, podemos detectar un detalle esencial que se han olvidado de mencionar porque lo hacen de manera tan rutinaria que se ha convertido en un hábito.

Pero todo esto no es suficiente. También necesitamos
Un proceso organizado para determinar cuál debe ser la abstracción. Si seguimos una lista comprobada de pasos para producir un modelo, entonces reducimos en gran medida la probabilidad de que omitamos alguna característica importante o descuidemos un requisito crítico.

Una forma de comunicar el modelo resultante de manera concisa y sin ambigüedades a nuestros compañeros desarrolladores de software y a las partes interesadas/usuarios previstos de nuestra aplicación. Si bien es ciertamente posible describir una abstracción en un texto narrativo, una imagen vale más que mil palabras, por lo que el lenguaje con el que comunicamos un modelo suele ser una notación gráfica . A lo largo de este libro, nos centraremos en la notación del lenguaje de modelado unificado (UML; consulte la figura 1-8 ) como nuestro lenguaje de comunicación modelo (aprenderá los conceptos básicos de UML en los capítulos 10 y 11 ). Piense en un modelo gráfico como un plano de la aplicación de software que se va a construir.


Figura 1-8Describir un paisaje en notación UML
Idealmente, una herramienta de software que nos ayude a automatizar el proceso de producción de dicho modelo.

La Parte 2 de este libro cubre estos tres aspectos del modelado (proceso, notación y herramienta) en detalle.

A lo largo del resto de este libro, nos centraremos en el siguiente caso de estudio como base para las lecciones de modelado de objetos y codificación Java:

Especificación de requisitos del sistema de registro de estudiantes (SRS)
Nos han pedido que desarrollemos un Sistema de Registro de Estudiantes (SRS) automatizado. Este sistema permitirá que los estudiantes se registren en línea para los cursos cada semestre, así como el seguimiento del progreso de un estudiante hacia la finalización de su título.

Cuando un estudiante se inscribe por primera vez en la universidad, usa el SRS para establecer un plan de estudio sobre qué cursos planea tomar para satisfacer un programa de grado en particular y elegir un asesor de la facultad. La SRS verificará si el plan de estudios propuesto cumple o no con los requisitos de la carrera que el estudiante busca. Una vez establecido un plan de estudios, durante el período de inscripción anterior a cada semestre, los estudiantes pueden consultar el horario de clases en línea y elegir las clases a las que desean asistir, indicando la sección preferida (día de la semana y hora de día) si la clase es ofrecida por más de un profesor.

Suponiendo que (a) se cumplan los requisitos previos para los cursos solicitados, (b) los cursos cumplan con uno de los requisitos del plan de estudio del estudiante y (c) haya espacio disponible en cada una de las clases ), el estudiante está inscrito en la(s) clase(s).

Si (a) y (b) se cumplen, pero (c) no, el estudiante se coloca en una lista de espera por orden de llegada. Si una clase/sección para la que estaba previamente en la lista de espera vuelve a estar disponible (ya sea porque otro estudiante abandonó la clase o porque se incrementó la capacidad de asientos para la clase), el estudiante se inscribe automáticamente en la clase en la lista de espera y se le envía un mensaje de correo electrónico. a tal efecto se envía al estudiante. Es su responsabilidad abandonar la clase si ya no la desea; de lo contrario, se les facturará el curso.

Resumen
En este capítulo, has aprendido que

La abstracción es una técnica fundamental que las personas utilizan para percibir el mundo.

Desarrollar una abstracción del problema a automatizar es un primer paso necesario de todo desarrollo de software.

Naturalmente, organizamos la información en jerarquías de clasificación basadas en reglas que estructuramos cuidadosamente, de modo que no sean ni demasiado generales ni demasiado restrictivas.

A menudo reutilizamos abstracciones cuando intentamos modelar un nuevo concepto.

Producir una abstracción de un sistema a construir, conocido como modelo, es en algunos sentidos una segunda naturaleza para nosotros y, sin embargo, paradójicamente, es una de las cosas más difíciles que los desarrolladores de software tienen que hacer en el ciclo de vida de un proyecto de sistemas de información. También es uno de los más importantes.

Ejercicios
1.	
Dibuje una jerarquía de clases que se relacione con todas las siguientes clases de manera razonable:

Manzana

Banana

Carne de res

Bebida

Queso

Consumible

Producto lácteo

Alimento

Fruta

Judías verdes

Carne

Leche

Cerdo

Espinaca

Verdura

Justifique su respuesta, señalando en particular cualquier desafío que haya enfrentado al hacerlo.

 
2.	
¿Qué aspectos de un televisor sería importante abstraer desde la perspectiva de
¿Un consumidor que desea comprar uno?

¿Un ingeniero responsable de diseñar uno?

¿Un minorista que los vende?

¿El fabricante?

 
3.	
Seleccione un área problemática que le gustaría modelar desde una perspectiva orientada a objetos. Idealmente, este será un problema en el que realmente trabajará en su lugar de trabajo o en el que tenga un gran interés. Suponga que va a escribir un programa para automatizar algún aspecto de esta área problemática. y escriba una descripción general de una página de los requisitos para este programa, siguiendo el patrón del estudio de caso de SRS .

Asegúrese de que su primer párrafo resuma la intención del sistema, como lo hace el primer párrafo en el estudio de caso de SRS. Además, enfatice los requisitos funcionales , es decir, aquellos que un usuario final sin conocimientos técnicos podría establecer sobre cómo debe comportarse el sistema, y ​​evite establecer requisitos técnicos , por ejemplo, “Este sistema debe ejecutarse en una plataforma Unix y debe usar TCP/ Protocolo IP para…”

 
4.	
Lea el estudio de caso de un Sistema de Seguimiento de Recetas (PTS) en el Apéndice. En su opinión, ¿qué tan efectivo es este estudio de caso como abstracción? ¿Hay detalles que cree que podrían haberse omitido o faltan detalles que cree que habría sido importante incluir? Si tuviera la oportunidad de entrevistar a los usuarios previstos del PTS, ¿qué preguntas adicionales podría hacerles para refinar mejor esta abstracción?
