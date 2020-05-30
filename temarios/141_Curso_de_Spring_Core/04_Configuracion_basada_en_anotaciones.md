# 4. Configuración basada en anotaciones 38m

* Uso de @Required 8:58 
* Uso de @Autowired 10:58 
* Uso de Primary y @Qualifier 7:04 
* Uso de @PostConstruct y @PreDestroy 3:28 
* Uso de estereotipos 7:51 
* Contenido adicional  5

# 13 Uso de @Required 8:58 

[PDF 4-1_Configuracion_a_traves_de_anotaciones_Required.pdf](pdfs/4-1_Configuracion_a_traves_de_anotaciones_Required.pdf)

## Resumen Profesor

### Configuración vía XML vs vía anotaciones

#### ¿Las anotaciones son mejores que XML para configurar Spring??

La introducción de la configuración basada en anotaciones planteó la pregunta de si este enfoque es “mejor” que XML. La respuesta corta es que **depende**. La respuesta larga es que cada enfoque tiene sus pros y sus contras, y generalmente le corresponde al desarrollador decidir qué estrategia le conviene más. Debido a la forma en que se definen, las anotaciones proporcionan *mucha información* en su declaración, lo que lleva a una configuración más breve y concisa. Sin embargo, XML se destaca en el *cableado* de componentes sin tocar su código fuente o recompilarlos. Algunos desarrolladores prefieren tener el *cableado* cerca del código fuente, mientras que otros argumentan que las clases anotadas ya no son **POJO (Plain Old Java Object)** y, además, que la configuración se vuelve descentralizada y más difícil de controlar.

No importa la elección, Spring puede acomodar ambos estilos e incluso mezclarlos. Vale la pena señalar que a través de su opción JavaConfig, Spring permite que las anotaciones se utilicen de forma no invasiva, sin tocar el código fuente de los componentes objetivo.

*La inyección por anotación se realiza antes de la inyección de XML, por lo tanto, la última configuración anulará la anterior para las propiedades inyectadas a través de ambos enfoques.*

## Transcripción

<img src="images/13-01.png">

<img src="images/13-02.png">

<img src="images/13-03.png">

Acción a través de anotaciones hemos comprobado al principio de curso como la configuración de examen de información que nosotros tenemos que proporcionar la podíamos hacer mediante varios días hasta ahora hemos venido utilizando la configuración única y exclusiva a través de un escritor XML sin embargo vamos a aprender tenemos a nuestra disposición una serie de anotacionesla configuración estaría más cerca del código es decir que podemos aplicar un principio de localidad es decir tener más Junta acerca de la configuración de donde la vayamos a utilizar es una ocasiones puede ser una ventaja más cerca significan más acoplada en decir que para poder cambiar la configuración de alguna clase tenemos que tocar su código fuente y no un fichero externo la configuración de anotación en la tenemos disponible desde la version 2.5 y como decía veremos a partir de televisión y en las sucesivas como algo de configuración mínima XML vamos a necesitar cada vez necesitaremos menos pero algo de configuración mínima necesitaremos jazz en XML 47 ábaco cómo hablar antes de lo que es el concepto de ping pong proceso porque vamos a utilizarlo y cómo lo vamos a utilizar para estaría bien que lo conozcamos esta utilización sea a través de una notación nosotros permite extender el manejo del contenedor de inversión de control y lo hace a través de la interfaz beanpostprocessor que nos va a permitir nosotros cómo se gestiona la distancia entre vins la configuración de inyección de dependencia todo eso apartados y de hecho nosotros podemos quedar cuántos procesadores necesitamos que se podrá ir aplicando todo y cada uno de ellos en el ámbito de actuación que necesite ya nos define algunos que son útiles y que nosotros vamos a utilizar para poder usarla anotaciones uno de ellos es en autowey annotation bean proceso que permitirá utilizar la inyección automática a través de la anotaciones autoway o de la anotación oficial de Java inject vale y también la inyección de valores con jabalí otro sería el recuento annotationdbi proceso que nos va a permitir utilizar la notación a rodar request el como annotation bean post processor que nos permite utilizar la unidad SR250 como por ejemplo o bastante más procesos pero estos son algunos de ellos para que nosotros podamos utilizar la configuración a través de anotaciones tendríamos que declarar vale referencia de shopkins en nuestra configuración acordarse de esos nombres tan largos de clase buscar el paquete en el que se encuentra un poco de ser algo tedioso sin embargo nosotros lo podemos hacer añadiendo una anotación especial a nuestro fichero XML de que utilicemos damos un nuevo espacio de nombres a nuestro beans.xml vale anotaciones context 2 puntos annotation-config vale y declarando hecho nada más se va a encargar de registrar los procesos necesarios para que nosotros podamos trabajar con la natación como podemos comprobar estoy francamente como mucho más que si nosotros tuviéramos que que registrar pues todos los primeros procesos necesarios para poder trabajar con la natación cómo añadir está nota cine sencillo vale tenemos aquí añadido este nuevo espacio de nombres context y no tendríamos que hacer muchas más cosas en este caso pues el resto de elementos del ejemplo lo tenemos que declarar vía XML vale lo vamos a utilizar esto sería una aplicación muy sencilla sobre películas vale un título años y manejadas por un lado vale también muy sencillo con una implementación también memoria muy sencilla y con unos datos de ejemplo vale esto ya nos permitiría que comenzamos a trabajar con anotaciones la primera que vamos a aprender a usar es recuerda está notación tiene una utilización básica y es que nos permite indicar que una inyección se tiene que realizar que no podemos dejar esa dependencia no satisfecha no implica que nosotros hagamos esa inyección por varias vías en este caso lo vamos a hacer vía autowire vale con configuración XML qué sucede si no se satisface esta dependencia se va a producir una excepción esto nos permite evitar errores de excepción porque esta sesión se va a producir a lo largo de la carga del contenedor sino de la ejecución del programa vale esto nos permite prevenir posibles errores que vayamos a tener con objetos que sean críticos y que necesiten dependencias que estén totalmente satisfecha en ese momento la utilización sería muy sencilla en el INEM película service qué es el que nos va a permitir interactuar con película dado y que me este caso no es capaz de devolvernos las películas por género tenemos como dependencia película dado la dependencia la podemos asociar o incluso podríamos hacer a la misma propiedad de manera que si no hacemos esa referencia entre los mismos pues nos dará un error vamos a comprobar como auto inyección cómo mola tener comprobar cómo ha sucedido un error de inicializacion bueno pues no tuviéramos este mail cómo lo que sucede realmente sería un error de tipo NullPointerException de esta manera fue lo estamos evitando de alguna manera añadimos aquí el autobús aplicación tiene que servir para mostrarnos todas las películas del género drama que hemos definido dentro de nuestro almacén dentro de los programas que tenemos la lista de schindler en Madrid de esta manera la anotación request obligada a que está dependencia este satisfecha vamos a terminar ahora este vídeo para poder seguir en los siguientes con alguna anotaciones más que nos van a ir permitiendo configurar mejor Machu Picchu


<img src="images/13-04.png">

<img src="images/13-05.png">

<img src="images/13-06.png">

<img src="images/13-07.png">

<img src="images/13-08.png">

<img src="images/13-09.png">

# 14 Uso de @Autowired 10:58 

[PDF 4-2_Uso_de_Autowired.pdf](pdfs/4-2_Uso_de_Autowired.pdf)

## Resumen Profesor

### Autowired

La especificación JSR 330 de Java define un conjunto de anotaciones *estándar* para la inyección de dependencias. **En nuestro caso, estamos usando las anotaciones propias de Spring, pero podríamos usar perfectamente las estándar con el mismo comportamiento.**

Para usar las dependencias estándar, necesitamos añadir la siguiente dependencia Maven:

```html
<dependency>
    <groupId>javax.inject</groupId>
    <artifactId>javax.inject</artifactId>
    <version>1</version>
</dependency>
```

En lugar de usar `@Autowired`, podríamos usar la anotación `@Inject`:

```java
import javax.inject.Inject;

public class SimpleMovieLister {

    private MovieFinder movieFinder;

    @Inject
    public void setMovieFinder(MovieFinder movieFinder) {
        this.movieFinder = movieFinder;
    }

    public void listMovies() {
        this.movieFinder.findMovies(...);
        ...
    }
}
```

## Transcripción

<img src="images/14-01.png">

<img src="images/14-02.png">

<img src="images/14-03.png">

<img src="images/14-04.png">

<img src="images/14-05.png">

<img src="images/14-06.png">

<img src="images/14-07.png">


# 15 Uso de Primary y @Qualifier 7:04 

[PDF 4-3_Uso_de_Primary_y_Qualifier.pdf](pdfs/4-3_Uso_de_Primary_y_Qualifier.pdf)

## Resumen Profesor

### Anotaciones estándar

Al igual que en la lección anterior, podemos utilizar las anotaciones estándar para *calificar* o *nombrar* un bean. Tenemos disponibles las anotaciones estándar

* `@Qualifier`: sirve para asignar un nombre a un bean
* `@Named`: sería la equivalente al uso de la anotación de Spring @Qualifier.

### Extendiendo la anotación `@Qualifier`

Para extender la anotación @Qualifier debemos crear un interfaz como este:

```java
@Target({ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Qualifier
public @interface Epoca {

    String value();

}
```

De esta forma, allá donde se pueda usar `@Qualifier`, podremos usar nuestra anotación (en el ejemplo, `@Epoca`).

Aunque la creación de anotaciones propias (en general) queda fuera del ámbito de este curso, puedes consultar la siguiente documentación oficial de Oracle: https://docs.oracle.com/javase/tutorial/java/annotations/declaring.html

## Transcripción

<img src="images/15-01.png">

<img src="images/15-02.png">

<img src="images/15-03.png">

<img src="images/15-04.png">

<img src="images/15-05.png">

<img src="images/15-06.png">

<img src="images/15-07.png">

<img src="images/15-08.png">

<img src="images/15-09.png">

# 16 Uso de @PostConstruct y @PreDestroy 3:28 

[PDF 4-4_PostConstruct_y_PreDestroy.pdf](pdfs/4-4_PostConstruct_y_PreDestroy.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/16-01.png">

<img src="images/16-02.png">

<img src="images/16-03.png">

# 17 Uso de estereotipos 7:51 

[PDF 4-5_Uso_de_estereotipos.pdf](pdfs/4-5_Uso_de_estereotipos.pdf)

## Resumen Profesor

### Filtrado en el escaneo automático de componentes

Por defecto, cuando utilizamos el escaneo automático de componentes, Spring buscará dentro del paquete base (y sus subpaquetes), todas las clases anotadas con algún tipo de estereotipo y las incluirá. En el caso de que solo queramos seleccionar algunas, podemos utilizar el filtrado. Este filtrado puede ser inclusivo o exclusivo, y lo usual es que indiquemos algún tipo de anotación sobre la que filtrar, o una expresión regular sobre el nombre de las clases:

A continuación tenemos un ejemplo:

```html
<beans>
    <context:component-scan base-package="org.example">
        <context:include-filter type="regex"
                expression=".*Service.*Repository"/>
        <context:exclude-filter type="annotation"
                expression="org.springframework.stereotype.Controller"/>
    </context:component-scan>
</beans>
```

## Transcripción

<img src="images/17-01.png">

<img src="images/17-02.png">

<img src="images/17-03.png">

<img src="images/17-04.png">

<img src="images/17-05.png">

<img src="images/17-06.png">

<img src="images/17-07.png">


# Contenido adicional  5

* [PDF 4-1_Configuracion_a_traves_de_anotaciones_Required.pdf](pdfs/4-1_Configuracion_a_traves_de_anotaciones_Required.pdf)
* [PDF 4-2_Uso_de_Autowired.pdf](pdfs/4-2_Uso_de_Autowired.pdf)
* [PDF 4-3_Uso_de_Primary_y_Qualifier.pdf](pdfs/4-3_Uso_de_Primary_y_Qualifier.pdf)
* [PDF 4-4_PostConstruct_y_PreDestroy.pdf](pdfs/4-4_PostConstruct_y_PreDestroy.pdf)
* [PDF 4-5_Uso_de_estereotipos.pdf](pdfs/4-5_Uso_de_estereotipos.pdf)
