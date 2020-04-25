# 4. Manipulación y tratamiento de datos 77m
   * Conoce Java API Docs 9:57 
   * Uso de la clase String 13:03 
   * Manejo de Arrays 23:09 
   * Práctica: Creando el juego de hundir la flota 31:16 
   * Contenido adicional 4
   
## 14. Conoce Java API Docs 9:57 

[Conoce Java API Docs-1](pdfs/14_Conoce_JAVA_API_DOCS-1.pdf)

![14_Conoce_JAVA_API_DOCS-1](images/14_Conoce_JAVA_API_DOC-1.png)

Conoce más Java y descubre la documentación de Java para ver todos los paquetes y clases que contiene Java

![14_Conoce_JAVA_API_DOCS-2](images/14_Conoce_JAVA_API_DOC-2.png)

![14_Conoce_JAVA_API_DOCS-3](images/14_Conoce_JAVA_API_DOC-3.png)

![14_Conoce_JAVA_API_DOCS-4](images/14_Conoce_JAVA_API_DOC-4.png)

## 15. Uso de la clase String 13:03 

[Uso de la clase String](pdfs/15_Uso_de_la_clase_String.pdf)

![15_Uso_de_la_clase_String-1](images/15_Uso_de_la_clase_String-1.png)

### 15.1 Creación de Strings

![15_Uso_de_la_clase_String-2](images/15_Uso_de_la_clase_String-2.png)

La forma más fácil de crear una cadena de caracteres es a partir de un literal con dobles comillas

```java
String saludo = "Hola Mundo";
```

Los literales de cadenas de caracteres son compilados por Java como un objeto `String`.

Como comprobaremos más adelante, Java ofrece un tipo de sucesión o colección de elementos de un tipo llamado array. Un array de caracteres también podría representar una cadena de caracteres, pero para nosotros será menos versátil.

**IMPORTANTE**: *La clase `String` es inmutable, es decir, que una vez creada, su valor no se puede modificar. Todas las operaciones que realicemos con objetos de este tipo darán como resultado un nuevo objeto, no la modificación del actual.*

### 15.2 Concatenación

![15_Uso_de_la_clase_String-3](images/15_Uso_de_la_clase_String-3.png)

Concatenar dos cadenas es poner una cadena a continuación de la otra. Lo podemos hacer de varias formas:

* operador `+`: es la forma más cómoda: `"Cadena " + "concatenada"`.

* método `.concat(...)`: otra forma de hacerlo: `"Mi nombre es ".concat("Pepe")`.

### 15.3 Longitud, mayúsculas y minúsculas

![15_Uso_de_la_clase_String-4](images/15_Uso_de_la_clase_String-4.png)

Podemos obtener el número de caracteres de un `String` mediante el método `.length()`.

```java
String saludo = "Hola Mundo!";
System.out.println(saludo.length()); //Debe imprimir 11
```

![15_Uso_de_la_clase_String-5](images/15_Uso_de_la_clase_String-5.png)

Podemos pasar toda la cadena a minúsculas con `toLowerCase()`, o a mayúsculas con `toUpperCase()`.

### 15.4 Creación de cadenas formateadas

![15_Uso_de_la_clase_String-6](images/15_Uso_de_la_clase_String-6.png)

En ocasiones, podemos querer crear una cadena de caracteres concatenando varios literales de cadena, con otra serie de valores. En estos casos, puede resultar tedioso hacerlo:

```java
  String nombre = "Pepe";
  String apellidos = "Pérez";
  String mensaje = "¿qué tal estás?";
  System.out.println("Hola, soy " + nombre + " " + apellidos + ", y quiero saludarte diciéndote " + mensaje);
```

Para casos así, podemos usar el método `format`, que nos permite utilizar *variables* dentro de la cadena de formato, que serán sustituidos por valores.

* `%s`: será sustituido por una cadena de caracteres.

* `%f`: será sustituido por un número decimal.
* ...

El ejemplo anterior quedaría:

```java
  String nombre = "Pepe";
  String apellidos = "Pérez";
  String mensaje = "¿qué tal estás?";
  String str = String.format("Hola, soy %s %s y quiero saludarte diciéndote %s", nombre, apellidos, mensaje);
  System.out.println(str);
}
```

### 15.5 Comparaciones de cadenas y fragmentos de cadenas

![15_Uso_de_la_clase_String-7](images/15_Uso_de_la_clase_String-7.png)

La clase `String` nos proporciona muchos métodos para comparar cadenas y fragmentos de cadenas:

* `endsWith`, para comparar si una cadena termina igual que un sufijo proporcionado.

* `startsWith`, para comparar si una cadena comienza igual que un prefijo proporcionado.

* `compareTo`, para comparar una cadena con otra. Devuelve 0 si son iguales, `< 0` si es menor, y `> 0` si es mayor (lexicográficamente hablando).

* `equalsIgnoreCase`, para comparar dos cadenas ignorando si están en mayúsculas o minúsculas.

* `matches`, para comparar si una cadena cumple con una expresión regular.

* `contains`, para comparar si una cadena está contenida en otra.

### 15.6 Código

*EjemplosString.java*

```java
/**
 * USO DE LA CLASE STRING
 */
package string;

/**
 * @author 
 *
 */
public class EjemplosString {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		//CONCATENAR
		System.out.println("***** CONCATENAR *****");
		System.out.println(" 2 Formas diferentes: ");
		String nombre = "Mi nombre es ".concat("Pepe");
		String nombre2 = "Mi nombre es " + "Pepe";
		System.out.println(nombre);
		System.out.println(nombre2);
		System.out.println();
		
		// MAYÁSCULAS-MINÚSCULAS
		System.out.println("***** MAYÁSCULAS-MINÚSCULAS *****");
		String cadena = "En un lugar de La Mancha";
		System.out.println(cadena);
		System.out.println(cadena.toLowerCase());
		System.out.println(cadena.toUpperCase());
		System.out.println();
		
		
		//STRING FORMAT
		System.out.println("***** STRING FORMAT *****");
		System.out.println(" 3 Formas diferentes: ");
		String nombre3 = "Pepe";
		String apellidos3 = "Pérez";
		String mensaje3 = "¿qué tal estás?";
		System.out.println("Hola, soy " + nombre3 + " " + apellidos3 + ", y quiero saludarte diciéndote " + mensaje3);
		
		String nombre4 = "Pepe";
		String apellidos4 = "Pérez";
		String mensaje4 = "¿qué tal estás?";
		String str = String.format("Hola, soy %s %s, y quiero saludarte diciéndote %s", nombre4, apellidos4, mensaje4);
		System.out.println(str);
		
		System.out.printf("Hola, soy %s %s, y quiero saludarte diciéndote %s", nombre4, apellidos4, mensaje4);
		System.out.println();
		System.out.println();
		
		//MÉTODOS DE COMPARACIÓN
		System.out.println("***** MÉTODOS DE COMPARACIÓN *****");
		String quijote = "En un lugar de La Mancha";
		System.out.println(quijote.endsWith("La Mancha"));		
		System.out.println(quijote.startsWith("En un lugar"));		
		System.out.println(quijote.contains("lugar"));
		
	}

}
```

**SALIDA:**

```sh
***** CONCATENAR *****
 2 Formas diferentes: 
Mi nombre es Pepe
Mi nombre es Pepe

***** MAYÁSCULAS-MINÚSCULAS *****
En un lugar de La Mancha
en un lugar de la mancha
EN UN LUGAR DE LA MANCHA

***** STRING FORMAT *****
 3 Formas diferentes: 
Hola, soy Pepe Pérez, y quiero saludarte diciéndote ¿qué tal estás?
Hola, soy Pepe Pérez, y quiero saludarte diciéndote ¿qué tal estás?
Hola, soy Pepe Pérez, y quiero saludarte diciéndote ¿qué tal estás?

***** MÉTODOS DE COMPARACIÓN *****
true
true
true
```

## 16. Manejo de Arrays 23:09 

[Manejo de Arrays](pdfs/16_Arrays.pdf)

![16_Arrays-1](images/16_Arrays-1.png)

### 16.1 Arrays

![16_Arrays-2](images/16_Arrays-2.png)

Un array es un contenedor de elementos de un mismo tipo, con un tamaño fijo que hay que conocer a la hora de crearlo. A la hora de recorrerlo, las posiciones comienzan a contar en cero.

![16_Arrays-3](images/16_Arrays-3.png)

### 16.2 Creación de un array

![16_Arrays-4](images/16_Arrays-4.png)

Usamos el operador `new`, y tenemos que conocer el tipo de dato y el tamaño:

```java
int[] unArray = new int[10];
```

### 16.3 Acceso de lectura y escritura

![16_Arrays-5](images/16_Arrays-5.png)

El operador `[ ]` nos permite acceder a las posiciones de un array, para leer su valor, o también para modificarlo.

Para asignar un valor, usaremos el operador corchete a la izquierda de una operación de asignación:

```java
unArray[1] = 100;
```

Para leer un valor, lo utilizaremos en operaciones como un `println`:

```java
System.out.println(unArray[1]);
```

### 16.4 Inicialización de un array

![16_Arrays-6](images/16_Arrays-6.png)

Tenemos varias formas de hacerlo:

1. Manualmente, asignando cada una de las posiciones

2. Manualmente, pero utilizando un bucle para iterar por las posiciones (simpre que la lógica del programa lo permita).

3. Atajo con la sintaxis `{ }`.

### 16.5 Reocorrido de un array

![16_Arrays-7](images/16_Arrays-7.png)

Todo array tiene una propiedad pública, `length`, que son permite consultar su número de elementos. Utilizándola, podemos usar un bucle para recorrer un array:

```java
for(int i = 0; i < unArray.length; i++) {
     System.out.println(unArray[i]);
}
```

También podemos utilizar un bucle for-each, que nos permite extraer elemento a elemento, sin necesidad de conocer a priori su longitud:

```java
for(int i : unArray) {
     System.out.println(i);
}
```

### 16.6 Arrays de objetos

![16_Arrays-8](images/16_Arrays-8.png)

No solamente podemos crear arrays de tipos primitivos, sino que también lo podemos hacer de instancias de alguna clase que hayamos definido previamente.

```java
Persona[] unArray = new Persona[10];
//...
unArray[1] = new Persona(…);
```

### 16.7 Arrays multidimensionales

![16_Arrays-9](images/16_Arrays-9.png)

Podemos crear arrays que tengan más de una dimensión. Tan solo tenemos que añadir otra pareja de corchetes.

```java
int[][] biArray = new int[10][20];
biArray[3][4] = 78;
```

![16_Arrays-10](images/16_Arrays-10.png)

Para recorrerlos necesitaremos *anidar* otro bucle for:

```java
for(int i = 0; i < biArray.length; i++) {
   for(int j = 0; i < biArray[0].length; j++) {
     System.out.println(unArray[i][j]);
   }
}
```

### 16.8 Manipulación de arrays

![16_Arrays-11](images/16_Arrays-11.png)

Java nos provee de una clase, `java.util.Arrays`, que posee una serie de métodos para realizar operaciones rápidas con arrays. Entre otros:

* `sort(...)`: nos permite ordenar los elementos de un arrays

* `copyOf(...)`: nos permite copiar rápidamente un array en otro

* `binarySearch(...)`: nos permite buscar un valor entre los elementos de un array. Previamente debe estar ordenado

Java 8 incorpora algunos métodos paralelos, que aprovechan mejor el rendimiento de arquitecturas con varios procesadores, para operar con arrays muy grandes, con estas operaciones, entre otras:

* `parallelSort(...)`

* `parallelSetAll(...)`

### 16.9 Código

*ManejoArrays01.java*

```java
/**
 * 
 */
package arrays;

/**
 * @author 
 *
 */
public class ManejoArrays01 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//CREACIÓN E INICIALIZACIÓN ELEMENTO A ELEMENTO
		int[] unArray = new int[10];
		
        unArray[0] = 100;
        unArray[1] = 200;
        unArray[2] = 300;
        unArray[3] = 400;
        unArray[4] = 500;
        unArray[5] = 600;
        unArray[6] = 700;
        unArray[7] = 800;
        unArray[8] = 900;
        unArray[9] = 1000;
        
        //RECORRIDO DE TODOS LOS VALORES DE UN ARRAY
        for(int i = 0; i < unArray.length; i++) {
        	System.out.println(unArray[i]);
        }    
	}

}


SALIDA:

100
200
300
400
500
600
700
800
900
1000
```

*ManejoArrays02.java*

```java
package arrays;

/**
 * @author 
 *
 */
public class ManejoArrays02 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//CREACIÓN E INICIALIZACIÓN CON EL ATAJO { }
		//En este caso, el tamaño lo determina la cantidad 
		//de valores que inicializamos
		int[] unArray = { 
			    100, 200, 300,
			    400, 500, 600, 
			    700, 800, 900, 1000
		};
        
    //RECORRIDO DE TODOS LOS VALORES DE UN ARRAY
		//CON EL BUCLE FOR MEJORADO
    for(int i : unArray) {
        	System.out.println(i);
    }
	}
}


SALIDA:

100
200
300
400
500
600
700
800
900
1000
```

*Persona.java*

```java
package arrays.objetos;

public class Persona {
	
	private String nombre;
	private String apellidos;
	private int edad;
	private int altura;
	private float peso;
	
	public Persona() {}
	
	public Persona(String nombre, String apellidos) {
		this.nombre = nombre;
		this.apellidos = apellidos;
	}

	public Persona(String nombre, String apellidos, int edad, int altura, float peso) {
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.edad = edad;
		this.altura = altura;
		this.peso = peso;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public int getAltura() {
		return altura;
	}

	public void setAltura(int altura) {
		this.altura = altura;
	}

	public float getPeso() {
		return peso;
	}

	public void setPeso(float peso) {
		this.peso = peso;
	}

	@Override
	public String toString() {
		return "Persona [nombre=" + nombre + ", apellidos=" + apellidos + ", edad=" + edad + ", altura=" + altura
				+ ", peso=" + peso + "]";
	}
}
```

*ManejoArrays03.java*

```java
package arrays.objetos;

import java.util.Random;

/**
 * @author 
 *
 */
public class ManejoArrays03 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//Estos dos arrays nos permitirán obtener valores aleatorios para inicializar los datos
		String[] nombres = {"José", "Antonio", "Martín", "Luis", "María", "Leticia", "Luisa"};
		String[] apellidos = {"Pérez", "Gómez", "López", "García", "Muñoz", "Martínez"};
		
		//Creamos nuestro array de 5 elementos de tipo Persona
		Persona[] personas = new Persona[5];
		
		//Inicializamos los valores
		for(int i = 0; i < personas.length; i++) {
			//Obtenemos un nombre de una posición aleatoria
			String nombre = nombres[aleatorio(nombres.length)];
			//Obtenemos un apellido de una posición aleatoria			
			String apellido = apellidos[aleatorio(nombres.length)];
			//Los usamos para crear una nueva persona
			personas[i]= new Persona(nombre, apellido);
		}
		
		//Recorremos de nuevo el array, esta vez
		//para imprimir sus valores.
		for(Persona p : personas) {
			System.out.println(p);
		}

	}

	/*
	 * ESTE MÉTODO DEVUELVE UN NÚMERO ALEATORIO ENTRE
	 * 0 y TOPE-1.
	 */
	public static int aleatorio(int tope) {
		Random r = new Random();		
		return r.nextInt(tope-1);
	}

}


SALIDA:

Persona [nombre=Luis, apellidos=Gómez, edad=0, altura=0, peso=0.0]
Persona [nombre=María, apellidos=Gómez, edad=0, altura=0, peso=0.0]
Persona [nombre=Antonio, apellidos=Muñoz, edad=0, altura=0, peso=0.0]
Persona [nombre=María, apellidos=Pérez, edad=0, altura=0, peso=0.0]
Persona [nombre=Luis, apellidos=Muñoz, edad=0, altura=0, peso=0.0]

OTRA EJCUCIÓN(Genera otros datos):

Persona [nombre=Leticia, apellidos=Gómez, edad=0, altura=0, peso=0.0]
Persona [nombre=Antonio, apellidos=Muñoz, edad=0, altura=0, peso=0.0]
Persona [nombre=Antonio, apellidos=Muñoz, edad=0, altura=0, peso=0.0]
Persona [nombre=José, apellidos=Pérez, edad=0, altura=0, peso=0.0]
Persona [nombre=Luis, apellidos=Gómez, edad=0, altura=0, peso=0.0]
```

*ManejoArrays04.java*

```java
package arrays.bidimensionales;

import java.util.Random;

/**
 * @author 
 *
 */
public class ManejoArrays04 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		//No tiene porqué ser cuadrado
		int[][] bidimensional = new int[10][20];
		final int TOPE = 100;
		
		for(int i = 0; i < bidimensional.length; i++) {
			for(int j = 0; j < bidimensional[0].length; j++) {
				bidimensional[i][j] = aleatorio(TOPE);
			}
		}
				

		for(int i = 0; i < bidimensional.length; i++) {
			for(int j = 0; j < bidimensional[0].length; j++) {
				System.out.print(bidimensional[i][j]+ "\t");
			}
			System.out.println("");
		}

	}
	
	/*
	 * ESTE MÉTODO DEVUELVE UN NÚMERO ALEATORIO ENTRE
	 * 0 y TOPE-1.
	 */
	public static int aleatorio(int tope) {
		Random r = new Random();		
		return r.nextInt(tope-1);
	}

}


SALIDA:

40	68	58	68	96	12	36	91	38	45	30	90	13	4	63	34	2	11	20	84	
22	39	73	66	57	76	87	16	71	24	15	81	39	95	52	9	47	1	92	0	
48	47	2	54	49	79	97	18	66	85	64	3	48	66	64	75	58	94	54	50	
52	96	77	79	10	55	85	45	80	20	15	18	5	33	56	26	89	26	39	8	
40	75	4	73	28	86	20	22	34	50	53	36	39	29	45	13	20	61	82	72	
68	97	65	14	94	73	36	67	39	39	28	41	71	45	63	55	84	13	56	36	
73	95	9	11	21	78	46	98	58	37	33	35	56	82	73	60	53	43	9	5	
4	12	11	73	81	2	22	54	1	40	30	86	80	8	11	91	79	92	40	79	
70	80	57	91	10	15	5	84	6	28	37	79	69	92	64	77	70	15	30	59	
28	70	86	3	4	33	35	65	39	4	53	12	60	62	27	51	98	76	54	30	


```

*ManejoArrays05.java*

```java
/**
 * 
 */
package arrays;

import java.util.Arrays;
import java.util.Random;

/**
 * @author 
 *
 */
public class ManejoArrays05 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		int[] array = new int[100];
		
		for(int i = 0; i < array.length; i++) {
			array[i] = aleatorio(100);
		}
		System.out.println("");
		System.out.println("Array generado");
		printArray(array);
		System.out.println();
				
		
		//Podemos crear otro array, copia del primero, ampliando su longitud
		int[] otroArray = Arrays.copyOf(array, 200);
		
		//Podemos ordenar los elementos de un array
		Arrays.sort(otroArray);
		System.out.println("");
		System.out.println("Array ordenado");
		printArray(otroArray);
		System.out.println();
		
		//Posición de un número aleatorio, si es que está
		int num = aleatorio(100);
		int pos = Arrays.binarySearch(otroArray, num);
		System.out.println("");
		if (pos >= 0)
			System.out.printf("El valor " + num + " está contenido en el array, en la posición "+ pos);
		else
			System.out.println("El valor " + num + " no está en el array");

		
		//JAVA SE 8
		//El método parallelsort realiza una ordenación más rápida para arrays
		//muy largos
		int[] arrayGrande = new int[123456];
		//Este método sirve para inicializar un array con valores
		//y usa una expresión lambda, que aprenderemos a crear
		//en la última lección del curso
		Arrays.parallelSetAll(arrayGrande, i -> aleatorio(12345));		
		Arrays.parallelSort(arrayGrande);
	}
	
	/*
	 * ESTE MÉTODO DEVUELVE UN NÚMERO ALEATORIO ENTRE
	 * 0 y TOPE-1.
	 */
	public static int aleatorio(int tope) {
		Random r = new Random();		
		return r.nextInt(tope-1);
	}
	
	/*
	 * Este método imprime un array, indicando para
	 * cada elemento su valor y su posición
	 */
	public static void printArray(int[] array) {
		for(int i = 0; i < array.length; i++) {
			System.out.print("[" + i +"] = " + array[i] + "\t");
			if ((i > 0 && i % 10 == 0) ||(i == 0))
				System.out.println("");
		}
		System.out.println("");
	}
}


SALIDA:

Array generado
[0] = 30	
[1] = 71	[2] = 87	[3] = 12	[4] = 54	[5] = 41	[6] = 90	[7] = 91	[8] = 62	[9] = 24	[10] = 67	
[11] = 50	[12] = 6	[13] = 22	[14] = 23	[15] = 5	[16] = 26	[17] = 55	[18] = 37	[19] = 18	[20] = 50	
[21] = 45	[22] = 3	[23] = 2	[24] = 45	[25] = 55	[26] = 94	[27] = 10	[28] = 41	[29] = 17	[30] = 41	
[31] = 8	[32] = 42	[33] = 38	[34] = 37	[35] = 91	[36] = 35	[37] = 12	[38] = 96	[39] = 61	[40] = 34	
[41] = 3	[42] = 37	[43] = 82	[44] = 59	[45] = 3	[46] = 46	[47] = 14	[48] = 50	[49] = 77	[50] = 90	
[51] = 53	[52] = 70	[53] = 32	[54] = 12	[55] = 58	[56] = 17	[57] = 90	[58] = 5	[59] = 51	[60] = 52	
[61] = 8	[62] = 93	[63] = 16	[64] = 60	[65] = 38	[66] = 18	[67] = 84	[68] = 38	[69] = 2	[70] = 15	
[71] = 72	[72] = 61	[73] = 50	[74] = 22	[75] = 90	[76] = 81	[77] = 15	[78] = 28	[79] = 72	[80] = 80	
[81] = 37	[82] = 70	[83] = 14	[84] = 28	[85] = 95	[86] = 25	[87] = 75	[88] = 2	[89] = 35	[90] = 83	
[91] = 4	[92] = 6	[93] = 31	[94] = 80	[95] = 98	[96] = 44	[97] = 32	[98] = 40	[99] = 3	


Array ordenado
[0] = 0	
[1] = 0	[2] = 0	[3] = 0	[4] = 0	[5] = 0	[6] = 0	[7] = 0	[8] = 0	[9] = 0	[10] = 0	
[11] = 0	[12] = 0	[13] = 0	[14] = 0	[15] = 0	[16] = 0	[17] = 0	[18] = 0	[19] = 0	[20] = 0	
[21] = 0	[22] = 0	[23] = 0	[24] = 0	[25] = 0	[26] = 0	[27] = 0	[28] = 0	[29] = 0	[30] = 0	
[31] = 0	[32] = 0	[33] = 0	[34] = 0	[35] = 0	[36] = 0	[37] = 0	[38] = 0	[39] = 0	[40] = 0	
[41] = 0	[42] = 0	[43] = 0	[44] = 0	[45] = 0	[46] = 0	[47] = 0	[48] = 0	[49] = 0	[50] = 0	
[51] = 0	[52] = 0	[53] = 0	[54] = 0	[55] = 0	[56] = 0	[57] = 0	[58] = 0	[59] = 0	[60] = 0	
[61] = 0	[62] = 0	[63] = 0	[64] = 0	[65] = 0	[66] = 0	[67] = 0	[68] = 0	[69] = 0	[70] = 0	
[71] = 0	[72] = 0	[73] = 0	[74] = 0	[75] = 0	[76] = 0	[77] = 0	[78] = 0	[79] = 0	[80] = 0	
[81] = 0	[82] = 0	[83] = 0	[84] = 0	[85] = 0	[86] = 0	[87] = 0	[88] = 0	[89] = 0	[90] = 0	
[91] = 0	[92] = 0	[93] = 0	[94] = 0	[95] = 0	[96] = 0	[97] = 0	[98] = 0	[99] = 0	[100] = 2	
[101] = 2	[102] = 2	[103] = 3	[104] = 3	[105] = 3	[106] = 3	[107] = 4	[108] = 5	[109] = 5	[110] = 6	
[111] = 6	[112] = 8	[113] = 8	[114] = 10	[115] = 12	[116] = 12	[117] = 12	[118] = 14	[119] = 14	[120] = 15	
[121] = 15	[122] = 16	[123] = 17	[124] = 17	[125] = 18	[126] = 18	[127] = 22	[128] = 22	[129] = 23	[130] = 24	
[131] = 25	[132] = 26	[133] = 28	[134] = 28	[135] = 30	[136] = 31	[137] = 32	[138] = 32	[139] = 34	[140] = 35	
[141] = 35	[142] = 37	[143] = 37	[144] = 37	[145] = 37	[146] = 38	[147] = 38	[148] = 38	[149] = 40	[150] = 41	
[151] = 41	[152] = 41	[153] = 42	[154] = 44	[155] = 45	[156] = 45	[157] = 46	[158] = 50	[159] = 50	[160] = 50	
[161] = 50	[162] = 51	[163] = 52	[164] = 53	[165] = 54	[166] = 55	[167] = 55	[168] = 58	[169] = 59	[170] = 60	
[171] = 61	[172] = 61	[173] = 62	[174] = 67	[175] = 70	[176] = 70	[177] = 71	[178] = 72	[179] = 72	[180] = 75	
[181] = 77	[182] = 80	[183] = 80	[184] = 81	[185] = 82	[186] = 83	[187] = 84	[188] = 87	[189] = 90	[190] = 90	
[191] = 90	[192] = 90	[193] = 91	[194] = 91	[195] = 93	[196] = 94	[197] = 95	[198] = 96	[199] = 98	


El valor 71 está contenido en el array, en la posición 177
```


## Práctica: Creando el juego de hundir la flota 31:16 

[Práctica: Creando el juego de hundir la flota](pdfs/Hundir_la_flota.pdf)

![Hundir_la_flota-1](images/Hundir_la_flota-1.png)

En esta sesión práctica veremos como crear el juego de hundir la flota, tienes el código de ejemplo en el [repositorio de GitHub](https://github.com/OpenWebinarsNet/Curso-Java-desde-0/tree/master/16bis_HundirFlota).

![Hundir_la_flota-2](images/Hundir_la_flota-2.png)

![Hundir_la_flota-3](images/Hundir_la_flota-3.png)

![Hundir_la_flota-4](images/Hundir_la_flota-4.png)

### Código

*HundirLaFlota.java*

```java
/**
 * HUDIR LA FLOTA
 * 
 * Se trata de un juego clásico, en el que nos vamos a enfrentar al ordenador. Cada usuario dispone de un mapa
 * de 10x10 casillas, donde se colocarán barcos (dos de tamaño 5, tres de tamaño 3, y cinco de tamaño 1). 
 * Jugador y ordenador irán diciendo posiciones en el mapa, y el jugador opuesto tendrá que indicar si la "bomba"
 * ha caádo en el agua, o ha tocado algún barco.
 * 
 * Para simplificar el juego, en lugar de verificar si un barco completo se ha hundido, y cuantos barcos quedan a flote,
 * contabilizamos el número total de casillas correspondientes a un barco que no han sido "hundidas". Se parte con
 * 24 puntos (5+5+3+3+3+1+1+1+1+1) 
 * 
 * Este código está inspirado (aunque reescrito y simplificado) de un código original de Manuel Jesús Gallego Vela
 */
package hundirflota;

import java.util.Random;
import java.util.Scanner;

/**
 * @author 
 *
 */
public class HundirLaFlota {

	//CONSTANTES, que nos sirven para representar algunos valores
	final static char AGUA_NO_TOCADO = '.';
	final static char AGUA = 'A';
	final static char TOCADO = 'X';

	//TAMAÑO DEL TABLERO
	final static int TAMANIO = 10;
	
	private static Scanner sc;

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		//La clase Scanner nos permite, junto con System.in, leer desde el teclado
		sc = new Scanner(System.in);
		
		// Mapa del usuario y del ordenador
		char[][] mapaUsuario = new char[TAMANIO][TAMANIO];
		char[][] mapaOrdenador = new char[TAMANIO][TAMANIO];
		
		// Este tercer mapa nos sirve para anotar y visualizar
		// las tiradas que hacemos sobre el mapa del ordenador
		char[][] mapaOrdenadorParaUsuario = new char[TAMANIO][TAMANIO];
		
		// Puntos con los que comienzan las partidas		
		int puntosUsuario = 24;
		int puntosOrdenador = 24;
		
		// Lleva el control del programa.
		// Si no quedan barcos a flote del jugador o el ordenador, lo ponemos a true
		boolean juegoTerminado = false;

		// Indica si el tiro es correcto, para volver a realizar otro
		boolean tiroCorrecto = false;

		//Posiciones de la tirada
		int[] tiro = new int[2];

		// Inicializamos los mapas, colocando los barcos
		inicializacion(mapaUsuario, mapaOrdenador);
		// Inicializamos el mapa de registro a AGUA_NO_TOCADO
		inicializaMapaRegistro(mapaOrdenadorParaUsuario);

		//Mientras queden barcos a flote
		while (!juegoTerminado) {

			// Al principio del turno, pintamos el mapa del usuario
			System.out.println("MAPA DEL USUARIO");
			imprimirMapa(mapaUsuario);
			
			System.out.printf("PUNTOS RESTANTES DEL JUGADOR: %d\n", puntosUsuario);
			System.out.println("TURNO DEL JUGADOR");
			
			//Comenzamos con la tirada del usuario
			tiroCorrecto = false;
			while (!tiroCorrecto) {
				//Solicitamos los datos por teclado.
				tiro = pedirCasilla();
				//Verificamos si el tiro es correcto o no
				if (tiro[0] != -1 && tiro[1] != -1) {
					//Puede ser INCORRECTO porque ya haya tirado
					//sobre esas coordenadas
					tiroCorrecto = evaluarTiro(mapaOrdenador, tiro);
					if (!tiroCorrecto)
						System.out.println("TIRO INCORRECTO");	
				} else {
					System.out.println("TIRO INCORRECTO");
				}
				//De no serlo, el jugador debe volver a tirar
				
			}
			
			//Actualizamos mapa del ordenador y los puntos
			int puntosOrdenadorAnterior = puntosOrdenador;
			puntosOrdenador = actualizarMapa(mapaOrdenador, tiro, puntosOrdenador);
			
			//Actualizamos nuestro mapa de registro y lo imprimimos.
			//Sabemos si la tirada ha sido AGUA O TOCADO si el número de puntos se ha decrementado.
			char tipoTiro = (puntosOrdenadorAnterior - puntosOrdenador) > 0 ? TOCADO : AGUA; 
			actualizarMapaRegistro(mapaOrdenadorParaUsuario,tiro, tipoTiro);
			System.out.println("\nREGISTRO DEL MAPA DEL ORDENADOR");
			imprimirMapa(mapaOrdenadorParaUsuario);
			
			//El juego termina si el número de puntos llega a 0
			juegoTerminado = (puntosOrdenador == 0);
			
			
			//Si no ha ganado el jugador, le toca a la máquina
			if (!juegoTerminado) {
				
				System.out.printf("PUNTOS RESTANTES DEL ORDENADOR: %d\n\n", puntosOrdenador);
				System.out.println("TURNO DEL ORDENADOR");
				tiroCorrecto = false;
				//Seguimos los mismos parámetros de comprobación que en la tirada del usuario
				while (!tiroCorrecto) {
					tiro = generaDisparoAleatorio();
					tiroCorrecto = evaluarTiro(mapaUsuario, tiro);
				}
			}
			//Actualizamos mapa
			puntosUsuario = actualizarMapa(mapaUsuario, tiro, puntosUsuario);
			//El juego termina si el número de puntos llega a 0			
			juegoTerminado = (puntosUsuario == 0);

		} //FIN DE LA PARTIDA. Alguien ha ganado
				
		if (puntosOrdenador == 0) {
			System.out.println("EL VENCEDOR HA SIDO EL JUGADOR");
		} else 
			System.out.println("EL VENCEDOR HA SIDO EL ORDENADOR");

		sc.close();
	}

	
	/*
	 * Método que sirve para que el ordenador pueda hacer un disparo
	 */
	private static int[] generaDisparoAleatorio() {		
		return new int[] {aleatorio(), aleatorio()};
	}


	/*
	 * Metodo que aglutina la inicialización de ambos mapas
	 */
	public static void inicializacion(char[][] m1, char[][] m2) {
		inicializaMapa(m1);
		inicializaMapa(m2);
	}
	
	/*
	 * Método que inicializa el mapa que mostramos al usuario
	 * con las tiradas que ha hecho sobre el mapa del ordenador.
	 */
	private static void inicializaMapaRegistro(char[][] mapa) {
		// Inicializamos el mapa entero a AGUA_NO_TOCADO
		for (int i = 0; i < TAMANIO; i++)
			for (int j = 0; j < TAMANIO; j++)
				mapa[i][j] = AGUA_NO_TOCADO;
		
	}

	/*
	 * Método que inicializa un mapa de juego, colocando
	 * los barcos sobre el mismo.
	 */
	private static void inicializaMapa(char[][] mapa) {

		// Inicializamos el mapa entero a AGUA_NO_TOCADO
		for (int i = 0; i < TAMANIO; i++)
			for (int j = 0; j < TAMANIO; j++)
				mapa[i][j] = AGUA_NO_TOCADO;

		// 2 portaaviones (5 casillas)
		// 3 buques (3 casillas)
		// 5 lanchas (1 casilla)
		int[] barcos = { 5, 5, 3, 3, 3, 1, 1, 1, 1, 1 };

		// Posible dirección de colocación del barco
		char[] direccion = { 'V', 'H' };

		// Para cada barco
		for (int b : barcos) {

			// Intentamos tantas veces sea necesarias para colocar el barco en el mapa.
			// Vamos de mayor tamaño a menor, para que sea menos
			// dificultoso encontrar un hueco
			boolean colocado = false;
			while (!colocado) {

				//Obtenemos una posición y dirección aleatorias
				int fila = aleatorio();
				int columna = aleatorio();
				char direcc = direccion[aleatorio() % 2];

				// ¿Cabe el barco en la posición indicada?
				if (direcc == 'V') {
					if (fila + b <= (TAMANIO - 1)) {
						// comprobamos que no hay otro barco que se solape
						boolean otro = false;
						for (int i = fila; (i <= fila + b) && !otro; i++) {
							if (mapa[i][columna] != AGUA_NO_TOCADO)
								otro = true;
						}
						// Si no hay otro barco, lo colocamos
						if (!otro) {
							for (int i = fila; i < fila + b; i++) {
								mapa[i][columna] = Integer.toString(b).charAt(0);
							}
							colocado = true;
						}
					}
				} else { // direcc == 'H'
					if (columna + b <= (TAMANIO - 1)) {
						// comprobamos que no hay otro barco que se solape
						boolean otro = false;
						for (int j = columna; (j <= columna + b) && !otro; j++) {
							if (mapa[fila][j] != AGUA_NO_TOCADO)
								otro = true;
						}
						// Si no hay otro barco, lo colocamos
						if (!otro) {
							for (int j = columna; j < columna + b; j++) {
								mapa[fila][j] = Integer.toString(b).charAt(0);
							}
							colocado = true;
						}
					}
				}

			}
		}

	}

	/*
	 * Método que nos devuelve un número aleatorio
	 */
	private static int aleatorio() {
		Random r = new Random(System.currentTimeMillis());
		return r.nextInt(TAMANIO);
	}

	/*
	 * Método que imprime un mapa, con una fila y columna de encabezados
	 */
	public static void imprimirMapa(char[][] mapa) {

		// Calculamos las letras según el tamaño
		char[] letras = new char[TAMANIO];
		for (int i = 0; i < TAMANIO; i++)
			letras[i] = (char) ('A' + i);

		// Imprimimos la fila de encabezado
		System.out.print("    ");
		for (int i = 0; i < TAMANIO; i++) {
			System.out.print("[" + i + "] ");
		}

		System.out.println("");
		// Imprimimos el resto de filas
		for (int i = 0; i < TAMANIO; i++) {
			System.out.print("[" + letras[i] + "]  ");
			for (int j = 0; j < TAMANIO; j++) {
				System.out.print(mapa[i][j] + "   ");
			}
			System.out.println("");
		}
	}

	/*
	 * Método mediante el cual el usuario introduce una casilla
	 */
	private static int[] pedirCasilla() {
		
		System.out.println("Introduzca la casilla (por ejemplo B4): ");
		String linea = sc.nextLine();
		//Pasamos la cadena a mayúsculas
		linea = linea.toUpperCase();
		int[] t;

		
		// Comprobamos que lo introducido por el usaurio es correcto mediante una expresión regular
		if (linea.matches("^[A-Z][0-9]*$")) {

			// Obtenemos la letra.
			// Suponemos que, como mucho, usaremos una letra del abecedario
			char letra = linea.charAt(0);
			// El número de fila es VALOR_NUMERICO(LETRA) - VALOR_NUMERICO(A).
			int fila = Character.getNumericValue(letra) - Character.getNumericValue('A');
			// Para la columna, tan solo tenemos que procesar el número
			int columna = Integer.parseInt(linea.substring(1, linea.length()));
			// Si las coordenadas están dentro del tamaño del tablero, las devolvemos
			if (fila >= 0 && fila < TAMANIO && columna >= 0 && columna <= TAMANIO) {
				t = new int[]{ fila, columna };
			} else //En otro caso, devolvemos -1, para que vuelva a solicitar el tiro
				t =  new int[] { -1, -1 };
		} else 
			t =  new int[] { -1, -1 };
		
		
		return t;

	}

	/*
	 * Método que nos permite evaluar si un tiro es CORRECTO (AGUA o TOCADO)
	 * o se trata de una casilla por la que ya hemos pasado antes.
	 */
	public static boolean evaluarTiro(char[][] mapa, int[] t) {
		int fila = t[0];
		int columna = t[1];
		return mapa[fila][columna] == AGUA_NO_TOCADO || (mapa[fila][columna] >= '1' && mapa[fila][columna] <= '5'); 
		
	}
	
	/*
	 * Método que actualiza el mapa, con un determinado tiro. 
	 * Devolvemos el número de puntos restantes.
	 */
	private static int actualizarMapa(char[][] mapa, int[] t, int puntos) {
		int fila = t[0];
		int columna = t[1];
		
		if (mapa[fila][columna] == AGUA_NO_TOCADO) {
			mapa[fila][columna] = AGUA;
			System.out.println("AGUA");
		} else {			
			mapa[fila][columna] = TOCADO;
			System.out.println("HAS ALCANZADO A ALGÚN BARCO");
			--puntos;
		}
		
		return puntos;
		
		
	}
	/*
	 * Método que actualiza el mapa de registro
	 */
	private static void actualizarMapaRegistro(char[][] mapa, int[] t, char valor) {
		int fila = t[0];
		int columna = t[1];

		mapa[fila][columna] = valor;
	}

}
```

**SALIDA:**

```sh
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   3   3   3   .   1   .   .   
[E]  5   .   .   .   1   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   1   .   .   
[I]  .   .   .   .   .   .   3   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 24
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
A1
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   .   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   .   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   .   .   .   .   .   .   .   .   
[H]  .   .   .   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 24

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   1   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   1   .   .   
[I]  .   .   .   .   .   .   3   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 23
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
B7
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   .   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   .   .   .   .   .   .   .   .   
[H]  .   .   .   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 24

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   1   .   .   
[I]  .   .   .   .   .   .   3   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 22
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
E3
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   A   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   .   .   .   .   .   .   .   .   
[H]  .   .   .   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 24

TURNO DEL ORDENADOR
AGUA
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   1   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 22
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
H2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   A   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   .   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 23

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 21
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
G2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   A   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 22

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 20
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
F2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 21

TURNO DEL ORDENADOR
AGUA
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 20
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
E2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   X   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 20

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  X   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 19
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
I2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   X   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   X   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 19

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  X   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   X   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 18
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
J2
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   X   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   X   .   .   .   .   .   .   .   
[J]  .   .   A   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 19

TURNO DEL ORDENADOR
AGUA
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  X   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   X   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   A   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 18
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
D2
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   A   .   .   .   .   .   .   .   
[E]  .   .   X   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   X   .   .   .   .   .   .   .   
[J]  .   .   A   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 19

TURNO DEL ORDENADOR
AGUA
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  X   .   .   A   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   X   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   A   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 18
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
```

## Contenido adicional 4   

[Conoce Java API Docs](pdfs/14_Conoce_JAVA_API_DOCS.pdf)

[Uso de la clase String](pdfs/15_Uso_de_la_clase_String.pdf)

[Manejo de Arrays](pdfs/16_Arrays.pdf)

[Práctica: Creando el juego de hundir la flota](pdfs/Hundir_la_flota.pdf)
