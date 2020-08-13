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
System.out.println(miVariableEntera);
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

![06-03](images/06-03.png)

Y podemos observar que nos despliega el valor de 10.

Así que con esto ya estamos declarando nuestra variable, la estamos mandando a imprimir y obtenemos el resultado de 10.

Eso es todo en esta lección y en las siguientes lecciones vamos a continuar con el tema de variables en Java. Nos vemos en la siguiente lección. Saludos.

# 007 Tipos Enteros y Tipo String en Java - 09:07

Bien, vamos a continuar con la selección de variables. Ya hemos definido nuestra variable entera. Ahora una de las ventajas de haber definido esta variable es que la podemos utilizar a lo largo del programa y cambiar su valor conforme lo necesitemos. 

Por ejemplo, si escribimos de nueva cuenta el nombre de nuestra variable `miVariableEntera`, recuerden que debemos de respetar mayúsculas y minúsculas. Así es el lenguaje de Java es sensible a mayúsculas y minúsculas, por lo tanto, cualquier diferencia no va a reconocer el nombre de su variable. Ahora lo que podemos hacer es asignarle un nuevo valor, por ejemplo, el valor de 5, y podemos saber que esta variable ya fue definida debido a que ya no estamos indicando el tipo de dato. Una vez que vamos a utilizar nuestra variable, una vez que ya fue definida, ya no es necesario volver a especificar el tipo de dato. De hecho, si lo hacemos, el compilador nos va a decir que esta variable ya fue definida. Según podemos ver, el mensaje que nos manda nos indica que esta variable ya fue definida dentro de nuestro programa, así que no podemos volver a definir una variable que ya ha sido definida anteriormente.

```java
//Modificamos el valor de la variable
miVariableEntera = 5;
```

Así que en esta línea, lo que estamos haciendo es modificando el valor de nuestra variable. Ahora vamos a imprimir este valor, podemos volver a escribir `System.out.println` o podemos utilizar un atajo que nos brinda NetBeans, este tipo de atajos existe en la mayoría de los IDEs en la mayoría de las herramientas para trabajar con Java, así que cualquier duda pueden revisar la documentación del IDE que estén utilizando, pero en este caso con Apache NetBeans vamos a escribir **`sout`** y posteriormente presionamos la tecla de tabulador, y podemos observar que nos complementa en automático esta línea de código `System.out.println` y con esto se manda llamar el método para imprimir a consola. Debido a que en este caso no vamos a imprimir una cadena, un texto, podemos quitar la doble comilla y podemos imprimir de nueva cuenta solamente el valor de nuestra variable. Por ejemplo.

```java
//Modificamos el valor de la variable
miVariableEntera = 5;
System.out.println(miVariableEntera);
```

Guardamos cambios presionando CTRL+S, recuerden que con cada cambio en su código deben de guardar estos cambios, ya sea presionando el icono de los discos o presionando CTRL+S, incluso pueden observar que en este momento ya se ha guardado el código debido a que ya está en gris, ya fueron guardados todos los cambios. Bien guardamos cambios, ejecutamos, damos clic derecho Run File. Y podemos observar que en primer lugar mandamos a imprimir el valor de la variable entera con el valor de 10 y posteriormente mandamos a imprimir este mismo valor con el valor de 5.

![07-01](images/07-01.png)

Así que de esta manera estamos definiendo una variable y su primer valor es el valor de 10 y posteriormente modificamos esta variable y le asignamos el valor de 5. Volvemos a imprimir esta variable y entonces observamos ahora el nuevo valor.

Así que ese es el concepto básico de nuestras variables en Java vamos a poder definir una variable y 
reutilizarla a lo largo de nuestro programa. Sin embargo, el uso de las variables tiene restricciones. Más adelante vamos a ver a detalle el tema de métodos y una variable que fue definida dentro de un método, por ejemplo, en este caso dentro del método `main` no va a poder ser utilizada fuera de este método.

A esto se le va conocer como el **alcance de una variable**, pero esto lo vamos a ver más adelante, simplemente para que sepan que existen también restricciones cuando estamos trabajando con nuestras variables, así que no la podemos acceder en cualquier parte de nuestro programa, sino que dependiendo donde sea definido esta variable va a ser en los lugares donde podemos utilizar esta variable.

Bien, por último, vamos a utilizar ahora el tipo `String` para definir una variable de tipo `String` vamos a hacer lo siguiente, vamos a utilizar el tipo de dato `String`, podemos observar que es con S mayúscula, debido a que no es un tipo primitivo, sino es una clase de Java.

Todo eso lo vamos a ver más adelante, pero tenemos que adelantar el uso de la clase `String` debido a que va a ser uno de los tipos más utilizados y posteriormente vamos a ver a detalle qué significa esto del uso de clases, cómo crearlas y cómo crear objetos de una clase.

Así que ponemos el tipo `String`, el cual ya podemos utilizar por default en Java y ahora agregamos el identificador, por ejemplo, `miVariableCadena`, puede ser cualquier otro nombre, en este caso simplemente estamos poniendo un nombre muy explícito para que sepamos qué valor va a almacenar esta variable y le asignamos un valor, los valores de las cadenas, vamos a asignarle el valor utilizando doble comillas, así que le podemos poner un primer valor y como es una línea de código en Java es una nueva línea de código, terminamos con punto y coma. Vamos a imprimir el valor de esta variable, así que ponemos `sout` y tabulador e imprimimos el valor de nuestra variable.

Para que nos ayude el IDE para desplegar las variables que tenemos definidas en nuestro programa podemos presionar `mi` y la combinación de teclas CTRL + ESPACIO. Así que si presionamos CTRL + ESPACIO podemos observar que nos muestren las variables que hemos definido, `miVariableCadena` y `miVariableEntera`. En este caso queremos mandar imprimir `miVariableCadena` así que seleccionamos esta variable y damos ENTER.

```java
String miVariableCadena = "Saludos";
System.out.println(miVariableCadena);
```

Guardamos cambios con CTRL+S y ejecutamos nuestro programa Click Derecho Run File.

![07-02](images/07-02.png)

Y podemos observar ahora que se está desplegando el valor de nuestra variable, el valor de `Saludos`. Ahora se les vea como ejercicio volver a utilizar esta variable, pero ahora asignarle el valor de `Adiós` y posteriormente, una vez modificado el valor de esta variable, manden imprimir nuevamente. Les vamos a dar unos segundos para que realicen este ejercicio y vamos a continuar.

Bien, si ya lo hicieron, vamos a hacer lo siguiente, entonces vamos a ver la solución, vamos a utilizar nuestra variable `miVariableCadena`, recuerden que ya no es necesario poner el tipo de dato, solamente el nombre de nuestra variable, `miVariableCadena` a ahora le vamos a asignar otro valor por ejemplo, el valor de `Adiós`, punto y coma y mandamos a imprimir de nueva cuenta. Recuerden respetar mayúsculas y minúsculas.

```java
miVariableCadena = "Adiós";
System.out.println(miVariableCadena);
```

Por ejemplo, en este caso, si pongo minúscula, nos manda un error indicando que no reconoce el símbolo ni variable `miVariablecadena` debido a que la C debe de ser mayúscula. Así que corregimos con mayúscula y entonces ya no reconoce la variable.

Incluso si damos CTRL+CLIC sobre esta variable nos lleva a la definición, a la línea de código donde se definió esta variable y así cualquier otra variable. Por ejemplo, en este caso de `miVariableEntera`, si presiono CTRL+CLIC me lleva a la definición de esta variable. Esto quiere decir que nuestro IDE el compilador está reconociendo donde se está definiendo esta variable.

Así que con eso ya tenemos nuestro código, guardamos cambios y ejecutamos.

![07-03](images/07-03.png)

Y podemos observar ahora el nuevo valor de la variable `miVariablecadena` se está mostrando el valor de `Adiós`. 

Así que con esto hemos revisado más temas respecto al uso de variables en Java hemos visto el tipo primitivo `int` el cual nos va a servir para asignar números y el tipo de `String` que nos va a permitir asignar cadenas. Así que hasta el momento hemos visto estos dos tipos de datos conforme avancemos vamos a ver más tipos de datos, pero de momento son es más básicos que vamos a empezar a trabajar números y textos, así que eso es suficiente para comenzar a trabajar con Java.

Ahora, si observan, yo estoy ocultando y mostrando la consola, esta consola pueden dejarla fija en su IDE o en este caso yo la estoy ocultando para que puedan visualizar el código, pero en dado caso de que se oculte y ya nos esté mostrando para que la puedan mostrar de nueva cuenta sin problema, van a la *opción de Windows y posteriormente dan CLIC en Reset Windows* y esto va a restablecer todas las ventanas de su IDE, así que vamos a dar clic. Y con eso se debe de haber restablecido las ventanas, en dado caso de que aún así todavía no se visualice la opción de Outputs o la ventana que están buscando, pueden ir de nueva cuenta a la opción de Windows y, por ejemplo, en este caso, habilitar la opción de Output y pueden observar de nueva cuenta la consola.

Así que todas las ventanas internas del IDE aquí en la opción de Windows pueden revisar todas las opciones que se tienen porque aquí se habilitan o deshabilitar estas opciones.

![07-04](images/07-04.png)

Así que prueben hasta aquí y confirmen que no tengan ningún problema con la ejecución de su código.

### :computer: `007-VariablesJava`

*`Variables`*
```java
//Variables Java
public class Variables {
   public static void main(String arg[]){
      //Definimos la variable
      int miVariableEntera = 10;
      System.out.println(miVariableEntera);
        
      //Modificamos el valor de la variable
      miVariableEntera = 5;
      System.out.println(miVariableEntera);
        
      String miVariableCadena = "Saludos";
      System.out.println(miVariableCadena);
        
      miVariableCadena = "Adiós";
      System.out.println(miVariableCadena);
    }
}

```

![07-05](images/07-05.png)

Es todo por esta lección y nos vemos en la siguiente lección. Saludos!


# 008 Inferencia de Tipos en Java - 08:21
# 009 Ejercicio: Reglas para definir una variable en Java - 04:03
# 010 Ejercicio: Concatenación con Java - 11:46
# 011 Ejercicio: Caracteres Especiales con Java - 08:31
# 012 Ejercicio: Clase Scanner en Java - 07:58
# 013 Preguntas de Variables - 5 preguntas
# Detalles Libro - 1 preguntas
# Detalles Libro (Solución) - 00:09
