# 2. Tipos de datos, operadores y estructuras de control 110m

   * 05 Variables 16:58 
   * 06 Manipulación de números, caracteres y otros valores I 8:28 
   * 06 Manipulación de números, caracteres y otros valores II 15:39 
   * 06 Manipulación de números, caracteres y otros valores III 8:13 
   * 06 Manipulación de números, caracteres y otros valores IV 15:52 
   * 07 Estructura de decisión 21:22 
   * 08 Estructura de repetición 13:01 
   * 09 Práctica: Creando una calculadora 11:13 
   * Contenido adicional  7

# 05. Variables 16:58 

[Variables](pdfs/05_Variables.pdf)

## Resumen Profesor

### 5.1 Datos

Un dato es un registro de un hecho de la naturaleza, una idea, un objeto…. Podemos considerar como datos un número, una imagen, un sonido, un caracter, ....

### 5.2 Variable

En el mundo de la programación, una variable es la forma de almacenar en memoria un dato de un programa. Aunque como hemos visto, un dato puede representar un texto o una imagen, a nivel físico, estos se almacenan como 0 y 1.

Por tanto, podemos concluir que una variable será una región delimitada de memoria, a la que se le asigna un nombre y un tipo de dato.

### 5.2 Tipos de datos primitivos

Cualquier lenguaje de programación, Java incluido, ofrece una serie de tipos de datos primitivos, es decir, incorporados por el propio lenguaje y que siempre están disponibles para ser utilizados.

<img src="images/tipo_de_datos.jpg">

### 5.3 Declaración e inicialización de variables

Para poder usar una variable, previamente tenemos que haberla declarado. Es decir, tenemos que haber indicado que la vamos a usar. Para ello, basta con indicar el tipo de dato y el nombre de la variable:

```java
//Declaración e inicialización de dos variables
int numero = 7;        
char letra = 'a';

//Declaración e inicialización de una constante
final int NUM_HORAS = 8;
```

En muchas ocasiones, acompañaremos la declaración de la variable de su correspondiente inicialización; es decir, de la asignación de un valor inicial.

### 5.4 Como nombrar las variables

La tarea de dar un nombre a una variable no es sencilla, como iremos descubriendo poco a poco. Debemos seguir las suigientes reglas, que suele cumplir todo buen programador Java:

* El nombre debe ser autodescriptivo.

* El nombre de las variables es *case-sensitive*, es decir, sensible a mayúsculas y minúsculas.

* No se pueden usar espacios en blanco.

* Deben comenzar por una letra (también lo pueden hacer por los caracteres `$` o `_`, pero no es aconsejable).

* Se suele usar la notación camelCase, es decir, si el nombre de la variable está formado por más de una palabra, se escriben todas las palabras juntas en minúscula, a excepción de la letra inicial de la segunda, tercera, ...palabra, que irá en mayúsculas. Por ejemplo `numeroRuedas` o `descripcionDelTexto`.

Los valores constantes (declarados como `final`), se suelen escribir en mayúsculas, y separados por `_` si el nombre está formado por más de una palabra.

### 5.5 Vida (o ámbito) de una variable

Si bien ya hablaremos sobre este concepto más adelante, podemos indicar ya que las variables tienen un ámbito, es decir, un período de vida. Como norma general, el ámbito de una variable es el bloque donde ha sido definida la misma.

## Transcripción

![05_Variables-0](images/05_Variables-0.png)

A lo largo de esta lección y la siguiente vamos a hablar de variable y de tipo de dato en particular de los **tipos de datos** que se llaman o se conocen como **primitivos**.

![05_Variables-1](images/05_Variables-1.png)

Antes de hablar de tipos de datos primitivos tenemos que hablar de datos y es que los programas de ordenador están hechos sobre todo para manejarlo y que eso de un dato, un dato no es más que una forma de registrar un hecho de la naturaleza, un objeto, una idea y puede representar tanto la temperatura que hace hoy en la calle, la última canción que hemos escuchado en Spotify, el último email que hemos recibido. 

Los datos normalmente se representan como símbolos, la temperatura no dará un indicador de nuestro cuerpo si tenemos frío, si estamos sudando, pero al final la representamos mediante un símbolo que puede llegar a ser un número y algún otro símbolo como Celsius, Fahrenheit, Kelvin. Nosotros representamos los datos en función podríamos decir del tipo que tienen, no representamos igual una imagen, que un número, que un sonido o qué un carácter o una serie de caracteres.

![05_Variables-2](images/05_Variables-2.png)

La manera que tenemos de tratar datos dentro de un programa de ordenador, en particular de un programa Java es haciendo uso de **variables**, una variable no va a ser más que una manera de almacenar un dato en un programa, cómo norma general nosotros cuando trabajemos con datos, con variable lo que hará nuestro programa será almacenarlo en una parte de la memoria RAM del ordenador con lo cual a nivel físico todo lo que hemos visto antes imagen, número, caracteres, sonido, vídeo cualquier cosa se va acabar almacenando a nivel físico como 0 y 1, en el lenguaje físico de la memoria, si bien nosotros vamos a poder trabajar en Java de una manera más cómoda  con una serie de tipo de dato primitivos que vamos a aprender a caballo entre esta lección y la siguiente.

![05_Variables-3](images/05_Variables-3.png)

Cómo podemos comprobar el manejo de una variable en Java no es más que manejar una zona delimitada de la memoria de ordenador, es decir un conjunto de 1 y 0 si bien nosotros no vamos a ser capaces de ver esto nunca y es el lenguaje realiza un proceso podríamos decir de abstracción nos abstrae de estos detalles concretos y bien nosotros solamente trabajaremos con lo que tenemos abajo no, es decir con que esta región de la memoria RAM de de nuestro ordenador, no es más que un número o mejor dicho su contenido representa un número, podríamos llamar precio ya veremos que las variables tienes un nombre y al ser un número podría tener un valor representado en base 10 en decimal, que podría ser el precio de un coche 45996, el precio de un buen coche. 

<img src="images/tipo_de_datos.jpg">

Cómo podemos comprobar las variable tienen siempre asociado un tipo y es que Java es un lenguaje de los conocidos como fuertemente tipado, es decir que toda variable va a llevar siempre asociado un tipo. Las diferencias entre dos tipos de datos que se pueden ver claramente en este árbol y son los **tipos de datos primitivos**, es decir unos tipos de datos que ya nos proporciona el lenguaje de programación para que nosotros lo podamos utilizar directamente y los **tipos de dato estructurado** que lo iremos viendo más adelante que los podremos construir sobre todo a través de **clases** y **objetos**. Dentro de los tipos primitivos tenemos los **tipos numéricos**, los **tipos alfanuméricos** y los **tipos lógicos o boleanos**. Para los tipos numéricos veremos como Java nos ofrece lo suficiente para manejar números enteros de diferentes maneras y números reales, para los tipos alfanuméricos Java no ofrece la posibilidad de trabajar con **caracteres sueltos**, con letra sueltas y también la forma de trabajar con **cadenas de caracteres**, es decir con asociaciones de caracteres y también tendremos la posibilidad de trabajar con los conocidos **tipos lógicos o Boolean** que básicamente nos permitirán decir si dicha variable es verdadera o es falsa, los conocemos a nivel concreto en la siguiente lección.

![05_Variables-4](images/05_Variables-4.png)

Si me gustaría ahora que nos centraremos en cómo *declarar* y cómo *inicializar* una variable y es que cómo norma general para que podamos utilizar una variable tenemos que hacer ante una operación que se llama **declaración** es decir expresamente que *va a haber una región de memoria que vamos a utilizar con un tipo concreto y con un contenido concreto y además asociarle un nombre a este proceso se le llama **declaración***, *asignarle un valor inicial se le llama **inicializacion*** y lo normal es que antes de que nosotros utilicemos una variable por ejemplo para imprimir por consola su contenido la declaremos como es natural porque si no ya podremos comprobar como el entorno de desarrollo se va a quejar y si lo compilamos en nuestro fichero de una manera suelta el compilador también se quejaría de qué estamos intentando utilizar una variable desconocida y por supuesto también tendremos que proporcionar un valor, ya veremos como Eclipse nos va dando ayudas y si se nos olvida algún paso cómo inicializar una variable antes de utilizarla, le tendremos que dar un valor inicial para que la podamos usar con ciertas garantías, en este ejemplo tenemos dos variables un número entero y otra una letra que estamos declarando y posteriormente inicializando, lo hacemos todo en una línea aunque realmente son dos pasos diferentes, si nos damos cuenta cada variable tiene un nombre y el proceso de nombrar una variable que a priori puede resultar sencillo, en proyectos que no tienen porqué ser de una gran envergadura puede llegar a ser algo tedioso y podemos optar por usar nombre de variable que cuando volvamos al visitar nuestro código días o semanas después con no nos digas nada y es que **la primera premisa a la hora de nombrar una variable es que el nombre tiene que ser autodescriptivo**, es decir el nombre de una variable nos tiene que dar cierta información a ser posible toda, sobre para qué se utiliza y el contenido que va a tener, si pensamos en el que estábamos utilizando antes, las variables número o letra ya nos van informando, no solamente del tipo que tiene sino de a que podemos orientar su uso, para qué tipo de operaciones las podemos usar.

![05_Variables-5](images/05_Variables-5.png)

Además el nombre de las variables como pasa con el con el resto de los elementos del lenguaje es *Case-Sensitive* es decir su nombre es sensible a mayúsculas y a minúscula, no es lo mismo que utilizamos `NUMERO` que `numero`, que `Numero` no va a ser igual, con lo cual debemos de tener cuidado, en ese sentido yo recomiendo que utilicéis como digo más abajo en esta transparencia la notación *camelCase*, es una notación especial que nos va a permitir para aquellas variables, para las cuales utilizan en su nombre varias palabras, como no vamos a poder utilizar espacios lo que haremos será eliminar los espacios en blanco entre esas palabras pero para poder leerlos fácilmente podremos la primera letra de cada palabra en mayúscula, a esta notación se le llama *camelCase*. A la hora de escribir el nombre de una variable yo recomiendo que empiecen siempre siempre siempre por una letra, Java permite también utilizar algunos caracteres como el dólar `$` o el guíon bajo `_`, yo no lo recomiendo, el propio Oracle si leen la documentación oficial de Java no recomienda su utilización. Tampoco podemos utilizar alguna palabra reservada, las iremos aprendiendo poco a poco por ejemplo la palabra `class` hemos visto antes que se utiliza, no podríamos utilizarla como nombre de una variable. Existen también un grupo de variables especiales cuyo valor no va a a cambiar nunca tras su inicialización que se llaman **constantes** por ejemoplo si tuvieramos que utilizar el valor de PI en algún tipo de programa que calculara un área el vallor de esa constante no va a variar, por diferenciarla un poco de las variables, las constantes si se suelen escribir en mayúsculas y si incluyen varias palabras en lugar la notación *camelCase* como ya lo estamos escribiendo todo en mayúsculas si nos recomiendan el que separtemos las palabras mediante `_`. 

![05_Variables-6](images/05_Variables-6.png)

Por último antes de pasar a ver un ejemplo hablar que el **ámbito de una variable**, el ámbito se circunscribe al bloque donde, como norma general aunque veremos que esto se puede transgredir, el ámbito es el bloque en el que la hemos escrito, es decir si declaramos la variable número y la variable letras dentro del método main en cuanto finalice la ejecución de este método ya no tendríamos la posibilidad de acceder a la a la variable número y a la variable letra porque ya estaríamos fuera de su ámbito.

### :computer: `101-02-Declaracion_de_Variables_y_Constantes`

Aquí tenemos el pequeño ejemplo que hemos ido viendo, incluyendo también la declaración e inicializacion de una constante, por ejemplo el número de horas que suele incluir una jornada laboral normal suelen ser de 8 y bien ese número no suele variar si el valor va a ser constante, el nombre se suele declarar en mayúscula y utilizando guiones bajos, además para forzar que este valor se constante y que no se pueda modificar después utilizaríamos esta palabra `final` de la cual aprenderemos algo más adelante en este curso. Como podéis comprobar podemos declarar diferentes tipos de variables, podemos declarar variables en cualquier punto del programa, es decir no tenemos que hacerlo como en otros lenguajes de programación que nos fueza hacerlo siempre en las primeras líneas, tenemos una variable con nombre en notación camelCase en la que en lugar de escribir esto con espacio lo cual sería un error, o escribirlo todo en mayúscula que ya digo que se recomienda con el uso de constantes, utilizamos una notación en la que si utilizamos dos o más palabras, eliminamos los espacios en blanco intermedios, lo escribimos todo en minúsculas salvo la primera letra de cada palabra, si fueran muchas más palabras lo escribiríamos de esta manera `otroNumeroMasQueEscribimosEnNotacionCamelCase`, podríamos dar un valor inicial y pasaríamos por ejemplo a imprimirlo por consola que es de las cosas que sabemos hacer.

Si os dais cuenta el IDE nos va ayudando y nos va diciendo algunos mensajes los que están subrayados en rojo normalmente, siempre y cuando no sean comentarios, son errores que también se van a destacar a la derecha mediante un recuadro y lo que viene subrayado en amarillo son advertencias, no son errores pero son líneas que deberíamos vigilar porque es posible que pase algo raro en ellas, en particular está nos está indicando que el valor de esta variable, qué es local al ámbito de este método, no se usa nunca, esto es muy posible que nos pase cuando empecemos a desarrollar un código y empecemos a declarar variables qué en la versión final del código quiza no usemos todas, nos puede servir para eliminar código ineccesario y no nos quede emborronado. Para el método `println` qué es el que imprimir por consola tenemos un atajo de teclado escribimos `Syso` y le damos a 
`Ctrl+Espacio` el propio Eclipse general el resto del método para que nosotros podamos escribir. También tiene autocompletado con el nombre de variables, si nosotros escribimos `otro` y no hay nada más que se llame `otro` y le damos a las teclas `Ctrl+Espacio`, completaría con el nombre de la variable que hemos creado.

*Variables.java*

```java
package variables;

/**
 * @author 
 *
 */
public class Variables {

   /**
    * @param args
    */
   public static void main(String[] args) {
		
      //Declaración e inicialización de dos variables
      int numero = 7;		
      char letra = 'a';		
		
      //Declaración e inicialización de una constante
      final int NUM_HORAS = 8;	
		
      //Impresión por consola de los 3 valores
      System.out.println(numero);
		
      System.out.println(letra);
		
      System.out.println(NUM_HORAS);
		
      int otroNumeroMasQueEscribimosEnNotacionCamelCase = 1;
		
      System.out.println(otroNumeroMasQueEscribimosEnNotacionCamelCase);

   }
}


SALIDA:

7
a
8
1
```

![05-01](images/05-01.png)

# 6. Manipulación de números, caracteres y otros valores I 8:28 

[Manipulación de números, caracteres y otros valores](pdfs/06_Manipulación_de_numeros_caracteres_y_otros_valores.pdf)

![06_Manipulación-0](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-0.png) 

### 6.1 Tipos de datos primitivos en Java

![06_Manipulación-1](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-1.png)                     

Son solamente 8: `boolean, char, byte, short, int, long, float, double`. A estos, se suele añadir el objeto `java.lang.String`, ya que es muy usual.

### 6.1.1 Valores literales

![06_Manipulación-2](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-2.png)

Un valor literal es la representación de un valor fijo, que se escribe directamente en el código:

```java
boolean resultado = true;

int i = 100000;

String str = "CADENA";
```

![06_Manipulación-3](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-3.png)

Desde Java SE 7, se puede usar el guión bajo `_` para delimitar partes en un literal, sin que java lo procese:

```java
long creditCardNumber = 1234_5678_9012_3456L;
```

### 6.1.2 Operadores de asignación

![06_Manipulación-4](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-4.png)

El principal operador de asignación en java es`=`, y nos permite establecer el valor de una variable.

# 06 Manipulación de números, caracteres y otros valores II 15:39

[Manipulación de números, caracteres y otros valores](pdfs/06_Manipulación_de_numeros_caracteres_y_otros_valores.pdf)

### 6.2 Tipos de datos numéricos

![06_Manipulación-5](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-5.png)

#### 6.2.1 Tipos de datos enteros

![06_Manipulación-6](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-6.png)

Para manejar números enteros, tenemos 4 tipos de datos primitivos:

* `byte`: ocupa 8 bits, y su rango es de -128 a 127
* `short`: ocupa 16 bits, y su rango es de -32768 a 32767
* `int`: ocupa 32 bits, y su rango es de -2^31 a (2^31)-1
* `long`: ocupa 64 bits, y su rango es de -2^63 a (2^63)-1

#### 6.2.2 Tipos de datos reales

![06_Manipulación-7](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-7.png)

Ambos tipos numéricos se representan mediante la notación IEEE 754, en la que se descompone un número en su mantisa, base y exponente.

* `float`: ocupa 32 bits
* `double`: ocupa 64 bits

#### 6.2.3 Operadores numéricos

![06_Manipulación-8](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-8.png)

Java es muy rico en cuanto a operadores se refiere:

* `--expr`, `++expr, `expr--, `expr++`: pre y post incremento y decremento.
* `+`, `-`: cambio de signo a positivo o negativo.
* `*`, `/`, `%`: multiplicación, división y resto.
* `+`, `-`: suma, resta.
* `<<`, `>>`, `>>>`: desplazamiento a nivel de bits.

#### 6.2.4 Operadores numéricos de asignación abreviada

![06_Manipulación-9](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-9.png)

Estos son operadores que nos permiten asignar el valor de una variable al primer operando. Por ejemplo:

```java
val1 += 1; //Es equivalente a val1 = val1 + 1;
```

Los operadores son `+=`, `-=`, `*=`, `/=` y `%=`.

# 06 Manipulación de números, caracteres y otros valores III 8:13 

[Manipulación de números, caracteres y otros valores](pdfs/06_Manipulación_de_numeros_caracteres_y_otros_valores.pdf)

#### 6.2.5 Operadores numéricos a nivel de bits

![06_Manipulación-10](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-10.png)

Estos son los menos usuales de todos, pero los presentamos también por si en alguna ocasión fueran necesarios:

* `&`: operación AND a nivel de bits.
* `^`: operación OR exclusivo a nivel de bits (en este tipo de OR, el resultado de 1 OR 1 es 0).
* `|`: operación OR inclusivo a nivel de bits (en este tipo de OR, el resultado de 1 OR 1 es 1).
* `~`: cambia cada cero por un uno y cada uno por un cero.
* `<<`: desplaza un número de bits hacia la izquierda. Rellena los huecos con ceros.
* `>>>`: desplaza un número de bits hacia la derecha. Rellena los huecos con ceros.
* `>>`: desplaza un número de bits hacia la derecha. Rellena los huecos con el bit más significativo (el de signo).

## Manipulación de números, caracteres y otros valores IV 15:52 

[Manipulación de números, caracteres y otros valores](pdfs/06_Manipulación_de_numeros_caracteres_y_otros_valores.pdf)

#### 6.2.6 Código

*TiposDatosNumericos.java*

```java
package tiposdatos;

/**
 * @author 
 *
 */
@SuppressWarnings("all")
public class TiposDatosNumericos {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		/*
		 * LITERALES
		 */
		
		//Valor booleano VERDADERO
		boolean resultado = true;
		//Letra C
		char letraMayuscula = 'C';
		//Número 100
		byte by = 100;
		//Número 1000
		short sh = 1000;
		//Número 1000000
		int in = 1000000;
		
		//Valor 26, en decimal
		int decVal = 26;
		//Valor 26, en hexadecimal
		int hexVal = 0x1a;
		//Valor 26, en binario
		int binVal = 0b11010;
		
		//String s = "Hola Mundo";
		
		/*
		 * TIPOS DE DATOS NUMÉRICOS
		 */
		
		//TIPOS DE DATOS ENTEROS
		//[-128,127]
		byte b = 28;
		//[-32768,32767]
		short s = 3458;
		//[-2^31,(2^31)-1]
		int i = 33456;
		//[-2^63,(2^63)-1]
		long l = 3_000_000_000L;
		
		
		//TIPOS DE DATOS REALES
		//Precisión simple
		float f = 0.25f;
		//Precisión doble
		double Pi = Math.PI;
		
		
		
		//OPERADORES NUMÉRICOS
		int x = 7;
		int y = 5;
		
		//Suma
		int z = x + y;
		System.out.print("Suma ");
		System.out.println(z);
		
		//Resta
		z = x - y;
		System.out.print("Resta ");
		System.out.println(z);
		
		//Multiplicación
		z = x * y;
		System.out.print("Multipliación ");		
		System.out.println(z);
		
		
		//División (entera)
		z = x / y;
		System.out.print("División entera ");		
		System.out.println(z);
		
		//División (no entera)
		double j = Pi/f;
		System.out.println("División con decimales ");
		System.out.println(j);
				
		//Resto
		z = x % y;
		System.out.print("Módulo o resto ");		
		System.out.println(z);
		
		//Incremento
		z = x++;
		System.out.print("Incremento ");		
		System.out.println(z);
		System.out.println(x);
		
		
		
		//OPERADORES A NIVEL DE BITS
		int bitmask = 0b0011; 
		int val = 0b1111; 
		
		int res = val & bitmask; //0011
		System.out.print("AND ");
		System.out.println(Integer.toBinaryString(res));
		
		res = val ^ bitmask; //1100
		System.out.print("OR exclusivo ");		
		System.out.println(Integer.toBinaryString(res));
				
		res = val | bitmask; //1111
		System.out.print("OR inclusivo ");
		System.out.println(Integer.toBinaryString(res));
		
		// 0b1111
		
		res = val << 1; //11110
		System.out.print("left shift ");		
		System.out.println(Integer.toBinaryString(res));
				
		res = val >> 2; //0011
		System.out.print("Signed rigth shift ");		
		System.out.println(Integer.toBinaryString(res));
		
		
		res = (-val) >> 2; //11111111111111111111111111111100
		System.out.print("Signed rigth shift ");		
		System.out.println(Integer.toBinaryString(res));
				
		res = val >>> 1; //111
		System.out.print("Unsigned rigth shift ");		
		System.out.println(Integer.toBinaryString(res));
		
		res = ~val; //11111111111111111111111111110000
		System.out.print("Inverso o complementario ");
		System.out.println(Integer.toBinaryString(res));

//		int a = 5;
//		int b = 9;
//		
//		System.out.println((double)a/b);
		
	}

}


SALIDA:

8
AND 11
OR exclusivo 1100
OR inclusivo 1111
left shift 11110
Signed rigth shift 11
Signed rigth shift 11111111111111111111111111111100
Unsigned rigth shift 111
Inverso o complementario 11111111111111111111111111110000
```

### 6.3 Tipos de datos lógicos o booleanos

![06_Manipulación-11](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-11.png)

Nos permite almacenar valores susceptibles de ser verdadero o falso (`true`, `false`).

![06_Manipulación-12](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-12.png)

#### 6.3.1 Operadores lógicos condicionales

![06_Manipulación-13](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-13.png)

* `!`: realiza la negación del valor.
* `&&`: realiza un AND condicional de los dos operandos.
* `||`: realiza un OR condicional de los dos operandos.
* `?` :: Si el primer operando es verdadero, devuelve el valor del segundo; en otro caso, devuelve el tercero.

#### 6.3.2 Operadores lógicos relacionales

![06_Manipulación-14](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-14.png)

* `==`: devuelve verdadero si ambos valores son verdaderos
* `!=`: devuelve el valor inverso a ==
* `>`: devuelve verdadero si el valor de la izquierda es mayor estricto que el de la derecha.
* `>=`: devuelve verdadero si el valor de la izquierda es mayor o igual que el de la derecha.
* `<`: devuelve verdadero si el valor de la izquierda es menor estricto que el de la derecha.
* `<=`: devuelve verdadero si el valor de la izquierda es menor o igual que el de la derecha.

#### 6.3.3 Código

*TiposDatosLogicos.java*

```java
/**
 * 
 */
package tiposdatos;

/**
 * @author
 *
 */
@SuppressWarnings("all")
public class TiposDatosLogicos {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		//OPERADORES LÓGICOS CONDICIONALES
		int valor1 = 1;
        int valor2 = 2;
        //En el próximo capítulo profundizamos en las sentencias condicionales
        if((valor1 == 1) && (valor2 == 2))
            System.out.println("valor1 es 1 AND valor2 es 2");
        if((valor1 == 1) || (valor2 == 1))
            System.out.println("valor1 es 1 OR valor2 es 1");
		
        
        //OPERADOR "TERNARIO"
        int result;
        boolean someCondition = false;
        result = someCondition ? valor1 : valor2;
        System.out.println(result);
        
        
        //OPERADORES LÓGICOS RELACIONALES
        //En el próximo capítulo profundizamos en las sentencias condicionales
        if(valor1 == valor2)
            System.out.println("valor1 == valor2");
        if(valor1 != valor2)
            System.out.println("valor1 != valor2");
        if(valor1 > valor2)
            System.out.println("valor1 > valor2");
        if(valor1 < valor2)
            System.out.println("valor1 < valor2");
        if(valor1 <= valor2)
            System.out.println("valor1 <= valor2");
        
	}
}


SALIDA:

valor1 es 1 AND valor2 es 2
valor1 es 1 OR valor2 es 1
2
valor1 != valor2
valor1 < valor2
valor1 <= valor2
```

### 6.4 Tipos de datos para caracteres

![06_Manipulación-15](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-15.png)

![06_Manipulación-16](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-16.png)

Como tipo de dato primitivo para el manejo de caracteres, Java solamente nos ofrece `char`, el cual nos permite almacenar un solo caracter (letra, signo de puntuación, …).

```java
char = 'a';
```

Por si solo, este tipo de dato no nos permite mucho *juego*.

Sin embargo, Java nos ofrece una clase, `java.lang.String`, con la que manejar facilmente cadenas de caracteres. La incluimos en este apartado, aunque sea un tipo de dato estructurado ya que se puede obtener directamente desde un literal:

```java
String str = "Cadena de caracteres";
```

#### 6.4.1 Operadores con cadenas de caracteres

El principal operador para cadenas de caracteres es `+`, que nos permite concatenar dos textos, es decir, *poner* el segundo tras el primero.

#### 6.4.1 Código

*TiposDatosCaracteres.java*

```java
package tiposdatos;

/**
 * @author 
 *
 */
public class TiposDatosCaracteres {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		char a = 'a';
		System.out.println(a);
		
		String str = "Cadena de caracteres";
		System.out.println(str);
		
		String str2 = " más larga";
		System.out.println(str + str2); // Cadena de caracteres más larga
	}
}


SALIDA:

a
Cadena de caracteres
Cadena de caracteres más larga
```

### 6.5 Castings o transformaciones explícitas de tipos

![06_Manipulación-17](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-17.png)

![06_Manipulación-18](images/06_Manipulación_de_numeros_caracteres_y_otros_valores-18.png)

En ocasiones, nos puede interesar realizar un cambio explicito de un tipo de dato.

```java
System.out.println(5/9);
```

Este código produce como salida un 0, porque está haciendo la división entera. Si queremos obtener el resultado con decimales, podemos cambiar el tipo de dato explícitamente, pero para esa operación.

```java
System.out.println((double)5/9);
```

En este caso, el resultado será 0.55555555556

# 7. Estructura de decisión 21:22 

[Estructura de decisión](pdfs/07_Estructuras_de_decisión.pdf)

![07_Estructuras_de_decision-0](images/07_Estructuras_de_decision-0.png)

### 7.1 Repaso sobre sentencias, bloques y expresiones

![07_Estructuras_de_decision-1](images/07_Estructuras_de_decision-1.png)

En el capítulo 4 veíamos que podíamos asemejar una sentencia a una *línea de código*, y un bloque a una agrupación de sentencias con una determinada misión. Repasemos esos conceptos y, vistos los capítulos 5 y 6, conzcamos mejor el de expresión.

#### 7.1.1 Expresión

![07_Estructuras_de_decision-2](images/07_Estructuras_de_decision-2.png)

Se trata de una construcción hecha con variables, operadores y llamadas a funciones, que sigue la sintaxis del lenguaje, y que se evalúa produciendo un solo valor.

Sin saberlo, ya hemos trabajado con algunas expresiones:

```java
int numero = 0;
numero = 1 + 2;
```

Java permite construir expresiones de mayor tamaño componiendo algunas de menor tamaño:

```java
numero = 1 + 2 * 3;
```

Sin embargo, en casos como estos debemos tener cuidado con la posible ambigüedad y usar paréntesis para aclarar como se va a evaluar la expresión

```java
numero = (1 + 2) * 3;
```

#### 7.1.2 Sentencia

![07_Estructuras_de_decision-3](images/07_Estructuras_de_decision-3.png)

Tras conocer una expresión, podemos decir que una sentencia es una expresión que termina en `;`

#### 7.1.3 Bloque de código

![07_Estructuras_de_decision-4](images/07_Estructuras_de_decision-4.png)

Un bloque será un grupo de cero o más sentencias, delimitadas por un `{ }`. Por ejemplo:

```java
class BlockDemo {
     public static void main(String[] args) {
          boolean condicion = true;
          if (condicion) { // inicio del bloque 1
               System.out.println("La condición es verdadera");
          } // final del bloque 1
          else { // inicio del bloque 2
               System.out.println("La condición es falsa.");
          } // final del bloque 2
     }
}
```

### 7.2 Estructuras de decisión

![07_Estructuras_de_decision-5](images/07_Estructuras_de_decision-5.png)

#### 7.2.1 Estructura `if-then`

![07_Estructuras_de_decision-6](images/07_Estructuras_de_decision-6.png)

Permite evaluar una expresión como verdadera o falsa, y ejecutar en caso de que sea verdadera un bloque de código

```java
int num1 = 3, num2 = 4;

if (num1 > num2) {
   System.out.println("num1 es mayor que num2");
}

System.out.println("Este mensaje se imprime siempre");
```

##### 7.2.1.1 Código

*Decision01.java*

```java
/**
 * Ejemplo de uso de la estructura IF
 */
package decision;

/**
 * @author 
 *
 */
public class Decision01 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
//		int num1 = 3;
//		int num2 = 4;
		int num1 = 5, num2 = 4;
		
		if (num1 > num2) {
			System.out.println("num1 es mayor que num2");
		}
		
		System.out.println("Este mensaje se imprime siempre");

	}
}


SALIDA:

num1 es mayor que num2
Este mensaje se imprime siempre
```

*Decision02.java*

```java
/**
 *  Ejemplo de uso de la estructura IF con una condición más compleja
 */
package decision;

/**
 * @author 
 *
 */
public class Decision02 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		int num1 = 4, num2 = 9, num3 = 7;

		if (num3 > num1 && num3 < num2) {
			System.out.println("num1 es menor que num3, y este es menor que num2");
		}
	}
}


SALIDA:

num1 es menor que num3, y este es menor que num2

```

#### 7.2.2 Estructura `if-else`

![07_Estructuras_de_decision-7](images/07_Estructuras_de_decision-7.png)

Permite evaluar una expresión como verdadera o falsa; si el valor es verdadero se ejecuta un bloque de código, y si es falso, se ejecuta otro diferente:

```java
int num1 = 3, num2 = 4;

if (num1 > num2) {
   System.out.println("num1 es mayor que num2");
}else {
   System.out.println("num1 NO es mayor que num2");
}

System.out.println("Este mensaje se imprime siempre");
```
##### 7.2.2.1 Código

*Decision03.java*

```java
/**
 * Ejemplo de uso de la estructura IF-ELSE
 */
package decision;

/**
 * @author 
 *
 */
public class Decision03 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		int num1 = 25;
		int num2 = 21;
		if (num1 > num2) {
			System.out.println("El número mayor es " + num1); 
		} else { 			
			System.out.println("El número mayor es " + num2);
		}

	}
}


SALIDA:

El número mayor es 25
```

#### 7.2.3 Estructura `if-else-if`

![07_Estructuras_de_decision-8](images/07_Estructuras_de_decision-8.png)

Permite evaluar varias expresión como verdadera o falsa; si el valor es verdadero se ejecuta un bloque de código, y si es falso, se ejecuta el último bloque de código correspondiente al else:

```java
if (puntuacion >= 9) {
   System.out.println("Tienes un SOBRESALIENTE");
} else if (puntuacion >= 7) {
   System.out.println("Tienes un NOTABLE");
} else if (puntuacion >= 5) {
   System.out.println("Tienes un APROBADO");
} else {
   System.out.println("Estás SUSPENSO. Lo siento");
}
```

##### 7.2.3.1 Código

*Decision04.java*

```java
/**
 * Ejemplo de uso de varias estructuras IF-ELSE-IF
 * anidadas
 */
package decision;

/**
 * @author 
 *
 */
public class Decision04 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		float puntuacion = 7.6f;
		
		if (puntuacion >= 9) {
			System.out.println("Tienes un SOBRESALIENTE");
		} else if (puntuacion >= 7) {
			System.out.println("Tienes un NOTABLE");
		} else if (puntuacion >= 5) {
			System.out.println("Tienes un APROBADO");
		} else {
			System.out.println("Estás SUSPENSO. Lo siento");
		}
	}
}


SALIDA:

Tienes un NOTABLE
```

#### 7.2.4 Estructura `switch`

![07_Estructuras_de_decision-9](images/07_Estructuras_de_decision-9.png)

Permite evaluar si una expresión se corresponde con alguno de los valores de una serie de casos. Se puede usar con valores `byte`, `short`, `char`, `int` y `String`, entre otros. También existe la posibilidad de tener un caso por defecto (parecido a `else`).

```java
switch (mes) {
   case 1:  mesString = "Enero";
      break;
   case 2:  mesString = "Febrero";
      break;
   case 3:  mesString = "Marzo";
      break;
   case 4:  mesString = "Abril";
      break;
   case 5:  mesString = "Mayo";
      break;
   case 6:  mesString = "Junio";
      break;
   case 7:  mesString = "Julio";
      break;
   case 8:  mesString = "Agosto";
      break;
   case 9:  mesString = "Septiembre";
      break;
   case 10: mesString = "Octubre";
      break;
   case 11: mesString = "Noviembre";
      break;
   case 12: mesString = "Diciembre";
      break;
   default: mesString = "Mes no válido";
      break;
}
```

##### 7.2.4.1 Código

*Decision05.java*

```java
/**
 * Ejemplo de uso de estructura Switch
 */
package decision;

/**
 * @author 
 *
 */
public class Decision05 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		int mes = 4;
        String mesString;
        switch (mes) {
            case 1:  mesString = "Enero"; // mes == 1 -> true
                     break;
            case 2:  mesString = "Febrero";
                     break;
            case 3:  mesString = "Marzo";
                     break;
            case 4:  mesString = "Abril";
                     break;
            case 5:  mesString = "Mayo";
                     break;
            case 6:  mesString = "Junio";
                     break;
            case 7:  mesString = "Julio";
                     break;
            case 8:  mesString = "Agosto";
                     break;
            case 9:  mesString = "Septiembre";
                     break;
            case 10: mesString = "Octubre";
                     break;
            case 11: mesString = "Noviembre";
                     break;
            case 12: mesString = "Diciembre";
                     break;
            default: mesString = "Mes no válido";
                     break;
        }
        System.out.println(mesString);

	}

}


SALIDA:

Abril
```


*Decision06.java*

```java
/**
 * Ejemplo más complejo de uso de SWITCH
 */
package decision;

/**
 * @author 
 *
 */
public class Decision06 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int mes = 4;
		int numDias = 0;

		switch (mes) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			numDias = 31;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			numDias = 30;
			break;
		case 2:
			// No tenemos en cuenta si el año es bisiesto
			// para no hacer más complejo el ejemplo
			numDias = 28;
			break;
		default:
			System.out.println("Mes no válido");
			break;
		}
		System.out.println("Número de días = " + numDias);
	}

}


SALIDA:

Número de días = 30
```

*Decision07.java*

```java
/* Uso de la estructura Switch con cadenas de caracteres
 */
package decision;

/**
 * @author 
 */
public class Decision07 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int mesNumero = 4;
		String mes = "abril";

		switch (mes) {
		case "enero":
			mesNumero = 1;
			break;
		case "febrero":
			mesNumero = 2;
			break;
		case "marzo":
			mesNumero = 3;
			break;
		case "abril":
			mesNumero = 4;
			break;
		case "mayo":
			mesNumero = 5;
			break;
		case "junio":
			mesNumero = 6;
			break;
		case "julio":
			mesNumero = 7;
			break;
		case "agosto":
			mesNumero = 8;
			break;
		case "septiembre":
			mesNumero = 9;
			break;
		case "octubre":
			mesNumero = 10;
			break;
		case "noviembre":
			mesNumero = 11;
			break;
		case "diciembre":
			mesNumero = 12;
			break;
		default:
			mesNumero = 0;
			break;
		}

		System.out.println("El mes de " + mes + " se corresponde con el número " + mesNumero );

	}

}


SALIDA:

El mes de abril se corresponde con el número 4
```

# 08 Estructura de repetición 13:01 

[Estructura de repetición](pdfs/08_Estructuras_de_repeticion.pdf)

![08_Estructuras_de_repeticion-0](images/08_Estructuras_de_repeticion-0.png)

### 8.1 Bucle `while`

![08_Estructuras_de_repeticion-1](images/08_Estructuras_de_repeticion-1.png)

![08_Estructuras_de_repeticion-2](images/08_Estructuras_de_repeticion-2.png)

Nos permite repetir la ejecución de un bloque de sentencias. La repetición se realiza durante un número indeterminado de veces, mientras una expresión sea cierta. Una de las sentencias del cuerpo del bucle debe modificar alguna de las variables de la condición, para que, en alguna ocasión, la expresión sea falsa.

```java
while (condicion) {
   ...
   ...      
}
``` 

#### 8.1.1 Código

*Repeticion01.java*

```java
/**
 *  Ejemplo de uso del bucle while
 */
package repeticion;

/**
 * @author 
 *
 */
public class Repeticion01 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int contador = 1;
        while (contador < 11) {
            System.out.println("Contador vale: " + contador);
            contador++;
        }

	}

}


SALIDA:

Contador vale: 1
Contador vale: 2
Contador vale: 3
Contador vale: 4
Contador vale: 5
Contador vale: 6
Contador vale: 7
Contador vale: 8
Contador vale: 9
Contador vale: 10
```

### 8.2 Bucle `do-while`

![08_Estructuras_de_repeticion-3](images/08_Estructuras_de_repeticion-3.png)

![08_Estructuras_de_repeticion-4](images/08_Estructuras_de_repeticion-4.png)

Nos permite repetir la ejecución de un bloque de sentencias. La condición, a diferencia de la estructura while, se evalúa al final del bucle. El cuerpo del bucle se ejecuta siempre, al menos, una vez.

```java
do {
   ...
   ...      
} while (condicion);
```

#### 8.2.1 Código

*Repeticion02.java*

```java
/**
 * Ejemplo de uso del bucle do-while
 */
package repeticion;

/**
 * @author 
 *
 */
public class Repeticion02 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int contador = 1;
        do {
            System.out.println("Contador vale: " + contador);
            contador++;
        } while (contador < 11);

	}
}


SALIDA:

Contador vale: 1
Contador vale: 2
Contador vale: 3
Contador vale: 4
Contador vale: 5
Contador vale: 6
Contador vale: 7
Contador vale: 8
Contador vale: 9
Contador vale: 10
```

### 8.3 Bucle `for`

![08_Estructuras_de_repeticion-5](images/08_Estructuras_de_repeticion-5.png)

![08_Estructuras_de_repeticion-5](images/08_Estructuras_de_repeticion-6.png)

Nos permite repetir un bloque de código un número conocido a priori de veces. Suele ser el más utilizado de los 3. Se podría implementar un bucle for con un while. Cuando trabajemos con colecciones o arrays, podremos usar su variante llamada *for-each*.

```java
for(declaracion; condicion; incremento) {
   ...
}
```    

#### 8.3.1 Código

*Repeticion03.java*

```java
/**
 * Ejemplo de uso del bucle FOR
 */
package repeticion;

/**
 * @author 
 *
 */
public class Repeticion03 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		for(int contador = 4; contador < 11; contador+=2) {
			System.out.println(contador);
		}
	}
}


SALIDA:

4
6
8
10
```

### 8.4 Sentencias `break` y `continue`

Existen dos sentencias especiales, que no suelen usarse mucho ya que producen posibles caminos de ejecución *raros*, que son `break` y `continue`:

* `break`: permite finalizar la ejecución de un bucle, independientemente de si se cumple la condición de finalización del mismo.

* `continue`: permite finalizar la ejecución de la iteración actual de un bucle, pasando automáticamente a la siguiente iteración del mismo.

Su uso no es demasiado recomendable, ya que puede producir un efecto conocido como código spaguetti, por el cual es dificil predecir los caminos de ejecución del mismo.

# 09 Práctica: Creando una calculadora 11:13 

En esta sesión práctica veremos como crear una calculadora, tienes el código de ejemplo en el [repositorio de GitHub](https://github.com/OpenWebinarsNet/Curso-Java-desde-0).

***Calculadora.java***

```java
/**
 * Ejemplo más complejo que nos permite utilizar
 * 
 *  - Variables numéricas
 *  - Operadores
 *  - Expresiones
 *  - Estructuras de decisión
 *  - Estructuras de repetición
 * 
 */
package calculadora;

import java.util.Scanner;

/**
 * @author 
 *
 */
public class Calculadora {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//Variable donde almacenamos el valor seleccionado
		//del menú
		int opcion = 0;
		//Por ahora, es normal si no se comprenden estas dos
		//líneas de código.
		Scanner sc;
		sc = new Scanner(System.in);
		
		do {

			//Imprimimos por consola el menú
			System.out.println("\n"); //Este caracter especial nos permite imprimir una línea en blanco
			System.out.println("***** CALCULADORA CUARENTENA *****");
			System.out.println();
			System.out.println("1. Sumar");
			System.out.println("2. Restar");
			System.out.println("3. Multiplicar");
			System.out.println("4. Dividir");
			System.out.println("5. Resto");
			System.out.println("0. Salir del programa");
			System.out.println();
			System.out.print("Introduzca una opción válida: ");
			
			//Estas líneas de código nos permiten leer del teclado
			//y transformar el valor leído de String a int
			
			// 1) Recoger el valor escrito en el teclado
			// 2) Transformar esa cadena de caracteres en un valor entero
			opcion = Integer.parseInt(sc.nextLine());
			
			//Si la opcion es menor que 0 o mayor que 5, no es una
			//opción válida
			if (opcion < 0 || opcion > 5) {
				System.out.println("Opción no válida. Vuelva a escoger");
				//Si la opcion es diferente a cero, solicitamos los 
				//dos operandos
			} else if (opcion != 0) {

				System.out.println("\n");
				
				float operando1, operando2;
				
				System.out.print("Introduzca el primer operando: ");
				operando1 = Float.parseFloat(sc.nextLine());
				
				System.out.print("Introduzca el segundo operando: ");
				operando2 = Float.parseFloat(sc.nextLine());

				
				System.out.println("\n");
				switch(opcion) {
				
				case 1: //Suma
					System.out.println("El resultado de la suma es " + (operando1 + operando2));
					break;
				case 2: //Resta
					System.out.println("El resultado de la resta es " + (operando1 - operando2));
					break;
				case 3: //Multiplicación
					System.out.println("El resultado de la multiplicación es " + (operando1 * operando2));
					break;
				case 4: //División
					System.out.println("El resultado de la división es " + (operando1 / operando2));
					break;
				case 5: //Resto
					System.out.println("El resto de dividir " +operando1 + " entre " + operando2 + " es "+ (operando1 % operando2));
					break;
					
				}
				
			}
			
		} while (opcion != 0); //opcion == 0 implicar salir del programa
		
		//Indicamos que no vamos a leer ningún valor más por teclado.
		sc.close();
		
		System.out.println("Finalizando la ejecución de la calculadora");

	}

}

```

**SALIDA:**

```sh
***** CALCULADORA CUARENTENA *****

1. Sumar
2. Restar
3. Multiplicar
4. Dividir
5. Resto
0. Salir del programa

Introduzca una opción válida: 1


Introduzca el primer operando: 10
Introduzca el segundo operando: 7


El resultado de la suma es 17.0


***** CALCULADORA CUARENTENA *****

1. Sumar
2. Restar
3. Multiplicar
4. Dividir
5. Resto
0. Salir del programa

Introduzca una opción válida: 2


Introduzca el primer operando: 10
Introduzca el segundo operando: 7


El resultado de la resta es 3.0


***** CALCULADORA CUARENTENA *****

1. Sumar
2. Restar
3. Multiplicar
4. Dividir
5. Resto
0. Salir del programa

Introduzca una opción válida: 3


Introduzca el primer operando: 10
Introduzca el segundo operando: 7


El resultado de la multiplicación es 70.0


***** CALCULADORA CUARENTENA *****

1. Sumar
2. Restar
3. Multiplicar
4. Dividir
5. Resto
0. Salir del programa

Introduzca una opción válida: 4


Introduzca el primer operando: 10
Introduzca el segundo operando: 7


El resultado de la división es 1.4285715


***** CALCULADORA CUARENTENA *****

1. Sumar
2. Restar
3. Multiplicar
4. Dividir
5. Resto
0. Salir del programa

Introduzca una opción válida: 5


Introduzca el primer operando: 10
Introduzca el segundo operando: 7


El resto de dividir 10.0 entre 7.0 es 3.0


***** CALCULADORA CUARENTENA *****

1. Sumar
2. Restar
3. Multiplicar
4. Dividir
5. Resto
0. Salir del programa

Introduzca una opción válida: 0
Finalizando la ejecución de la calculadora
```

## Contenido adicional  4

[Variables](pdfs/05_Variables.pdf)

[Manipulación de números, caracteres y otros valores](pdfs/06_Manipulación_de_numeros_caracteres_y_otros_valores.pdf)

[Estructura de decisión](pdfs/07_Estructuras_de_decisión.pdf)

[Estructura de repetición](pdfs/08_Estructuras_de_repeticion.pdf)
