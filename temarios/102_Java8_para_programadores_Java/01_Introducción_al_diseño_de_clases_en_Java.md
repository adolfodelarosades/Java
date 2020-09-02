# 1. Introducción al diseño de clases en Java 73m
   
   * 00 Presentación del profesor y curso 7:36 
   * 01 Implementación de la encapsulación 12:31 
   * 02 Implementación de herencia con modificadores de acceso y composición 9:55 
   * 03 Polimorfismo 10:37 
   * 04 Sobreescribir los métodos hashcode, equals y to string de la clase object 14:34 
   * 05 Uso del ámbito static para variables, métodos y clases 9:30 
   * 06 Clases singleton y clases de inmutables 9:09 
   * Contenido adicional 10
   
# 00 Presentación del profesor y curso 7:36

[Presentación](pdfs/Presentación.pdf)

## Resumen del Profesor

Conoce al profesor de Java desde 0, los requisitos y los objetivos del curso.

## Transcripción

<img src="images/00-01.png">
<img src="images/00-02.png">
<img src="images/00-03.png">
<img src="images/00-04.png">
<img src="images/00-05.png">
<img src="images/00-06.png">
<img src="images/00-07.png">
<img src="images/00-08.png">
<img src="images/00-09.png">
<img src="images/00-10.png">
<img src="images/00-11.png">
<img src="images/00-12.png">

Hola todo y bienvenidos al curso de Java 8 para programadores Java me llamo luis Miguel López Magaña y soy profesor de FP de ciclos formativos de particular de desarrollo de aplicaciones multiplataforma desde hace 10 años además de th15 pues llevo trabajando con la tecnología Java desarrollando aplicaciones tanto para Java este cada vez spring Hibernate también proyectos de movilidad con Android y bueno quiero compartir con vosotros algunos elementos de este curso lo primero es comentaros es que como requisito es recomendable haber realizado el curso de Java 8 desde cero podéis probar a comenzar el curso si os sentís que tenéis buenos conocimientos suficientes para para poder prestaros pero si en algún momento vierais qué bueno alguno de los conceptos que se tratan en el curso de Java 8 desde cero pues vienes bien os recomiendo que lo hagáis para el último bloque de este curso en el que trabajaremos con con base de datos también sería recomendable es tener cierta garantía a la hora de trabajar con SQL y sí bueno si veis que es mejor para para vosotros poder hacer el curso que tenemos sobre SQL DC porque aprender a programar Java y en particular programación algo más avanzada que la inicial bueno según Oracle el dueño de la tecnología Java a día de hoy hay más de tres mil millones de dispositivos que utilizan Java y el número va en incremento no podemos encontrar en todo tipo de plataforma desde coche sistema recuerdos libro electrónico en robótica cajero router y como no pensar que además Java es la mejor manera de empezar a saber programación si lo que queremos es aprender a programar aplicaciones de movilidad en Android si consultamos alguno de los índices como el indice TIOBE sobre los lenguajes de programación más utilizados y más demandados en el mercado podemos ver cómo Java en lo último año siempre ha estado en el talkray de este ranking y como desde el año 2015 pues ha vuelto a incrementarse la demanda y la utilización de cava y a día de hoy sigue ganando ampliamente a al siguiente competidor que sería hacer os recomiendo también y el salario a la hora de trabajar es una condición que imponga y a la hora de aprender un lenguaje de programación que visitéis nuestro blog para saber cuánto gana un programador Java en España vamos a pasar ahora hablar de los contenidos del curso que está estructurado en 8 minutos comenzaremos haciendo un diseño de clase en Java donde podremos ver cómo hacer el encapsulamiento y dónde iremos avanzando en concepto de herencia polimorfismo donde hablaremos de clase final de clases inmutable del modificador static comenzaremos después perdón seguiremos después en un diseño de clases más avanzadas dónde sobretodo trabajaremos con clase interna clases anónimas clases locales pasaremos después en el tercer bloque a hablar de clase genérica y de colecciones en el cuarto bloque hablaremos de interfaces funcionales desprecia en el Landa y de algunos de los interfaces funcionales pesaba nos proveen que más se van a utilizar con lo que veremos en el quinto bloque que será en la piscina podríamos decir que el núcleo del curso ya que lo que va a entrenar después el resto de momento y es que el API stream en la gran novedad es dejada en el bloque sexto hablaremos de entrada salida con la los flujos de trabajo y las nuevas clases y métodos que nos aportan java.nio para hacer operaciones de entrada-salida rápidamente hablaremos en el séptimo bloques de concurrencia en Java y de programacion multihilo de problemas de sincronización y de colecciones concurrente y terminaremos nuestro curso trabajando con bases de datos relacionales hija va a través de JDBC Hola todo y bienvenidos al curso de cada 8 para programadores a dame llamo Luis Miguel López Magaña y soy profesor de FP de ciclo formativos de particular de de desarrollo de aplicaciones . Plataforma desde hace 10 años además de que hace 15 es ebook trabajando con la tecnología desarrollando aplicaciones para escribir también porque tú me dio

Algunos proyectos de ejemplos concretos como por ejemplo un codificador del CEJAS vale para ficheros de texto un servicio meteorológico que permitirá procesar información meteorológica este proyecto lo haremos en dos pasos vale y nos permitirá practicar sobre lápices trim expresiones lambda tratamiento de ficheros con Java nio2 y también haremos al final con Cruz completo sobre una tabla en una base de datos relacional y podremos insertar datos consultar datos actualizar datos y modificar datos cuando terminéis el curso cuáles van a ser los resultados del aprendizaje bueno pues seréis capaces por lo pronto de programar aplicaciones Java con total garantía de que se van a ejecutar en diferentes sistema operativo podréis manejar avanzados conceptos de programación orientada a objetos herencia polimorfismo también podréis diferenciar entre clases públicas clases internas locales o anónima además manejar e múltiples tipos de colecciones de lápiz de colecciones que se ofrece cava conoceré y el nuevo estilo de programación que ofrece Java 8 a través de expresiones lambda y el API string para trabajar con colecciones de elementos y poder hacer un operaciones de procesamiento filtrado reducción y transformación interactuar con el sistema de ficheros a través de los flujos de la Java io y de las clases paz y los métodos de la clase File de la Java nio2 también seréis capaces de realizar aplicaciones multihilo y manejar conceptos de programación concurrente y sincronización y seréis capaces de implementar aplicaciones que utilizan bases de datos relacionales para realizar conexiones lanzar consultas y procesar respuesta para finalizar cuando termine con este curso os ánimo a que podáis visitar otros en otros cursos que pueden complementar vuestros conocimientos el primero sería el de Java para su versión Enterprise Edition vale también el curso de Java server 6 los cursos de Spring Hibernate y JP a ti también nuestro curso de antes espero que disfrutéis del curso que luego estará a disposición en el foro para cualquier duda que tengáis un saludo y gracias

# 01 Implementación de la encapsulación 12:31 

[Implementación de la encapsulación](pdfs/01_Implementación_de_la_encapsulación.pdf)

## Resumen del Profesor

### 1.1 Encapsulación

Los objetos conocen solamente su estructura, no la de los demás. El trato entre objetos se realiza a través de los métodos. Normalmente, los atributos de un objeto se deben consultar o editar a través de métodos.

### 1.2 Buenas prácticas.

#### 1.2.1 Para clases

* La mayoría de las clases que se crean son públicas.
* Cada fichero .java tendrá solamente una clase pública, con el mismo nombre del fichero.

#### 1.2.2 Para atributos

* La mayoría de los atributos de una clase serán privados.
* Solamente algunas constantes, o casos muy particulares, tendrán otra modificador de acceso.

#### 1.2.3 Para métodos

* Si una clase tiene atributos, seguramente tenga métodos públicos.
* Los métodos privados son interesantes para cálculos auxiliares o parciales (solo se pueden invocar desde la propia clase).

### 1.3 Tipos de clases

Aunque Java tiene solamente una forma de crear clases, los patrones de diseño nos dicen que podemos encontrar diferentes tipos de clases según su cometido:

* Modelo: representan objetos o hechos de la naturaleza: un coche, un asiento contable, los datos meteorológicos de un día. Suelen tener atributos, getters y setters, equals, hashCode, toString, …

* Servicios: implementan la lógica de negocio. Suelen tener algunos atributos, pero sobre todo métodos públicos y privados.

* Auxiliares: sirven para realizar operaciones auxiliares de cálculo o transformación de datos. Mayoritariamente, sus métodos son estáticos.

* Main: son el punto de entrada de la aplicación. La mayoría de las ocasiones, solo tienen este método, y si tienen más, suelen ser estáticos.

* Test: clases orientadas a realizar pruebas de nuestra aplicación. En Java, suelen ser test unitarios con JUnit.

* ...

## Transcripción

<img src="images/01-01.png">
<img src="images/01-02.png">
<img src="images/01-03.png">
<img src="images/01-04.png">
<img src="images/01-05.png">
<img src="images/01-06.png">
<img src="images/01-07.png">
<img src="images/01-08.png">
<img src="images/01-09.png">
<img src="images/01-10.png">
<img src="images/01-11.png">
<img src="images/01-12.png">
<img src="images/01-13.png">

Hola a todos y bienvenidos a este primer vídeo del curso de Java 8 para programadores cada vamos a tratar de aprender a lo largo de este curso algunos elementos más avanzado de nuestro apreciado lenguaje de programación comenzamos en este primer capítulo que aglutinará algunos vídeos sobre el diseño de clase y es el primer vídeo versará sobre lo que hemos llamado la implementación de la encapsulación y dónde también veremos algunos tipos de clases que podemos crear en nada aquellos que vengáis de hacer el curso de Java 8 desde cero sabréis que un objeto está conformado por su estructura y su comportamiento esto es común para cualquier objeto para cualquier tipo de lenguaje de programación la estructura más después viene delimitada por las propiedades de ese objeto y el comportamiento pues por las funcionalidades que es capaz de hacer no aquí en pantalla tenemos un vehículo un coche que bueno siendo como este juguete estaría conformado por una estructura de plástico de material plástico 4 ruedas volante y bueno si un niño no cogía ese juguete sería capaz de moverlo adelante y hacia atrás entre otros posibles movimientos vale esto pues nos diría cómo funciona un objeto como como está caracterizado mejor dicho la encapsulación es un mecanismo mediante el cual los objetos conocen solamente su estructura y no la de los demás empecine un objeto es el quiere se conoce por dentro vale a modo de iceberg fuimos tratado de representarlo un objeto es el que se conoce por dentro y y bueno ofrece al exterior solamente una pequeña parte de lo que sería el objeto en si no dejando oculto una gran parte de el lo normal es que a la hora de implementar la encapsulación en Java el trato entre Egipto se realiza a través de métodos frente a que los atributos normalmente suelen quedar ocultos y no se puede acceder a ellos salvo desde el propio objeto vale con lo cual ETT otro objeto diferente quisiéramos consultar algún tipo de propiedad tendríamos que hacerlo siempre a través de un método de ese objeto vale para todo ello pues se le llama encapsulación y suele ser la manera más habitual de implementarla en Java para implementar una clase en Java bueno pues ya digo eso lo sabe muy bien lo que los que habéis hecho el curso de Java 8 desde cero pues tenemos una estructura que mediante la palabra reservada la con un modificador de acceso delante un nombre de la clase en notación uppercamelcase y encerrado entre llaves tendríamos una serie de propiedades y de metros ya sabéis que entre los diferentes modificadores de acceso tenemos la posibilidad de incluir que los elementos sean públicos es decir que cualquiera podría acceder a este elemento y hacía clase atributos método privado solamente la propia clase iba a utilizar en cualquier contexto sobre todo orientado a las propiedades no solamente la propia clase podría acceder a el protected la propia clase los elementos que tienen el mismo paquete y sus derivados podrían acceder a él y por defecto solamente podrían hacer lo que llamaríamos las clases cerca no las que estén en el mismo paquete aparte de la propiedad algunas buenas prácticas a la hora de crear clase en Java la hora de implementar la encapsulación sería el que la gran mayoría de las clases que nosotros vayamos a crear serán públicas vale cada fichero Java a diferencia de otros lenguajes de programación tendría solamente dentro una clase pública vale con el mismo nombre del chistes de hecho se intenta y hacerlo diferente y USA hay alguna y de como por ejemplo y pensé que estaremos nosotros a lo largo del curso pues se quejará en el sentido de que no está obligando set anticipando a posible error de compilación la unidad el fichero que contiene una clase pública tiene que llamarse tal cual se llama esa que hace pública vale por facilidad otra cosa será dentro del apartado que veremos en la partir del segundo capítulo vale el hecho de que una clase encierre dentro otra pero lo normal es que cada fichero incluye una clase pública otro lenguaje de programación múltiple hola a todos y bienvenidos a este primer vídeo de curso de Java 8 para programador casa vamos a tratar de aprender a lo largo de este curso algunos elementos más avanzado del nuestro apreciado lenguaje de programación por ejemplo Python puesto portal que tengamos múltiples clases un solo módulo otra segunda buena práctica es que la mayoría de los atributos de una clase casi siempre serán privados y solamente serán públicos algunas constantes vale o unos casos muy muy muy particular vale solamente sería en este caso atributos público lo normal es que los atributos de una clase en privado y se han expuesto al exterior a través de unos metros de especiales conocidos como que te lo sé pu2 método que nos ayuden a implementar la lógica de nuestra aplicación si tenemos atributo también deberíamos tener un método para poder interaccionar con ellos y los atributos un privado los métodos deberían ser públicos no los métodos privados son interesantes pero si queremos realizar algún tipo de cálculo auxiliar dentro de la clase separado el otro método pues en ese caso si son interesantes y todos los métodos de una clase fuera en privado y no podríamos interaccionar con ella de ninguna manera la gran mayoría de los métodos de las clases y bueno para diferenciar algunos tipos de clase nominalmente de picamos sintácticamente estaba solamente tiene un tipo de clase no una forma única de crear clase a través de la palabra reservada class no es la única manera que nosotros tenemos de deficiencia sin embargo en función del cometido que vayan a tener las clases conforme vayáis trabajando en diferentes proyectos o algún tipo de patrón de diseño diferentes tipos tener las clases conforme vayáis trabajando en diferentes proyectos o algún tipo de patrón de diseño o ir dando cuenta de que existen diferentes tipos de diferencial una clase que va a representar algún objeto hecho de la naturaleza por ejemplo coche un asiento contable unos datos meteo meteorológicos para un día en particular vale serían las clases que representarían el modelo de nuestro sistema suelen tener atributos privados métodos de tipo que utilicé este método equal to string vale y algún método más si me explicara a una clase concreta que normalmente suelen ser así suelen ser clase muy fácil de implementar porque tan solo con que nosotros definamos los atributos que la conforman sus propiedades pues rézale código que así que no podemos generar por escrito los servicios por contra suelen ser a clases que implementan la lógica de negocios decir lo propio de nuestro sistema si visitáis el curso de Java 8 desde cero en el ejemplo final es igual a implementar la gestión de un parking pues toda la lógica asociada a la gestión de un parking podría ir separadas en un servicio decir que se hace cuando un vehículo tiene que entrar dentro del parking o que é necesario para cobrarle a un cliente o a la hora de salir sería algo propio de un parque eso normalmente se suele intención estar en un servicio suele tener algunos atributos esos servicios pero sobre todo suelen tener menos mal que se han orientado a la ejecución de esa lógica de negocio los métodos perdón las clases auxiliares suelen ser clase que tienen métodos de cálculo de Transformers transformación de datos algunos métodos que eso que no utilidad para nuestra aplicación normalmente serán clases que tendrán métodos estáticos malas y los cuales podremos invocar en cualquier punto de nuestro cuerpo las clases de ti podríamos llamar Meifrén ser el punto de entrada una aplicación son las clases que tendrían que el método ven que es un método especial y qué sirve para comentarle vocación de de normalmente no suelen tener más método o si los tienen suelen ser método estático vale otras clases por ejemplo sería por decir otro tipo último las que acepte son clases especiales que están orientadas a realizar prueba de nuestra aplicación en Java por ejemplo tenemos los trinitarios religiosos pueden realizar con J y otro que conozco son otro tipo de clase con otros métodos específicos que servirían para para que nosotros pudiéramos realizar esos esas pruebas unitarias aquí tenemos algunos ejemplos de los tipos de clase que hemos ido mostrando antes no tendríamos una clase modelo como la clase persona que tendría pues sus atributos privado constructor en vacío con parámetros un metodo getter method of step count equal el metodo ToString como decía son clase las más sencillas de implementar porque con tan solo que nosotros definamos en sacarte aquí en el apartado de sol podemos generar lo que te dicen ser el método factor el método equal string los constructores y algunos métodos mal suelen ser muy tonto las clases servicio cómo es posible que tengan algunos atributos y que suelen tener métodos que sirven para hacer la gestión y la lógica de negocio de nuestro sistema que por ejemplo tendríamos un servicio que sería el que nos permitiría gestionar persona con un método para añadir persona una colección editar los datos de una persona vale y eliminar personas así como obtener todas las personas de esa conexión la utilidad como tenemos aquí serían auxiliares que posiblemente utilizaremos en más de un sitio de nuestra aplicación una de ellas podría ser una clase que nos permitirá verificar sin DNI tiene las letras correctas Valencia un DNI vale el algoritmo que nos muestra que lo he sacado de la wikipedia vale es muy sencillo de implementar ya ya viene implementando Estado para comprobar un array pues ayunar sucesión de letras que se almacenan en un array que tienen un orden específico y lo que se hace es coger los 8 primeros números se dividen entre 23 que el número de letra nos quedamos con el resto y buscamos la posición correspondiente a esta letra y esa es la letra del nene coches de

Pues lo tendríamos que es una clase que es posible que tenga otro método diferente al método menos siempre suele ser método estático aunque ya digo también es muy habitual encontrarnos una clase menos acceso a través de otras clases en brazos de nuestra aplicación así veremos cómo podríamos crear una persona y se adquiere el servicio ni abrirlo y listar todas las personas que tengan ahora mismo el servicio comprobando si su DNI es correcto o no lo es a la persona con su DNI incorrecto vale porque no quería el correspondiente a las letras en la letra al 12345678 bueno pues este vídeo de encapsulación vamos a seguir diseñando nuestras clases y en el siguiente vídeo hablaremos sobre el


# 02 Implementación de herencia con modificadores de acceso y composición 9:55 

[Herencia](pdfs/02_Herencia.pdf)

## Resumen del Profesor

### 2.1 Herencia de clases

Una clase que extiende a otra hereda sus atributos y sus métodos (no constructores). Puede añadir atributos y métodos nuevos. Se trata de una asociación *es-un*, ya que la clase Hija es-un(a) (sub)tipo de la clase Base. Por ejemplo un `Coche` es-un `Vehiculo`, o un `Leon` es-un `Animal`.

Si usamos `protected` en la clase base, tendremos acceso directo a los atributos. En otro caso, tendremos que acceder vía getters/setters. ¡OJO! Los constructores no se heredan aunque sean públicos.

```java
public class Base {

   private String nombre;
   protected String apellidos;

   //...
}

public class Hija extends Base {

   public void metodo() {
      //this.nombre = "Pepe";  //Imposible acceder. Nos da error
      this.setNombre("Pepe"); //Funciona perfectamente
      this.apellidos = "Perez";
   }

   //...
}
```

### 2.2 Herencia de interfaces

También podemos establecer relaciones jerárquicas entre interfaces. Nos regimos por las mismas reglas que en el caso de las clases.

### 2.3 Asociación de composición

Normalmente, cuando representamos la estructura de un sistema, está formado por muchas clases. En este caso, no solamente importan las clases en sí, sino las asociaciones. Una de ellas es la composición. En UML, se representan de una forma especial.

Diagrama de clases

<img src="images/diagrama01.png">

Dentro de la clase Todo tendremos una referencia a la clase Parte. También es posible que la multiplicidad nos indique que debemos tener una colección (`Provincia` y `Municipio`). Normalmente hay dependencia de existencia entre la parte y el todo.

<img src="images/diagrama02.png">

## Transcripción

<img src="images/02-01.png">
<img src="images/02-02.png">
<img src="images/02-03.png">
<img src="images/02-04.png">
<img src="images/02-05.png">
<img src="images/02-06.png">
<img src="images/02-07.png">
<img src="images/02-08.png">
<img src="images/02-09.png">
<img src="images/02-10.png">

Todos en este segundo vídeo vamos a hablar de herencia y de composición de clase comencemos por la herencia de clase para aquellos que hayáis visitado nuestro curso de cada 8 desde cero sabréis que la herencia es un mecanismo de asociación entre clase mediante el cual podemos definir una clase vale que podríamos llamar base y alguna serie de clase me da las clases que entienden a una clase base heredan o atributo es un método salvo los constructores y estas nuevas clases pueden añadir atributos nuevo y método nuevo entre la clase que extiende y la clase extendida se forma una asociación de tipo es un cómo podemos ver en el gráfico tendríamos que un empleado que un trabajador un consultor también un trabajador no ambas son dos clases que heredan de trabajador no he utilizado en este caso la notación de VML tampoco por no por si alguno no lo conoce y no complicar el diagno asociada a la herencia de clases en el anterior curso tenéis el modificador protected que es su uso suele estar asociado a la herencia y es que si usamos protect es para algún elemento por ejemplo en los atributos de la clase va a ser y las clases que heredé de ella tendrían acceso directo a estos atributos si usamos otro modificador deberíamos usar como privado deberíamos usar lo que te lo que te dice te Oracle no recomienda que lo hagamos de esta segunda manera es decir que en la clase va a ser pongamos los atributos como privados y si hace falta que utilicemos los metros que te espero pues todavía tenemos la posibilidad de usar el modificador protected podemos ver un ejemplo sencillo de herencia lo trabajaremos ampliamente a lo largo de varios vídeos otros mecanismos de herencia sobre todo con clase abstracta aquí tenemos una clase base que define una serie de propiedades una de ellas privada otra protegida un constructor vale vacío otro parámetro que se entera y aquí tenemos una clase hija como la clase hija puede invocar al constructor de la clase baja utilizando súper tenéis la opción aquí también cuando construyó una clase hija de general constructores desde la clase base utilizando constructores base bueno a diferencia de la diferencia entre el atributo qué es en la clase base como privado y protegido sería que bueno sigamos este comentario podemos ver cómo triunfar y no y es que tiene un atributo privado no podemos acceder directamente a él desde la clase base tendríamos que hacerlo a través de el CT el correspondiente aquí no tenemos ninguno en cambio para los atributos de tipo protected bueno no tendríamos dificultad en acceder a ellos tendríamos aquí una serie de método y por ejemplo otro método que añadiría y que no para ejemplificar el acceso a uno que es privado y otro que no que lo que tendríamos que hacer esto con respecto a la herencia de clases que ya digo que iremos mucho más sobre ella con las clases abstractas también tenemos la posibilidad de hacer herencia cuando utilicemos interfaces vale podemos establecer el mismo tipo de relaciones jerárquicas que en el caso de las clases vale cuando un interfaz hereda de otro pásame heredar los métodos que tiene así como las constantes vamos a ver un ejemplo de herencia de interfaces vale como tenemos una interfaz que se llama imprimible que decirme todas tractor llamado Prim una clase perdón poner en una interfaz que tiende a imprimir imprimibles por consola que define un método que spring consola y además da la acción por defecto de este método no definimos una clase de Malaquías imprimible que implementa ambos interface podemos ver cómo estamos obligados a dar la implementación de la

Implementar la interfaz a imprimible por consola y comentamos este Código podríamos ver cómo al haber herencia entre imprimible por consola imprimible también nos está obligando incrementar el método print que me digas thriller viene por herencia de la clase imprimir lo de comentamos podemos comprobar como ahora bueno pues no nos lo pediría no de manera que esto está respondiendo a que imprimible por consola es tienda imprimible y tiene un método abstracto que se llama free no es bueno aquí tendríamos un pequeño ejemplo de creación de un imprimible y de la llamada a los diferentes métodos no tienen fondo están haciendo por dentro lo mismo como vemos también podemos tener herencia de interfaces la asociación entre clases no se limita a simplemente a mecanismo de herencia sino que podemos tener múltiples tipos de asociaciones teclas están modelación de la estructura de un sistema queda fuera del alcance de este curso pero sí me gustaría presentaros otro tipo de asociación cómo es la Asociación de composición porque en ocasiones algunos estudiantes suelen confundir AMPA como digo la composición es un tipo de asociación entre clase vale la asociación entre clases son tan importantes a la hora de modelar un sistema como las propias clases porque también nos dan nos aportan información y como decía la composición que no ml se suele representar mediante mediante un rombo vale nos denota que tenemos una asociación de tipo todo parte entre dos clases decir hay una clase qué suele estar formada compuesta por distintas partes de otra clase en este caso la parte todo tendría el extremo de la línea que marca la Asociación un rojo por ejemplo tendríamos que la clase provincia tiene uno unos municipios que la conforman vale una clase provincia estaría compuesta por estancia de provincia estaría compuesta por una serie de municipios no a la hora de implementar no dentro de la clase todo tendremos al menos una referencia a la clase parte vale y la multiplicidad de la Asociación así lo requiere tendríamos no solamente una referencia sino una colección de elementos vale y bueno cuando tenemos una asociación de composición se suele dar que hay una dependencia de existencia entre la parte y el todo no es decir que podría no podríamos tener en este caso municipios que quedarán fuera del alcance de una provincia no hay una cierta dependencia de existencia y queremos ver un ejemplo de Vera composición implementado en Java aquí lo tendríamos tendríamos la clase municipio que tiene un nombre número de habitantes vale con los métodos habituales en su constructor y tendríamos que una provincia tiene aparte de su nombre un listado de municipio está compuesta por un listado de municipios vale que tendría también la provincia los métodos habituales cómo ejemplo podríamos ver cómo podríamos crear la provincia de Sevilla y como podríamos añadir a la provincia de Sevilla una serie de municipios como son Sevilla capital dos hermanas Mairena del Aljarafe con la cantidad de personas que viven ellos con su número de habitantes de forma que si imprimimos una provincia Sevilla se imprimiría dentro la lista de municipios que lo conforman vale entre otros datos de manera que hemos podido modelar así la composición entre dos clases como podemos comprobar no es lo mismo composición que herencia en ningún caso los municipio ni vienen a la provincia ni la provincia tiene el municipio vale no es ningún tipo de asociación es un una provincia no es un municipio ni un municipio es una provincia sin embargo una provincia está compuesta conformada por una serie de municipios por eso es una asociación de composición en el próximo capítulo vamos a seguir trabajando con clase y vamos a trabajar el concepto de polimorfismo

# 03 Polimorfismo 10:37 

[Polimorfismo](pdfs/03_Polimorfismo.pdf)

## Resumen del Profesor

### 3.1 Polimorfismo

Java nos permite crear instancias de objetos, pero que estos sean referenciados por alguna de sus clases *ancestro* o alguno de los interfaces que implementa:

```java
Rectangulo r = new Cuadrado();
```

También permite la ocultación o sobreescritura de métodos por parte de las clases derivadas.

¿Qué sucede en caso de el uso de referencias de clase base, pero instanciación de objetos derivados? Java escoge, en tiempo de ejecución, el tipo de objeto. Si ese tipo ha ocultado un método de la superclase, llama a la concreción. En otro caso, llama al método de la clase base.

```java
Cuadrado [lado=5.39897]
Area de un cuadrado
Perimetro de un cuadrado
Area de la figura: 10,797940 | Perímetro de la figura: 21,595881

Rectangulo [base=10.55045, altura=0.6183386]
Area de un rectángulo
Perímetro de un rectángulo
Area de la figura: 6,523750 | Perímetro de la figura: 22,337578
```

Esto también sucede cuando una clase implementa una interfaz que forma parte de una jerarquía de herencia:

```java
ClaseQueImplementaInterfaz c1 = new ClaseQueImplementaInterfaz();
c1.saludar("Hola Mundo");

Hija c2 = new ClaseQueImplementaInterfaz();
c2.saludar("Hola Mundo, otra vez");

Base c3 = new ClaseQueImplementaInterfaz();
c3.saludar("Hola Mundo, por tercera vez");
```

## Transcripción

<img src="images/03-01.png">
<img src="images/03-02.png">
<img src="images/03-03.png">
<img src="images/03-04.png">
<img src="images/03-05.png">
<img src="images/03-06.png">

Hola a todos en este tercer vídeo vamos a hablar sobre el polimorfico en el anterior vídeo hablábamos de herencia entre clases hemos visto como una subclase puede acceder a los métodos de la clase base en tanto en cuanto estén marcados como público o protegido además de acceder a ellos también puede sobreescribir su comportamiento y es que una clase que extiende a otra puede tener la implementación de un método que sería se llame igual tenga la misma firma que el de la clase base con esto lo que estaría haciendo sería sobreescribir su comportamiento por otro lado a la hora de crear instancias de clase podríamos tener y para ellos de hecho sirve la herencia podríamos tener la posibilidad de instanciar un objeto de un tipo de clase hija y guardar su referencia en una variable de un tipo de clase vas pero desde la clase padre esto es muy útil cuando queremos definir un método que puede recibir un tipo de una clase o alguno de sus hijos sus nietos no dentro de esta jerarquía de la EMT por ejemplo un cuadrado es un tipo especial de rectángulo en el cual pues no pues los lados son del mismo tamaño no de manera que podríamos crear un cuadrado y guardar su referencia en un rectángulo vale Pilar subclase añade un método con el mismo nombre y firma que otro de la clase base pues ocultaría este con lo cual qué sucedería si llamáramos a ese método que ha quedado oculto mediante la clase hija pero con una referencia de la clase base bueno pues en este momento sucede lo que se conoce como polimorfismo y es que habéis coge el tiempo de ejecución el método que tiene que implementar en función del tipo de objeto si el tipo concreto si la clase que ha sido que ha hecho la herencia oculta al método de la clase base se llamará esa concreción independientemente del tipo de la referencia si no habido esa ocultación pues se llama el método de la clase vas esto que sucede con clase también lo podemos tener presente con la herencia de interfaces de interfaces y de clase que lo implementan es decir podríamos tener también la posibilidad de utilizar referencias de un tipo de interfaz a la hora de guardar un objeto de una clase que implemente hasta a esa interfaz no y también vamos a poder comprobar el ejemplo que vamos a ver ahora como usando referencia con interface pues también sucede el polimorfismo veamos tenemos la clase rectángulo delimitada por su base y su altura y otros métodos como son Guetaria y que el perímetro vale que nos devuelven bueno pues el área y el perímetro respectivamente de un rectángulo un cuadrado es un rectángulo en el que bueno solamente no hace falta construirlo con una medida no porque los cuatro lados son iguales eso es lo que delimita lo que caracteriza un cuadrado los métodos que tendría serían lado vale que podíamos devolver por ejemplo la base ya que vas y altura son iguales a la hora de setear lo pues lo que haríamos sería utilizar los métodos centro base y altura del rectángulo poniéndole la misma medida y bueno podemos sobreescribir la manera de calcular el área mediante bueno multiplicando la base por 2 y el perímetro la base por 4 no que sería la manera de calcular el área de el perímetro y perdón estoy de pase pero que al cuadrado vale nos vamos a hacer más sencillo todavía la base por nada vale para delimitar altura imperfecto la base por la base notaría el área de un cuadrado y ya digo en la base por 4 notaría el perímetro aquí tenemos una serie de figuras ya vamos a guardar en un ArrayList de rectángulos 

La vamos a guardar en un ArrayList de rectángulo ejemplo en el que podemos ver cómo podemos guardar referencias de tipo leaf cómo podemos comprobar en la documentación es una interfaz vale estamos guardando instancia de clase vale bueno cree haríamos 10 figuras de tamaño aleatorio vale para ello hemos implementado un método que simula al tirar una moneda vale que nos devuelve VERDADERO o FALSO vale para qué es bueno simplemente creemos un rectángulo o un cuadrado en función de si sale cara o cruz vale también tendríamos método aleatorio que nos devuelve un número aleatorio hasta un determinado tope el método Ernestine y nos permite marcar un límite superior pero el método NetFlow no nos lo permite y lo que haces devolver un número aleatorio entre 0,0 y 1,0 a la hora de crear un número aleatorio mayor por lo que vamos a hacer es multiplicar el uno por el otro vale para que nos dé un número aleatorio que esté bueno rondando siempre porque puede salir aquí uno el tope que le hemos marcado vale y también en 300 con un montón de décimas haríamos sería recorrer primero la lista de figuras para para ponerme un tamaño aleatorio como vemos está colección vamos a imprimir la figura de un rectángulo con cuadrado y vamos a calcular su área y su perímetro siempre con referencias de tipo rectángulo podremos ver cómo el primer objeto que se ha creado un rectángulo con esta medida vale estas dos líneas se llaman porque le hemos incluido para que podamos evidenciar a qué método concreto como parte del polimorfismos está llamando vale área de un rectángulo y perímetro de un rectángulo y no está dibujando perfectamente chino esta sería usuaria y esta sería este sería súper listo vale la segunda figura que ha creado en un cuadrado de lado 18 y pico y podemos comprobar como está llamando mediante el polimorfismo porque los métodos están sobrescrito al área del cuadrado y el perímetro del quad María siempre al método de la clase base para un cuadrado estaría llamando correspondientemente a los métodos de la clase que lo están diciendo el polimorfismo está funcionando cuando hemos tenido herencia supongamos ahora que tenemos una interfaz bastante con un método por defecto saludar que tienes un calendario por defecto una clase que tenemos aquí instanciar la clase y guardarla en una referencia de tipo y en otra de tipo llamar a los distintos métodos saludar para saber a quién está mañana podemos ver como la primera vez estamos llamando a hola mundo desde insta vale es decir estaría llamando a este método aunque la referencia sea del tipo de la clase porque la clase no ha hecho ninguna ocultación de la implementación del método saluda cuando llamamos desde una referencia tipo hija también llamaría a la implementación de la clase hija y si llamamos al de la base como esta clase está implementando la interfaz física aunque llamamos desde base vale estaría llamando en este caso el de la clase hija si quisiéramos diferenciar o evidencia un mal polimorfismo podríamos ver cómo podríamos darle cuerpo a la implementación de saludar en la clase y también podría variar este ejemplo pero ya eso os lo voy a dejar a vosotros mismos vales para que podáis comprobar cómo podría hacer esa combinación de polimorfismo entre la implementación de una clase la implementación por defecto de un método en una interfaz que además tiene herencia precio 30 con esto terminamos un vídeo sobre el polimorfismo en el siguiente vídeo vamos a sobreescribir algunos métodos de la clase hostia cómo son las BBDD y cual y el método triste


# 04 Sobreescribir los métodos hashcode, equals y to string de la clase object 14:34 

[Sobreescribir los métodos hashcode, equals y to string de la clase object](pdfs/04_Equals_hashCode_y_toString.pdf)

## Resumen del Profesor

### 4.1 Herencia de `Object`

Todo objeto, de forma directa o indirecta hereda de `Object`. Esta clase tiene una serie de métodos, entre los que destacan:

* `equals`: nos permite indicar cuando dos objetos son iguales

* `hashCode`: nos devuelve un número “único” asociado a una instancia de una clase

* `toString`: nos devuelve una reperesentación del objeto como una cadena de caracteres.

### 4.2 Sobrescritura de `equals`

Con tipos primitivos, hemos usado el operador ==. ¿Qué sucede con los objetos? Primero tenemos que definir cuando dos instancias de un objeto son iguales o diferentes.

El método `equals` nos permite devolver un boolean indicando si un objeto es igual a otro. Nuestro IDE lo autogenera, junto con `hashCode`. La representación actual es muy verbosa y no aprovecha las capacidades de Java 7. La actualización está en desarrollo.

### 4.3 Sobrescritura de `hashCode`

Devuelve un número asociado a la clase. Sirve como posición de memoria en hexadecimal. Por definición, si dos objetos son iguales (equals), su *hash code* también debe serlo. Si sobrescribimos el método equals, también tenemos que sobrescribir hashCode para que se cumpla esa propiedad.

### 4.4 Sobrescritura de toString

Devuelve una representación en `String` del objeto. Por defecto, devuelve el tipo (la clase) y su `hashCode`. Lo podemos sobrescribir para que represente los valores. Dos objetos iguales deben tener la misma representación.

## Transcripción

<img src="images/04-01.png">
<img src="images/04-02.png">
<img src="images/04-03.png">
<img src="images/04-04.png">
<img src="images/04-05.png">
<img src="images/04-06.png">

Hola a todos en este cuarto vídeo en el que todavía estamos en el bloque de diseño de clases en Java vamos a hablar de algunos métodos de la clase Vázquez por excelencia en Java que es la clase ostia en particular del metro de igual del metodo hashCode en el método to String que suelen ser sobreescrito en la mayoría de las clases que generan bueno todo esto de forma explícita o implícita en cada vale es decir cualquier clase e incluso aunque tienda otra clase y vamos tirando poco a poco de ese árbol genealógico acabaría siempre en la clase hoy está recojo de comprobar con cualquier clase por ejemplo la documentación directa o muy remota de cualquier clase que nosotros simplemente estaba la clase y mirar en la documentación proporcionada cuando comparamos objeto tenemos que hacernos un determinado planteamiento de bueno realmente como se está haciendo esa comparación cuando trabajábamos en el curso de Java 8 desde cero con los tipos primitivos y usábamos el operador de comparación igual igual teníamos muy claro que lo que estábamos comprando era los valores de esos palos de esos tipos primitivos si queríamos comprobar si la variable a espera que tiene un valor 7 = la variable ve que tiene dentro la suma de 3 + 4 determinar que hay eran igual igual igual devolver si la referencia de ámbar Valentina A y B están apuntando al mismo objeto en la misma posición en el móvil los valores de los objetos al cual apunta A o B son los mismos no tenemos el método igual implementado y lo comparamos con nada igual igual la vez no te volvería a salir porque en el fondo no es tan referencial del mismo cuál el que nos permite devolver un valor booleano verdadero o falso indicando cuando un objeto es igual a 11 no implementamos en una clase el método igual pues directamente como implícitamente heredamos de o que estaremos usando la implementación de Georgia es muy fácil implementar este método porque nuestro IDE Eclipse no lo general no tenemos que plantearnos el hacerlo nosotros solo si bien desde cada 7 proporcionó una clase hostia que tiene algunos métodos estáticos rápidos para hacer un código de método visual más conciso y es una tristeza que todavía existe no haya incorporado esta novedades a las 7 que ya lleva algún tiempo todavía no está implementada hospital la curiosidad vale entre la gente que va desarrollando el tinte vale que hay una comunidad de desarrolladores detrás podréis comprobar pues como el debate de que próxima versión de Eclipse se va a poder incluirla la generación del método y cual para una clase utilizando la notación que ya no es perfecta bajaba S7 de todas maneras en el ejemplo que veamos yo os voy a enseñar cómo cómo podríamos hacer sin tratar devuelve un número vale también te un número decimal vale pero devuelve un número asociado a la clase y sirve como posición de memoria vale es un número hexadecimal por definición vale del lenguaje Java si dos objetos son iguales mediante el método equal to have got también debería serlo vale eso por definición con lo cual estamos sobrescribiendo el método igual también deberíamos sobreescribir el metodo exacto para que se cumpla esa propiedad vale esta dirección de memoria no suele aparecer cuando bueno no tenemos implementado el método stream en un objeto y hacemos un system. Al punto primer eje de una referencia de chaqueta no la podemos consultar por último el método to string digo lo que hace devolver una representación en una cadena de caracteres del objeto y no modifican el comportamiento por defecto lo que hace imprimir su casco además del tipo la clase y a la hora de representar lo bueno pues también podemos a la hora de implementar no perdón también podemos hacerlo con la autogeneración que tiene que ir dos objetos iguales por el método y cual deberían también devolver la misma representación


Veamos algunos ejemplo vale de y quad de Samsung y reduce vale supongamos dos clases la clase Conchi la clase persona coche esta clase no implementa el método igual por lo cual la implementación que se utilizara cuando llamemos al método o no hemos dicho si coche está extendiendo implícitamente o que podrá usar su implementación sin embargo personas utilizamos soul general tejas go and igual lo que nos generaría sería un código como esté en el que va haciendo una comprobación vale del objeto propio desde el cual estamos llamando a y cuarto del objeto que le pasamos para saber si el mismo no la comprobaciones agua porque lo que va haciendo es comprobar y la referencia son iguales entonces verdadero y el objeto que le proporcionamos como para meter los falsos y las clases son distintas falso que hacía el objeto al tipo propio y entonces a partir de ahí se pone comparar propiedad propiedad apellidos fecha de nacimiento nombre y bueno Paco probando unos 100 no lo mañana sería vale no son iguales pues ya devuelve falso también es cetera etcétera sin embargo el estilo a partir de Java se7 es mucho más compacto más conciso en la primera parte común antes de hacer el casting sigue siendo la misma no comprobamos si lo si las referencias son las mismas longitudes igual y la referencia que proporciona no es nula el objeto es falso y si por defecto por definición y no pertenecen a la misma clase también sería diferente a la hora de castear lo tenemos la clase o pie vale que la tenemos por aquí tiene una serie de métodos estáticos vale entre ellos tiene el método igual que recibe dos hombres y que devuelve true si esos dos métodos no son iguales por lo cual aquí lo que está haciendo es utilizar la implementación de igual en el fondo de la clase Street vale que es una más básica y qué bueno ya viene definida por Java y que nosotros no tenemos que dar tanto para el hombre como para apellidos como para la fecha de nacimiento no en este caso estaría haciendo uso del método y de la clase localdate que también nos da centralización la propia sábana de forma que como podéis comprobar que este código que era mucho más conciso que todo este bloque de código de aquí si bien este primero de arriba es la implementación que nos proporciona por defecto eclipse vale vamos a comprobar el funcionamiento cómo puedes comprobar aquí vamos a crear dos coches un Mercedes A200 y un Volkswagen Passat si intentamos comprobar si un Mercedes es igual a un Volkswagen nos dirá que los dos coches son iguales y si no nos dirás que los otros dos coches son diferentes y ahora damos la referencia de Mercedes a Volkswagen lo que estaríamos haciendo es que no se copian los valores es decir no tenemos dos objetos distintos en memoria sino que las dos referencias estarían apuntando a la misma dirección de fútbol y lo vamos a comprobar también imprimiendo Mercedes y Volkswagen ya que el coche no tiene tu estrés no tirar su referencia memory veremos comer la misma y por otro lado vamos a crear cree distancia de persona Rafa Nadal otra instancia también de Rafa Nadal y Roger Federer como hemos visto personas implementar el método igual no vamos a comprobar si Rafa Nadal qué es una referencia a un objeto es igual a otro Rafa Nadal que otra referencia otro objeto pero que tiene los valores iguales y también lo compararemos con Roger Federer para saber si son iguales o no sé y nos centramos en la primera parte podemos comprobar como en principio Mercedes no es igual a Volkswagen son dos coches diferente pero cuando hacemos esta afirmación de aquí ambas referencias apuntan al mismo objeto en memoria por lo cual los dos coches sí que serían iguales es decir no se está metiendo en comparar más allá de la referencia aquí vemos como ambas referencias son la misma en el caso de los tenistas tenemos aquí que en principio Rafa Nadal y otro Rafa Nadal son iguales aunque sus referencias sean francamente distinta y todo viene porque si se está haciendo la comprobación de

Aunque su preferencia estén francamente distinta y todo viene porque si se está haciendo la comprobación de los tres atributos las tres propiedades que conforman a la persona si compramos a Rafa Nadal con Roger Federer como el nombre es diferente los apellidos son diferentes la fecha de nacimiento en distintos los dos objetos no son iguales son diferentes vale incluyendo la referencia en memoria que también es distinta si además queremos ver la versión de Huston en el caso de este método también tenemos a partir de las Java se7 dentro de objects tenemos un metodo hashCode que nos devuelve el casco para un objeto que no sea nulo y menos puede servir para hacer una implementación más concisa de este método que si lo autogenera Eclipse en el viejo estilo pues podéis comprobar cómo va haciendo aquí el cálculo con un número primo y alguna cosa más bueno pues vamos a comentar este código el viejo estilo de Eclipse Madrid vamos a ver comentar el nuevo estilo a partir de las 7 que bastante más atractivo y conciso y podemos comprobar como lamerte la la implementación de Huston para detener un número primo y tal poder hacerla en una sola línea porque miramos la documentación Captur tiene esto y tiene el método Óscar que lo que hace recibir un varal de los objetos y que construye el casco en Master a los distintos objetos que nosotros le proporcionaremos la verdad es que este método en el momento en que quede incluido dentro del generador de código de Eclipse pues será bastante bastante mejor vale y por último vamos a comprobar cómo sería en otra en otro ejemplo la generación de tu stream vale para personas no podemos hacer desde este generador muestra mismo nos dice que ya lo tenemos otra vez podríamos utilizar distintas funcionalidades podríamos generar los a partir de los campos o en lugar de eso a partir de los métodos podríamos intentar tirar de algún método de clase vas es que lo hubiera podemos indicar dónde se va a colocar añadir un comentario al método utilizar alguna otra plantilla para formatear el estilo si queremos usar diferentes tipos de implementación concatenación de strings streaming eurostreaming base vale con cadena con llamada encadenada con string format in mensaje forma vale un constructor de testing porque nosotros podemos coger dar tus tamizado ya podemos indicar también si queremos que saliste en el contenido de rey limitándolo incluso un número de elementos supongamos que tenemos un objeto que tiene dentro una colección y la colección tiene miles de elementos Isa no queramos que se representen todo y si queremos evitar que se muestren valores nulos lo cual lo haría operador ternario como tenemos nosotros por aquí letra no stream cuando le pasamos una referencia de un objeto que lo implementa a LN incluso sin hacer una llamada Cristina vale implícitamente se estaría llamando al metro de utensilio conecta terminamos el vídeo en el que hemos hablado de igual becas go de tu stream y en el siguiente vídeo vamos a hablar del ámbito static y cómo lo podemos aplicar a variable a método sierra

# 05 Uso del ámbito static para variables, métodos y clases 9:30 

[Uso del ámbito static para variables, métodos y clases](pdfs/05_Uso_de_static.pdf)

## Resumen del Profesor

### 5.1 Atributos de objeto y de clase

Java nos permite crear cuantos objetos queramos de una misma clase. Estos objetos tienen una copia propia de los atributos. Sin embargo, en ocasiones, puede interesarnos tener un atributo común a todos los objetos. Estos son los atributos `static`.

Están asociados a la clase, y compartidos para todas las instancias. Pueden ser manipulados por cualquier objeto, o incluso sin crear una instancia de esa clase.

### 5.2 Métodos estáticos

Se rigen por los mismos principios de los atributos estáticos. Para invocar:

```java
Clase.metodoEstatico(...);
```

Podemos acceder a una variable estática desde un contexto estático o no estático. También podemos crear métodos estáticos como métodos de operaciones auxiliares (recordemos todos los métodos de la clase `java.util.Arrays`).

### 5.3 Constantes

Se pueden definir como `static`.

```java
static final PI = 3.141592653589793;
```

### 5.4 Clases estáticas

Este tipo de clases solamente tienen sentido cuando trabajemos con clases internas (lo haremos en capítulos posteriores). Nos permiten, entre otras cosas, agrupar código, definiendo clases que tendrán solo sentido si están envueltas por otra.

Para crear una instancia de la clase interna, si esta es estática, no necesitamos una instancia de la clase externa:

```java
public class EjemploClaseStatic {

   /**
    * @param args
    */
   public static void main(String[] args) {

      Persona p = new Persona("Pepe");        
      System.out.println(p);

   }

   public static class Persona {
       //...
   }        

   public class OtroEjemplo {

      /**
       * @param args
       */
      public static void main(String[] args) {

         EjemploClaseStatic.Persona p = new EjemploClaseStatic.Persona("Pepe");        
         System.out.println(p);

      }
   }

}
```

## Transcripción

<img src="images/05-01.png">
<img src="images/05-02.png">
<img src="images/05-03.png">
<img src="images/05-04.png">
<img src="images/05-05.png">
<img src="images/05-06.png">

Continuamos dentro del bloque de diseño de clases en Java y vamos a hablar del uso de esta un poco del curso de Java 8 desde cero la diferencia entre atributos de objetos y atributos de clase cómo sabemos los objetos son instancias de una clase la clase vendría a ser algo así como el molde mediante el cual construimos una serie de jefa objeto de tener su copia de sus propios atributos pero qué pasa si quisiéramos tener un atributo ejemplo que fuese común a todos los objetos de esta clase es decir que cada una cada instancia no tuviera su copia sino que tuviera cada cada instante pues tuviera acceso a esa misma para ello tenemos el modificador static no que nos permite indicar que un atributo o un método vale pues puede ser compartido por todas las listas los atributos estáticos están asociados a la clase no a un objeto en particular de ella vale son compartidos para todas las instancias cualquier instancia tiene acceso a este atributo estático y Amanecer de cualquiera podríamos acceder a él y también pueden ser manipulado y eso es muy interesante sin que tengamos una instancia creada de esa clase es decir que lo podríamos hacer manipularlo a través de métodos estáticos de algunos de los ejemplos que bueno que os podéis encontrar en this que tenemos una clase que solamente tiene un buen cuerpo tienes método estático y define como parte de la clase atributos estáticos que pueden que pueden ser accedidos por el mes y por cualquier otro método estático que se avecina dentro de resaca hablando de método estático pues son similares a las variables estáticas las propiedades estática se pueden invocar desde la propia clase film necesidad de tener una estancia la sintaxis suele ser el nombre de la clase punto y el nombre del método estático eclipse suele poner las llamada a método estático en cursiva vale para que podamos diferenciarlo de llamada métodos de instancia podemos vale podemos acceder a una variable estática desde un método estático vale aunque no es obligatorio vale bueno podemos comprobar como algunos métodos auxiliares algunos métodos auxiliares por ejemplo de la clase Array vale la clase o pie o alguna de ellas pues nos permite acceder a un gran juego de método estático en el primer vídeo hablamos de las clases de utilidad en las cuales los métodos que tienen son la mayoría clases de apetito echa métodos de tipo estático no digo si queréis visitar el la documentación de Java util arrays podréis ver cómo tiene un juego de método enorme estáticos para poder hacer operaciones con diferentes tipos de rally las constantes vale suelen ser definidas también como estática de hecho suele ser definidas como staticfiles vale muchas de ellas suelen ser definidas dentro de interfaz alguna otra cosa que como como miembro de una clase por ejemplo si tenéis cómo sería de género en la constante Pi ya viene definida dentro de la cárcel de la clase más vale pero cómo sería definir la constante team de tipo doble vale cómo está piscina los nombres suelen ir en mayúscula y su valor no se puede modificar vale no sería no produciría una continuamos centro de bloque de diseño de clase sé nada ya hablaremos

Próximo bloque con clases están dentro de otras clases de alguna otra manera vamos a poder ver como hay si podemos definir clases estáticas las clases estáticas clase que van dentro de otra clase nos van a permitir agrupar código de manera que habitación tiene más cohesionada no que sigan un principio de localidad de que si tenemos que si trabajan juntas porque a la hora de evitar la podemos evitar las compras no para crear una instancia de una clase interna estática de habremos como no necesitamos de la clase no se lo podemos hacer sin tener ningún tipo de instancia de esa clase externa y la interna fueran una clase no estática tendríamos que tener una instancia de la clase externa para poder definir plantearse me armó alguno ejemplo vale por ejemplo tenemos la clase bicicleta bloque clase están dentro de otra clase de alguna otra manera vamos a poder ver , a ver si podemos definir clase método de la bicicleta podemos comprobar como podríamos crear dos bicicletas diferente trato tomar Twitter y ver el número de bicicleta y lo sé como aquí ha ido utilizando la propiedad estática de número de bicicleta incrementando la para ir dándole una idea cada una de las bicicleta y nos permite consultar la desde un método estático para obtener su valor aquí en este otro ejemplo podemos ver el uso de clases estáticas como decía antes y esto lo que comentamos veríamos cómo se produciría un fallo y es que una clase solamente puede ser pública puede ser abstracta puede ser final pero una clase Héctor le pertenecían a la clase que está definida aquí directamente no existe cuándo puede ser estática sino que ese modificador se puede aplicar a otra clase como por ejemplo está que tiene aparte de métodos vale pues podría tener atributo tiene dentro otra clase explicaremos en un vídeo posterior que puede ser estática y puede no ser la cuál es la diferencia práctica en su uso comprobar aquí como si definimos la clase persona y otra clase diferente donde personas si es estática la podríamos utilizar como si fuera una clase que estuviera decidida fuera vale es decir como si fuera una clase pública no estática a diferencia de que bueno sabemos de que está aquí dentro al estar dentro de la propia clase podemos acceder a ella sin necesidad de tener una instancia de clase está vale sin embargo para una clase que no sea estática tendríamos que crear primero se anotación en ocasiones la primera vez que se ve son poco frecuentes pero tendríamos que crear primero una instancia de la clase terna de la que envuelve para poder tener una instancia de esas otra clase que no está definida como estática vale para poder acceder a ella aquí fue implementar el perdón ponerla en ejecución para ver cómo funciona cada una de ellas será bastante habitual si tenemos que tener definida una clase interna que nos la encontremos definida como una clase estática para que podamos acceder directamente a ella si es que bueno la lógica del código que estamos implementando así lo requieren hasta aquí el vídeo de código que utiliza estatil vamos a ver en este último vídeo del primer blog cómo crear clases que implementen el patrón Singleton y también clases que sean inmutables decir que una vez creada no puedan modificar


# 06 Clases singleton y clases de inmutables 9:09 

[Clases singleton y clases de inmutables](pdfs/06_Singleton_e_inmutables.pdf)

<img src="images/singleton.png">

## Resumen del Profesor

### 6.1 Singleton

*Singleton* es uno de los patrones de diseño propuesto por *Gang of Four*(GOF), y sirve para poder tener una clase de la cual solamente querremos tener una instancia (manejadores, servicios, …).

Para implementarla, podemos seguir los siguientes pasos:

1. Definir un único constructor, como privado, para evitar instanciaciones innecesarias.
2. Obtener siempre la instancia a través de un método estático.

```java
public class MiServicioSingleton {

   //Una instancia del objeto que va a existir
   private static MiServicioSingleton instance = null;

   //Evitamos así la instanciación directa
   private MiServicioSingleton() {    }

   public static MiServicioSingleton getInstance() {
      if (instance == null)
         instance = new MiServicioSingleton();

         return instance;
   }


}
```

### 6.2 Objetos inmutables

Son objetos cuyo estado no puede ser modificado una vez se haya inicializado. No son constantes ya que estas se definen en tiempo de compilación, y los inmutables en tiempo de ejecución. Un ejemplo de clase inmutable que ya hemos utilizado es `String`.

Algunas recomendaciones para crear objetos inmutables:

1. Definir todas las propiedades como `final private`
2. No añadir métodos *setter*
3. Evitar que existiendan la clase, añadiendole el modificador `final a la definición.

## Transcripción

<img src="images/06-01.png">
<img src="images/06-02.png">
<img src="images/06-03.png">
<img src="images/06-04.png">
<img src="images/06-05.png">
<img src="images/06-06.png">

En este último vídeo del primer bloque sobre diseño de clase vamos a hablar de clase Singleton y de clases inmutables comencemos por Singleton Singleton patrón de diseño vale que está definido dentro del documento de la panda de los cuatro novelas Gang of Four de bueno de los patrones de diseño más conocido a la hora de programa y lo que nos diste y cometido de este patrón es que bueno si para una determinada clase necesitamos una y sola una instancia decir que queremos tener más de una instancia no sería posible bueno pues podríamos implementar el patrón sin pinzas vale esto tiene su utilidad en múltiples contextos no por ejemplo del uso de servicio bueno pues suele hacerse mediante el patrón Singleton de hecho frenworld como como spring pues nos permiten hacer la inyección de dependencia y la definición de esa clase vale cuando contenedor de inversión de control pues al final lo que vamos haciendo es utilizar una sola instancia múltiple permiso que la inyectamos allá donde la gente sin el uso de frameworks como como el que os decía como estén nosotros podríamos implementar todo lo necesario para que una una clase que nosotros queramos dear tea Singleton por ejemplo una conexión a la base de datos podríamos hacer mediante este patrón de hecho en el último bloque del curso en el que trabajaremos con JDBC utilizaremos el patrón Singleton para para que bueno solamente tengamos un objeto de tipo conexión y lo reutilicemos si es que es necesario por ser un elemento que podríamos Asperger y pensar vale pues no podemos ver el diseño de una clase Singleton suele llevar aparejado una serie de operaciones clásicas por así decirlo y es que bueno vamos a tener almacenada dentro de la propia clase una instancia que será estática y bueno un método que pintan que nos va a devolver la instancia de la clase antes de devolver los de la clase puede tener los métodos tradicionales y otra operación veamos un ejemplo de single zone vale para la creación de un servicio supongamos que tenemos una clase poder implementar el patrón de hacer citamos los siguientes elementos por lo pronto podríamos tener cualquier tipo de cantidad de atributos propios pero deberíamos tener siempre uno privado y estático que fuera una referencia no podemos comprobar de la propiedad vale que inicialmente valdrían oficialista haríamos algo vale para evitar la instanciación directa lo que haríamos sería definir constructor la clase sin parámetros como privado esto evitaría que pudiéramos hacer una construcción directa de mujer a partir de ahí lo que haríamos sería tener un método estático que nos devuelva la instancia y bueno su lógica es muy sencilla si la instancia es nula lo que hacemos es construir la estancia en objeto como el constructores privados no tenemos ninguna dificultad enfocarlo desde aquí dentro y tantos y la estancia era nula y se acaba de construir objetos como si no lo era ya te volveré a molestar de manera que es bueno esta operación se realizará una sola vez y a partir de ahí iremos devolviendo siempre la 50 etcétera atributos propios podríamos tener lo que quisieras a la hora de utilizar lo podemos comprobar como no podríamos llamar al constructor del servicio porque no hemos definido lo privado sería un error de compilación cómo podemos crear o mejor dicho tener dos instancias del servicio y podemos comprobar imprimiendo no hemos sobre la referencia del objeto

La referencia del objeto vale 23 de servicio 2 y si lo consultamos de servicio tres aunque sea un atributo de instancia no solamente tenemos una no es para devolver siempre el mismo gesto y no te volvería a este nuevo valor hola podemos comprobar como perdón y centre vale son en realidad referencias de un mismo objeto del único objeto que tenemos implementarse injerto y como si se te amos el valor hola al atributo pues a la hora de consultar lo tendríamos este valor zona es decir aunque tengamos varias referencias estarán todas cediendo siempre al mismo es esa es la idea del patrón single otro tipo de objetos muy usual suele ser los objetos inmutables un objeto inmutable es un objeto que tiene un valor que se le da al inicializar dos y una vez que termina la inicialización de ese objeto pues no se puede modificar un objeto inmutable no es lo mismo que una constante vale las constantes se definen en tiempo de compilación los objetos inmutables se pueden definir en tiempo de ejecución con una serie de valores que podrían ser diferentes de una a otra vez imagina un programa en el que vamos tomando los valores que el usuario se produce por consola y a partir de eso quisiéramos construir un objeto que no se quisiera modificar eso sería un objeto inmutable por ejemplo un objeto inmutable son los objetos de tipo este vale vale ya hablamos también en el curso de Java 8 desde cero para hacer un objeto inmutable lo que tenemos que tomar es una estrategia con una serie de paso que son sencillos aunque hablaremos de código final más adelante podemos definir las propiedades como Farnals y privadas vale como primer paso para que nuestro objeto sea imputable al ser final no podrán ser modificadas las siguientes características y varía en no añadir método setter a casa que hace sino solamente el método que te de esa manera solamente podríamos inicializarlo calor en la construcción a través de el constructor y a partir de ahí no tendríamos manera si en los atributos son privados y no hay setter no podríamos modificar su valor por último para que no se pudiera implementar una clase que extendiera de esta clase que implementará los setter queríamos sería declarar la clase también como falta vale como último paso de esta estrategia vamos a ver un ejemplo de una persona que sería inmutable como podemos comprobar seguimos los tres pasos que hemos dicho al declarar los atributos como final y privado vale solamente podrán ser modificado desde la construcción del objeto solamente en esa inicializacion para que no pudiera ver algún problema con pasar en los constructores un objeto que pudiéramos modificar desde fuera y así también se modificará bueno pues también podríamos indicar que estos objetos pesen final para que la referencia no cambie de fuera y la clase también sería también sería como como podemos comprobar no tenemos otra forma de modificar las propiedades solamente podríamos acceder a ella para hacer una lectura no de manera que si quedamos una persona inmutable le podemos proporcionar los datos a la hora distanciando pero después no podemos modificar con esto tendríamos objetos inmutables que en ocasiones también no será con los objetos inmutable y el patrón Singleton terminamos este primer bloque en el que hemos diseñado clase en Java en el próximo vídeo comenzaremos con el segundo bloque en el que haremos un diseño a Lanzarote


## Contenido adicional 10   

[Presentación](pdfs/Presentación.pdf)

[Implementación de la encapsulación](pdfs/01_Implementación_de_la_encapsulación.pdf)

[Herencia](pdfs/02_Herencia.pdf)

[Polimorfismo](pdfs/03_Polimorfismo.pdf)

[Sobreescribir los métodos hashcode, equals y to string de la clase object](pdfs/04_Equals_hashCode_y_toString.pdf)

[Uso del ámbito static para variables, métodos y clases](pdfs/05_Uso_de_static.pdf)

[Clases singleton y clases de inmutables](pdfs/06_Singleton_e_inmutables.pdf)
