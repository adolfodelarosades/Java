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

# 16 Uso de @PostConstruct y @PreDestroy 3:28 

[PDF 4-4_PostConstruct_y_PreDestroy.pdf](pdfs/4-4_PostConstruct_y_PreDestroy.pdf)

## Resumen Profesor

No existe.

## Transcripción

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

# Contenido adicional  5

* [PDF 4-1_Configuracion_a_traves_de_anotaciones_Required.pdf](pdfs/4-1_Configuracion_a_traves_de_anotaciones_Required.pdf)
* [PDF 4-2_Uso_de_Autowired.pdf](pdfs/4-2_Uso_de_Autowired.pdf)
* [PDF 4-3_Uso_de_Primary_y_Qualifier.pdf](pdfs/4-3_Uso_de_Primary_y_Qualifier.pdf)
* [PDF 4-4_PostConstruct_y_PreDestroy.pdf](pdfs/4-4_PostConstruct_y_PreDestroy.pdf)
* [PDF 4-5_Uso_de_estereotipos.pdf](pdfs/4-5_Uso_de_estereotipos.pdf)
