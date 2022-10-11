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

Entonces, ¿por q no automatizar pruebas, pues como podéis ver, los requisitos, la necesidad de mimo, ir estos costes de disminuir la cantidad de recursos necesarios sin perder la calidad que ofrecemos, es decir, en lugar de eliminar pruebas. Dentro de la aplicación queremos mantener el número, incluso queremos incrementar, lo vamos a tener que incrementarlo, pero no queremos disminuir esa caída que ofrecemos, no queremos. Ese chat casuísticas simplemente por el hecho de que bueno, no podemos abarcarlo no. El objetivo va a ser realizado, siempre hay más pruebas para verificar que en cada nueva versión del software que se se despliegue. Todas las pruebas que teníamos se realiza y además vamos a realizar nuevas pruebas para ese nuevo módulo. Ese nuevo despliegue, esa nueva versión de la aplicación que estamos realizando. ¿Cuál es la solución a todo esto? Pues como digo, automatizar pruebas. ¿Cómo? ¿Cómo sería este objetivo? ¿Realmente él? Muchas personas suelen decir. Bueno, pues pues lo automatizamos todo, muchas decisiones erróneas el llano, subjetivamente, sino objetivamente. E tratan la automatización de todo y eso no tiene sentido porque. Porque podemos encontrarnos en la situación de que implementar la automatización de una prueba nos conlleve más trabajo que realizar esa prueba manualmente. Esto ocurre cuando, por ejemplo, necesitamos realizar una prueba puntualmente. ¿O puntualmente, entre comillas, cuando simplemente tenemos unos planes de regresión? Bueno, pues cada vez que y únicamente cuando se despliegue la aplicación necesitamos pasar esta prueba. Pero bueno, resulta que la complejidad de implementar esa prueba. De forma automática es mucho mayor que el simple hecho de que humanamente cualquier test coja la aplicación y la pruebe en no sé, 3 minutos por poner un número puede ser que no lleve mucha tarea, mucha, mucha problemática, implementarla porque no sea necesitemos librería o necesitamos información. Cómo recoger datos para poder implementarlo cuando humanamente simplemente no sé lo que tengo que escribir, sé dónde tengo que usar. Sé lo que tengo que hacer. Y es mucho más rap. Entonces debemos encontrar un equilibrio en cuanto al él. Trabajo que invertimos el esfuerzo que invertimos con el retorno del beneficio de ese trabajo invertido. Bien concluyendo aquí esta sección, el a continuación, en el siguiente video, vamos a hablar de la pirámide del testing, que no es solo relacionadas tomar la decisión, sino a la importancia OA donde encontramos el grueso. De prueba a la hora de realizarla el test sobre una aplicación 7 por favor acompañadme y vamos a ir. 



## Pirámide del testing y JUnit 9:10 
## Contenido adicional 3


