# 8. Apéndices 09:34
   * 32 Apéndice A. Ejercicios propuestos 01:18
   * 33 Apéndice B. Soluciones ejercicios resueltos y propuestos 04:10
   * 34 Apéndice C. Novedades en versiones Java 9, 10 y 11 04:06
   
# 32 Apéndice A. Ejercicios propuestos 01:18

Ejercicios Propuestos

1. Hacer un programa que, dados dos números, nos diga si uno es divisible por el otro. (lección 9)
2. Hacer un programa que, dada una variable que contiene la hora del día (valor entre 0 y 23), nos de un mensaje de buenos días si su valor está entre 6 y 12, mensaje de buenas tardes si es entre 13 y 20, y de buenas noches si es cualquier otro valor. (lección 11)
3. Realizar un programa que nos muestre el factorial de un número dado. (lección 14)
4. Tenemos dos variables, a y b, que almacenan dos números enteros cualquiera. Por otro lado, tenemos una variable c que contiene un número comprendido entre a y b. Hacer un programa que nos muestre, por una lado, la suma de todos los números comprendidos entre a y c y, por otro, la de los comprendidos entre c y b. (lección 14)
5. Realizar un programa que, dado un array de 10 números enteros y otro número almacenado en una variable, nos indique cuantos números del array son mayores que el contenido en la variable. (lección 21)
6. Realizar un programa que lea números y los guarde (hasta un máximo de 10). Los números no se pueden repetir, por lo que si al leer un número este ya está almacenado, no se guardará y se leerá otro. Así hasta completar el total. Después, el programa mostrará en pantalla todos los números almacenados. Aplicar la separación en clases (lección 25)
7. Realizar un programa que solicite al usuario la introducción de un texto y después una palabra. El programa nos mostrará la cadena resultante de eliminar del texto principal la palabra introducida. (lección 29)
8. Realizar un programa que solicite los datos de 5 alumnos (nombre, nota y edad). Después, el programa nos mostrará los nombres de todos los alumnos aprobados y también el que ha obtenido la máxima nota. (final)

# 33 Apéndice B. Soluciones ejercicios resueltos y propuestos 04:10

Soluciones Ejercicios Propuestos

1.- Hacer un programa que, dados dos números, nos diga si uno es divisible por el otro. (lección 9)

```java
public class Divisor {

     public static void main(String[] args) {

         //dos números cualquiera

         int n1=12;

         int n2=24;

         //son divisibles si el resto de la

         //división entre uno y otro es 0

         if(n1%n2==0) {

              System.out.println(n1+ " es divisible entre "+n2);

         }else if(n2%n1==0){

              System.out.println(n2+ " es divisible entre "+n1);

         }

         else {

              System.out.println("Los números no son divisibles");

         }

 

     }

 

}
```
 
 

2.- Hacer un programa que, dada una variable que contiene la hora del día (valor entre 0 y 23), nos de un mensaje de buenos días si su valor está entre 6 y 12, mensaje de buenas tardes si es entre 13 y 20, y de buenas noches si es cualquier otro valor. (lección 11)

SOLUCIÓN A:

```java
public class Mensaje {

     public static void main(String[] args) {

         int hora=3;

         //solución con swtich

         switch(hora) {

              case 6:

              case 7:

              case 8:

              case 9:

              case 10:

              case 11:

              case 12:

                   System.out.println("Buenos días");

                   break;

              case 13:

              case 14:

              case 15:

              case 16:

              case 17:

              case 18:

              case 19:

              case 20:

                   System.out.println("Buenas tardes");

                   break;

             

              default:

                   System.out.println("Buenas noches");

         }

     }

 

}
```

SOLUCIÓN B:

```java
public class Mensaje_b {

     public static void main(String[] args) {

         int hora=3;

         //solución con if

         if(hora>=6 && hora<=12) {

              System.out.println("Buenos días");

         }else if(hora>=13 && hora<=20) {

              System.out.println("Buenas tardes");

         }

         else {

              System.out.println("Buenas noches");

         }

 

     }

 

}
```
 
3.- Realizar un programa que nos muestre el factorial de un número dado. (lección 14)

```java
public class Factorial {

     public static void main(String[] args) {

         int n=5;

         //inicializa a 1 la variable con el resultado

         int res=1;

         //multiplica todos los números entre 1 y n

         for(int i=1;i<=n;i++) {

              res*=i;

         }

         System.out.println("El factorial de "+n+" es "+res);

 

     }
}
```
 
4.- Tenemos dos variables, a y b, que almacenan dos números enteros cualquiera. Por otro lado, tenemos una variable c que contiene un número comprendido entre a y b. Hacer un programa que nos muestre, por una lado, la suma de todos los números comprendidos entre a y c y, por otro, la de los comprendidos entre c y b. (lección 14)

```java
public class Sumatorio {

     public static void main(String[] args) {

         //variables con números cualquiera

         int a=2;

         int b=9;

         int c=7;

         //variables que almacenarán las sumas

         int suma1=0,suma2=0;

         for(int i=a;i<=c;i++) {

              suma1+=i;

         }

         for(int i=c;i<=b;i++) {

              suma2+=i;

         }

         System.out.println("Suma entre "+a+" y "+c+": "+suma1);

         System.out.println("Suma entre "+c+" y "+b+": "+suma2);

     }

}
```
 
5.- Realizar un programa que, dado un array de 10 números enteros y otro número almacenado en una variable, nos indique cuantos números del array son mayores que el contenido en la variable. (lección 21)

```java
public class ContarMayores {

     public static void main(String[] args) {

         //array de números cualquiera

         int nums[]= {6,9,11,3,16,70,8,12,1,35};

         int n=13; //número a comprobar

         int cont=0;//contador

         for(int i=0;i<nums.length;i++) {

              if(nums[i]>n) {

                   cont++;

              }

         }

         System.out.println("Total mayores de "+n+":"+cont);

 

     }

}
```
 
6.- Realizar un programa que lea  números y los guarde  (hasta un máximo de 10). Los números no se pueden repetir, por lo que si al leer un número este ya está almacenado, no se guardará y se leerá otro. Así hasta completar el total. Después, el programa mostrará en pantalla todos los números almacenados. Aplicar la separación en clases (lección 25)

```java
public class GestionNumeros {

     private int[] numeros;

     private int total; //indica el total de números guardados

     public GestionNumeros() {

         numeros=new int[10];

     }

     public boolean comprobarNumero(int n) {

         boolean res=false;

         //comproueba si el número recibido

         //está ya guardado

         for(int i=0;i<total;i++) {

              if(n==numeros[i]) {

                   res=true;

              }

         }

         return res;

     }

     public void agregar(int n) {

         //guarda el número si hay espacio

         if(total<10) {

              numeros[total]=n;

              total++;

         }

     }

     //indica cuantos números llevamos guardados

     public int existentes() {

         return total;

     }

     public int[] recuperarTodos() {

         return numeros;

     }

}
 

public class Principal {

 

     public static void main(String[] args) {

         GestionNumeros gnumeros=new GestionNumeros();

         Scanner sc=new Scanner(System.in);

         //realiza lectura de números

         //hasta completar los 10

         do {

              System.out.println("Introduce número");

              int leido=sc.nextInt();

              //solo guarda el número sino existe

              if(gnumeros.comprobarNumero(leido)) {

                   System.out.println("El número ya existe, introduce otro");

              }else {

                   gnumeros.agregar(leido);

              }

         }while (gnumeros.existentes()<10);

         //muestra todos los números

         int [] todos=gnumeros.recuperarTodos();

         for(int n:todos) {

              System.out.println(n);

         }

 

     }

 

}
```
 
7.- Realizar un programa que solicite al usuario la introducción de un texto y después una palabra. El programa nos mostrará la cadena resultante de eliminar del texto principal la palabra introducida. (lección 29)

```java
public class EliminarCadena {

     public static void main(String[] args) {

         Scanner sc=new Scanner(System.in);

         String texto, palabra,aux="";

         System.out.println("Introduce texto: ");

         texto=sc.nextLine();

         System.out.println("Introduce palabra");

         palabra=sc.nextLine();

         //creamos un array con todas la palabras

         //###u/u### texto

         String [] palabras=texto.split("[ ]");

         //agrupamos en la variable aux todas

         //las palabras ###u/u### texto, excepcto la buscada

         for(String s:palabras) {

              if(!s.equals(palabra)) {

                   aux+=s+" ";

              }   

         }

         //en aux quedará la frase completa

         //menos la palabra buscada

         System.out.println(aux);

 

     }

 

}
```
 
8.- Realizar un programa que solicite los datos de 5 alumnos (nombre, nota y edad). Después, el programa nos mostrará los nombres de todos los alumnos aprobados y también el que ha obtenido la máxima nota. (final)

```java
public class Alumno {

     private String nombre;

     private double nota;

     private int edad;

     public Alumno(String nombre, double nota, int edad) {

         super();

         this.nombre = nombre;

         this.nota = nota;

         this.edad = edad;

     }

     public String getNombre() {

         return nombre;

     }

     public void setNombre(String nombre) {

         this.nombre = nombre;

     }

     public double getNota() {

         return nota;

     }

     public void setNota(double nota) {

         this.nota = nota;

     }

     public int getEdad() {

         return edad;

     }

     public void setEdad(int edad) {

         this.edad = edad;

     }

    

}

 

public class GestionAlumnos {

     private Alumno[] alumnos;

     private int total; //indica el total de alumnos registrados

     public GestionAlumnos() {

         alumnos=new Alumno[5];

     }

    

     public void guardarAlumno(String nombre, double nota, int edad) {

         //si hay espacio, crea el alumno

         //y lo guarda en el array

         if(total<5) {

              alumnos[total]=new Alumno(nombre, nota, edad);

              total++;

         }

     }

     //indica cuantos números llevamos guardados

     public int existentes() {

         return total;

     }

     public Alumno maximaNota() {

         //inicializamos a null la variable

         //donde guardaremos

         //el alumno con máxima nota

         Alumno al=null;

         //variable que guarda la máxima nota

         //se inicialzia a 0

         double nota=0.0;

         for(int i=0;i<total;i++) {

              //si encontramos un alumno con mayor nota

              //Actualizamos las variables

              if(alumnos[i].getNota()>nota) {

                   al=alumnos[i];

                   nota=alumnos[i].getNota();

              }

         }

         return al;

     }

     public int totalAprobados() {

         //calcula el total de aprobados

         int aprobados=0;

         for(int i=0;i<total;i++) {

              if(alumnos[i].getNota()>=5) {

                   aprobados++;

              }

         }

         return aprobados;

     }

     public Alumno[] recuperarAprobados() {

         int ap=0;//contador de aprobados

         //creamos un array con el tamaño

         //de los alumnos aprobados

        

         Alumno[] encontrados=new Alumno[totalAprobados()];

         for(int i=0;i<total;i++) {

              if(alumnos[i].getNota()>=5) {

                   encontrados[ap]=alumnos[i];

                   ap++;

              }

         }

         return encontrados;

     }

}

 

public class Principal {

 

     public static void main(String[] args) {

         GestionAlumnos galumnos=new GestionAlumnos();

         Scanner sc=new Scanner(System.in);

         //realiza lectura de alunnos hasta

         //completar los 5

         do {

              String nombre;

              double nota;

              int edad;

              System.out.println("Introduce nombre");

              nombre=sc.nextLine();

              System.out.println("Introduce nota");

              nota=Double.parseDouble(sc.nextLine());

              System.out.println("Introduce edad");

              edad=Integer.parseInt(sc.nextLine());

              galumnos.guardarAlumno(nombre, nota, edad);

             

         }while (galumnos.existentes()<5);

         //muestra resultados

         System.out.println("Alumno con mayor nota: "+galumnos.maximaNota().getNombre());

         System.out.println("Aprobados: ");

         Alumno[] aprobados=galumnos.recuperarAprobados();

         for(Alumno al:aprobados) {

              System.out.println(al.getNombre());

         }

 

     }

 

}
```
 

### Recursos de esta clase

[ejercicios.zip]()

# 34 Apéndice C. Novedades en versiones Java 9, 10 y 11 04:06   

En esta elección quería hablarte de las novedades que han aparecido en las últimas versiones de Java concretamente Java 9 Java 10 y Java 11.

Y es que dejaba nueve la política de Oracle han sido lanzar nuevas versiones del lenguaje y en general de la librería Java estándar cada seis meses.

Eso ha hecho que últimamente nos estemos encontrando con una nueva versión cada dos por tres aunque lógicamente con pocas novedades respecto a las anteriores.

Bien lo que te voy a presentar a continuación es un listado de esas novedades que han aparecido en cada una de estas tres versiones que te comento aunque muchas de ellas no afectan a lo que hemos estudiado a lo largo del curso es decir no afectan a lo que sería el lenguaje y las clases básicas.

Por ejemplo Java 9 que es la que lógicamente más novedades trajo porque apareció como un par de años después de Java 8 pues incluye por ejemplo el carácter de Subrayado que podíamos utilizar en Java 8 como identificador de variable no puede utilizarse en Java 9 como como un identificador es decir podría combinarse con otras con otras letras con otros caracteres pero no como carácter único vale.

Algunas de estas novedades que sí que afectan a lo que es el lenguaje la vamos a ver más vas a poder conocer con más profundidad en un documento adjunto que tenemos en esta elección cuando termines el vídeo lo podrás consultar.

Otra de las novedades interesantes métodos privados en interfaces la idea de incluir métodos privados en interfaces utilizaciónde constantes efectivas entre con recursos una herramienta que también comentaremos en el documento de profundizaremos en algunas de estas novedades que la herramienta JSE para poder utilizar provar llamadas a métodos probar expresiones a través de línea de comandos sin necesidad de tener que crearte un programa un proyecto con un entorno de desarrollo por ejemplo con Eclipse.

Crear una clave es el método de una forma mucho más rápida y sencilla.

La modularidad es una de las novedades más importantes de Java 9 métodos en la clase string métodos de factoría en unas interfaces de colección.

Esto no nos afectaría algo que hemos estudiado en el curso.

Luego ya como ves en Java 10 la cosa se ha ido reduciendo porque Java 10 apareció seis meses después de Java 9.

Entonces sí que incluye una novedad muy interesante que es la inferencia de tipos que también la estudiamos en profundidad en el documento que te comentaba.

Métodos para generar copias de colecciones clones de colecciones.

Métodos de reducción en Collector no son novedades realmente salvo la inferencia de tipos nosotros no son muy significativas y Java 11 que apareció seis meses después de Java 10 pues tampoco tiene novedades muy significativas si acaso lo más interesante sería uno de los métodos que se han incorporado en la clase string de manipulación de cadenas de caracteres que si se estudian en el curso y por lo tanto esto lo comentaremos después en el documento te invito a que ahora consúltese dicho documento y puedas ver un poquito más de detalle algunas de esas novedades muy interesantes que afectarían a lo que hemos estudiado a lo largo de curso.

Para terminar el vídeo pues simplemente comentarte que el entorno desarrollo Eclipse que hemos utilizado en el curso en la versión oxígeno pues no incorpora la posibilidad de trabajar con Java 11 si hay una nueva versión de eclipse muy reciente que puedes descargar en Eclipse apuntó Ordos.

Los paquetes que es el eclipse 2018 09 entrarías en esa dirección y ahí descargaremos el eclipse de forjaba developers.

Esto realmente es un eclipse para también programar aplicaciones web.

Ahora mientras estás aprendiendo Java no sería tu caso pero bueno es un entorno ya muy completo que si en un futuro quieres puedes profundizar el desarrollo de aplicaciones para web y demás pues podría seguir usando esta versión.

Y como digo lo más interesante es que este incluya soporte para Java.
