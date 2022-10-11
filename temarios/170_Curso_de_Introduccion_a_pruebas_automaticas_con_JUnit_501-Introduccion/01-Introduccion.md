# Introducción 20m

* Presentación 4:31 
* ¿Qué es el testing y por qué debemos hacerlo? 6:52 
* Pirámide del testing y JUnit 9:10 
* Contenido adicional 3

## Presentación 4:31

### Requisitos

![image](https://user-images.githubusercontent.com/23094588/195101318-3b7843e4-aaa3-4051-b31a-d1dccffb9a8e.png)

### Indice

![image](https://user-images.githubusercontent.com/23094588/195102647-619fd5e9-0519-47ea-9ba0-0f9a87c23aad.png)

#### Introducción

Veremos que es el testing, ¿por qué hay que automatizar pruebas? ¿que es JUnit? 

#### Primeros Pasos

Como instalarlo, como configurarlo, como empezar las ejecuciones.

#### Aserciones

Las ***Aserciones*** nos permiten asegurarnos de que un dato que nosotros estamos entregando se nos es devuelto, nos devuelve el retorno de las funciones con el dato que nosotros esperamos recibir.

#### Agrupando Aserciones y Asunciones

La agrupacion nos va a permitir no solo un dato sino varios elementos, podemos comprobar texto, booleano, valores enteros o incluso listas, arrays. 

Las ***Asunciones*** es cuando asumimos que algo que nosotros esperamos esta ocurriendo, para que algo ocurra debemos configurar por ejemplo un método que haga algo entonces debemos cerciorarnos que realmente eso ocurre. 

#### Anotaciones

Las Anotaciones consistiran en el cambio de comportomiento de esta operativa.

#### Filtrado y Agrupando Test

Si queremos agrupar una batería de pruebas ver como podemos hacer una seleccion de dichas pruebas o enfocarlas a un modulo de la aplicación que estemos probando.

![image](https://user-images.githubusercontent.com/23094588/195107038-08f51c1e-adaa-4186-a46a-c14d0063833f.png)

Estos son los objetivos que tenemos al finalizar el curso.

Siempre que saquemos una nueva versión de nuestra aplicación debemos ser capaces de actualizar la batería de pruebas que siempre vamos a estar ejecutando.

Diseñar una batería de pruebas para ser ejecutada en cada uno de esos planes de regresión que tengamos, cada nueva versión de la aplicación que obtengamos seremos capaces de prepar una batería de pruebas a corde a dicha versión.


## ¿Qué es el testing y por qué debemos hacerlo? 6:52 

![image](https://user-images.githubusercontent.com/23094588/195109013-d332962e-109f-4159-b816-94a50a5e63d3.png)

Continuamos con el testing automático en JUnit5. En esta sección vamos a enfocarnos en que es el testing automático y porque debemos tratar de hacerlo. 

![image](https://user-images.githubusercontent.com/23094588/195109098-e6733f6a-c82f-4d29-85a4-0aa17c261ec5.png)

Comenzando por ¿Por qué automatizar pruebas?. En todo ciclo de desarrollo de software, aunque ya estamos dentro de una era Agile por decirlo así, todo está en continua reedición, continuo movimiento. En esencia más o menos siempre suelen llevar la misma directiva. Y es que ***en todo ciclo de desarrollo de software es necesario, es imperativo hacer pruebas a todos aquellos desarrollos que estamos realizando***. Entonces, no es tan simple como desarrollar una funcionalidad, un módulo, parte de una aplicación y listo, ya hemos terminado, no,  hay que hay que comprobar que todos esos desarrollos están siendo robustos, están a prueba. ¿Cómo decirlo? estan a prueba de balas, a prueba de errores, en este caso. 

Cuando se está diseñando el software, los encargados del aseguramiento de calidad, se encargan de diseñar planes de prueba acorde a esos módulos, esos desarrollos que se están realizando, con el fin de cubrir todas las posibilidades dentro de lo posible, dentro de la gran envergadura que tiene, es decir, nunca vamos a poder cubrir toda la casuística que existen con las pruebas. Pero bueno, sí en gran medida, en mayor medida de lo más crítico, bueno dependiendo de cómo hacemos el detalle.

Como ya digo, los encargados de testing, **los encargados del QA diseñan planes de pruebas**, se encargan de desarrollar estos planes de prueba. 

Cuando el proyecto está comenzando, cuando es de una pequeña envergadura, digamos que estamos cubriendo un amplio abanico de esas casuísticas, entoces no es difícil, entre comillas, podemos tener un número abarcable de pruebas. Pero este este número va a crecer en función del desarrollo, quiero decir, cuando tenemos un solo módulo es simple, pero cuando empezamos a añadir módulos estamos considerando que tenemos que hacer las pruebas que teníamos, más las nuevas pruebas correspondientes al nuevo módulo, al nuevo desarrollo que se vaya haciendo. Al final acabamos con una batería de prueba inmensa, y en la mayoría de los casos suele ser "inabarcable". El consumo de tiempo al principio puede ser ligero, liviano, pero a medida que avance va a ser tedioso va a ser muy complicado abarcar todas. 

En este punto necesitamos invertir muchos recursos para ello. Si nos estamos centrando únicamente como ya digo en pruebas manuales, vamos a tener el problema de que en poco tiempo nos van a faltar personas, nos van a faltar manos para poder abarcar todas esas pruebas, y no solo eso, sino que en la dificultad que entraña en algunas de esas va a ser considerable, es decir, no van a ser pruebas que podamos realizar digamos en minutos, sino que a lo mejor podemos tardar 5 minutos en ejecutar una prueba por poner un número. Así en números pequeños, hablando rápidamente sobre la marcha, es poco, pero pensar que esto va a seguir creciendo y creciendo y lo que son 5 minutos, y como ya no vamos a tener solo una entonces, hemos pasado de tener una prueba de 5 minutos a 10 pruebas de 5 minutos, ya llevamos 50 minutos. 

![image](https://user-images.githubusercontent.com/23094588/195109184-817bc5de-0180-4d20-83e3-30c751acd2c3.png)

Entonces, ¿por qué automatizar pruebas?, pues como podéis ver en los requisitos, la necesidad de disminuir los costes, de disminuir la cantidad de recursos necesarios, sin perder la calidad que ofrecemos, es decir, en lugar de eliminar pruebas dentro de la aplicación, queremos mantener el número, incluso queremos incrementar, lo vamos a tener que incrementarlo, pero no queremos disminuir esa calidad que ofrecemos, no queremos desechar casuísticas, simplemente por el hecho de que no podemos abarcarlas. 

El objetivo va a ser realizar siempre las mismas pruebas para verificar que en cada nueva versión del software que se se despliegue, todas las pruebas que teníamos se realizan y además vamos a realizar nuevas pruebas para ese nuevo módulo, ese nuevo despliegue, esa nueva versión de la aplicación que estamos realizando. 

¿Cuál es la solución a todo esto? Pues como digo, **automatizar pruebas**. ¿Cómo sería este objetivo realmente? Muchas personas suelen decir, bueno, pues lo automatizamos todo. Muchas decisiones erróneas ya no subjetivamente, sino objetivamente tratan la automatización de todo y eso no tiene sentido porque podemos encontrarnos en la situación de que implementar la automatización de una prueba nos conlleve más trabajo que realizar esa prueba manualmente. Esto ocurre cuando, por ejemplo, necesitamos realizar una prueba puntualmente o puntualmente entre comillas, como cuando simplemente tenemos unos planes de regresión, pues cada vez que y únicamente cuando se despliegue la aplicación necesitamos pasar esta prueba. Pero bueno, resulta que la complejidad de implementar esa prueba de forma automática es mucho mayor que el simple hecho de que manualmente cualquier tester coja la aplicación y la pruebe, no sé, en 3 minutos por poner un número. Puede ser que no lleve mucha tarea, mucha problemática implementarla porque no se, necesitemos librerías o necesitamos información, cómo recoger datos para poder implementarlo, cuando humanamente simplemente sabemos lo que tengemos que escribir, sé dónde tengo que pulsar, sé lo que tengo que hacer y es mucho más rapido todo. 

Debemos encontrar un equilibrio en cuanto al trabajo que invertimos, el esfuerzo que invertimos, con el retorno del beneficio de ese trabajo invertido. 

Concluyendo aquí esta sección, a continuación, en la siguiente sección, vamos a hablar de la pirámide del testing, que no es solo relacionadas con el tema de automatización sino a la importancia o en donde encontramos el grueso de pruebas, a la hora de realizarla el testing de una aplicación.

## Pirámide del testing y JUnit 9:10 

![image](https://user-images.githubusercontent.com/23094588/195127106-65167dec-f287-4eaf-a21a-444ede01e1f7.png)

![image](https://user-images.githubusercontent.com/23094588/195127286-cdfd2906-1d87-4728-b546-8a556741902f.png)

![image](https://user-images.githubusercontent.com/23094588/195127400-45fd2c6b-b7cf-4a06-8c14-571c3f7651fa.png)

Y continuando sobre el porq debemos automatizar pruebas en entramos en la pirámide del testing y. ¿Qué es la pirámide del testing? Bien esa esa imagen que tenéis en en pantalla define una variante porque sí, bueno, normalmente si ponéis en Google textil, pues bueno, vais a encontrar un montón de variantes de acuerdo. Incluso veréis que algunas de ellas incluyen un estamento que es la prueba de sistema. Referidas a cómo se comporta la aplicación dentro del sistema, que vas enfocado, por ejemplo, serían las pruebas de rendimiento. Que no tratan de de la propia aplicación en sí, sino cómo se comporta la aplicación, digamos a qué velocidad o cómo gestiona los recursos dentro de un sistema. Entonces, bueno, una de tantas variantes puede ser esto. ¿Por qué existe este diagrama? Este dibujo de la pirámide porque no todas las pruebas que veis ahí, las pruebas unitarias, las pruebas de componentes, las pruebas de integración, las pruebas en Twitter y las exploratorias tienen ni el mismo costo. Mismo la misma importancia. Con esto quiero decir que en función a la complejidad de estas pruebas. Encontramos tanto en complejidad como en cantidad. Vamos a encontrar el esa división. Normalmente la base del apuntarías quiere decir que hay mucha cantidad, hay mucha cantidad de pruebas unitarias, esas son las que llevan a cabo los propios desarrolladores, quienes desarrollan la propia aplicación. Por decirlo así, hacen sus propias pruebas sobre sus propios métodos de. Estas son muchísimas por haber del orden de cientos, cientos de cientos de pruebas unitarias, miles de pruebas unitarias, puesto que son simples, simplemente entre comillas, prueba. Comprueban que para unos parámetros dado dentro de un método bueno, todos tenemos el retorno la la. Después, para la función es la que esperamos dentro del algorítmica que tienen en la operativa. Pasamos por las pruebas de componente que hacen referencia a dentro de un mismo módulo de un conjunto de esos métodos, por decirlo así, que tenemos el módulo de, por ejemplo, el módulo del login. No sé, por ejemplo, que pongo del login una aplicación, bien por el componente del login. Bueno, pues se hacen pruebas sobre ese componente en una caja. ¿Es decir, para una serie de parámetros que nosotros pasamos, obtenemos un, pues si es que un usuario, o sea este usuario, estos datos corresponden con cooperativa, que quieres modificar el seguimos? Seguimos con las pruebas de integración que comprueban dos o más módulos, cómo interactúan dos o más módulos entre sí. Aquí podríamos incluir las pruebas que comprueban el tema de la integración entre el módulo de la operativa y la lógica del módulo con la base de datos. El módulo se ha a una serie de parámetros de entrada, una serie de. Datos que nosotros pasamos. Lo los pregunta, los del comunica correctamente con la base de datos, la base de datos le devuelve la información bien capaz de devolvernos la información esperada y pues sí, son los objetivos de este estamento de prueba. Un nivel más arriba encontramos las entiendo. ¿Nuevamente, Estas son las que atañen a personas como las que se dedican a lo que me dedico yo al tema de las pruebas automáticas del Front End, podríamos decir? Nome comprobamos que que. Realizando una simulación del comportamiento de un usuario con el frontón de una página, obtenemos los resultados antes de nuevo, haciendo referencia al Login, no estamos hablando de enviarle datos, digamos, a llamarse como aplicación como tal, sino que directamente también será cuando confrontes. El lugar nuevamente para cenar con mate. Para un login correcto el accedemos a la página. Bien, eso estaríamos haciendo la comprobación del flujo completo. ¿Con esto qué quiero decir? Que la prueba de Ping así de bueno. Desde el punto del usuario hasta el punto final del sistema, que se encargará de comprobar que esos datos que ha introducido usuarios son comprobados correctamente dentro de la base de datos y devuelve que la sesión es correcta o no lo veis en caso de que no lo sea. Y un estamento más arriba, pues encontramos la exploratoria, las pruebas exploratorias como bueno, pues muchos sabréis, no es llegan, no cumplen plan definido son exploratorias como el propio nombre indica, se tratan de explorar cómo el explorador que va a la jungla iba a averiguar a ver qué hay, va explicarlo. Pues trata de. Bicho grotescamente. De reventar la aplicación de decir. Bueno, pues quiero comprobar que esta casuística que no está contemplada dentro del plan de prueba cómo está prevista, está cubierta, es decir, vamos a intentar saltarnos por ejemplo las comprobaciones que hacen se los desarrolladores del plan. Todos los fans suelen tener una serie de comprobaciones para que. Por ejemplo, cuando nosotros intentamos introducir un email incorrecto. Bueno, el propio, la propia web dicen o email no cumple la las especificaciones de ser un mail. Bien, pues este tipo de saltos de saltarse esas pruebas podrían inyectar código javascript a ver qué ocurre aquí. Bien se contemplarían dentro de testamento. Como podéis ver, la unitarias. Hay muchas porque son sencillas de implementar, mientras que las Venezuela. Notoria, bueno, vamos a verlo fuera de la automatización, las lenguas hay pocas porque cuestan mucho implementarlo y demás son muy difícilmente mantenidos cuando algo es simple, simplemente cambiando algún dato dentro de la de la prueba podemos volver a tenerla en marcha, mientras que una prueba en Twain que contempla el hecho de decir, bueno, pues necesito acceder a este elemento en el centro, decir este dato. Pulsar este botón y en función de lo que me devuelva, pues conectó comprobar este elemento dentro de la página que fue. Es una prueba sencilla dentro de este segmento, pero podemos estar enviar un formulario con un dato. Datos queme previamente me estamos comprobar y que posteriormente, tras la devolución de la respuesta por parte del servidor, también debemos comprobar entonces suele ser algo menos mantenido. De forma que. En quien nos ayuda, hey humilde, en toda esta tarea. Bien pues como he comentado en el video anterior. No es cuestión de automatizarlo todo, sino que debemos encontrar un equilibrio dentro del return of investment, no del Roy, para que todo aquello que automatizaciones nos compense. Corto, medio plazo, mayormente. Con ese tiempo y esfuerzo que hemos cerrado en implementarlo. Y hay un se encarga de esta automatización y hay un nos ofrece un framework de trabajo donde, mediante el propio Código podemos automatizar estas pruebas. No solo está enfocado a prueba voluntaria, sino que también podemos implementar pruebas de front back dentro de este mismo framework, haciendo uso, por ejemplo. Desde luego, pero no tengo que podemos incorporar con con con yuli. De tal forma que nuestras pruebas, pues vaya mejor la impresora. Intentar hacer la gestión dentro del Front, es decir, de pulsar botones, recibir datos y hay un es encargadas de organizar esta. Prueba 1. La prueba dos consiste en hacer un login erróneo. Al final de todo tendremos un reporte diciendo, bueno, pues lo incorrecto funciona correctamente. El login incorrecto funciona correctamente si está mal bien dentro del reporte, podemos ver qie operativas hemos llevado a cabo. ¿Y qué ocurre cuando las llevamos? Nokia. Esto nos permite ver dentro de todo el de toda la la casuística que contemplaba dentro del plan de prueba que necesitamos corregir, que funciona correctamente y en función de esto, que necesitaremos implementar como nueva nuevos test debido a una nueva versión de la aplicación que hemos sacado. Bien entonces comentar por último, que lleguen y 5, que es la versión que estamos tratando en este en este curso. Requiere de Java 8 como mínimo, de acuerdo estamos no sé qué versión estaremos ahora trabajando, pero bueno, ya hemos superado las 8 con creces en el momento incluso de que veáis este video, no sabré por qué versión vamos, pero vaya que la 8 ya suele ser algo sobre. Y bueno, pues. Terminando con esta sección, vamos a empezar ya a entrar en materia, vamos a implementar OA mejor dicho, a recoger, yo bien vamos a meter janey dentro de un proyecto y vamos a ponerlo en marcha, a ver que nos encontramos, así que vamos acompañando. 


## Contenido adicional 3


