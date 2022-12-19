# 03 Que le pido a un control de versiones • 11 clases • 17m

* Que le pido a un control de versiones 00:51
* Trabajo sin conexión 01:31
* Trabajos a medias 01:50
* Commits atómicos 02:09
* Flujos 01:17
* Metainformación concentrada 01:30
* Interface amigable 01:09
* Acceso sin cliente 01:07
* Múltiples servidores 02:20
* Proyectos completos 01:37
* Sencillez 01:33

## Que le pido a un control de versiones 00:51

Probablemente la mejor forma de entender por qué Git te está teniendo tanto éxito últimamente es contando qué es lo que por lo menos yo le pido a un control de versiones de tal forma que podremos ver que efectivamente Git encaja o da respuesta a todas estas necesidades y ese es uno de los motivos por los cuales está teniendo tantísimo éxito.

Entonces vamos a ir viendo a uno a uno todos esos todas esas cosas que yo por lo menos le pido a un 
control de versiones para entender qué es cada cosa en qué situación nos puede servir nos puede ser 
de utilidad y ver que efectivamente el Git nos encaja en todas esas cosas.

## Trabajo sin conexión 01:31

Esta es una característica que cuando lees la documentación la verdad es que yo creo que en mi modesta opinión la explican muy mal porque, no es que si vas en un avión que no tienes conexión y puedes hacer un commic dice que si normalmente viajan en avión, la gente con la que trabajo en los proyectos normalmente no viaja en avión con lo cual parece que es una característica que no necesitas.

Porque si yo estoy siempre en mis oficina esto no lo usare, pero lo que sí que es cierto es que por lo menos a mí, a veces sí que me ha pasado y sobre todo cada vez más con que proliferan más los portátiles que te puedes encontrar que tú estás con tu portátil y estás en un cliente en el que no tienes conexión en tu oficina, no a tu repositorio y poder estar haciendo en esos en esas situaciones hacer commits o tener acceso a todo el histórico de tus de los cambios en el código, pues la verdad es que es una característica que es a mí por lo menos me parece que es bastante interesante.

No puede ser que haya gente que no lo necesite nunca porque tiene un ordenador de sobremesa y no tiene 
posibilidad de trabajar fuera de su ordenador con su conectividad con su servidor.

Pero la verdad es que yo creo que es una funcionalidad que es bastante bastante interesante.

## Trabajos a medias 01:50

Bueno para mí esta es una de las características más interesantes que tiene Git, que levante la mano al que no le haya pasado alguna vez que está en mitad de un desarrollo y resulta que tiene que dejar eso para corregir una incidencia urgente y tiene que evitar todo ese código que tiene a medias, bajarse una versión que es la que está puesto en producción y corregir ese error y luego seguir con el trabajo que estamos haciendo.

A mí me ha pasado varias veces a decir y yo creo que a todo el mundo que haya trabajado en algún tipo de proyecto mínimamente grande eso le ha le ha ocurrido.

Con otras herramientas básicamente lo que tienes que hacer es cogerte toda la carpeta o guardartela, volver a bajarte la versión donde tienes que hacer la corrección del parche, corregirlo subirlo, volver a poner lo que tenías antes y ese cambio volverlo a incorporar.

Lo cual es una solución bastante amateur y es un poquito propensa a errores. Y la verdad es que en ese aspecto con Git y los **stages**, la verdad es que lo soluciona de una forma bastante limpia, puedes coger y decir pum le das al botón y decirle guarda todo lo que tengo aquí a medias y me dejas una versión limpia, le das el nombre a lo que quieres guardar, haces tus cambios y luego una vez que has hecho ya has arreglado la incidencia y le dices y ahora me vuelves a poner esta versión que tenía que tenía a medias con lo cual la verdad es que a mí eso es una característica que me parece impresionante es decir es muy cómoda y sobretodo lo puedes hacer de una forma mucho más limpia, que no con los apaños de me hago un ZIP, copio la carpeta a otro lado que siempre acaban siendo chapuzas.

## Commits atómicos 02:09

Bien a quién no le ha pasado estar con su control de versiones habiendo hecho cambios en su proyecto sobre todo si son.

Si son unos cambios bastante amplios y llegará el momento en el que tienes que hacer commit con un control de versiones como por ejemplo la subversión en el cual tienes que hacerlo todo de golpe.

Esta no se favorece por decirlo así el hacer commits atómicos es decir lo que a nosotros nos interesaría 
es subir en un único cómic todos los cambios que se han hecho cuando tienes un montón de cambios y tienes que ir revisando uno a uno a ver si ese fichero le quieres subir o no le quieres subir.

Qué es lo que pasa que si tienes muchos ficheros tienes que ir mirando este si este no este si este no y al final lo que acaba pasando normalmente yo mismo lo he hecho es que lo que haces son varios commits porque no eres capaz de hacerlo todo en uno.

Por ejemplo lo que tiene es una zona intermedia una zona de stage en el cual tu puedes ir cogiendo y lo puedes ir diciendo bueno este me lo vas a subir a la zona de este si, este no, este sí, este no.

Y luego cuando ya lo tienes todo claro que es el commic que quieres hacerle y dices bueno ahora me haces commic esta es una funcionalidad que realmente al principio puede parecer un poco extraña sobretodo para la gente como yo que hemos venido de repositorios de código como Subversion etcétera que se hace un commic directamente no hay una zona intermedia y al principio te puede causar un poco de extrañeza decir por qué tengo que dejar las cosas en una zona intermedia y no hago el commit de golpe.

Pues bueno está. Este es el motivo es el poder ir haciendo una selección de qué cosas quiero subir y qué cosas no quiero subir incluso como veremos en los ejemplos dentro de un único fichero de un fichero se puede elegir qué bloques se quieren subir y qué bloques no se quieren subir a la zona de stage para luego hacer el commic.

## Flujos 01:17
## Metainformación concentrada 01:30
## Interface amigable 01:09
## Acceso sin cliente 01:07
## Múltiples servidores 02:20
## Proyectos completos 01:37
## Sencillez 01:33
