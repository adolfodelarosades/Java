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

Bien a quién no le ha pasado estar con su control de versiones habiendo hecho cambios en su proyecto sobre todo si son unos cambios bastante amplios y llegará el momento en el que tienes que hacer commit. Con un control de versiones como por ejemplo **Subversion** en el cual tienes que hacerlo todo de golpe. Esto no se favorece por decirlo así el hacer commits atómicos, es decir lo que a nosotros nos interesaría es subir en un único commit todos los cambios que se han hecho, cuando tienes un montón de cambios y tienes que ir revisando uno a uno a ver si ese fichero le quieres subir o no le quieres subir.

Qué es lo que pasa, que si tienes muchos ficheros tienes que ir mirando este si, este no, este si, este no y al final lo que acaba pasando normalmente, yo mismo lo he hecho, es que lo que haces son varios commits porque no eres capaz de hacerlo todo en uno.

Git lo que tiene es una zona intermedia, una zona de stage en el cual tu puedes ir cogiendo y lo puedes ir diciendo bueno este me lo vas a subir a la zona de stage, este si, este no, este sí, este no. Y luego cuando ya lo tienes todo claro que es el commic que quieres hacer le dices bueno ahora me haces commit, esta es una funcionalidad que realmente al principio puede parecer un poco extraña sobretodo para la gente como yo que hemos venido de repositorios de código como Subversion etcétera, que se hace un commit directamente no hay una zona intermedia y al principio te puede causar un poco de extrañeza decir por qué tengo que dejar las cosas en una zona intermedia y no hago el commit de golpe.

Pues bueno este es el motivo, el poder ir haciendo una selección de qué cosas quiero subir y qué cosas no quiero subir, incluso como veremos en los ejemplos dentro de un único fichero de un fichero, se puede elegir qué bloques se quieren subir y qué bloques no se quieren subir a la zona de stage para luego hacer el commit.

## Flujos 01:17

Otra de las características que a mí la verdad es que me gusta bastante de Git es la facilidad que tiene para tener diferentes flujos de trabajo.

Esto no es inherente a el hecho de tener flujos de trabajo sino el hecho de soportar ramas y Mergeos entre ramas y hacerlo bastante bien, lo que permite es tener una riqueza de flujos de trabajo no, cosa 
que con otros repositorios de código que no manejan tan bien las ramas, que aunque las tienen no las manejan tan bien, que hacen esos repositorios al no manejar bien las ramas, pues hace que sea un poco arduo el tener flujos de trabajo complejos, porque realmente esos flujos de trabajo normalmente suelen ser ramas y si no manejas bien las ramas, pues tiendes a intentar hacer los flujos lo más sencillos posibles, los menos flujos posibles y utilizar soluciones mucho más chapuceras, entonces el hecho de que maneje tan bien las ramas, lo que nos va a permitir es tener flujos de trabajo mucho más elaborados de una forma mucho más sencilla.

## Metainformación concentrada 01:30

Realmente esto es una característica que yo creo que es más, un poco comparándolo con Subversión, en Subversión en cada carpeta te crea su fichero **`.svn`** y ahí tiene sus cosas. Entonces cuando quieres mover una carpeta acabas arrastrando toda esa información, toda esa información del Subversion en todas las carpetas y entonces si por cualquier circunstancia no te interesa tienes que ir borrando esas carpetas.

La diferencia es que Git en ese aspecto lo que hace es que toda la información la tiene en una carpeta **`.git`** y la tienen en la raíz del proyecto, con lo cual si no quieres llevarte toda esa metainformación del Git coges y borras esa carpeta y ya esta, con lo cual al final eso tiene otra conotación.

A mi me ha pasado muchas veces con el Subversion que se te olvida borrar una de esas carpetas **`.svn`** que has copiado de un sitio a otro y resulta que estás haciendo el commit a donde tú no querías porque lo que prevalece es la información de esa carpeta. Entonces me parece que es una situación o una característica de subversión en este caso que es un poco farragosa.

A mi me parece mucho más mucho más limpio tenerlo en un único sitio como en Git y allí tengo toda la información de toda la metainformación del control de versiones y ya ya está. No me ensucia el resto de carpetas de trabajo.

## Interface amigable 01:09

Una de las características sobre todo hoy día que ya las herramientas van siendo ya bastante potentes. Una de las características que yo le pido a un control de versiones es tener una interfaz amigable que en ese aspecto realmente no es tanto un problema del propio control de versiones como tal porque realmente en ese aspecto Git es una herramienta de línea de comandos.

Pero sí que es cierto que entorno a Git con su popularidad han surgido una serie de herramientas. Estoy pensando en un GitHub, en un GitBucket de Altasia. Estoy hablando de un GitLab, entonces esas herramientas que te permiten hacer es usar Git de una forma mucho más amigable, porque tienes una interfaz y una interfaz de administración bastante sencilla, cosa que con otros repositorios de código no está tan trabajada sobre todo con Subversion que en ese aspecto se nota que es un poquito más viejo.

## Acceso sin cliente 01:07

Esta es una característica el Acceso sin Cliente que va un poco ligada también al apartado de la clase
anterior o la característica anterior más bien, que es el hecho que no es propio de Git o sea porque es 
como hemos comentado, es de línea de comandos, pero todas estas herramientas que han surgido alrededor de Git, una de las cosas que te permiten es acceder a un Git sin necesidad de tener una herramienta o vía web y poder operar con ello, por lo menos hacer bastantes cosas con lo cual eso es un un plus en el sentido de que no en un momento determinado puedas estar en un ordenador que no tienes un cliente configurado o que haya gente que quiera acceder a algo o algún alguna persona con un perfil más de gestor que pueda entrar y pueda ver cosas o pueda realizar algún tipo de gestión.

Y eso es un extra que no es que sea una de las cosas más importantes pero es un extra que está bastante bien.

## Múltiples servidores 02:20

Otra de las características que a mí más me gusta es la posibilidad de tener más de un más de un repositorio.

Eso es algo que en principio puede parecer un poco como innecesario porque yo estoy en mi empresa y

trabajo contra el repositorio de mi empresa pero no siempre hay buena conectividad no siempre.

A veces puedes tener buena conectividad si estás trabajando sólo para tu empresa pero muchas veces si

tú estás trabajando para un cliente externo eres un subcontratista que tú estás desarrollando una aplicación

y luego se la entrega al cliente.

No siempre hay buena conectividad o a veces ni siquiera hay conectividad así como quien dice con el

cliente y se tiene que andar tirando de VPN que a veces no funcionan del todo bien.

Entonces el poder tener un repositorio en tus instalaciones con los que tengas buena conectividad y

luego simplemente con un botón con un botón hizo pasar toda esa información con todos sus históricos

cambios.

Toda la información al cliente a mí me parece que es algo muy muy interesante porque a veces hay unas

ciertas peleas a mí me ha pasado estar en algunas reuniones sobre todo con Subversion que no tiene esa

posibilidad.

Hablo de subversión porque la verdad es que es como el más típico antes de por lo menos en esta zona

en la que yo me muevo y a veces había discusiones no de utilizar el Subversion del proveedor sin utilizar

el Subversion del cliente.

El cliente quería que es el suyo pero el suyo no funcionaba bien la gente del cliente prefería utilizar

el suyo que lo tenía controlado etcétera etcétera y eso acaba generando una serie de cosas que convites

muy sencillos a utilizar los dos puedes dejar las cosas en uno y en otro no. Sobre todo porque a veces

también hay problemas o puede haber ciertos problemas legales en el sentido de que claro si tú no tienes

el código fuente de lo que has entregado te pueden decir que un defecto que hay en el software que tú

has creado es por culpa tuya cuando has sido el cliente el que ha metido mano o un tercero el que ha

metido mano hoy y lo ha fastidiado entonces tener tu código en tus instalaciones en algo bajo tu control

es bastante y bastante interesante.


## Proyectos completos 01:37
## Sencillez 01:33
