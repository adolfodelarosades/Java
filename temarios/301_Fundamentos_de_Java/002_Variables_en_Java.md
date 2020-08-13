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

Hola y bienvenidos a esta lección.

A continuación vamos a ver el uso de la palabra reservada `var` en Java están listos? Vamos. 

Continuando con nuestro ejercicio, 

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

Hemos visto cómo definir una variable utilizando un tipo de dato, posteriormente el identificador o nombre de la variable y asignándole un valor. Este valor se va a conocer como una **literal** y en este caso las literales numéricas en Java van a ser de tipo `int`.

Así que no solamente la variable va a tener un tipo, sino también las literales es decir, los valores que asignamos a nuestras variables también van a tener un tipo en Java, así que cualquier tipo numérico que no tenga punto flotante va a ser de tipo `int`. Por ejemplo, en este caso 10 y 5 son de tipo `int`.

Y una literal de tipo cadena en automático su tipo va a ser de tipo `String`. 

Ahora, por qué les comento esto?

Porque **a partir de la versión 10 de Java podemos utilizar la palabra reservada `var`** en lugar de utilizar el tipo de dato definido, podemos simplemente poner `var` para que Java infiera el tipo de dato que estamos utilizando, pero **el tipo de dato lo va a inferir a partir de la literal que estamos utilizando**.

Recuerden que la literal es de tipo entero en este caso de 5 y 10, ya que es un número sin punto flotante y en caso de "Saludo" la literal es de tipo `String` debido a que estamos utilizando comillas dobles.

Ahora vamos a ver cómo utilizar `var`, `var` va a hacer inferencia de tipos en Java, a partir del valor que le vamos a asignar de nuestra literal, así que para definir una variable de tipo entero, en lugar de utilizar `int` por ejemplo:

```java
int miVariableEntera2 = 10;
```

En lugar de hacerlo así, podemos sino poner ahora la palabra reservada `var`.

```java
//var - Inferencia de tipos en Java
var miVariableEntera2 = 10;
```

Y con esto vamos a lograr varias cosas, pero básicamente nuestro código se va a simplificar debido

a que vamos a utilizar tipos de datos mucho más complejos y simplemente utilizando Baur en automático,

Java va a inferir el tipo de dato según el valor que le estemos asignando del lado derecho.

Así que según el valor que asignemos en este caso puede ser una literal, pero más adelante vamos a

ver que le podemos asignar referencias de objetos y aquí es en el tema de la inferencia de tipos va

a ser mucho más poderoso.

En este caso es más simple debido a que la literal 10 es de tipo entero, según hemos comentado.

Por lo tanto, la variable que estamos definiendo mi variable enterados también va a ser de tipo entero.

Vamos a imprimir ahora esta variable, ese tabulador.

Ponemos las primeras letras de nuestra variable y posteriormente control espacio para que nos dé la

ayuda y seleccionamos la variable mi variable.

Enterados.

Ya estamos utilizando el valor de 10, por lo tanto vamos a usar uno distinto, por ejemplo el valor

de 15 para que veamos el nuevo valor en guardamos cambios y ejecutamos.

Y podemos llevar el nuevo valor de nuestra variable, el valor de 15.

Así que está funcionando sin ningún problema.

En dado caso de que el uso de bar no funcione en su programa, deben de revisar que en su proyecto tengan

la última versión del JDK.

Puede ser una versión 10 o superior.

Por ejemplo, en este caso damos clic derecho propiedades y aquí, en el icono de Sources podemos observar

aquí una parte inferior que estamos seleccionando el JDK 14, que es la última versión que tenemos al

día de hoy.

Si tienen una versión más reciente no hay ningún problema.

Pueden seleccionarla, pero pueden observar que su proyecto lo pueden poner a cualquier otra versión.

Pero en este caso, a partir de la versión 10 es cuando se introdujo el concepto de variables inferencia

de tipos.

Y también aquí en la sección de Libraries deben de verificar que estén seleccionando el JDK 14.

De lo contrario no va a funcionar correctamente su programa, ya que no va a reconocer el uso de.

Así que el uso de barcos va a simplificar la definición de variables.

Sin embargo, todo el poder del uso de bar lo vamos a ver más adelante, cuando ya estudiamos el tema

de objetos, en el cual vamos a poder crear nuestros propios tipos de datos utilizando clases en Java.

Bien les dejamos como ejercicio ahora definir una variable de tipo cadena llamada Mi Variable Cadena

2 y mandan a imprimir esta nueva variable, pero ya no van a utilizar el tipo string, sino van a utilizar

el tipo de dato VAR.

Les damos unos segundos y continuamos.

Bien, si ya lo realizaron, vamos a comprobar la solución.

Vamos a definir nuestra variable de tipo string, pero podemos observar que ya no es necesario utilizar

el tipo de dato string, sino que lo vamos a inferir a partir del valor que le vamos a asignar.

Por ejemplo, en este caso utilizamos Baur, mi variable.

Cadena 2 y le asignamos un valor, este valor va a ser una literal de tipo cadena.

Y le asignamos cualquier valor, por ejemplo, nueva cadena para mandar a imprimir directamente el valor

de la variable en lugar de ese otro.

Podemos aceptar que no nos muestra el valor de la variable, pero para mandar a imprimir el valor de

la variable voy a presionar control Z.

Para quitar este código y posteriormente en lugar de otro, voy a poner ese hobby, es otro atajo muy

común también que podemos utilizar para imprimir el valor de nuestra variable.

Así que ponemos ese bi de variable, presionamos la tecla de tabulador y podemos se va que nos va a

mandar a imprimir.

La última variable que hemos definido en este caso nos va a mandar el texto mi variable y posteriormente

va a imprimir el valor de la variable mi carenados.

Posteriormente vamos a ver este concepto que se conoce como concatenación de cadenas.

Podemos se va que en este caso para unir dos cadenas ya utiliza el operador de más.

Así que no solamente el operador de más se puede utilizar para sumar números.

Como vamos a ver más adelante, sino que en este caso también lo vamos a utilizar para unir cadenas.

A este concepto se le conoce como concatenación de cadenas y esto lo vamos a ver al detalle más adelante.

Pero pueden observar que en este momento ya estamos uniendo la cadena, que es el texto de mi variable

dos, el símbolo de igual.

Esto es simplemente un texto y del lado derecho, con el símbolo de más, unimos el valor de nuestra

variable, en este caso el valor de la variable cadena 2.

Bien, vamos a guardar cambios, ejecutamos.

Y podemos observar ahora el valor de nuestra variable primero el texto mi variable cadena 2 igual y

se imprime el valor de nuestra variable.

Todo esto lo podemos hacer en las impresiones anteriores de las variables para que sepamos cuál es el

valor de la variable que estamos imprimiendo.

Por qué en este caso ya no sabemos cuál es la variable que tiene este valor.

Por lo tanto, es recomendable que mandemos a imprimir el nombre de la variable y posteriormente su

valor.

Simplemente es una práctica común.

Y para ello nos va a servir entonces el atajo de ese automóvil.

Así que ponemos ese bi tabulador.

Y Podemos va, que nos imprime el valor de nuestra variable, incluyendo el nombre de la variable en

texto.

Así que esperemos que hayan llegado a la misma solución, en este caso solamente con la diferencia de

que estamos agregando el nombre de nuestra variable.

Y en conclusión, si están utilizando una versión del JDK anterior a la versión 10, entonces tienen

que indicar el tipo de dato.

Por ejemplo, en este caso que es de tipo int, que es de tipo string, etc. pero si están trabajando

con una versión de JDK superior a la versión 10, entonces pueden utilizar el tipo bar para la inferencia

de tipos y el tipo se va a inferir a partir del valor que le estamos asignando.

Más adelante vamos a ver qué restricciones existen respecto al uso de bar, pero en resumen podríamos

decir que sí van a definir una variable dentro de un método.

Por ejemplo, en este caso dentro del método Domaine lo van a poder utilizar sin problema, pero si

ya están fuera de un método, entonces ya no pueden utilizar bahr.

Así que es parte de las restricciones que vamos a ir estudiando poco a poco.

Es todo por este video y nos vemos en la siguiente elección.

Saludos.

# 009 Ejercicio: Reglas para definir una variable en Java - 04:03
# 010 Ejercicio: Concatenación con Java - 11:46
# 011 Ejercicio: Caracteres Especiales con Java - 08:31
# 012 Ejercicio: Clase Scanner en Java - 07:58
# 013 Preguntas de Variables - 5 preguntas
# Detalles Libro - 1 preguntas
# Detalles Libro (Solución) - 00:09
