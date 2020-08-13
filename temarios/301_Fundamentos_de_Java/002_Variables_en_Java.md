# 002 Variables en Java • 8 clases • 55 min

* 006 Variables en Java - 05:03
* 007 Tipos Enteros y Tipo String en Java - 09:07
* 008 Inferencia de Tipos en Java - 08:21
* 009 Ejercicio: Reglas para definir una variable en Java - 04:03
* 010 Ejercicio: Concatenación con Java - 11:46
* 011 Ejercicio: Caracteres Especiales con Java - 08:31
* 012 Ejercicio: Clase Scanner en Java - 07:58
* 013 Preguntas de Variables - 5 preguntas
* Detalles Libro - 1 preguntas
* Detalles Libro (Solución) - 00:09


# 006 Variables en Java - 05:03

## [Resumen Profesor](/temarios/301_Fundamentos_de_Java/pdfs/006-CFJ-A-Leccion-Variables.pdf)


## Transcripción

Hola, que tal y bienvenidos a esta lección. A continuación van a estudiar el tema de variables en Java, están listos? Vamos.

![06-01](images/06-01-1.png)

Bien, como podemos ver en la figura, una variable nos va a permitir almacenar información. Esta información van a ser los datos que vamos a procesar con este programa, así que estos datos van a variar según la información que estemos recibiendo por parte del usuario o del tipo de información que estemos procesando.

Una variable va a tener un identificador y va a almacenar entonces un valor, pero este valor que va a almacenar puede cambiar al pasar el tiempo. Así que precisamente su nombre de variable, debido a que el valor que almacena puede modificarse al pasar el tiempo al ejecutarse nuestro programa. Ahora nuestras variables pueden almacenar diferentes tipos de datos, por ejemplo, tenemos datos como pueden ser números, también pueden ser textos o cadenas, o también pueden ser referencias a objetos.

Esto lo vamos a ver más adelante y en estas primeras lecciones vamos a comenzar con dos tipos.

![06-02](images/06-02-1.png)

En Java existen diferentes tipos de datos, pero en esta lección vamos a comenzar con lo que se conoce

como tipos primitivos.

Por ejemplo, en este caso tenemos los tipos primitivos de tipo entero y también los tipos primitivos de tipo flotante, así que son los tipos con los que vamos a empezar. Sin embargo, también existe un tipo especial en Java que se conoce como `String` y nos va a permitir manejar las cadenas que vamos a trabajar en Java. Esto ya lo trabajamos en nuestra primera lección, pero en esta lección vamos a ir profundizando más en ese tipo de dato que es una cadena y esto lo vamos a conocer como un *tipo referenciado*. Sin embargo, esto lo vamos a ver a detalle en clases posteriores. Pero la clasificación de tipos referenciados va a ser *clases*, *interfaces* y *arreglos*. Todo eso lo vamos a ver a detalle posteriormente. Así que tengan paciencia.

De momento vamos a trabajar con los tipos primitivos, *enteros* y *flotantes*, y también respecto de los tipos referenciados, como hemos comentado vamos a trabajar con el tipo `String` o cadena.

Así que vamos a empezar nuestra lección, lo que van a hacer es abrir su IDE de NetBeans.

Recordemos que el método `main` nos va a permitir ejecutar nuestro programa, así que de momento vamos a entender que este método únicamente lo estamos utilizando para poder ejecutar las líneas de código que están contenidas dentro de este método `main`.

Para definir una variable existen diferentes reglas, *primero tenemos que especificar el tipo en Java que vamos a utilizar* por ejemplo, podemos definir una variable primitiva de tipo entero, `int` es la palabra reservada que vamos a utilizar para definir una variable de tipo entero y posteriormente utilizamos un identificador, es decir, el nombre de la variable por ejemplo, `miVariableEntera`.  

```java
int miVariableEntera = 10;
```

Podemos observar que el nombre de la variable inicia con minúscula y posteriormente, si tenemos más de una palabra, entonces se recomienda utilizar la primera letra en mayúscula, por ejemplo, la palabra variable, la V que es la primer letra de esta palabra inicia mayúscula y también la E inicia con mayúscula.

A este tipo de notación se le conoce como **notación de camello o notación de altas y bajas**, y se conoce así debido a la forma que se genera. Como podemos observar de altas y bajas o notación de camello.

Así que eso es lo más común que vamos a encontrar cuando trabajamos en Java, incluso es una buena práctica, por lo tanto, es recomendable que nos empecemos a familiarizar con esto desde un inicio.

Podemos ver que **la variable inicia con letra minúscula** y posteriormente, después de definir la variable y su tipo, vamos a asignarle un valor para poder asignar un valor vamos a utilizar el operador de igual, es decir, el operador de asignación y le podemos asignar cualquier valor, por ejemplo, el valor de 10 y como es una línea de código en Java, debe determinar con punto y coma. Así que todas las líneas en Java terminan con punto y coma. 

Ahora lo que vamos a hacer es imprimir el valor de esta variable.

```java
int miVariableEntera = 10;
System.out.println(miVariableentera);
```

Guardamos cambios, ya sea presionando este icono o presionando la combinación de teclas CTRL+S. Bien guardamos cambios y ejecutamos, **para ejecutar** vamos a dar clic derecho sobre nuestro archivo y seleccionamos la opción de ***Run File***.

### :computer: `006-VariablesJava`

*`Variables`*
```java
//Variables Java
public class Variables {
   public static void main(String arg[]){
      int miVariableEntera = 10;
      System.out.println(miVariableEntera);
   }
}
```

![06-03](images/06-01-3.png)

Y podemos observar que nos despliega el valor de 10.

Así que con esto ya estamos declarando nuestra variable, la estamos mandando a imprimir y obtenemos el resultado de 10.

Eso es todo en esta lección y en las siguientes lecciones vamos a continuar con el tema de variables en Java. Nos vemos en la siguiente lección. Saludos.

# 007 Tipos Enteros y Tipo String en Java - 09:07
# 008 Inferencia de Tipos en Java - 08:21
# 009 Ejercicio: Reglas para definir una variable en Java - 04:03
# 010 Ejercicio: Concatenación con Java - 11:46
# 011 Ejercicio: Caracteres Especiales con Java - 08:31
# 012 Ejercicio: Clase Scanner en Java - 07:58
# 013 Preguntas de Variables - 5 preguntas
# Detalles Libro - 1 preguntas
# Detalles Libro (Solución) - 00:09
