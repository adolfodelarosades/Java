# 8. Algunas clases del API de Java 82m

   * 30 Manipulación de datos con Stringbuilder 8:01 
   * 31 Manejo de fechas 17:31 
   * 32 Colecciones ArrayList 11:30 
   * 33 Introducción a las expresiones lambda 20:21 
   * 34 Práctica: Creando un gestor de aparcamiento de coches 25:16 
   * Contenido adicional 6
      
# 30. Manipulación de datos con Stringbuilder 8:01 

[Manipulación de datos con Stringbuilder](pdfs/30_StringBuilder.pdf)

## Resumen del Profesor

Conoce el tipo de cadena Stringbuilder en esta lección

## Transcripción

![30_StringBuilder-1](images/30_StringBuilder-1.png)

Vamos a comenzar el último bloque de este curso de Java desde cero en el que vamos a conocer algunas de las clases más utilizadas del API de Java de las clases que Java nos proporciona, así como una introducción a la gran novedad de Java 8 qué ha sido el uso de la expresión Lambda.

![30_StringBuilder-2](images/30_StringBuilder-2.png)

Comencemos en este caso con la manipulación de cadenas de caracteres de datos con la clase `StringBuilder`. `StringBuilder` surge a raíz de la cuestión de que la clase **`String` es una clase inmutable**, con inmutable queremos decir que **es una clase cuyo valor no se puede modificar**, una vez inicializado no se puede modificar su valor, esto ofrece sus ventajas pero también tienes sus inconvenientes y es que si nosotros queremos hacer operaciones sobre todo de concatenación de varias cadenas de caracteres o de sustitución parcial de algún fragmento de la cadena, nos encontramos con que cualquier operación de este tipo **producíra siempre una nueva cadena** por lo cual vamos a sobrecargando la memoria y las operaciones son francamente ineficientes.

**Un objeto de `StringBuilder`** nos va a permitir representar una cadena un `String` pero que si será modificable, que **será mutable** y por ende será más eficiente para cadenas que van a ser modificadas o que queremos darle otro tratamiento que no sea diferente a simplemente crearlas y utilizarlas tal cual.

![30_StringBuilder-3](images/30_StringBuilder-3.png)

A la hora de construir una instancia de tipo `StringBuilder` tenemos que tener en cuenta los conceptos de **tamaño y capacidad**, el tamaño de un `StringBuilder` va a ser igual que el de un `String` es decir el número de caracteres que tenga, sin embargo **`StringBuilder` incorpora el concepto de capacidad** y es que podemos crear una instancia de `StringBuilder` que tenga un tamaño menor a la capacidad que tenga, es decir al cuál le quepan todavía más caracteres, pueda alojar un número de caracteres superior, de hecho cuando nosotros creamos una instancia de `StringBuilder` con su constructor sin parámetros, crea un `StringBuilder` vacío pero con una capacidad de 16 caracteres, es decir si invocaramos directamente a `length()` devolvería 0 pero el método `capacity()` devolvería 16. Tenemos otra serie de constructores en particular parece interesante el que permite construir un `StringBuilder` a partir de una instancia de `String` o el que nos permite indicar la capacidad inicial de un `StringBuilder` si es que prevemos que va a ser muy superior a los 16 caracteres. 

![30_StringBuilder-4](images/30_StringBuilder-4.png)

Aquí tenemos un pequeño gráfico que ilustra la diferencia entre tamaño y capacidad, si creamos un `StringBuilder` vacío y le añadimos una serie de caracteres para saludar, podemos comprobar como le hemos añadido una cadena con 9 caracteres que ocuparían desde el índice 0 hasta el 8, pero desde el índice 9 hasta el 15, es decir hasta completar la capacidad 16 estaría vacío, pero estaría disponible para que nosotros lo pudiéramos utilizar. 

![30_StringBuilder-5](images/30_StringBuilder-5.png)

La clase `StringBuilder` tiene una serie de métodos que nos van a permitir manejar la longitud, nos va a permitir cambiar la longitud de un `StringBuilder`, si la nueva longitud es menor que la actual los caracteres que quedarían a la derecha de esa longitud son truncados, de decir que se perderían, si es mayor lo que se añadirían serían elementos vacíos y a diferencia de `setLength` lo que hace el método `ensureCapacity` es asegurar que la capacidad de este `StringBuilder` sea al menos la del `minCapacity` que le estamos pasando.

Algunos métodos como `append()` que acabamos de ver que lo que hace es agregar una serie de caracteres al final del `StringBuilder`, es decir a continuación del último carácter, pueden aumentar la capacidad de nuestros `StringBuilder` de manera transparente a nosotros. 

![30_StringBuilder-6](images/30_StringBuilder-6.png)

Antes de ver los ejemplos conozcamos algunos de las operaciones que podemos hacer con `StringBuilder`. Ya hemos visto que podemos usar el método `append()` que nos permite añadir a continuación del último carácter que tengamos una cadena de caracteres y también tiene sobreescrito el método `append()` para los diferentes tipos primitivos, si le pasamos un tipo de dato que no es primitivo lo que hace es transformarlo antes de pasarlo. 

Tenemos también el método `delete()` que elimina una secuencia de caracteres dentro del `StringBuilder`. 

Tenemos el método `insert()` que inserta el segundo argumento tanto si es de tipo `String` como de tipo primitivo en la cadena, `offset` es el primero lo que indica la posición a partir de la cual se va insertar.

El método `replace()` que lo que hace es reemplazar un carácter o una cadena de caracteres a partir de una posición o a partir de un inicio y un fin.

Y otros métodos bastante útiles como el método `reverse()` que nos devuelven la cadena pero dada la vuelta.

Por último decir que si necesitamos utilizar el método `StringBuilder` como si fuera una cadena de caracteres tenemos el método `toString()` que nos devolvería una instancia inmutable del contenido de ese `StringBuilder` que inicialmente es mutable.

### :computer: `101-30-StringBuilder`

Veamos algunos ejemplos, tendríamos la posibilidad de hacer una especie de conversor de palíndromos, un palíndromo en una frase que en principio se lee igual de izquierda a derecha o de derecha a izquierda obviando un poco los espacios, uno de los más clásicos es `dabale arroz a la zorra el Abad` si lo leyera de derecha izquierda ya digo obviando un poco los espacios en blanco, veríamos que se leería igual, que en el fondo son las mismas palabras, son como los números capicúa pero aplicado a la frase.

Tendríamos la posibilidad de darle un tratamiento con `String` ineficiente y con `StringBuilder` bastante más eficiente.

*`PalindromosString`*

```java
package usodestringbuilder;

public class PalindromosString {
   public static void main(String[] args) {

      String palindromo = "Dabale arroz a la zorra el abad";
      int longitud = palindromo.length();
      char[] tempCharArray = new char[longitud];
      char[] charArray = new char[longitud];

      // transformamos el string en un array de char
      for (int i = 0; i < longitud; i++) {
         tempCharArray[i] = palindromo.charAt(i);
      }

      // lo invertimos
      for (int j = 0; j < longitud; j++) {
         charArray[j] = tempCharArray[longitud - 1 - j];
      }

      String palindromoInvertido = new String(charArray);
      System.out.println(palindromoInvertido);

   }
}
```

![30-01](images/30-01.png)

Tendríamos la frase, recuperamos su longitud, construiriamos una serie de arrays de Char para darle ese tratamiento, transformar el `String` en un array `char` que lo haríamos posición a posición, lo invertiríamos, crearíamos la nueva frases y podríamos comprobar si al darle la vuelta a la frase, lo comprobariamos manualmente no nos hemos parado a implementar la comprobación, si esto que tenemos aquí escrito se parece a esto que tenemos en la salida.

Esto que con una cadena de tipo `String` es muy ineficiente sería bastante más sencillo con el uso de la clase `StringBuilder` cómo podemos comprobar.

*`PalindromosStringBuilder`*

```java
package usodestringbuilder;

public class PalindromosStringBuilder {

   public static void main(String[] args) {

      String palindromo = "Dabale arroz a la zorra el abad";
      StringBuilder sb = new StringBuilder(palindromo);
      sb.reverse(); // lo invertimos
      System.out.println(sb); // llamada implícita a sb.toString().

   }
}
```

![30-02](images/30-02.png)

Podemos construir un `StringBuilder` a partir de un `String` tan solo tendríamos que darle la vuelta con el método `reverse()` y lo imprimimos, no teníamos que hacer toda esta sucesión de operaciones auxiliares.

Por lo cual os recomiendo que si vamos a trabajar con una cadena de caracteres que va a ser modificadas en el tiempo usemos siempre la clase `StringBuilder` a través de su método `append()`,  `reverse()`, `insert()` y si por contra vamos a crear una cadena de caracteres que no vaya a ser modificada nunca pues podemos usar la clase `String`


# 31. Manejo de fechas 17:31 

[Manejo de fechas](pdfs/31_Manejo_de_fechas.pdf)

## Resumen del Profesor

El API de fechas de Java 8 posee varias clases para manejarlas, pero la mayoría de ellas sigue esta convención sobre el nombre de los métodos que sirven para manejarlas.

Nombre | Tipo     | Uso
-------|----------|----
`of`   | estático |	Crear una instancia del objeto a partir de los datos de entrada
`from` | estático	| Convertir el parámetro de entrada en una instancia de la clase
`parse`| estático	| Procesar la cadena de entrada y construir una instancia
`format`| instancia |	Procesar los datos para producir una cadena de caracteres
`get`  | instancia | Devolver una parte del objeto
`is`   | instancia | Consultar el estado del objeto
`with` | instancia | Devolver una copia del objeto con uno o varios elementos modificados
`plus` | instancia | Devolver una copia del objeto con una cantidad de tiempo añadido
`minus`| instancia | Devolver una copia del objeto con una cantidad de tiempo sustraído
`to`   | instancia | Convertir el objeto en otro Tipo
`at`   | instancia | Combinar el objeto con otro objeto

## Transcripción

![31_Manejo_de_fechas-1](images/31_Manejo_de_fechas-1.png)

Vamos a continuar con el uso de alguna de las clases que no ofrece Java conociendo otra gran novedad de Java 8 que el manejo de fecha.

Hasta las versiones anteriores de Java el manejo de fecha en Java era horrible, por no decir alguna cosa peor, el tratamiento de fechas se hacía a través de una sola clase `Date` donde los métodos que a priori podrían parecer más interesantes estaban deprecados desde la versión 2 de Java aproximadamente, con lo cual para crear una fecha necesitas otra clase auxiliar que era una clase de tipo `Calendar` sobre todo en calendario gregoriano que es el que nosotros manejamos y bueno todo el tratamiento de fechas era horriblemente tedioso.

![31_Manejo_de_fechas-2](images/31_Manejo_de_fechas-2.png)

Java 8 se ha puesto las pilas en ese sentido y basándose en una librería llamada **joda-time** que ya existía desde hace tiempo, lo ha incorporado al estándar y lo ha definido mediante el documento JSR-310. Utilizando además con un calendario predeterminado que el que define la normativa ISO-8601.

![31_Manejo_de_fechas-3](images/31_Manejo_de_fechas-3.png)

Es decir ahora para el manejo de fechas, Java nos ofrece un buen grueso de clases diferentes entre las que destacan `LocalDate` y `LocalDateTime` que serán clases que nos permitirán manejar fechas o fechas y horas pero dentro de nuestro ámbito horario.

También podremos crear una fecha o una fecha y hora que estará en una determinada zona que nosotros podremos manejar o incluso tendrá clases que nos permitirán manejar no instante concreto o fechas concretas o fecha y hora sino periodos de tiempo o periodo de duración. Además nos va a ayudar a manejar elementos complejos como no podíamos hacerlo antes como el uso del años bisiestos, la zona horaria, horario de verano, horarios de invierno, todo eso es capaz de manejarlo el nuevo API.

![31_Manejo_de_fechas-4](images/31_Manejo_de_fechas-4.png)

Se ha hecho siguiendo una serie de principios de diseño, que os presentamos por aquí el uso tenía que ser claro, es decir en el uso de los distintos métodos de la clases tiene que ser el esperado según su nombre, que fuese fluido, es decir que pudiéramos encadenar llamadas a métodos que nos hicieran un código legible y todo muy en el estilo de Java 8, que los objetos sean inmutables y que además fuese extensible, por ejemplo si nosotros tuviéramos que crear nuestro propio sistema de calendario lo pudiéramos hacer. 

En la diapositiva algún ejemplo de cómo crear una fecha, de cómo manejar una fecha para ajustarle un determinado día o para obtener una fecha no solo la de hoy sino a partir de una serie de cifras, añadirle, restarle cantidades etc.

Si accedemos a la documentación de Java DOC del paquete `java.time`.

https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/time/package-summary.html

![31-01](images/31-01.png)

![31-02](images/31-02.png)

Podría encontrar todas y cada una de las clases que ofrece y encontrareis un montón de información súper concreta sobre cada una de las clases.

![31_Manejo_de_fechas-5](images/31_Manejo_de_fechas-5.png)

**Si les puedo decir a modo común que todas las clases siguen una serie de convención de métodos**, suelen tener el método `of` y el método `from` ambos estático y qué **el método `of` sirve para crear una instancia del objeto del tipo sobre el que estamos llamando a partir de una serie de datos entrada**, en la diapositiva pasada teníamos la manera de crear un objeto de tipo `LocalDate` a partir de un año, mes y día. 

Tenemos también la posibilidad de **convertir algo que no es** un `LocalDate` o un `LocalDateTime` o un `ZoneTime` en un objeto **a partir de ese parámetro de entrada** con el **método `from`**

El **método `parse`** nos permiten procesar una cadena de caracteres para obtener una instancia de esa clase.

El **método `format`** procesaría los datos de una cadena sobre la cual estamos llamando, para producir una cadena de caracteres, usualmente para visualizar una parte o todos los datos de esa fecha u hora.

El **método `get`**, el **método `is`**, el **método `with`**, que veremos que tiene bastante implementaciones nos permite devolver una parte de un objeto, consulta una parte de un objeto, el estado, si se cumpla una determinada propiedad, por ejemplo si un año es bisiesto o alguna fecha es posterior a otra, lo podríamos hacer mediante métodos `is` y el método `with` en donde devuelve una copia de un objeto ajustando algún tipo de parámetro, por ejemplo el día de cobro lo podríamos ubicar como dos días antes del último día del mes de la fecha actual, esto lo podemos hacer con el método `with` como lo muestra la diapositiva pasada.

![31_Manejo_de_fechas-6](images/31_Manejo_de_fechas-6.png)

Algunos métodos más que nos vamos a encontrar, los **métodos `plus`** y **`minus`** que nos permiten añadir una unidad o restar una unidad en días, meses o años a una determinada fecha y los **métodos `to`** y **`at`**, el método `to` que nos permite **convertir un objeto en otro tipo** y el método `at` que **combina un objeto con otro objeto para producir otro**.

### :computer: `101-31-Fechas`

Vamos a ver una sucesión de ejemplo sencillo que tenéis aquí de la A a la O para poder ver elementos sencillos de tratamiento de fechas.

Por ejemplo si quisieramos obtener la fecha concreta de hoy día mes y año lo podríamos hacer con el método estático `now()` de la clase `LocalDate`, si imprimimos podemos ver cómo está tomando la fecha actual y después la esta imprimiendo sobre el formato de impresión, está imprimiendo en un formato estándar, veremos después como se puede modificar.

*`A_FechaHoy`*

```java
package fechas;

import java.time.LocalDate;

public class A_FechaHoy {
	
   public static void main(String[] args) {

      LocalDate hoy = LocalDate.now();
      System.out.println("La fecha actual es : " + hoy);

   }

}
```

![31-03](images/31-03.png)

Si quisieamos obtener el día, el mes y el año de un `LocalDate` lo podríamos hacer a través de los diferentes **métodos `get`** que nos ofrecen, `getYear()` nos devuelve el año, `getMonthValue()` nos devuelve el mes y el día del mes lo podríamos obtener con el método `getDayOfMonth()`, usamos `printf` para formatear la salida.

*`B_DiaMesAnio`*

```java
package fechas;

import java.time.LocalDate;

public class B_DiaMesAnio {

   public static void main(String[] args) {
      LocalDate hoy = LocalDate.now();
      int year = hoy.getYear();
      int month = hoy.getMonthValue();
      int day = hoy.getDayOfMonth();
      System.out.printf("Año : %d Mes : %d Día : %d \t %n", year, month, day);

   }
}
```

![31-04](images/31-04.png)

Si en lugar de usar la fecha de hoy queremos colocar la fecha de nacimiento lo podríamos hacer a través del método estático `of(1982, 9, 18)` con el año, mes y día podríamos obtener una instancia de `LocalDate` algo muy comodo ya digo, solamente este proceso con la fecha antes de Java 8 ya era tedioso utilizando `Date` utilizando `Calendar` terriblemente tedioso, esto es mucho más conciso y más concreto.


*`C_FechaConcreta`*

```java
package fechas;

import java.time.LocalDate;

public class C_FechaConcreta {

   public static void main(String[] args) {

      LocalDate nacimiento = LocalDate.of(1982, 9, 18);
      System.out.println("Tu fecha de nacimiento es : " + nacimiento);

   }
	
}
```

![31-05](images/31-05.png)

Podemos comparar y saber si dos fechas son iguales a través de este ejemplo si por ejemplo queremos obtener la fecha del 19 del 08 del 2020 y la fecha de hoy, las podríamos comparar si son la misma fecha mediante el método `equals` que nos permitiría saber si son o no son la misma fecha. 

*`D_FechasIguales`*

```java
package fechas;

import java.time.LocalDate;

public class D_FechasIguales {

   public static void main(String[] args) {
      LocalDate fecha = LocalDate.of(2020, 8, 19);
      LocalDate hoy = LocalDate.now();
      if (fecha.equals(hoy)) {
         System.out.printf("Hoy %s y la fecha %s son la misma fecha", hoy, fecha);
      } else {
         System.out.println("Las fechas no son iguales");
      }

   }

}
```

![31-06](images/31-06.png)

El manejo de otro tipo de fechas que son un poco peculiares, lo podemos plantear con los llamados eventos recurrentes y para ellos nos plantea `java.time` otra clase, por ejemplo nosotros cumplimos años el mismo día del mismo mes de todos los años ( a excepción de los nacidos el 29 de Febrero), pues tenemos una clase `MonthDay` que nos permite albergar una fecha sin año, nos permite guardar el día y mes de una fecha pero no el año y lo podríamos utilizar para almacenar eventos recurrentes como por ejemplo tenemos aquí el día del nacimiento, si alguien naciera por ejemplo en el día `11/11/2017` podríamos guardar su día y mes de nacimiento en un `MonthDay` llamado `diaNacimiento` o también tenemos un ejemplo de `MonthDay` con `from` que nos permite obtener un `MonthDay` a partir de un `LocalDate` procesa este `LocalDate` obtiene lo que quiere y lo construye. Despúes compara ambos `MonthDay` si estos fueran iguales nos felicitaría por que hoy será nuestro cumpleaños.

*`E_EventosRecurrentes`*

```java
package fechas;

import java.time.LocalDate;
import java.time.MonthDay;

public class E_EventosRecurrentes {

   public static void main(String[] args) {
      LocalDate nacimiento = LocalDate.of(2017, 11, 11);
      MonthDay diaNacimiento = MonthDay.of(nacimiento.getMonth(), nacimiento.getDayOfMonth());
      MonthDay diaMesHoy = MonthDay.from(LocalDate.now());
      if (diaMesHoy.equals(diaNacimiento)) {
         System.out.println("Muchas felicidades, porque es tu cumpleaños");
      } else {
         System.out.println("Lo siento, pero no es tu cumpleaños");
      }

   }
}
```

![31-07](images/31-07.png)


Para manejar la hora tenemos otra clase que es `LocalTime` que es análoga a la de `LocalDate` y nos permite conocer la hora actual, fijaos como nos permite conocer incluso hasta los nanosegundos, cosa que antes no podíamos manejar.

*`F_HoraActual`*

```java
package fechas;

import java.time.LocalTime;

public class F_HoraActual {
	
   public static void main(String[] args) {
      LocalTime time = LocalTime.now();
      System.out.println("La hora actual es : " + time);

   }

}
```

![31-08](images/31-08.png)

Si queremos añadir o disminuir una serie de días, horas, en este caso una hora determinada a un `LocalTime` le queremos añadir 2 horas, podríamos añadirlo a través de los métodos `plus`, podemos ver que tenemos varias implementaciones de `plus` y de `minus` para sumar o restar un número de horas determinado. En este ejemplo estamos añadiendo dos horas al hora actual.

*`G_AniadirHoras`*

```java
package fechas;

import java.time.LocalTime;

public class G_AniadirHoras {
	
   public static void main(String[] args) {
		
      LocalTime time = LocalTime.now();
      LocalTime newTime = time.plusHours(2); // añadiendo dos horas 
      System.out.println("Hora, después de 2 horas : " + newTime);

   }

}
```

![31-09](images/31-09.png)

Tenemos también un método generico `plus` y `minus` en el que le podemos indicar una cantidad y a partir de una enumeración de `ChronoUnit` le podemos indicar el tipo de unidad de tiempo que le estamos añadido, por ejemplo a una fecha si siquiera sumarle una semana, pues podríamos sumarselo con `plus` indicando 1 y en `ChronoUnit` podemos ver como tenemos diferentes unidades de tiempo centurias, días, decadas, medios días, horas, milenios.

![31-11](images/31-11.png)

la verdad que está muy muy completo y podríamos ver la diferencia entre la fecha de hoy y la fecha de dentro de una semana. 


*`H_UnaSemanaDespues`*

```java
package fechas;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class H_UnaSemanaDespues {
	
   public static void main(String[] args) {

      LocalDate nextWeek = LocalDate.now().plus(1, ChronoUnit.WEEKS);
      System.out.println("Hoy es : " + LocalDate.now());
      System.out.println("Dentro de 1 semana: " + nextWeek);

   }

}
```

![31-10](images/31-10.png)

Podemos también sumar años o restar años a una determinada fecha con los métodos `plus` y `minus`.

*`I_FechaHaceUnAnio`*

```java
package fechas;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class I_FechaHaceUnAnio {
	
   public static void main(String[] args) {

      LocalDate today = LocalDate.now();
      LocalDate previousYear = today.minus(1, ChronoUnit.YEARS);
      System.out.println("Fecha hace un año: " + previousYear);
      LocalDate nextYear = today.plus(1, ChronoUnit.YEARS);
      System.out.println("Fecha dentro de 1 año : " + nextYear);

   }

}
```

![31-12](images/31-12.png)

Para comparar fechas decíamos que teníamos algunos métodos y por ejemplo tenemos los método `isAfter` e `isBefore` que nos permiten indicar si una fecha es posterior o es anterior a otra.

*`J_CompararFechas`*

```java
package fechas;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class J_CompararFechas {
	
   public static void main(String[] args) {
		
      LocalDate today = LocalDate.now();
      LocalDate otraFecha = LocalDate.of(2017, 12, 24);
      if (otraFecha.isAfter(today)) {
         System.out.println("La otra fecha es posterior a la de hoy");
      }
      LocalDate ayer = today.minus(1, ChronoUnit.DAYS);
      if (ayer.isBefore(today)) {
         System.out.println("Ayer es anterior a hoy");
      }

   }

}
```

![31-13](images/31-13.png)

Para fechas fijas del mes del año como por ejemplo la caducidad de una tarjeta de crédito, no caducan nunca un determinado día del mes si no que si miran vuestra tarjeta de débito o crédito caduca en un mes y un año, pues lo podríamos hacer con la clase `YearMonth` que nos permitiría obtener un año y mes actual, aquí por ejemplo actual sería Afosto del 2020 y podemos también ver la longitud en días del mes actual con el método `lengthOfMonth()` y si quisieramos como decía antes usarlo por ejemplo para una tarjeta de crédito, podríamos decir su tarjeta caduca en febrero de 2022 creandolo con el con el método `of` de esta manera.

*`K_FechasFijas`*

```java
package fechas;

import java.time.Month;
import java.time.YearMonth;

public class K_FechasFijas {
	
   public static void main(String[] args) {
		
      YearMonth anioYMesActual = YearMonth.now();
      System.out.printf("Días en la clase MonthYear %s: %d%n", anioYMesActual, anioYMesActual.lengthOfMonth());
      YearMonth caducidadTarjetaCredito = YearMonth.of(2022, Month.FEBRUARY);
      System.out.printf("Su tarjeta de crédito caduca en %s ", caducidadTarjetaCredito);

   }

}
```

![31-14](images/31-14.png)

Un auténtico quebradero de cabeza que hay siempre en el manejo de fechas es el manejo de si una fecha pertenece a un año bisiesto, Java 8 nos elimina eso con el método `isLeapYear()` que nos devuelve verdadero si el año de la fecha es biciesto y falso si no lo es, particular el año 2020 es bisiesto. 

*`L_Bisiesto`*

```java
package fechas;

import java.time.LocalDate;

public class L_Bisiesto {
	
   public static void main(String[] args) {
		
      LocalDate today = LocalDate.now();
      if (today.isLeapYear()) {
         System.out.println("Este año es bisiesto");
      } else {
         System.out.println("Este año no es bisiesto");
      }

   }

}
```

![31-15](images/31-15.png)

No solamente podemos manejar un momento concreto, sino que podemos querer modificar o manejar un periodo de tiempo, cómo saben Java 8 ya lleva algún tiempo liberado, en 2017 se libero una primera versión de Java 9, podríamos ver con la clase `Period` el periodo que hay entre la fecha de liberación de la primera versión de Java 8 y de la primera liberación de la versión de Java 9 y guardarlo en una instancia de periodo, cómo podéis comprobar no es un instante de tiempo sino que en el fondo lo que estamos almacenando es la diferencia entre dos fechas, lo podríamos ver y expresar está diferencia por ejemplo en una cantidad de meses, ha habido 42 meses de diferencia entre la liberación de Java 8 y de Java 9.

*`M_Periodo`*

```java
package fechas;

import java.time.LocalDate;
import java.time.Month;
import java.time.Period;

public class M_Periodo {
	
   public static void main(String[] args) {
      LocalDate java8Release = LocalDate.of(2014, Month.MARCH, 14);
      LocalDate java9Release = LocalDate.of(2017, Month.SEPTEMBER, 27);
      Period periodToNextJavaRelease = Period.between(java8Release, java9Release);
      System.out.println("Meses transcurridos entre la liberación de Java 8 y Java 9 : " + periodToNextJavaRelease.toTotalMonths());

   }

}
```

![31-16](images/31-16.png)

Para procesar fecha tenemos también la posibilidad de usar el método `parse` que es estático, lo que haría sería procesar una fecha que estaría en una cadena de caracteres para obtener en este caso por ejemplo un `LocalDate` la clase `DateTimeFormatter` nos proporciona una serie de constantes indicando el formato que tiene esa fecha, una de ellas el `BASIC_ISO_DATE` nos vendría la fecha con el año, el mes y el día sin ningún tipo de separación, tendríamos la posibilidad de crear un `DateTimeFormatter` a partir de un patrón utilizando una serie de caracteres `dd/MM/yyyy` en este caso las `dd` representan un día del mes, las `MM` mayúscula los meses del año y la `yyyy` el año expresado en cuatro cifras, esto se le llaman **máscara de formato**, la cantidad diferente de elementos que podemos usar en una máscara de formato lo podéis encontrar en la documentación, porque es bastante bastante extensa y os recomiendo que la leáis con detenimiento, aquí podríamos crear un formateador `formatter` y utilizarlo con la clase `parse` para traducir la cadena `viernes` en un `LocalDate`,  si se produjera algún tipo de situación excepcional lo podríamos manejar con la excepción `DateTimeParseException` que viene definida también dentro del API de `java.time` y bueno podríamos decir que esa fecha por ejemplo no sería parseable, en este caso sí que lo ha sido y por ejemplo si le añadiéramos otro cuatro en `String viernes = "18/04/20144";` pues nos daría una excepción esa fecha no sería parseable, no hemos llegado al año 20000.

*`N_ParseFormat`*

```java
package fechas;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class N_ParseFormat {
	
   public static void main(String[] args) {
      String diaDespuesDeHoy = "20171112";
      LocalDate formateada = LocalDate.parse(diaDespuesDeHoy, DateTimeFormatter.BASIC_ISO_DATE);
      System.out.printf("La fecha generada de un String %s es %s %n", diaDespuesDeHoy, formateada);

      String viernes = "18/04/2014";
      try {
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
         LocalDate holiday = LocalDate.parse(viernes, formatter);
         System.out.printf("Cadena formateada correctamente %s, la fecha es %s%n", viernes, holiday);
      } catch (DateTimeParseException ex) {
         System.out.printf("%s no es parseable!%n", viernes);
         ex.printStackTrace();
      }

   }

}
```

![31-17](images/31-17.png)

Como mecanismo análogo tenemos la posibilidad de formatear una fecha para obtener una cadena de caracteres que poder visualizar y aquí tendríamos la fecha y hora de hoy con la clase `LocalDateTime.now()` procesada de manera que visualizamos el día del mes, el mes con 3 caracteres, el año con cuatro cifras, la hora y los minutos y lo formatearíamos utilizando un determinado formateador, una instancia de `DateTimeFormatter`, si no se pudiera procesar porque nos hemos equivocado en la máscara de formato o porque no se tiene esa información también nos daría una excepción de tipo `DateTimeException`.

*`O_FechaAString`*

```java
package fechas;

import java.time.DateTimeException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class O_FechaAString {
	
   public static void main(String[] args) {
      LocalDateTime fechaLlegada = LocalDateTime.now();
      try {
         DateTimeFormatter format = DateTimeFormatter.ofPattern("dd MMM yyyy HH:mm");
         String landing = fechaLlegada.format(format);
         System.out.printf("Llegada a : %s %n", landing);
      } catch (DateTimeException ex) {
         System.out.printf("%s no puede ser formateada!%n", fechaLlegada);
         ex.printStackTrace();
      }

   }

}
```

![31-18](images/31-18.png)


Con esto terminamos la lección referente a fechas, ha sido una introducción hemos podido conocer a vista de pájaro muchos de los métodos que nos ofrece Java 8, os recomiendo que vayáis trabajando poco a poco con las diferentes clases que nos ofrece este apasionante API de tratamiento de fecha y de hora y que poco a poco también vayas practicando con el.

# 32. Colecciones ArrayList 11:30 

[Colecciones ArrayList](pdfs/32_Arraylist.pdf)

## Resumen del Profesor

### 32.1 Desventajas del uso de arrays

El uso de arrays nos aportan una serie de **desventajas**:

* Tenemos que conocer a priori el tamaño.
* El tamaño no se puede modificar una vez creado.
* Problemas para insertar objetos en posiciones intermedias.
* Los arrays no son realmente objetos (instancias de clases)

Java nos provee de una serie de colecciones con algunos beneficios:

* Menos esfuerzo de programación.
* Aumento de la calidad y velocidad.
* Interoperabilidad
* Curva de aprendizaje pequeña
* Reusabilidad

### 32.2 ArrayList

De todas las colecciones de Java es quizá la más usada de todas. Permite algunas operaciones típicas de las colecciones **secuenciales**:

* Acceso posicional
* Búsqueda
* Iteración
* Tomar un fragmento

Para conocer mejor los métodos, podemos acceder a la documentación del api:

https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html

## Transcripción

![32_Arraylist-1](images/32_Arraylist-1.png)


No podíamos dejar pasar este curso de Java desde cero sin presentar alguna de las múltiples colecciones que Java nos ofrece.

![32_Arraylist-2](images/32_Arraylist-2.png)

La más utilizada de todas es `ArrayList` y la motivación de tener una colección frente al uso de los ya conocidos `arrays` es que lo `arrays` nos ofrecen algunas ventajas pero también nos ofrecen dificultades, la primera es que tenemos que conocer a priori el tamaño del array, es decir se lo tenemos que dar en el momento en el que lo vamos a instanciar, esto nos ofrece la dificultad de que si se nos queda pequeño una vez ccreado el `array` no se puede modificar su tamaño y si lo hacemos demasiado grande pues quizá estemos usando más memoria de la que nosotros quisieramos. También el hecho de querer insertar objetos en posiciones intermedias se vuelve bastante tedioso por último decir que los array incluso aunque sean de objetos **no son objetos** y eso pues también puede ser una dificultad en su tratamiento.

![32_Arraylist-3](images/32_Arraylist-3.png)

Frenta a los `arrays` Java nos ofrece toda un API de colecciones con decenas de interfaces y clases con una serie de beneficios muy claros, lo primero es que para hacer lo mismo vamos a tener que programar menos porque muchas de las cosas que con los `arrays` haciamos manualmente Java ya lo ha programado por nosotros, además esos métodos están muy bien programado y testeados con lo cual aumenta la calidad del código y la velocidad de las operaciones. El hecho de que tengamos un API común que se utilice entre librerías de terceros y en las distintas comunidades de desarrolladores aumenta la interoperabilidad de nuestro código, si nosotros creamos nuestros propios tipo de conexión basado en un `array` sería nuestro y no sería interoperable con el código de otros programadores, el uso de unas colecciones que son comunes a toda la comunidad de desarrolladores nos hace posible que podamos trabajar con librerías de terceros, **las colecciones tienen una curva de aprendizaje pequeña**, son muy fáciles de aprender y son muy reusables.

![32_Arraylist-4](images/32_Arraylist-4.png)

Quizá la colección más utilizada de todas, la clase quizá más utilizada de Java sea `ArrayList` es una estructura de datos en secuencia que nos permiten manejar una serie de elementos que se van almacenando de manera lineal y que nos permite una serie de operaciones básicas como accesos posicional, es decir podemos acceder a un índice concreto de un `ArrayList`, nos permitirá buscar, iterar, es decir ir recorriendo un `array` de una determinada manera para que nos devuelva los errores, tomar un fragmento, entre otras operaciones.

![32_Arraylist-5](images/32_Arraylist-5.png)

Construir un `ArrayList` en muy sencillo, `ArrayList` nos ofrece una serie de constructores, el primero el constructor sin parámetros construira un `ArrayList` con una capacidad inicial de 10 elementos, podemos modificar eso con la llamada a un `ArrayList` indicando explícitamente su capacidad inicial y bueno existe una interfaz llamada `Collection` y podríamos construir un `ArrayList` a partir de otra colección.

![32_Arraylist-6](images/32_Arraylist-6.png)

Hasta la versión 1.4 de Java todos los `ArrayList`, todas las colecciones de tipo `List` eran de objetos,  esto ofrecían una ventaja frente a otros lenguajes de programación que no permitían esto y es que bueno podíamos crear `ArrayList` de cualquier objeto que nosotros crearamos, esto viene provocado porque bueno cualquier objeto de Java de una u otra manera hereda de una clase base primitiva qué es la clase `Object` entonces cualquier `ArrayList` era un `ArrayList` de `Object` y como cualquier clase podía heredar de `Object` pues podríamos almacenar cualquier tipo de objeto en un `ArrayList`, sin embargo esto provocaba el que pudiéramos tener `ArrayList` que albergará instancias de diferentes tipos en una misma colección y esto en ocasiones podía ser positivo, pero la gran mayoría de las veces no lo era, porque si posteriormente nosotros queríamos tomar los objetos de allí adentro y llamar a algún método específico podríamos tener errores de casteo.

![32_Arraylist-7](images/32_Arraylist-7.png)

Cómo se soluciona a partir de Java 5, con el uso de genéricos, lo que queráis conocer algo más sobre genérico os recomiendo que cuando termine este curso de Java desde cero, podáis hacer el curso de Java 8 para programadores Java, **los genéricos permiten parametrizar el tipo indicando que una determinada colección va a ser de un tipo específico** y ese tipo lo indicamos entre los ángulos, de manera que podíamos crear `ArrayList` de `String` o `ArrayList` de otra clase propia nuestra llamada `Persona`.

Java 7 incorporo el operador *diamond* el operador diamante que nos permite ahorrarnos el hecho de escribir dos veces el tipo, si miramos la sentencia de inicialización del primer `ArrayList` en la diapositiva podemos ver al indicar que es de tipo `String` tenemos que llamar al constructor de tipo `String` a partir de Java 7 nos podemos ahorrar ese segundo tipo porque entiende que si estamos creando un `ArrayList` para almacenarlo en una referencia de `List<String>` el tipo que tiene que crear es un `ArrayList` de `String`.

![32_Arraylist-8](images/32_Arraylist-8.png)

Antes de conocer algún ejemplo de uso de `ArrayList` vamos a conocer algunos de los métodos, tenemos los métodos `add` y `addAll` que nos permiten añadir elementos al final de la lista, `add` añadiría un solo elemento `addAll` añade todos los elementos de otra colección, el método `clear` eliminaría todos los elementos de una lista, `contains ` nos va a permitir comprobar si un elemento está o no en una determinada lista, `get` nos permite devolver el elemento de una posición específica, ese aspecto posicional, `isEmpty` nos verifica si una lista está vacía, `remove` elimina un elemento de la lista, `size` nos devuelve el número de elementos de una lista y `toArray` nos devolvería a partir de un `ArrayList` un `array` con los elementos que tenía ese `ArrayList`.

### :computer: `101-32-Arraylist`

Vamos a ver un ejemplo de uso de la clase `ArrayList`, hemos reutilizado una definición de `Persona` que teníamos por ahí pero la hemos modificado para que guarde nombre, apellido y teléfono.

*`Persona`*

```java
package usoarraylist;

public class Persona {
	
   private String nombre;
   private String apellidos;
   private String telefono;
	
   public Persona() {}
	
   public Persona(String nombre, String apellidos, String telefono) {
      this.nombre = nombre;
      this.apellidos = apellidos;
      this.telefono = telefono;
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

   public String getTelefono() {
      return telefono;
   }

   public void setTelefono(String telefono) {
      this.telefono = telefono;
   }

   @Override
   public String toString() {
      return "Persona [nombre=" + nombre + ", apellidos=" + apellidos + ", telefono=" + telefono + "]";
   }

}
```

Podríamos utilizar la clase `ArrayList` para hacer una pequeña aplicación que nos sirviera de agenda de contactos. Cómo podemos comprobar el método `main` tiene de una manera muy parecida a la calculadora que hicimos, un bucle `do while` dónde vamos a recoger una opción y vamos a mostrar un menú, recoger la opción y en función de esta opción hacer alguna de las operaciones, listar todos los contactos de la agenda, añadir un contacto a la agenda, eliminar un contacto, eliminarlos todo o salir del programa.

Primero vamos a ejecutar la aplicación y después vemos método a método como se esta usando el `ArrayList`.

*`UsoArrayList`*

```java
package usoarraylist;

import java.util.ArrayList;
import java.util.Scanner;

public class UsoArrayList {

   // Declaramos estas dos referencias como estáticas, para poder usarlas en todos
   // los métodos
   static Scanner sc;
   static ArrayList<Persona> listaPersonas;

   public static void main(String[] args) {

      // Inicializamos la lista y la lectura por teclado
      listaPersonas = new ArrayList<>();
      sc = new Scanner(System.in);
      int opcion;

      do {
         // Al inicio de cada iteración mostramos el menú, y recogemos la opción
         menu();
         opcion = Integer.parseInt(sc.nextLine());

         switch (opcion) {
            case 1:
               listarPersonas();
               break;
            case 2:
               aniadirPersona();
               break;
            case 3:
               eliminarPersona();
               break;
            case 4:
               eliminarTodas();
               break;

            default:
               System.out.println("Opción no válida. Introduzca una opción válida, por favor.");
         }

      } while (opcion != 0);

      sc.close();

   }

   /*
    * MÉTODO QUE IMPRIME EL MENÚ
    */
   public static void menu() {
      System.out.println("AGENDA DE CONTACTOS");
      System.out.println("===================");
      System.out.println("1. Listar todos los contactos");
      System.out.println("2. Añadir un contacto");
      System.out.println("3. Eliminar un contacto");
      System.out.println("4. Eliminar todos los contactos");
      System.out.println("0. Salir del programa\n\n");
      System.out.print("Introduzca una opción: ");

   }

   /*
    * MÉTODO QUE LISTA TODOS LOS CONTACTOS DE LA AGENDA O MUESTRA UN MENSAJE SI NO
    * HAY NINGUNO QUE MOSTRAR
    */
   public static void listarPersonas() {
      if (listaPersonas.isEmpty()) {
         System.out.println("La agenda no tiene contactos\n");
      } else {
         for (int i = 0; i < listaPersonas.size(); i++) {
            Persona p = listaPersonas.get(i);
            System.out.printf("%d %s %s (%s) %n", i, p.getNombre(), p.getApellidos(), p.getTelefono());
         }
         System.out.println("");
      }
   }

   /*
    * MÉTODO QUE RECOGE LOS DATOS DEL USUARIO PARA AÑADIR UNA NUEVA PERSONA, Y LA
    * INSERTA EN LA LISTA
    */
   public static void aniadirPersona() {
      System.out.println("\n\nAÑADIR NUEVO CONTACTO");
      System.out.print("Introduzca el nombre: ");
      String nombre = sc.nextLine();
      System.out.print("Introduzca los apellidos: ");
      String apellidos = sc.nextLine();
      System.out.print("Introduzca su número de teléfono: ");
      String telefono = sc.nextLine();

      listaPersonas.add(new Persona(nombre, apellidos, telefono));

      System.out.println("");

   }

   /*
    * MÉTODO QUE ELIMINA UNA PERSONA DE LA AGENDA EN FUNCIÓN DE UNA POSICIÓN
    * RECOGIDA DEL TECLADO
    */
   public static void eliminarPersona() {
      System.out.println("\n\nELIMINAR CONTACTO");
      System.out.print("Introduzca la posición del contacto: ");
      int posicion = Integer.parseInt(sc.nextLine());
      if (posicion < 0 || posicion >= listaPersonas.size()) {
         System.out.println("Posición erronea");
      } else {
         System.out.print("¿Está usted seguro de querer eliminar el contacto? (S/N): ");
         String siono = sc.nextLine();
         if (siono.equalsIgnoreCase("S")) {
            listaPersonas.remove(posicion);
         }
      }
      System.out.println("");

   }

   /*
    * MÉTODO QUE ELIMINA TODOS LOS CONTACTOS DE LA AGENDA PREVIA CONFIRMACIÓN DE LA
    * OPERACIÓN
    */
   public static void eliminarTodas() {
      System.out.println("\n\nELIMINAR CONTACTO");
      System.out.print("¿Está usted seguro de querer eliminar el contacto? (S/N): ");
      String siono = sc.nextLine();
      if (siono.equalsIgnoreCase("S")) {
         listaPersonas.clear();
      }
      System.out.println("");

   }

}
```

Inicialmente podríamos ver que la agenda no tiene contactos está vacía, si queremos añadir un contacto lo haríamos introduciendo los datos, ahora pasaremos a analizar todos los contactos veríamos que la agenda tiene la posición cero un contacto que en este caso sería yo, podríamos eliminar este contacto pasando la posición del contacto y si ahora la lista podemos comprobar como la agenda se ha quedado vacía podríamos eliminar todo y salir.

*`Salida`*

```sh
AGENDA DE CONTACTOS
===================
1. Listar todos los contactos
2. Añadir un contacto
3. Eliminar un contacto
4. Eliminar todos los contactos
0. Salir del programa


Introduzca una opción: 1
La agenda no tiene contactos

AGENDA DE CONTACTOS
===================
1. Listar todos los contactos
2. Añadir un contacto
3. Eliminar un contacto
4. Eliminar todos los contactos
0. Salir del programa


Introduzca una opción: 2


AÑADIR NUEVO CONTACTO
Introduzca el nombre: Adolfo
Introduzca los apellidos: De la Rosa
Introduzca su número de teléfono: 666778899

AGENDA DE CONTACTOS
===================
1. Listar todos los contactos
2. Añadir un contacto
3. Eliminar un contacto
4. Eliminar todos los contactos
0. Salir del programa


Introduzca una opción: 1
0 Adolfo De la Rosa (666778899) 

AGENDA DE CONTACTOS
===================
1. Listar todos los contactos
2. Añadir un contacto
3. Eliminar un contacto
4. Eliminar todos los contactos
0. Salir del programa


Introduzca una opción: 3


ELIMINAR CONTACTO
Introduzca la posición del contacto: 1
Posición erronea

AGENDA DE CONTACTOS
===================
1. Listar todos los contactos
2. Añadir un contacto
3. Eliminar un contacto
4. Eliminar todos los contactos
0. Salir del programa


Introduzca una opción: 1
0 Adolfo De la Rosa (666778899) 

AGENDA DE CONTACTOS
===================
1. Listar todos los contactos
2. Añadir un contacto
3. Eliminar un contacto
4. Eliminar todos los contactos
0. Salir del programa


Introduzca una opción: 4


ELIMINAR CONTACTO
¿Está usted seguro de querer eliminar el contacto? (S/N): S

AGENDA DE CONTACTOS
===================
1. Listar todos los contactos
2. Añadir un contacto
3. Eliminar un contacto
4. Eliminar todos los contactos
0. Salir del programa


Introduzca una opción: 0
Opción no válida. Introduzca una opción válida, por favor.
```

Vamos a analizar el código, vamos a trabajar con un `ArrayList` en este caso como lo estamos haciendo todo en una sola clase a raíz del método `main` creamos el `ArrayList` como estático.


```java
// Declaramos estas dos referencias como estáticas, para poder usarlas en todos
// los métodos
static Scanner sc;
static ArrayList<Persona> listaPersonas;
```

Esto no es para nada obligatorio sino que es propio de este ejemplo tendríamos un `ArrayList` de `Persona` llamdo `listaPersonas`.

Al comenzar el método `main` inicializamos este `ArrayList` como siempre usamos la clase `Scanner` para poder leer de teclado.

```java
// Inicializamos la lista y la lectura por teclado
listaPersonas = new ArrayList<>();
sc = new Scanner(System.in);
int opcion;
```

Y entramos en el bucle `do while` para hacer las distintas opciones.


```java
      do {
         // Al inicio de cada iteración mostramos el menú, y recogemos la opción
         menu();
         opcion = Integer.parseInt(sc.nextLine());

         switch (opcion) {
            case 1:
               listarPersonas();
               break;
            case 2:
               aniadirPersona();
               break;
            case 3:
               eliminarPersona();
               break;
            case 4:
               eliminarTodas();
               break;

            default:
               System.out.println("Opción no válida. Introduzca una opción válida, por favor.");
         }

      } while (opcion != 0);
```

Si queremos vamos a empezar por el principio a añadir una persona nos podríamos ir al método de añadir y vemos cómo lo único que estamos haciendo llamar al método `add` de `ArrayList` para añadir una nueva instancia de personas, que hemos creado con los valores que hemos recogido del teclado.

```java
   /*
    * MÉTODO QUE RECOGE LOS DATOS DEL USUARIO PARA AÑADIR UNA NUEVA PERSONA, Y LA
    * INSERTA EN LA LISTA
    */
   public static void aniadirPersona() {
      System.out.println("\n\nAÑADIR NUEVO CONTACTO");
      System.out.print("Introduzca el nombre: ");
      String nombre = sc.nextLine();
      System.out.print("Introduzca los apellidos: ");
      String apellidos = sc.nextLine();
      System.out.print("Introduzca su número de teléfono: ");
      String telefono = sc.nextLine();

      listaPersonas.add(new Persona(nombre, apellidos, telefono));

      System.out.println("");

   }
```

Una vez que hayamos añadido una o más personas podríamos recorrer el `ArrayList` para listar su contenido, lo tenemos aquí, la manera de listar un array pues es múltiple, lo podríamos hacer mediante un bucle `for` mejorado, un bucle `for each`, en este caso hemos escogido no hacerlo para poder indicar la posición de los distintos elementos en el array para poder utilizar esa posición para listarlo, podemos comprobar como estamos utilizando `printf` para imprimir una `Persona` que está en una determinada posición, aquí recorremos el array desde la posición cero hasta su tamaño, vamos tomando posición a posición imprimimos y vuelta a empezar, antes de ello comprobamos mediante el método `isEmpty()` si el `ArrayList` está vacío o no y si no tiene contactos pues imprimimos un mensaje de error y terminaríamos el método.


```java
   /*
    * MÉTODO QUE LISTA TODOS LOS CONTACTOS DE LA AGENDA O MUESTRA UN MENSAJE SI NO
    * HAY NINGUNO QUE MOSTRAR
    */
   public static void listarPersonas() {
      if (listaPersonas.isEmpty()) {
         System.out.println("La agenda no tiene contactos\n");
      } else {
         for (int i = 0; i < listaPersonas.size(); i++) {
            Persona p = listaPersonas.get(i);
            System.out.printf("%d %s %s (%s) %n", i, p.getNombre(), p.getApellidos(), p.getTelefono());
         }
         System.out.println("");
      }
   }
```

El método de eliminar una persona requiere que solicitemos la posición y siempre y cuando la posición sea correcta, es decir mayor que 0 y menor que el tamaño ejecutariamos la eliminación, como suele ser usual en los sistemas cuando vamos eliminar algún dato como una operación que no suele poder deshacerse requiere de una confirmación, y en ese caso eliminaríamos el elemento que esté en esa posición.

```java
   /*
    * MÉTODO QUE ELIMINA UNA PERSONA DE LA AGENDA EN FUNCIÓN DE UNA POSICIÓN
    * RECOGIDA DEL TECLADO
    */
   public static void eliminarPersona() {
      System.out.println("\n\nELIMINAR CONTACTO");
      System.out.print("Introduzca la posición del contacto: ");
      int posicion = Integer.parseInt(sc.nextLine());
      if (posicion < 0 || posicion >= listaPersonas.size()) {
         System.out.println("Posición erronea");
      } else {
         System.out.print("¿Está usted seguro de querer eliminar el contacto? (S/N): ");
         String siono = sc.nextLine();
         if (siono.equalsIgnoreCase("S")) {
            listaPersonas.remove(posicion);
         }
      }
      System.out.println("");

   }
```

Por último si queremos eliminarlos todos tan solo tendríamos que confirmar pero sería más fácil porque lo que haríamos sería invocar al método `clear()`. 

```java
   /*
    * MÉTODO QUE ELIMINA TODOS LOS CONTACTOS DE LA AGENDA PREVIA CONFIRMACIÓN DE LA
    * OPERACIÓN
    */
   public static void eliminarTodas() {
      System.out.println("\n\nELIMINAR CONTACTO");
      System.out.print("¿Está usted seguro de querer eliminar el contacto? (S/N): ");
      String siono = sc.nextLine();
      if (siono.equalsIgnoreCase("S")) {
         listaPersonas.clear();
      }
      System.out.println("");

   }
```

Con este sencillo ejemplo hemos querido ilustrar el uso de la clase `ArrayList` como una de las colecciones más utilizadas en Java. 


# 33. Introducción a las expresiones lambda 20:21 

[Introducción a las expresiones lambda](pdfs/33_ExpresionesLambda.pdf)

## Resumen del Profesor

### 33.1 Paradigma de programación funcional

A la hora de programar, existen más paradigmas (formas de entender la programación) que la orientación a objetos: imperativa, lógica, orientada a aspectos, ... Uno de ellos, que está muy de moda, es la **programación funcional**. Su origen está en un lenguaje matemático formal, y si lo tenemos que resumir en una frase, podríamos decir que en él, la salida de una función depende solo de los parámetros de entrada.

Los lenguajes funcionales son más expresivos (es decir, hacen más con menos código) y más elegantes. Este tipo de expresiones ya estaban presentes en muchos lenguajes de programación, y era algo que la comunidad demandaba a Java, que lo ha incluido en su versión Java SE 8.

### 33.2 Expresión lambda

Una expresión lamba no va a ser más que una función anónima, un método abstracto. Su sintaxis es sencilla:

```java
() -> expresión

(p1, p2, ...) -> expresión

(p1, p2, ...) -> { sentencia1; sentencia2; .....;}
```

Algunos ejemplos de expresiones lambda podrían ser:

```java
() -> new ArrayList<>()
(int a, int b) -> a+b
(a) -> {
  System.out.println(a);
  return true;
}
```

### 33.3 Interfaz funcional

Se trata de cualquier interfaz que tenga un solo método (además de métodos `default`, `static`, `equals`, ...). Están muy ligadas a las expresiones lambda ya que allá donde se espere una instancia de un objeto que implemente una interfaz funcional, podremos utilizar una expresión de este tipo.

### 33.4 Colecciones y el método forEach

En Java SE 8 las colecciones nos proveen de un método, `.forEach`, que acepta una instancia de un objeto que implementa una interfaz funcional, llamada `Consumer<T>`, que nos permitirá facilmente recorrer el bucle usando expresiones lambda.

```java
lista.forEach(System.out::println);
```

### 33.5 Acceso a métodos

El operador `::` nos permite abreviar más la sintaxis, de forma que podemos acceder a métodos directamente:

Por ejemplo:

```java
x -> System.out.println(x)
```

sería equivalente a

```java
System.out::println
```

### 33.6 API Stream

Se trata de una nueva funcionalidad, que nos permite trabajar con colecciones como si se trataran de flujos de datos. Esto nos dará gran versatilidad, junto con las expresiones lambda, para filtrar, transformar, ordenar, agrupar y presentar datos.


```java
List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);

lista
  .stream()
  .filter((x) -> x >= 5)
  .forEach(System.out::println);
```


## Transcripción

![33_ExpresionesLambda-1](images/33_ExpresionesLambda-1.png)

Hola a todos **no podíamos concluir este curso de Java 8 sin presentar las expresiones lambda qué es la gran novedad junto a la API Stream que Java 8 nos ofrece**.

![33_ExpresionesLambda-2](images/33_ExpresionesLambda-2.png)

Para hablar de **expresiones lambda** tenemos que hablar primero de **programación funcional**, la programación funcional, el paradigma de programación funcional es diferente al de la programación imperativa y también diferente al de la programación orientada a objetos como tal y como lo conocemos. **La programación funcional se basa en un lenguaje matemático formal llamado el cálculo lambda que se inventa en los años 30** y que con posterioridad se incorpora a algunos lenguajes de programación, Java lo toma ahora en su versión 8, **este paradigma permite trabajar o centrarse en el uso de funciones y centrándose en la idea de que una función dependerá única y exclusivamente de sus parámetros de entrada para producir la salida**. Como ventaja de uso de la programación funcional podemos darnos cuenta y eso nos daremos cuenta al ver los ejemplo de que **el código va a ser mucho más expresivo, es decir haremos más cosas con menos código y el código será mucho más elegante** porque la orientación al uso de métodos encadenado hara que podemos tener un código muy elegante a la hora de hacer las mismas operaciones para las cuales antes hacíamos un montón de sentencias de código. La programación funcional está presente en otros lenguajes de programación desde hace mucho tiempo sobre todo en algunos competidores de Java desde hace un tiempo acá como Python y C#  y bueno nunca es tarde si la dicha es buena, para que Java lo haya incorporado ahora a sus posibilidades.

![33_ExpresionesLambda-3](images/33_ExpresionesLambda-3.png)

**La programación funcional también se centra en la idea de convertir las funciones en entidades de primer nivel, hasta ahora las *entidades de primer nivel, es decir lo que podíamos pasar como argumento de un método* eran variables, literales u objetos y alguna combinación de ella arrays, objetos, un tipo primitivo, un literal concreto**.

**Si convertimos las funciones en entidades de primer nivel, podríamos utilizar una función allá donde antes usábamos una variable, con lo cual podríamos guardar una función dentro de una variable o *podríamos pasar una función como argumento de un método***.

![33_ExpresionesLambda-4](images/33_ExpresionesLambda-4.png)

Con todo ello nos centramos ahora en la sintaxis para ver cómo podemos hacer **expresiones lambda**, en Java **una expresiones lambda no va a ser más que una especie de método abstracto es decir una función sin nombre** cuya estructura puede ser alguna de las que tenemos en la diapositva.

```java

() -> expresión

(parámetros) -> expresión

(parámetros) -> { sentencias; }

```

A la izquierda de la flecha tendremos los argumentos que recibiría la función, los parámetros que recibía esa función y a la derecha tendríamos el código que se ejecutaría como cuerpo de esa función. Si solamente va a ser una expresión lo podríamos poner tal cual sin punto y coma, si va a ser un conjunto de sentencias lo encerraríamos en un bloque entre llaves separando cada sentencia por un punto y coma.

![33_ExpresionesLambda-5](images/33_ExpresionesLambda-5.png)

Algunas expresiones lambda de ejemplo las tenemos aquí, la primera nos permitiría crear un nuevo `ArrayList`, la segunda devolvería porque hay implícito una sentencia `return` a la derecha de la flecha recibiendo dos parámetros de tipo entero y en la tercera tendríamos que se recibiría un argumento `a` el tipo se inferiria a raíz del contexto donde esté la expresión lambda y dónde haríamos dos sentencias en este caso imprimirlo por consola y devolver un valor verdad.


![33_ExpresionesLambda-6](images/33_ExpresionesLambda-6.png)

De forma pareja a las expresiones lambda Java a incorporado el **concepto de interfaz funcional** que no trabajamos en su momento cuando vimos las interfaces, si no que lo presentamos ahora. **Una interfaz funcional va a ser una interfaz que tenga un solo método** y **esto se matiza diciendo que sera una interfaz con un solo método que no sea ni estático, ni default y en los cuales tampoco contemos los métodos propios de la clase `Objeto`**, es decir podríamos tener una interfaz con un solo método abstracto y sería funcional o una interfaz con un método abstracto y 10 métodos estáticos default que seguiría siendo una interfaz funcional. Cuando trabajamos con interfaces funcionales lo normal es que utilicemos **clases anónimas** el concepto de clase anónima también dejamos su presentación para el curso de Java 8 para programadores Java, pero simplemente decir que será una una clase que no tenemos que crear en un fichero aparte, si no que la podremos crear en un punto concreto del código. En lugar de que una clase implemente esta interfaz funcional o incluso hagamos una clase anónima en el sitio que lo necesitemos, podremos utilizar una expresión lambda. 

Un ejemplo de interfaz funcional en Java 8 es la interfaz `Interface Comparator<T>`.

https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html

![33-01](images/33-01.png)

Está interfaz nos va a permitir o **va a tener métodos para comparar dos objetos de un mismo tipo**, de un tipo `T` que le pasemos, teniendo además un montón de métodos estáticos para hacer comparaciones rápidas.

![33-02](images/33-02.png)

También tiene un montón de métodos por defecto, **sin embargo solamente tiene un método, el método `compare(T o1, T o2)` como método abstracto**, con lo cual independientemente de `equals(Object obj)` que ya hemos dicho que tampoco cuenta por ser un método heredado de `Object` **con lo cual está interfaz sería una interfaz funcional** para forzar que se compruebe si una interfaz es funcional surgue la anotación `@FunctionalInterface` aunque eso a nosotros ahora mismo no nos va a afectar, pero ya digo que para nosotros **la interfaz funcional nos basta con que sepamos que tiene solamente un método abstracto**.

Nosotros podríamos intentar utilizar una interfaz funcional implementando la clase, a través de una clase anónima o mediante una expresión lambda. 

### :computer: `101-33-Lambda`

Tendríamos varios ejemplos aquí.

Si tuviéramos una lista de integers, de enteros y queremos crear una `List` a partir de ella podemos usar el método estático `asList` de la clase `Arrays` que devuelve como una lista una sucesión de elementos que le proporcionamos.

```java
List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
```

Si quisiéramos ordenarla, la interfaz `List`, la clase `ArrayList` que hemos estudiado antes incluye el método `sort`, pero el método `sort` espera que nosotros le proporcionemos una instancia de `Comparator`.
 
![33-03](images/33-03.png)

`The method sort(Comparator<? super Integer>) in the type List<Integer> is not applicable for the 
 arguments ()`

**Nuestra primera manera de trabajar sería el que creáramos una clase llamada `MayorAMenor`** que nos permitirá definir el orden, para ordenar los números, el orden comparando dos números. 

Podríamos crear nuestra clase `MayorAMenor` que implementará esa interfaz `Comparator` de `Integer` solo que vamos a hacer un pequeño cambio, en lugar de dar el orden natural vamos a invertir el orden natural, de forma que la clase `Integer` ya tienes su método `compareTo` si viéramos la documentación de la clase `Integer` veríamos que implementa `Comparator` y que ya nos permite comparar dos números, indicando el orden natural de los números, bueno pues si nosotros lo que hacemos es devolver la inversa de lo que devuelve `compareTo` lo que hacemos es ordenarlos al revés.

*`MayorAMenor`*

```java
package lambda;

import java.util.Comparator;

public class MayorAMenor implements Comparator<Integer> {
	
   /*
    * ESTE MÉTODO SOBREESCRIBE EL "ORDEN NATURAL"
    * DE LOS NÚMEROS DE FORMA QUE:
    * 
    * - Si el primer número es menor que el segundo, devuelve un valor positivo.
    * - Si son iguales devuelve un cero.
    * - Si el primer número es mayor que el segundo, devuelve un valor negativo.  
    */
	
   @Override
   public int compare(Integer o1, Integer o2) {
      return -(o1.compareTo(o2));
   }

}
```

Ahora ya podemos ordenar la lista de números e imprimirla.

*`A_Lambda`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class A_Lambda {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);

      //1ª Forma: una clase que implementa comparator
      lista.sort(new MayorAMenor());
		
      for (Integer i : lista)
         System.out.println(i);
   }	

}
```

![33-04](images/33-04.png)

Esta sería una manera de ordenar los números al revés. Esta manera es válida lo que pasa que el código ha sido bastante tedioso hemos tenido que crear un fichero aparte, implementar la interfaz, darle código, cuando lo meramente funcional de este código está en la línea `return -(o1.compareTo(o2));`.

**Una segunda manera sería con el uso de una clase anónima** como decía antes las trabajaremos en profundidad aquellos que queráis hacer el curso de Java 8 para progamadores, la vamos a presentar aquí.

**Una clase anónima es una clase** que creamos en un punto de nuestro código, **que la instanciamos y la declaramos a la vez**, la instanciamos con el operador `new` pero a la vez la declaramos, le damos cuerpo, con lo cual solo la vamos a poder utilizar en esta parte del código. Esto nos ahorraría el uso de un nuevo fichero con una clase que ya no lo vamos a reutilizar nunca. el código lo ponemos en este único archivo.

*`A_Lambda`*

```java
package lambda;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class A_Lambda {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);

      //1ª Forma: una clase que implementa comparator
      //lista.sort(new MayorAMenor());
      
      //2ª Forma: una clase "anónima"
      //¿Qué tal si ponemos el cursor sobre la instanciación de la clase
      //anónima y pulsamos Ctrl+1?
      //Eclipse permite convertir esto en una expresión lambda automáticamente
      lista.sort(new Comparator<Integer>() {

         @Override
         public int compare(Integer o1, Integer o2) {
            return -(o1.compareTo(o2));
         }
		
      });
		
      for (Integer i : lista)
         System.out.println(i);
   }

}
```

![33-05](images/33-05.png)

La funcionalidad es la misma que antes, sin embargo nos volvemos a centrar con que el meoyo de todo está en esta única línea de código `return -(o1.compareTo(o2));`, si tuviéramos la manera de decirle oye que el orden quiero que sea así, sería muy sencillo.

**La tercera manera sería a través de una expresión lambda** y bueno Eclipse nos ofrece la funcionalidad de que si pulsamos CTRL+1 sobre una instancia anónima de una clase es capaz de convertirla en una expresión lambda directamente. Vamos a ver como se hace.

![33-06](images/33-06.png)

![33-07](images/33-07.png)

Vamos a dejar conforme estaba para mantener comentadas las diferentes formas de hacerlo y lo podríamos hacer nosotros manualmente. De esta manera a `sort` en lugar de proporcionarle una instancia de una clase que implementa una interfaz le proporcionamos una expresión lamdda, el uso de la expresión lambda aquí es posible porque la interfaz `Comparator` es funcional, si la interfaz tuvieras dos, tres, cuatro métodos por incrementar posiblemente no supiera cuál escoger, por eso las expresiones lambda tienen aparejadas a las interfaces funcionales. Como podemos comprobar si nosotros le decimos aquí que como `sort` espera un `Comparator` y le proporcionamos un `Comparator` de la clase `Integer` haría la misma operación pero en un código mucho más conciso.

*`A_Lambda`*

```java
package lambda;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class A_Lambda {
	
   public static void main(String[] args) {
		
       List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);

       //1ª Forma: una clase que implementa comparator
       //lista.sort(new MayorAMenor());
      
       //2ª Forma: una clase "anónima"
       //¿Qué tal si ponemos el cursor sobre la instanciación de la clase
       //anónima y pulsamos Ctrl+1?
       //Eclipse permite convertir esto en una expresión lambda automáticamente
//     lista.sort(new Comparator<Integer>() {
//
//	  @Override
//	  public int compare(Integer o1, Integer o2) {
//	     return -(o1.compareTo(o2));
//	  }
//
//    });
		
      // 3ª Forma: una expresion lambda
      // Los tipos de datos ¡no son obligatorios! Se infieren del contexto
      lista.sort((Integer n1, Integer n2) -> -(n1.compareTo(n2))); 
		
      for (Integer i : lista)
         System.out.println(i);
   }

}
```

![33-08](images/33-08.png)

Mucho más conciso sería por qué el uso de expresiones lambda nos permite inferir los tipos, si la lista es un `List<Integer>` y el método `sort` espera un `Comparator` del tipo de la lista, no sería necesario que nosotros le indicaremos el tipo de los argumentos sino que es capaz de inferirlo a través del contexto, con lo cual el código sería aún más conciso todavía.

```java
package lambda;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class A_Lambda {
	
   public static void main(String[] args) {
		
       List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);

       //1ª Forma: una clase que implementa comparator
       //lista.sort(new MayorAMenor());
      
       //2ª Forma: una clase "anónima"
       //¿Qué tal si ponemos el cursor sobre la instanciación de la clase
       //anónima y pulsamos Ctrl+1?
       //Eclipse permite convertir esto en una expresión lambda automáticamente
//     lista.sort(new Comparator<Integer>() {
//
//	  @Override
//	  public int compare(Integer o1, Integer o2) {
//	     return -(o1.compareTo(o2));
//	  }
//
//    });
		
      // 3ª Forma: una expresion lambda
      // Los tipos de datos ¡no son obligatorios! Se infieren del contexto
      //lista.sort((Integer n1, Integer n2) -> -(n1.compareTo(n2)));
      lista.sort((n1, n2) -> -(n1.compareTo(n2)));
		
      for (Integer i : lista)
         System.out.println(i);
   }

}
```

![33-09](images/33-09.png)

![33_ExpresionesLambda-7](images/33_ExpresionesLambda-7.png)

Las expresiones lambda también nos han permitido junto con el uso de las colecciones el aprovechamiento de un nuevo bucle llamado `forEach`, **el bucle `forEach` que será un método de todas las colecciones** recibe como parámetro un objeto que instancia otra interfaz funcional en particular la interfaz funcional `Consumer<T>` tiene un solo método que lo que va a ir haciendo es ir tomando los elementos de la colección y haciendo con él lo que indique el cuerpo de ese método, es perfecto para usarlo con expresiones lambda.

![33_ExpresionesLambda-8](images/33_ExpresionesLambda-8.png)

Pero antes vamos a centrarnos en este nuevo operador que nos presenta las expresiones lambda y es que bueno podemos incluso abreviar mucho más algunas expresiones lambda de una manera sencilla, por ejemplo si tenemos un determinado método nos podemos centrar en el último como `System.out.println` qué espera recibir un argumento para poder imprimirlo, podemos utilizar la notación de los dos puntos `::` de esta manera que tenemos para decirle, oye espera un argumento y este argumento me lo vas a proporcionar con `::` de esta manera podremos usar la la referencia a los métodos para hacerlo más rápido todavía. Podemos utilizarlo también para instanciar objetos, para llamar a métodos de un objeto en particular, para llamar a distintos métodos incluso indicando de qué clase vienen, etc. Está **referencia a método** también es bastante potente.

### :computer: `101-33-Lambda`

Aquí tenemos el uso de los bucles `forEach` y vamos a ver las diferente formas de hacerlo, la manera clásica de imprimir una serie de elementos, digo clásica aunque ya era la más novedosa que teníamos era a través del bucle `for` mejorado, en la cual nosotros recorríamos o iteravamos a partir de la colección uno a uno y lo íbamos obteniendo y lo íbamos imprimiendo.

*`B_Foreach`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class B_Foreach {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		
      //1ª Forma clásica de imprimir los elementos de una lista
      for(Integer i: lista)
         System.out.println(i);

   }

}
```

![33-10](images/33-10.png)


El uso de `forEach` nos va a permitir el utilizar expresiones lambda de manera que bueno podríamos decir que `forEach` qué espera un `Consumer` [la interfaz `Consumer`](https://docs.oracle.com/javase/8/docs/api/java/util/function/Consumer.html) nos va a permitir un método `accept(T t)`.

![33-11](images/33-11.png)

Ojo también podemos abrir la ayuda desde el propio Eclipse.

![33-12](images/33-12.png)

![33-13](images/33-13.png)

![33-14](images/33-14.png)

El método `accept(T t)` lo que aceptas son elemento y no devuelve nada, nosotros le daríamos el elemento de cada elemento del array y con el tipo inferido lo podríamos imprimir.


*`B_Foreach`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class B_Foreach {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		
      //1ª Forma clásica de imprimir los elementos de una lista
//    for(Integer i: lista)
//	 System.out.println(i);
		
      //2ª Uso de forEach
      lista.forEach(e -> System.out.println(e));

   }

}
```

![33-15](images/33-15.png)

y sería igual de funcional.

Podemos incluso utilizar la **referencia a los métodos** exactamente en este caso no es un método estático pero podemos usar una referencia a método con `::`.

*`B_Foreach`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class B_Foreach {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		
      //1ª Forma clásica de imprimir los elementos de una lista
//    for(Integer i: lista)
//	 System.out.println(i);
		
      //2ª Uso de forEach
//    lista.forEach(e -> System.out.println(e));

      //3ª Uso de referencias a métodos con ::
      lista.forEach(System.out::println);

   }

}
```

![33-16](images/33-16.png)

Esto es una abreviatura de la expresión lambda.

Incluso en lugar de utilizar una expresión lambda que tan solo tuviera una expresión, podríamos utilizar una expresión lambda que incluyera más de una sentencia para ir haciendo algún tipo de operaciones como por ejemplo incrementar el valor en uno antes de imprimirlo por consola.

*`B_Foreach`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class B_Foreach {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		
      //1ª Forma clásica de imprimir los elementos de una lista
//    for(Integer i: lista)
//	 System.out.println(i);
		
      //2ª Uso de forEach
//    lista.forEach(e -> System.out.println(e));

      //3ª Uso de referencias a métodos con ::
//    lista.forEach(System.out::println);



   }

}
```

![33-17](images/33-17.png)


Cómo podemos comprobar esta manera de recorrer una colección, un `ArrayList` es bastante potente.

![33_ExpresionesLambda-9](images/33_ExpresionesLambda-9.png)

Y como decíamos aparejado al uso de expresiones lambda Java 8 nos ofrece el **API Stream**, el API Stream **es un nuevo API que nos permite trabajar con una colección como si se tratara de un flujo de información**, con lo cual vamos a poder hacer junto con las expresiones lambda muy fácilmente operaciones de recorrido, filtrado, transformación, ordenación, agrupación y presentación de la información con un código muy conciso y expresado en pocas líneas, para lo que antes requeríamos muchas líneas de código a priori incluso recorrer varias veces un array lo vamos a poder hacer mediante el API Stream.

### :computer: `101-33-Lambda`

Lo voy a presentar brevemente, si  queréis conocer el API Stream en profundidad os recomiendo que cuando terminéis en el curso de Java 8 desde cero por ahí hacer el curso de Java 8 para programadores Java.

En este punto podemos utilizar el API Stream a partir de el método `.stream()` que tiene toda la colección, podríamos transformar una lista en un `stream` cómo podemos comprobar **`stream` es una una interfaz** que tenemos en Java, que además es parametrízada `Interface Stream<T>` en nuestro caso sería un `stream` de número entero.

![33-18](images/33-18.png)

![33-20](images/33-20.png)

![33-21](images/33-21.png)

![33-22](images/33-22.png)

Vemos el primer ejemplo del uso de `stream`.


*`C_ApiStream`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class C_ApiStream {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		
      //1º Imprimir todos los elementos de la lista
      lista
         .stream()
	 .forEach(System.out::println);

   }
	
}
```

![33-19](images/33-19.png)

Aquí ya vemos el uso de `stream` pero realmente esto no nos aporta mucho ya que la colección por si sola ya cuenta con el método `forEach` no es necesario convertirlo a un `stream`. 

Pero si quisiéramos hacer algún tipo de operación intermedia como por ejemplo un filtrado lo podríamos hacer con alguno de los métodos que tiene esa interfaz `Stream` el método `filter (Predicate<? super T> predicate)` espera **un predicado otra interfaz funcional** que nos permitiría a partir de un determinado valor hacer una comparación y por ejemplo podríamos filtrar para que solamente se quedarán después de este filtro los valores que fueran mayores iguales que 5 e imprimirlos por consola.

*`C_ApiStream`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class C_ApiStream {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		
      //1º Imprimir todos los elementos de la lista
//    lista
//	     .stream()
//	     .forEach(System.out::println);
		
      //2º Imprimir solo los mayores o iguales que 5
      lista
	     .stream()
	     .filter((x) -> x >= 5)
	     .forEach(System.out::println);

   }
	
}
```

![33-23](images/33-23.png)

Si quiciéramos imprimir solo los mayores o iguales que 5 pero ordenado inversamente podríamos utilizar otra operación intermedia de los `Stream` qué es `sorted (Comparator<? super T> comparator)` y que nos permite ordenar un `stream` pasándole un `Comparator`, podemos reutilizar una de las expresiones lambda del ejemplo anterior para ordenar los a la inversa.

*`C_ApiStream`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class C_ApiStream {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		
      //1º Imprimir todos los elementos de la lista
//    lista
//	     .stream()
//	     .forEach(System.out::println);
		
      //2º Imprimir solo los mayores o iguales que 5
//    lista
//	     .stream()
//	     .filter((x) -> x >= 5)
//	     .forEach(System.out::println);
		
      //3º Imprimir solo los mayores o iguales que 5, ordenados inversamente
      lista
	     .stream()
	     .filter((x) -> x >= 5)
	     .sorted((n1, n2) -> -(n1.compareTo(n2)))
	     .forEach(System.out::println);
   }
	
}
```

![33-24](images/33-24.png)


Imprimiría los números de mayores o iguales que 5 pero lo haría en el orden inverso al orden natural.

Por último podríamos ver cómo los `Streams` los podemos utilizar también para agrupar todos los valores en un solo valor, haciendo antes una transformación de los distintos valores, lo que se conoce como **un mapeo**, fijado que potente es está operación en la que podríamos crear un `stream`, mapear el valor de `Integar` a un valor entero primitivo, filtrar para que ese valor sea mayor o igual que 5 los que sean menores que 5 los descartariamos y sumaríamos todos esos valores reduciendo el `stream` a un solo valor resultado que obtenemos y que podríamos imprimir.

*`C_ApiStream`*

```java
package lambda;

import java.util.Arrays;
import java.util.List;

public class C_ApiStream {
	
   public static void main(String[] args) {
		
      List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);
		
      //1º Imprimir todos los elementos de la lista
//    lista
//	     .stream()
//	     .forEach(System.out::println);
		
      //2º Imprimir solo los mayores o iguales que 5
//    lista
//	     .stream()
//	     .filter((x) -> x >= 5)
//	     .forEach(System.out::println);
		
      //3º Imprimir solo los mayores o iguales que 5, ordenados inversamente
//    lista
//           .stream()
//	     .filter((x) -> x >= 5)
//	     .sorted((n1, n2) -> -(n1.compareTo(n2)))
//	     .forEach(System.out::println);
   
      //4º Sumar todos los elementos mayores o igual que 5
      int resultado = lista
			.stream()
			.mapToInt(v -> v.intValue())
			.filter((x) -> x >= 5)
			.sum();
      System.out.println(resultado);
 
   }
   
}
```

![33-25](images/33-25.png)


Si sumamos los números 5 + 6 + 7 + 8 + 9 + 10 la operación nos daría 45 en un código bastante elegante.

Con esta introducción al API Stream y expresiones lambda finalizamos el curso de Java 8 desde cero o agradezco la paciencia que habéis tenido viendo todos los vídeos y practicando con todos los ejemplos, los animo a que pueda ir hacer todas las preguntas que necesitéis en los foros y os ánimo a que os lancéis al finalizarlo a hacer el curso de Java 8 para programadores Java.

## Práctica: Creando un gestor de aparcamiento de coches 25:16 

[Proyecto_Final.pptx](otros/Proyecto_Final.pptx)

### Resumen del Profesor

En esta sesión práctica veremos como crear un gestor de aparcamiento de coches, tienes el código de ejemplo en el [repositorio de GitHub](https://github.com/OpenWebinarsNet/Curso-Java-desde-0/tree/master/Final_Parking).

### Transcripción.

[Gráfico.xlsx](otros/Gráfico.xlsx)

![34-Parking-1](images/34-Parking-1.png)

Hola a todos vamos a concluir nuestro curso con un ejemplo final qué trata de aglutinar alguno de los conceptos que hemos venido trabajando a lo largo de todo el curso y para ello vamos a implementar la gestión de un parking.

![34-Parking-2](images/34-Parking-2.png)

Nuestro parking será un parking de unas 100 plazas en el que vamos a plantear las plazas de aparcamiento simulando que tienen carriles intermedios por los cuales podemos circular y que alternativamente al dejarnos circular de arriba a abajo y a continuacón de abajo a arriba pues la numeración de las plazas de parking le hehemos hecho en forma de serpiente, es decir empezando la primera columna desde arriba abajo, la segunda de abajo arriba y así sucesivamente, eso pues va a añadir algo de complejidad en la gestión de manera que bueno pues nos tocará implementarla.

![34-Parking-3](images/34-Parking-3.png)

Nuestro parking permitirá el acceso a a **tres tipos de vehículos** normales **coches o motos**, donde el precio del vehículo será de 4 céntimos de euro por minuto, añadiremos también dos clases que heredarán de vehículos **furgoneta y autobús** y que tendrán alguna modificación para que veamos cómo funciona el polimorfismo en el cálculo del importe que hay que pagar por la estancia en el parking. La furgoneta pues además de pagar lo que paga un vehículo adicionalmente pagará 20 céntimos por cada metro de longitud que tenga y los autobuses pagarán 25 céntimos adicionales por cada asiento que tengan. 

![34-Parking-4](images/34-Parking-4.png)

Vamos a trabajar bastantes elementos tecnológicos de los que hemos trabajado a lo largo del curso cómo son la herencia y polimorfismo, arrays bidimensionales, alguna colección con ArrayList, métodos estáticos y métodos de instancia, vamos a hacer una customización del método equals, la entrada y salida al ser especifica de nuestro  parking tendrá cierta lógica de negocio que también implementaremos.

![34-Parking-5](images/34-Parking-5.png)

Como no podía ser de otra manera para gestionar el precio de la estancia de los vehículos tendremos que manejar fecha y hora, para imprimir el ticket por pantalla usaremos el formateo de cadena y la clase StringBuilder y también usaremos alguna expresión lambda sencilla que hará que podamos evidenciar como se utilizan pero que no añada excesiva complejidad al uso de este ejemplo.

Bueno aquí tenemos el código dónde tenemos varias clases, si os parece lo primero que hacemos es ponerlo en ejecución, vemos cómo funciona y después iremos visitando el código para ver los apartados más importantes.

### Código

*dibujoParking.txt*

```sh
//   1     20     21      .. .. .. .. .. ..  100 
//   2  |  19     22  |   ..                  99
//   3  ▼  18  ▲  23  ▼                       98
//   4     17  |  24         ..               97
//   5     16     25                          96
//   6     15     25            ..            95
//   7  |  14     27  |                       94
//   8  ▼  13  ▲  28  ▼            ..         93
//   9     12  |  29      ..          ..      92
//  10     11     30      31 .. .. .. .. ..   91
```

*App.java*

```java
/**
 * APLICACIÓN QUE IMPLEMENTA LA GESTIÓN DE UN PARKING
 */
package parking;

import java.util.Scanner;

import parking.modelo.Autobus;
import parking.modelo.Furgoneta;
import parking.modelo.Parking;
import parking.modelo.Vehiculo;

public class App {

   static Parking parking;

   static Scanner sc;

   /**
    * @param args
    */
   public static void main(String[] args) {

      // Inicializamos las clases necesarias
      sc = new Scanner(System.in);
      // Ponemos en marcha el Parking.
      parking = new Parking();

      int opcion = 0;

      do {
         // Imprimimos el menú
         menu();
         System.out.print("Introduzca la opción seleccionada: ");
         opcion = Integer.parseInt(sc.nextLine());
         System.out.println("");
         switch (opcion) {
         case 1:
            registrarEntradaVehiculo();
            parking.imprimirEstadoParking();
            break;
         case 2:
            registrarSalidaVehiculo();
            parking.imprimirEstadoParking();
            break;
         case 3:
            if (parking.getPlazasDisponibles() > 0) {
               System.out.printf("Hay %d plazas disponibles %n", parking.getPlazasDisponibles());
            } else {
               System.out.println("El parking está COMPLETO");
            }
            break;
         case 4:
            parking.imprimirEstadoParking();
            break;
         case 5:
            System.out.printf("El saldo acumulado es de %.2f", parking.getSaldoAcumulado());
            break;
         case 6:
            parking.getVehiculos().forEach(System.out::println);
            break;
         default:
            System.out.println("Introduzca una opción correcta");
         }
      } while (opcion != 0);

         sc.close();
      }

      public static void menu() {

         System.out.println("BIENVENIDO AL PARKING CORONAVIRUS");
         System.out.println("==================================\n");
         System.out.println("0. Salir del programa");
         System.out.println("1. Registrar la entrada de un vehículo");
         System.out.println("2. Registrar la salida de un vehículo");
         System.out.println("3. Número de plazas disponibles");
         System.out.println("4. Imprimir estado del parking");
         System.out.println("5. Saldo acumulado del día");
         System.out.println("6. Imprimir la lista de vehiculos que hay en el parking");

      }

      public static void registrarEntradaVehiculo() {
         // Identificamos el tipo de vehículo
         int opcion = 0;
         do {
            System.out.println("1. Coche o moto");
            System.out.println("2. Furgoneta");
            System.out.println("3. Autobús");
            System.out.print("Introduzca el tipo de vehículo: ");

            opcion = Integer.parseInt(sc.nextLine());
         } while (opcion < 0 || opcion > 3);

         // Recogemos los datos propios de cualquier vehículo
         System.out.print("Introduzca la marca del vehículo: ");
         String marca = sc.nextLine();
         System.out.print("Introduzca la matrícula del vehículo: ");
         String matricula = sc.nextLine();

         Vehiculo v = null;

         // En función del tipo de vehículo, creamos una u otra referencia
         switch (opcion) {
            case 1:
               //Almacenamos los datos en mayúsculas
               v = new Vehiculo(matricula.toUpperCase(), marca.toUpperCase());
               break;
            case 2:
               // Si es una furgoneta, solicitamos la longitud
               System.out.print("Introduzca la longitud en metros de la furgoneta (puede incluir decimales): ");
               float longitud = Float.parseFloat(sc.nextLine());
               v = new Furgoneta(matricula, marca, longitud);
               break;
            case 3:
               // Si es un autobús, solicitamos el número de plazas
               System.out.print("Introduzca el número de plazas del autobús: ");
               int numPlazas = Integer.parseInt(sc.nextLine());
               v = new Autobus(matricula, marca, numPlazas);
         }

         // Registramos la entrada del vehículo
         parking.registrarEntradaVehiculo(v);
         System.out.println("");
      }
	
      public static void registrarSalidaVehiculo() {
         System.out.print("\nIntroduzca la matrícula del vehículo: ");
         String matricula = sc.nextLine();
         // Para registrar la salida de un vehículo solamente
         // necesitamos su matrícula
         parking.registrarSalidaVehiculo(new Vehiculo(matricula.toUpperCase()));
      }

}
```

#### Modelo

*Vehiculo.java*

```java
package parking.modelo;

import java.time.LocalDateTime;

public class Vehiculo {
	
   // Dejamos las propiedades como protected de forma didáctica, aunque su uso no está muy recomendado
   // Sería más recomendable que fuera private, y acceder desde las clases hija mediante getters/setters
   protected String matricula;
   protected String marca;
   protected LocalDateTime fechaEntrada;
   protected int minutos;
   protected int numPlazaAparcamiento; 
	
   public Vehiculo() { }
	
   public Vehiculo(String matricula) {
      this.matricula = matricula;
   }
	
   public Vehiculo(String matricula, String marca) {
      this.matricula = matricula;
      this.marca = marca;		
   }

   public String getMatricula() {
      return matricula;
   }

   public void setMatricula(String matricula) {
      this.matricula = matricula;
   }

   public String getMarca() {
      return marca;
   }

   public void setMarca(String marca) {
      this.marca = marca;
   }

   public LocalDateTime getFechaEntrada() {
      return fechaEntrada;
   }

   public void setFechaEntrada(LocalDateTime fechaEntrada) {
      this.fechaEntrada = fechaEntrada;
   }

   public int getMinutos() {
      return minutos;
   }

   public void setMinutos(int minutos) {
      this.minutos = minutos;
   }
	
   public int getNumPlazaAparcamiento() {
      return numPlazaAparcamiento;
   }

   public void setNumPlazaAparcamiento(int numPlazaAparcamiento) {
      this.numPlazaAparcamiento = numPlazaAparcamiento;
   }

   public float calcularImporte() {
      return Parking.PRECIO_BASE_POR_MINUTO * minutos;
   }
	
   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((fechaEntrada == null) ? 0 : fechaEntrada.hashCode());
      result = prime * result + ((marca == null) ? 0 : marca.hashCode());
      result = prime * result + ((matricula == null) ? 0 : matricula.hashCode());
      result = prime * result + minutos;
      return result;
   }

   // Modificamos la implementación por defecto del método equals para 
   // identificar que dos vehículos serán iguales si lo es su matrícula
	
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
//    if (getClass() != obj.getClass())
//	 return false;
      Vehiculo other = (Vehiculo) obj;
      if (matricula == null) {
         if (other.matricula != null)
            return false;
         } else if (!matricula.equalsIgnoreCase(other.matricula))
            return false;
         return true;
      }

      @Override
      public String toString() {
         return "Vehiculo [matricula=" + matricula + ", marca=" + marca + ", fechaEntrada=" 
	      + fechaEntrada + ", minutos=" + minutos + "]";
      }
}
```

*Autobus.java*

```java
package parking.modelo;

public class Autobus extends Vehiculo {
	
   private int numPlazas;
	
   public Autobus() { }
	
   public Autobus(String matricula, String marca, int numPlazas) {
      super(matricula, marca);
      this.numPlazas = numPlazas;		
   }

   public int getNumPlazas() {
      return numPlazas;
   }

   public void setNumPlazas(int numPlazas) {
      this.numPlazas = numPlazas;
   }
	
   @Override
   public float calcularImporte() {		
      return super.calcularImporte() + (Parking.PRECIO_POR_ASIENTO * numPlazas);
   }

   @Override
   public String toString() {
      return "Autobus [numPlazas=" + numPlazas + ", matricula=" + matricula + ", marca=" 
             + marca + ", fechaEntrada=" + fechaEntrada + ", minutos=" + minutos + "]";
   }
}
```

*Furgoneta.java*

```java
package parking.modelo;

public class Furgoneta extends Vehiculo {
	
   private float longitud;
	
   public Furgoneta() { }
	
   public Furgoneta(String matricula, String marca, float longitud) {
      super(matricula, marca);
      this.longitud = longitud;
   }

   public float getLongitud() {
      return longitud;
   }

   public void setLongitud(float longitud) {
      this.longitud = longitud;
   }
			
   @Override
   public float calcularImporte() {		
      return super.calcularImporte() + (Parking.PRECIO_POR_METRO * longitud);
   }

   @Override
   public String toString() {
      return "Furgoneta [longitud=" + longitud + ", matricula=" + matricula + ", marca=" 
             + marca + ", fechaEntrada=" + fechaEntrada + ", minutos=" + minutos + "]";
   }
}
```

*PlazaAparcamiento.java*

```java
package parking.modelo;

public class PlazaAparcamiento {
	
   private int numero;
   private boolean libre;
	
   public PlazaAparcamiento() { }
	
   public PlazaAparcamiento(int numero) {
      this.numero = numero;
      // Por defecto, al crear una plaza está libre
      this.libre = true;
   }

   public int getNumero() {
      return numero;
   }

   public void setNumero(int numero) {
      this.numero = numero;
   }

   public boolean isLibre() {
      return libre;
   }

   public void setLibre(boolean libre) {
      this.libre = libre;
   }

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + (libre ? 1231 : 1237);
      result = prime * result + numero;
      return result;
   }

   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (!(obj instanceof PlazaAparcamiento))
         return false;
      PlazaAparcamiento other = (PlazaAparcamiento) obj;
      if (libre != other.libre)
         return false;
      if (numero != other.numero)
         return false;
      return true;
   }

   @Override
   public String toString() {
      return "PlazaAparcamiento [numero=" + numero + ", libre=" + libre + "]";
   }
}
```

*Parking.java*

```java
/**
 * Clase que modela el Parking y su lógica de negocio.
 * 
 * IMPORTANTE: Para representar en algunos comentarios un mapa del parking, se ha modificado
 * la codificación de este fichero  UTF-8. Posiblemente, sea necesario que modifiques la misma
 * en eclipse para poder visualizarlo correctamente.
 */
package parking.modelo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import parking.utils.Utils;

public class Parking {
	
   // Mantenemos una lista con los vehículos que hay dentro del parking
   private List<Vehiculo> vehiculos;
	
   // Además, necesitamos saber qué plazas están libres o cuales están ocupadas
   private PlazaAparcamiento[][] plazasAparcamiento;
	
   // El número de plazas disponibles, para poder visualizarlo en el cartel de la entrada
   // Si el número de plazas disponibles es 0, el parking está COMPLETO
   private int plazasDisponibles;
	
   // Almacenamos el importe total que hemos cobrado a lo largo de la sesión
   private float saldoAcumulado;
	
   // La carta de precios la establecemos estáticamente en constantes, si bien
   // sería positivo buscar otro sistema, como un fichero de properties.
   public static final float PRECIO_BASE_POR_MINUTO = 0.04f;
   public static final float PRECIO_POR_METRO = 0.2f;
   public static final float PRECIO_POR_ASIENTO = 0.25f;
		
   public Parking() {
      saldoAcumulado = 0.0f;
      plazasDisponibles = 100;
      vehiculos = new ArrayList<>();
      // nuestro parking es cuadrado, así que lo representamos en
      // un array bidimensional de 10x10
      plazasAparcamiento = new PlazaAparcamiento[10][10];
      int numPlaza = 0;
      for(int j = 0; j < 10; j++) {
         // Las columnas pares se recorren de arriba a abajo
         // y las impares de abajo a arriba
         if (j % 2 == 0)
            for(int i = 0; i < 10; i++)		
               plazasAparcamiento[i][j] = new PlazaAparcamiento(++numPlaza);
            else
               for(int i = 9; i >= 0; i--)
                  plazasAparcamiento[i][j] = new PlazaAparcamiento(++numPlaza);
      }
		
      // Recorremos así el array para que quede de la siguiente forma
      // NOTA: Las flechas hacia abajo y arriba simulan el sentido de
      // los carriles por los que circularían los coches. 
		
      //   1     20     21      .. .. .. .. .. ..  100 
      //   2  |  19     22  |   ..                  99
      //   3  ▼  18  ▲  23  ▼                       98
      //   4     17  |  24         ..               97
      //   5     16     25                          96
      //   6     15     25            ..            95
      //   7  |  14     27  |                       94
      //   8  ▼  13  ▲  28  ▼            ..         93
      //   9     12  |  29      ..          ..      92
      //  10     11     30      31 .. .. .. .. ..   91
		
   }

   public int getPlazasDisponibles() {
      return plazasDisponibles;
   }

   public List<Vehiculo> getVehiculos() {
      return vehiculos;
   }

   public PlazaAparcamiento[][] getPlazasAparcamiento() {
      return plazasAparcamiento;
   }
			
   public float getSaldoAcumulado() {
      return saldoAcumulado;
   }

   /*
    * Método que imprime, de forma conveniente, el mapa del parking, 
    * indicando todas las plazas que hay y si están ocupadas o no.
    */
   public void imprimirEstadoParking() {
		
      for(int i = 0; i < 10; i++) {
         for(int j = 0; j < 10; j++) {
            PlazaAparcamiento plaza = plazasAparcamiento[i][j]; 
            String strPlaza = String.format("%3s", Integer.toString(plaza.getNumero())) + " " + ((plaza.isLibre()) ? "L" : "O") + "  "; 
            System.out.print(strPlaza);
         }
         System.out.println();
      }
      System.out.println("");
		
   }

   /*
    * Método que registra la entrada de un vehículo en el parking.
    */
   public void registrarEntradaVehiculo(Vehiculo v) {
		
      if (plazasDisponibles > 0) {
         // Asignamos la fecha y hora de entrada
         v.setFechaEntrada(Utils.fechaYHoraAleatoriaAlrededorFechaYHoraActual());
			
         // Colocamos el coche en una plaza de aparcamiento
         // Simularemos que esto se produce de forma aleatoria
         Random r = new Random();
         boolean cocheAparcado;
         int i, j, numPlaza = 0;
			
         do {
            cocheAparcado = false;		
            i = r.nextInt(10);
            j = r.nextInt(10);
				
            if (plazasAparcamiento[i][j].isLibre()) {
               plazasAparcamiento[i][j].setLibre(false);
               cocheAparcado = true;
               numPlaza = plazasAparcamiento[i][j].getNumero();
            }
         } while (!cocheAparcado);
			
         // Añadimos el coche a la lista de coches que tenemos
         // dentro del parking, asignándole el número de plaza que ocupa
         v.setNumPlazaAparcamiento(numPlaza);		
         vehiculos.add(v);
         --plazasDisponibles;
      } else {
         System.out.println("EL PARKING ESTÁ COMPLETO\n");
      }
   }
   
   /*
    * Método que registra la salida de un vehículo del parking
    */
   public void registrarSalidaVehiculo(Vehiculo v) {
		
      if (!vehiculos.contains(v)) {
         System.out.println("ESTE VEHÍCULO NO ESTÁ EN EL PARKING");
         return;
      } else {
         // Rescatamos la instacia de vehículo que tenemos
         // almacenada, ya que es la que tiene registrada
         // la fecha y hora de entrada
	 v = vehiculos.get(vehiculos.indexOf(v));
      }
		
      LocalDateTime salida = LocalDateTime.now();
		
      // Asignamos el número de minutos para calcular el importe
      v.setMinutos(Utils.minutosEntreDosFechas(v.getFechaEntrada(), salida));
		
      // Imprimimos el mensaje con el importe del pago
      StringBuilder ticket = new StringBuilder(
      	   String.format("TICKET DE SALIDA: %nMatrícula %s %nFecha y hora de llegada: %s "
      		+ "%nFecha y hora de salida: %s %nMinutos de estancia: %d%n", v.getMatricula(), 
		v.getFechaEntrada().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)),
		salida.format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)), 
		v.getMinutos()));
		
      if (v instanceof Furgoneta) {
         Furgoneta furgo = (Furgoneta) v;
         ticket.append(String.format("Longitud de la furgoneta %.2f ", furgo.getLongitud()));
      } else if (v instanceof Autobus) {
         Autobus bus = (Autobus) v;
         ticket.append(String.format("Núm. de plazas del autobús: %d " , bus.getNumPlazas()));
      }
		
      ticket.append(String.format("%nImporte total de la estancia: %.2f€ %n%n", v.calcularImporte()));
		
      System.out.printf(ticket.toString());
		
      // Añadimos el importe al saldo acumulado
      saldoAcumulado += v.calcularImporte();
		
      // Identificamos la posición que tenía ocupada el coche para dejarla libre
      int[] coordenadas = Utils.posicionNumeroPlaza(v.getNumPlazaAparcamiento());
      plazasAparcamiento[coordenadas[0]][coordenadas[1]].setLibre(true);
		
      // Eliminamos el vehículo de la lista
      vehiculos.remove(v);
		
      ++plazasDisponibles;
   }
}
```

#### Utils

*Utils.java*

```java
/**
 * Clase con métodos auxiliares
 */
package parking.utils;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Random;

public class Utils {
	
   /*
    * Este método nos devuelve una instancia de LocalDateTime aleatoria,
    * anterior a la fecha y hora actual, pero no muy lejana (en el intervalo
    * de entre 2 y 6 horas).
    */
   public static LocalDateTime fechaYHoraAleatoriaAlrededorFechaYHoraActual() {
      Random r = new Random();
      return LocalDateTime.now().minusHours(r.nextInt(4) 
             + 2).minusMinutes(r.nextInt(60)).minusSeconds(r.nextInt(60));		
   }
	
   /*
    * Nos devuelve la duración en minutos entre dos fechas
    */
   public static int minutosEntreDosFechas(LocalDateTime anterior, LocalDateTime posterior) {
      // Le sumamos un minuto a posterior, ya que al usar el método between, la fecha
      // más reciente es exclusiva.
      posterior = posterior.plusMinutes(1L);
      // Devolvemos la diferencia entre ambas fechas en minutos
      return (int) ChronoUnit.MINUTES.between(anterior, posterior); 
   }
	
   public static int[] posicionNumeroPlaza(int n) {
		
      int[] result;

      int unidades = n % 10;
      int decenas = n / 10;
      int fila, columna;

      // Este cálculo tenemos que hacerlo por la forma
      // en que hemos "dibujado" las plazas en el parking
      // Si n % 10 == 0 
      //    la decena es impar -> [9][decena-1]
      //    la decena es par -> [0][decena-1]
      // Si no
      //    Si la decena es par 
      //       [unidad-1][decena]
      //    Si no
      //       [10-unidad][decena]
      if (n % 10 == 0) {
         if (decenas % 10 == 1)
            fila = 9;
         else 
            fila = 0;
         columna = decenas - 1;
      } else {
         if (decenas % 2 == 0) 
            fila = unidades -1;
         else
            fila = 10 - unidades;
         columna = decenas;
      }
		
      // devolvemos las posiciones del resultado
      result = new int[]{fila, columna};
		
      return result;
   }
}
```

Al comenzar la jornada en el parking no tiene ningún coche dentro y abriría y comenzarían los vehículos a llegar, este sería el menú con las distintas operaciones que tendríamos, desde registrar la la entrada de un vehículo, la salida, ver el número de plazas que quedan disponibles, imprimir el estado del parking se imprimir el mapa del estado indicando el número de plazas y las plazas que están libres o las que están ocupadas y iremos acumulando el saldo del día para saber la caja al final del día y si queremos saber los vehículos que tenemos dentro con sus características los podremos listar.

**SALIDA:**

```sh
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 1

1. Coche o moto
2. Furgoneta
3. Autobús
Introduzca el tipo de vehículo: 1
Introduzca la marca del vehículo: Ford
Introduzca la matrícula del vehículo: 123ABC

  1 L   20 L   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 L   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 1

1. Coche o moto
2. Furgoneta
3. Autobús
Introduzca el tipo de vehículo: 2
Introduzca la marca del vehículo: PickUp Chevrolet
Introduzca la matrícula del vehículo: 898SDR
Introduzca la longitud en metros de la furgoneta (puede incluir decimales): 9

  1 L   20 L   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 1

1. Coche o moto
2. Furgoneta
3. Autobús
Introduzca el tipo de vehículo: 3
Introduzca la marca del vehículo: Mercedes Benz
Introduzca la matrícula del vehículo: 333LPU
Introduzca el número de plazas del autobús: 52

  1 L   20 O   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 3

Hay 97 plazas disponibles 
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 4

  1 L   20 O   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 6

Vehiculo [matricula=123ABC, marca=FORD, fechaEntrada=2020-04-26T17:17:07.800, minutos=0]
Furgoneta [longitud=9.0, matricula=898SDR, marca=PickUp Chevrolet, fechaEntrada=2020-04-26T16:57:28.571, minutos=0]
Autobus [numPlazas=52, matricula=333LPU, marca=Mercedes Benz, fechaEntrada=2020-04-26T19:08:44.591, minutos=0]
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 2


Introduzca la matrícula del vehículo: 333LPU
TICKET DE SALIDA: 
Matrícula 333LPU 
Fecha y hora de llegada: 26-abr-2020 19:08:44 
Fecha y hora de salida: 26-abr-2020 22:06:45 
Minutos de estancia: 179
Núm. de plazas del autobús: 52 
Importe total de la estancia: 20,16€ 

  1 L   20 L   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 4

  1 L   20 L   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 5

El saldo acumulado es de 20,16BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 6

Vehiculo [matricula=123ABC, marca=FORD, fechaEntrada=2020-04-26T17:17:07.800, minutos=0]
Furgoneta [longitud=9.0, matricula=898SDR, marca=PickUp Chevrolet, fechaEntrada=2020-04-26T16:57:28.571, minutos=0]
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 2


Introduzca la matrícula del vehículo: 123ABC
TICKET DE SALIDA: 
Matrícula 123ABC 
Fecha y hora de llegada: 26-abr-2020 17:17:07 
Fecha y hora de salida: 26-abr-2020 22:07:42 
Minutos de estancia: 291

Importe total de la estancia: 11,64€ 

  1 L   20 L   21 L   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 6

Furgoneta [longitud=9.0, matricula=898SDR, marca=PickUp Chevrolet, fechaEntrada=2020-04-26T16:57:28.571, minutos=0]
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 2


Introduzca la matrícula del vehículo: 898SDR
TICKET DE SALIDA: 
Matrícula 898SDR 
Fecha y hora de llegada: 26-abr-2020 16:57:28 
Fecha y hora de salida: 26-abr-2020 22:09:14 
Minutos de estancia: 312
Longitud de la furgoneta 9,00 
Importe total de la estancia: 14,28€ 

  1 L   20 L   21 L   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 L   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 3

Hay 100 plazas disponibles 
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 5

El saldo acumulado es de 46,08BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 0

Introduzca una opción correcta
```

Hemos añadido ciertos elemento aleatorio que simulen que el usuario buscaría la plaza de aparcamiento más adecuada para el y aparcaría el coche, eso lo hace el programa de forma aleatoria para añadir una cierta simulación de lo que  sería que entre el vehículo, se situe, que el sensor detecte donde ha aparcado y nos lo indica.

También hemos añadido un elemento aleatorio a la fecha de entrada para que bueno el cálculo del importe tenga elementos suficientes, tenga minutos suficientes, lo que hemos hecho es restarle una cantidad de tiempo aleatoria a la fecha de entrada de entre 2 y 6 horas para que tenga cierta funcionalidad la ejemplificación del proyecto.

La operación más interesante que sería registrar la salida del vehículo, nos pediría solamente la matrícula del vehículo, podremos ver como como hemos añadido cierta lógica incluso hemos modificado el método `equals` de la clase vehículo para que nos permita con solo gestionar la matrícula del vehículo poder detectar que el mismo que tenemos dentro. esto simularia que el usuario llefara a la máquina, introdujera su ticket que estaría asociado a su vehículo, de esta manera calcularía el ticket de salida, nos imprimiría los datos del vehículo, la matrícula, su fecha y hora de llegada, su fecha y hora de salida, la diferencia de ambas expresada en minutos, la longitud de la furgoneta y el importe total de la estancia, sumando los minutos por su precio la longitud de la furgoneta por el precio correspondiente

Vamos a pasar a ver el código de las diferentes partes, vamos a comenzar por las clases modelo, a partir de allí podemos ver la lógica de negocio y veremos también los distintos métodos estáticos que hemos añadido en la clase principal para recoger los datos.

Del modelo hay dos clases que son fundamentales que son `Vehiculo` y `Parking` y luego las demás que también vamos a necesitar.

`Vehiculo` es la base de la herencia de los tipos de vehículo que podemos manejar que ya habíamos dicho que son vehículo, coche o moto, furgoneta y autobuses, y por ser la base de la herencia tiene los atributos que serían comunes, así como algunos constructores y métodos getters y setters. Hemos intentado ilustrar el uso de `protected` pero al igual que os decía en la lección correspondiente a la herencia, vuelvo a insistir ahora que es el propio Oracle el que no recomienda demasiado el uso de `protected`, aquí hemos puesto los atributos con este modificador de acceso para poder ver un ejemplo. Si os dais cuenta qué si intentáis utilizar algún atributo de `Vehiculo` en clases que estan el mismo paquete, también tendrías acceso a los atributos, porque el modificador `protected` incluye también las posibilidades de acceso del modificador por defecto, sería bastante más recomendable en este ejemplo que usaremos atributos privados y si necesitamos acceder a esos atributos en algún momento que usaramos los getters y setters correspondiente. Bueno ya digo tenemos aquí la clase vehículo que bueno que ya digo son getters, setters

*Vehiculo.java*

```java
package parking.modelo;

import java.time.LocalDateTime;

public class Vehiculo {
	
   // Dejamos las propiedades como protected de forma didáctica, aunque su uso no está muy recomendado
   // Sería más recomendable que fuera private, y acceder desde las clases hija mediante getters/setters
   protected String matricula;
   protected String marca;
   protected LocalDateTime fechaEntrada;
   protected int minutos;
   protected int numPlazaAparcamiento; 
	
   public Vehiculo() { }
	
   public Vehiculo(String matricula) {
      this.matricula = matricula;
   }
	
   public Vehiculo(String matricula, String marca) {
      this.matricula = matricula;
      this.marca = marca;		
   }

   public String getMatricula() {
      return matricula;
   }

   public void setMatricula(String matricula) {
      this.matricula = matricula;
   }

   public String getMarca() {
      return marca;
   }

   public void setMarca(String marca) {
      this.marca = marca;
   }

   public LocalDateTime getFechaEntrada() {
      return fechaEntrada;
   }

   public void setFechaEntrada(LocalDateTime fechaEntrada) {
      this.fechaEntrada = fechaEntrada;
   }

   public int getMinutos() {
      return minutos;
   }

   public void setMinutos(int minutos) {
      this.minutos = minutos;
   }
	
   public int getNumPlazaAparcamiento() {
      return numPlazaAparcamiento;
   }

   public void setNumPlazaAparcamiento(int numPlazaAparcamiento) {
      this.numPlazaAparcamiento = numPlazaAparcamiento;
   }

   public float calcularImporte() {
      return Parking.PRECIO_BASE_POR_MINUTO * minutos;
   }
	
   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((fechaEntrada == null) ? 0 : fechaEntrada.hashCode());
      result = prime * result + ((marca == null) ? 0 : marca.hashCode());
      result = prime * result + ((matricula == null) ? 0 : matricula.hashCode());
      result = prime * result + minutos;
      return result;
   }

   // Modificamos la implementación por defecto del método equals para 
   // identificar que dos vehículos serán iguales si lo es su matrícula
	
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
//    if (getClass() != obj.getClass())
//	 return false;
      Vehiculo other = (Vehiculo) obj;
      if (matricula == null) {
         if (other.matricula != null)
            return false;
         } else if (!matricula.equalsIgnoreCase(other.matricula))
            return false;
         return true;
      }

      @Override
      public String toString() {
         return "Vehiculo [matricula=" + matricula + ", marca=" + marca + ", fechaEntrada=" 
	      + fechaEntrada + ", minutos=" + minutos + "]";
      }
}
```

El método de `calcularImporte()` multiplicaría los minutos por el precio base por minuto.

```java
   public float calcularImporte() {
      return Parking.PRECIO_BASE_POR_MINUTO * minutos;
   }
```

El método `equals` lo que hemos hecho es autogenerarlo con Eclipse pero después lo hemos modificado, mucho código de relleno lo he borrado directamente y alguno lo he dejado comentado para que podamos entender lo que estamos haciendo.

```java
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
//    if (getClass() != obj.getClass())
//	 return false;
      Vehiculo other = (Vehiculo) obj;
      if (matricula == null) {
         if (other.matricula != null)
            return false;
         } else if (!matricula.equalsIgnoreCase(other.matricula))
            return false;
         return true;
      }
```

Me centro primero en la segunda parte, para nosotros dos vehículos van a ser iguales en el programa del parking cuando su matrícula lo sea de esa manera nos va a servir fácilmente para poder localizar el vehículo dentro de una colección, cuando utilizamos métodos como `remove()` en la clase `ArrayList` o `contains(obj)` dónde le pasamos un objeto para que compruebe si está dentro y `remove()` para que compruebe y además lo borré, lo que va  haciendo es comparar con cada uno de los elementos del `ArrayList` en base al método `equals`, como ya digo para nosotros dos vehículos serán iguales en tanto y cuanto su matrícula lo sea, no puede haber en la calle dos vehículos que tengan la misma matrícula y sean diferentes, simplemente estamos tratando de modelar ese comportamiento. Así que esta parte 


```java
      Vehiculo other = (Vehiculo) obj;
      if (matricula == null) {
         if (other.matricula != null)
            return false;
         } else if (!matricula.equalsIgnoreCase(other.matricula))
            return false;
         return true;
      }
```

lo que hace es comprobar que un vehículo tiene matrícula, que la matrícula no es nula y que la matrícula es igual a la del otro vehículo, en lugar de que utilicé `equals` que sería el tramitación por defecto, bueno pues si el usuario ha introducido una matrícula unas en minúsculas otras en mayúscula para evitar esos problemas lo que hacemos es comparar con el método `equalsIgnoreCase` que tiene la clase `String` y qué bueno ignora si la cadena esta en mayúscula o minúscula a la hora de hacer la comparación. 

De la primera parte lo que hacemos es dejar la implementación que hace por defecto Eclipse, cuando nos general el método `equals`, sí se cumple que el operador `==` devuelve `true` nosotros devolveríamos `true` porque son realmente dos referencias a un mismo objeto. si el obeto que proporcionamos obviamente sería falso y hemos comentado dos líneas porque de dejarlas activas necesitariamos hacer la misma implementación de este método en las clases que heredaran de `Vehiculo`, para que fuera comparando tipo de clase con tipo de clase, es decir `Vehiculo` con `Vehiculo`, `Furgoneta` con `Furgoneta` y `Autobus` con `Autobus`. Para nosotros como digo como no puede haber en el mercado dos vehículos con la misma matrícula y que sean vehículos distintos incluso entre tipos pues nos ahorramos la comprobación de clases por que no va a ser necesario, de esta manera aun que utilicemos para comparar una instancia de `Vehiculo` con una matricula específica con una `Furgoneta` o `Autobus` si son la misma matrícula nos va a devolver `true` la coparación con `equals`.

```java
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
//    if (getClass() != obj.getClass())
//	 return false;
```

A partir de aquí para poder implementar el polimorfismo hemos customizado el método `calcularImporte` en las clases `Furgoneta` y `Autobus` de manera que el importe de la estancia de una `Furgoneta` es:

```java
   @Override
   public float calcularImporte() {		
      return super.calcularImporte() + (Parking.PRECIO_POR_METRO * longitud);
   }
```

el importe como vehículo más el precio por metro por la longitud en metros y en el caso del autobús:

```java
   @Override
   public float calcularImporte() {		
      return super.calcularImporte() + (Parking.PRECIO_POR_ASIENTO * numPlazas);
   }
```

el precio por asiento por el número de plaza añadido al importe base como vehículo.

Hasta aquí los tres tipos de vehículos que estamos manejando.

La siguiente clase que es importante es la clase `Parking` que podríamos decir que es el núcleo de toda la aplicación, porque además tiene dentro la lógica de negocio de entrada de un vehículo en el parking y de salida de un vehículo del parking.

*Parking.java*

```java
/**
 * Clase que modela el Parking y su lógica de negocio.
 * 
 * IMPORTANTE: Para representar en algunos comentarios un mapa del parking, se ha modificado
 * la codificación de este fichero  UTF-8. Posiblemente, sea necesario que modifiques la misma
 * en eclipse para poder visualizarlo correctamente.
 */
package parking.modelo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import parking.utils.Utils;

public class Parking {
	
   // Mantenemos una lista con los vehículos que hay dentro del parking
   private List<Vehiculo> vehiculos;
	
   // Además, necesitamos saber qué plazas están libres o cuales están ocupadas
   private PlazaAparcamiento[][] plazasAparcamiento;
	
   // El número de plazas disponibles, para poder visualizarlo en el cartel de la entrada
   // Si el número de plazas disponibles es 0, el parking está COMPLETO
   private int plazasDisponibles;
	
   // Almacenamos el importe total que hemos cobrado a lo largo de la sesión
   private float saldoAcumulado;
	
   // La carta de precios la establecemos estáticamente en constantes, si bien
   // sería positivo buscar otro sistema, como un fichero de properties.
   public static final float PRECIO_BASE_POR_MINUTO = 0.04f;
   public static final float PRECIO_POR_METRO = 0.2f;
   public static final float PRECIO_POR_ASIENTO = 0.25f;
		
   public Parking() {
      saldoAcumulado = 0.0f;
      plazasDisponibles = 100;
      vehiculos = new ArrayList<>();
      // nuestro parking es cuadrado, así que lo representamos en
      // un array bidimensional de 10x10
      plazasAparcamiento = new PlazaAparcamiento[10][10];
      int numPlaza = 0;
      for(int j = 0; j < 10; j++) {
         // Las columnas pares se recorren de arriba a abajo
         // y las impares de abajo a arriba
         if (j % 2 == 0)
            for(int i = 0; i < 10; i++)		
               plazasAparcamiento[i][j] = new PlazaAparcamiento(++numPlaza);
            else
               for(int i = 9; i >= 0; i--)
                  plazasAparcamiento[i][j] = new PlazaAparcamiento(++numPlaza);
      }
		
      // Recorremos así el array para que quede de la siguiente forma
      // NOTA: Las flechas hacia abajo y arriba simulan el sentido de
      // los carriles por los que circularían los coches. 
		
      //   1     20     21      .. .. .. .. .. ..  100 
      //   2  |  19     22  |   ..                  99
      //   3  ▼  18  ▲  23  ▼                       98
      //   4     17  |  24         ..               97
      //   5     16     25                          96
      //   6     15     25            ..            95
      //   7  |  14     27  |                       94
      //   8  ▼  13  ▲  28  ▼            ..         93
      //   9     12  |  29      ..          ..      92
      //  10     11     30      31 .. .. .. .. ..   91
		
   }

   public int getPlazasDisponibles() {
      return plazasDisponibles;
   }

   public List<Vehiculo> getVehiculos() {
      return vehiculos;
   }

   public PlazaAparcamiento[][] getPlazasAparcamiento() {
      return plazasAparcamiento;
   }
			
   public float getSaldoAcumulado() {
      return saldoAcumulado;
   }

   /*
    * Método que imprime, de forma conveniente, el mapa del parking, 
    * indicando todas las plazas que hay y si están ocupadas o no.
    */
   public void imprimirEstadoParking() {
		
      for(int i = 0; i < 10; i++) {
         for(int j = 0; j < 10; j++) {
            PlazaAparcamiento plaza = plazasAparcamiento[i][j]; 
            String strPlaza = String.format("%3s", Integer.toString(plaza.getNumero())) + " " + ((plaza.isLibre()) ? "L" : "O") + "  "; 
            System.out.print(strPlaza);
         }
         System.out.println();
      }
      System.out.println("");
		
   }

   /*
    * Método que registra la entrada de un vehículo en el parking.
    */
   public void registrarEntradaVehiculo(Vehiculo v) {
		
      if (plazasDisponibles > 0) {
         // Asignamos la fecha y hora de entrada
         v.setFechaEntrada(Utils.fechaYHoraAleatoriaAlrededorFechaYHoraActual());
			
         // Colocamos el coche en una plaza de aparcamiento
         // Simularemos que esto se produce de forma aleatoria
         Random r = new Random();
         boolean cocheAparcado;
         int i, j, numPlaza = 0;
			
         do {
            cocheAparcado = false;		
            i = r.nextInt(10);
            j = r.nextInt(10);
				
            if (plazasAparcamiento[i][j].isLibre()) {
               plazasAparcamiento[i][j].setLibre(false);
               cocheAparcado = true;
               numPlaza = plazasAparcamiento[i][j].getNumero();
            }
         } while (!cocheAparcado);
			
         // Añadimos el coche a la lista de coches que tenemos
         // dentro del parking, asignándole el número de plaza que ocupa
         v.setNumPlazaAparcamiento(numPlaza);		
         vehiculos.add(v);
         --plazasDisponibles;
      } else {
         System.out.println("EL PARKING ESTÁ COMPLETO\n");
      }
   }
   
   /*
    * Método que registra la salida de un vehículo del parking
    */
   public void registrarSalidaVehiculo(Vehiculo v) {
		
      if (!vehiculos.contains(v)) {
         System.out.println("ESTE VEHÍCULO NO ESTÁ EN EL PARKING");
         return;
      } else {
         // Rescatamos la instacia de vehículo que tenemos
         // almacenada, ya que es la que tiene registrada
         // la fecha y hora de entrada
	 v = vehiculos.get(vehiculos.indexOf(v));
      }
		
      LocalDateTime salida = LocalDateTime.now();
		
      // Asignamos el número de minutos para calcular el importe
      v.setMinutos(Utils.minutosEntreDosFechas(v.getFechaEntrada(), salida));
		
      // Imprimimos el mensaje con el importe del pago
      StringBuilder ticket = new StringBuilder(
      	   String.format("TICKET DE SALIDA: %nMatrícula %s %nFecha y hora de llegada: %s "
      		+ "%nFecha y hora de salida: %s %nMinutos de estancia: %d%n", v.getMatricula(), 
		v.getFechaEntrada().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)),
		salida.format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)), 
		v.getMinutos()));
		
      if (v instanceof Furgoneta) {
         Furgoneta furgo = (Furgoneta) v;
         ticket.append(String.format("Longitud de la furgoneta %.2f ", furgo.getLongitud()));
      } else if (v instanceof Autobus) {
         Autobus bus = (Autobus) v;
         ticket.append(String.format("Núm. de plazas del autobús: %d " , bus.getNumPlazas()));
      }
		
      ticket.append(String.format("%nImporte total de la estancia: %.2f€ %n%n", v.calcularImporte()));
		
      System.out.printf(ticket.toString());
		
      // Añadimos el importe al saldo acumulado
      saldoAcumulado += v.calcularImporte();
		
      // Identificamos la posición que tenía ocupada el coche para dejarla libre
      int[] coordenadas = Utils.posicionNumeroPlaza(v.getNumPlazaAparcamiento());
      plazasAparcamiento[coordenadas[0]][coordenadas[1]].setLibre(true);
		
      // Eliminamos el vehículo de la lista
      vehiculos.remove(v);
		
      ++plazasDisponibles;
   }
}
```

Un parking por un lado va a tener el listado de vehículos que tiene dentro, de manera que vamos a poder consultar qué vehículos son los que hay dentro, a qué hora entraron, su matrícula, su marca, etc. También va a tener las plazas de aparcamiento para saber si están libres u ocupadas, ya digo que con esto simulamos el hecho de que tuviéramos parking físico con unos sensores de presencia en cada una de las plazas que nos permitirán verificar si una determinada plaza está libre o está ocupada, lo haremos mediante un array bidimensional de la clase `PlazaAparcamiento`.

```java
   // Mantenemos una lista con los vehículos que hay dentro del parking
   private List<Vehiculo> vehiculos;
	
   // Además, necesitamos saber qué plazas están libres o cuales están ocupadas
   private PlazaAparcamiento[][] plazasAparcamiento;
```

`PlazaAparcamiento` la tenemos aquí.

*PlazaAparcamiento.java*

```java
package parking.modelo;

public class PlazaAparcamiento {
	
   private int numero;
   private boolean libre;
	
   public PlazaAparcamiento() { }
	
   public PlazaAparcamiento(int numero) {
      this.numero = numero;
      // Por defecto, al crear una plaza está libre
      this.libre = true;
   }

   public int getNumero() {
      return numero;
   }

   public void setNumero(int numero) {
      this.numero = numero;
   }

   public boolean isLibre() {
      return libre;
   }

   public void setLibre(boolean libre) {
      this.libre = libre;
   }

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + (libre ? 1231 : 1237);
      result = prime * result + numero;
      return result;
   }

   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (!(obj instanceof PlazaAparcamiento))
         return false;
      PlazaAparcamiento other = (PlazaAparcamiento) obj;
      if (libre != other.libre)
         return false;
      if (numero != other.numero)
         return false;
      return true;
   }

   @Override
   public String toString() {
      return "PlazaAparcamiento [numero=" + numero + ", libre=" + libre + "]";
   }
}
```

AQUIIIIIIII

`PlazaAparcamiento` es una clase sencilla que solamente tiene el número de plaza de aparcamiento de donante tendríamos también entero con el número de plazas disponibles para poder gestionarlo rápidamente el saldo acumulado dónde vamos a ir añadiendo no puedo conforme se registre la salida de los vehículos cuánto dinero hemos ido cobrando a lo largo de toda la sesión también tenemos aquí alguna constante definida como static final qué bueno dónde podemos definir el precio base por minuto el precio por metro 13 % habría mil maneras de implementar esta parte nombre de un fichero de perfil o algo similar o un fichero de configuración en algún formato conocido pero no teníamos tampoco si el ejemplo un poco más la lógica de inicio de un parque la tenemos por aquí cuando nosotros podremos decir empieza la jornada del parking el saldo acumulado se pone a cero no debe haber ningún vehículo dentro con lo cual tendríamos 100 plazas disponibles en la lista de vehículos que hay dentro estaría vacía mapa de plaza de aparcamiento comienza con todas las plazas libres y como podemos comprobar aquí empezamos ya a manejar la correspondiente valen las impares vale se fueran numerando de abajo arriba no según este este dibujo que tenemos para si tienes cuidado con si trabajáis en Windows en el cuidado con el tema de la codificación de fichero Windows utiliza una poco específica cuando trabajéis con Eclipse en Windows que no es f8hp 1252

```java
```



He cambiado la codificación de fichero en particular Audi S8 para que lo pudiera soportar no para ver la codificación de un fichero tiene quizás tan solo tenéis que darle al botón derecho propiedades y podéis manejar la codificación de texto bueno inicializamos nuestro mapa y ya está el parking libre para poder esperar la entrada y salida de mí cómo sería el manejo de salud cita bueno pues no podíamos ir la clase hace para ir visto la el menú es muy sencillo Valeo bucle while hasta que introduzca la opción cero y para registrar la entrada de un vehículo una vez que lo hemos recogido recogeremos la marca la matrícula y lo que haríamos sería en función del tipo de vehículo vale y es uno dos o tres creamos una instancia de vehículo una furgoneta pediríamos el dato adicional de furgoneta longitud y crearía molestarte de furgoneta y si fuera un autobús pues tendríamos el dato auxiliar de de un autobús y crearemos la estación y entonces llamaríamos al método de registrar entrada de un vehículo tipo vehículo aunque dentro lleve un vehículo una furgoneta o un autobús vale nos vendríamos a la clase parking a registrar por lo pronto podemos registrar la entrada del vehículo es el número de plazas disponibles superior hacer en caso de que no fuese C pues indie queríamos un mensaje de que el parking está completo y que no puede entrar ningún a partir de ahí lo que teníamos que hacer es registrar la entrada la fecha de entrada señora de eBay como decía lo vamos a hacer añadiendo un poco de elemento aleatorio mediante este método de la clase footing vale que es lo que va a hacer para la fecha y hora actual nos va a devolver una aleatoria hacer posible la misma fecha vale pero anterior en un intervalo de entre de entre 2 y 6 horas aproximadamente de esta manera bueno pues vamos a tener elementos para después saber el número de minutos que he estado un vehículo esta semana lo que hacemos después también concierto elemento aleatorio es aparcar el coche en una plaza aleatoria siempre y cuando esa plaza está libre para ello pues tenemos está para tanto que lo intenta aparcar si hay plazas disponibles tendrá que localizar alguna lo que va haciendo intentar aparcar en una plaza relatoria y si no está libre lo vuelve a intentar y si la plaza estuviera libre pues la marca como ocupada indica que el coche está aparcado y lo que haces qué bueno pues toma este dato el número de Plaza de la plaza de la plaza de aparcamiento porque están bien lo vamos a guardar en el en el vehículo será el dato que nos ayude después a saber en qué plaza de aparcamiento está y a partir de ese número calcular la posición dentro del parque no añadimos el vehículo dentro de la lista de vehículos que tenemos dentro del parking y decretamos las plazas cuál es la lógica para que un vehículo salga voy aquí es donde os decía que monos la customización del método y cual nos ayuda y es que vamos a registrar la salida de un vehículo la intentamos pasar entre la matrícula en mayúscula mala vamos a registrar la salida del vehículo


Comprobar y para cada uno de estos elementos pues tendría el algunos métodos auxiliares que nos devuelven ese cálculo en la unidad que le hemos indicado por ejemplo si quisiéramos calcular la diferencia entre dos fechas en horas lo haríamos de esta manera como lo que nos interesa es la diferencia en minutos no tenemos porque bueno pues calcularlo en otra unidad y transformar nosotros eso a minutos no por ejemplo no tenemos por que calcularlo en día la diferencia o en horas y pasarlo a minutos sino que directamente lo podemos hacer revolviendo la diferencia en minutos pues así damos el número de minutos dentro del vehículo que el lugar donde lo queremos guardar y nos decidimos a maquetar el mensaje con el importe de salvación dónde vamos a usar streambuilder porque vamos con este informa vamos a ir montando cadena de caracteres String que vamos a ir a juntando al Piqué en primera instancia le asignamos la matrícula le indicamos la fecha de entrada para ellos lo hacemos usando un datetimeformatter vale de bueno de nuestra localización y con un tamaño medio vale imprimir el día el mes del año la hora y los minutos indicaremos también de la fecha de salida vale son elementos que suelen quedar normalmente registrado en un ticket de un parking y el número de minutos ahora bien si además comprobamos que la instancia de vehículo vale el vehículo que hemos tomado de nuestro arrays y que ya bueno pues si sabemos si es furgoneta pues autobuses un vehículo a seca y sabemos que nuestro vehículo una furgoneta lo que hacemos es añadirle la longitud y si es un autobús lo que hacemos es añadirles el número de plazas no para que sale identificada en el ticket calcular el importe aquí como podemos comprobar si el vehículo que ha tenido que pagar este usuario saltando como lado Liebherr haríamos la posición esto también lo hemos hecho mediante un método de utilidad que lo que hace que bueno realiza el cálculo necesario en función del número de plazas conforme hemos hecho la numeración para saber si cuáles son las coordenadas de la plaza no lo hace mediante un pequeño calculo que he comentado a ti que podéis echar un vistazo para clarificar cómo cómo se hace eso si tenéis alguna duda os recomiendo que pinta y el mapa sobre un folio para ver cómo cómo se ha conseguido hacerse este cálculo bueno este este cálculo no te volvería dos coordenadas la fila y la columna y bueno si en parking los tendríamos las coordenadas para poder liberar esta plaza de aparcamiento marcarla como libre eliminar el vehículo de la lista de vehículo e incrementar el número de plazas a manera pues es muy implementado la simulación de utilización de un parking no al que solamente me faltaría para que fuera realmente funcional elemento hardware y algunos sensores decir fue alguna barrera la máquina de impresión de ticket de lectura de ticket genial Unicode elementos que realmente serían necesarios todo lo demás que tuviéramos esas máquinas que subirán conectada a nuestra aplicación sábado este parking pues la verdad es que sería totalmente funcionar con este ejemplo terminamos el curso de Java 8 desde cero espero que hayáis disfrutado de él o ánimo a que intente y hacer ahora el coche en ario de autoevaluación y si queréis saber más sobre Java o ánimo también a que pueda ir y hacer el curso de cada 8 para programadores Java

## Contenido adicional 6   

[Manipulación de datos con Stringbuilder](pdfs/30_StringBuilder.pdf)

[Manejo de fechas](pdfs/31_Manejo_de_fechas.pdf)

[Colecciones ArrayList](pdfs/32_Arraylist.pdf)

[Introducción a las expresiones lambda](pdfs/33_ExpresionesLambda.pdf)

[Proyecto_Final.pptx](otros/Proyecto_Final.pptx)

[Gráfico.xlsx](otros/Gráfico.xlsx)
