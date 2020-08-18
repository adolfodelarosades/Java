# 7. Manejo de excepciones 39m
   * 26 Excepciones y errores 9:28 
   * 27 Tratamiento de excepciones 13:36 
   * 28 Excepciones más comunes 4:49 
   * 29 Lanzamiento y propagación de excepciones 11:25 
   * Contenido adicional 4
   
# 26 Excepciones y errores 9:28

## Resumen del Profesor

[Excepciones y errores](pdfs/26_Excepciones_y_errores.pdf)


### 26.1 Excepciones

El término excepción es una abreviatura de *situación excepcional*. Se trata de una situación que altera la ejecución normal de un programa. Por ejemplo, en una calculadura, un usuario intenta realiza la división `2 / 0`. En ese momento, el sistema crea un objeto, que se llama *objeto de excepción* y lo pasa de una llamada de método a otra, buscando quien pueda hacerse cargo. Si no existe nadie, será la propia JVM quien lo haga.

El uso de excepciones tiene varias ventajas:

* Permiten separar el código de tratamiento de errores del código normal.
* Evitan que haya errores inadvertidos.
* Permiten la propagación de los errores.
* Permiten agrupar en un lugar común el tratamiento de errores.

### 26.2 Tipos de Excepciones

Podemos agrupar las excepciones en 3 grandes tipos:

* Excepciones comprobadas (*checked exceptions*): son aquellas excepciones que pueden surgir internamente en un programa, pero que al estar bien escrito, podemos tratar y de las que nos podremos recuperar.

* Errores (*errors*): situaciones externas que no son anticipables, y de las que puede que no podamos recuperarnos (por ejemplo, un error hardware). Son un tipo no comprobado (*unchecked*)

* Errores de ejecución (*Runtime errors*): son situaciones interas de la aplicación, de las que probablemente no podamos recuperarnos. Son un tipo no comprobado (*unchecked*).

## Trascripción

![26_Excepciones_y_errores-1](images/26_Excepciones_y_errores-1.png)

![26_Excepciones_y_errores-2](images/26_Excepciones_y_errores-2.png)

![26_Excepciones_y_errores-3](images/26_Excepciones_y_errores-3.png)

![26_Excepciones_y_errores-4](images/26_Excepciones_y_errores-4.png)

![26_Excepciones_y_errores-5](images/26_Excepciones_y_errores-5.png)

![26_Excepciones_y_errores-6](images/26_Excepciones_y_errores-6.png)

Hola a todos vamos a comenzar un nuevo bloque en el que hablaremos de excepción ahora todo el código que hemos ido desarrollando hemos supuesto pues que no solamente que iba a funcionar bien como no iba a funcionar así nosotros somos estupendos programables sino que bueno pues que toda situación que se iba a presentar era una situación normal o si queríamos tratar algún tipo de situación que no fuese la normal recordar por ejemplo los diferentes ejemplos que hemos hecho que incluyan un menú pues si la opción que introducía en el menú no estaba dentro del rango que nosotros teníamos definido lo comprobamos a través de un pequeño ahí y y podíamos decirle de equivocado usted la opción que introducido sin embargo es posible que se nos presenten situaciones excepcionales muchas de las veces sucederá porque un valor introducido por el usuario no es correcto otra es posible que sea porque los programadores que son humanos pues se hayan equivocado en la secuencia de operaciones de potencias que bancaria esta situación excepcional es posible que altere la ejecución de normal de nuestro programa al producirse esa situación excepcional el método dónde dónde sucede crea un objeto especial que recoge de alguna manera información sobre esa situación excepcional llamado objeto de ese objeto de excepción y que se lo pasa a alguien para que pueda tratar lo veremos además como si teníamos uno por una serie llamada a métodos que dentro habían llamado a otro método el método dónde sucede el error es posible que vaya pasando este objeto de excepción a diferentes métodos que traten de encontrar alguno que sea capaz de de manejar la excepción quien pueda manejarlo por ejemplo si uno de los métodos si tiene el mecanismo necesario para manejar esta excepción gratis recoges objeto del tratamiento que corresponda llegar a existir ese objeto sería la máquina virtual de Java la que le daría un tratamiento por defecto a cualquier excepción ese tratamiento por defecto pasa por imprimir lo que se conoce como la traza de la pila y finalizar la ejecución del programa la traza de la pila sería imprimir bueno pues el método actual en el que nos encontrábamos el finde alguna información sobre el perro y a raíz de ahí el método sobre el que habíamos llamado y habíamos llamado anteriormente etcétera etcétera hasta llegar al metro 2000 sería el tratamiento por defecto que haría la máquina virtual de Java no sería que esté así que en ningún en ningún caso salvo que estemos comenzando le el desarrollo de una pequeña aplicaciones no queramos todavía darle el tratamiento a esta situación excepcional espero que así que en ningún caso sería el más adecuado con sus respectivos nos queremos centrar en algo didáctico y que nos veamos allí tratamiento a esta excepción el uso de expresiones nos va a permitir separar el código de tratamiento de errores del código normal como decían en nuestra ocasiones anteriores el tratamiento del hecho de que un usuario introdujeron la opción de menú que no era correcta lo teníamos junto con el código del menú del resto del programa habrá situación en la que eso no sea de cuanto que podamos separar físicamente el código del tratamiento de error del código normal también nos va a permitir el uso de excepciones le evitar que haya errores que puedan pasar inadvertidos tanto para el programador como bueno si no se lo digo lo utilizarán otros programadores también va a permitir propagar errores en decir si un error se sucede sucede en una parte podamos propagarlo hasta el objeto que pueda tratarlo y también pues nos permite coge cenar el código de tratamiento de errores para agruparlos en un lugar común vale Java nos ofrece diferentes tipos de excepciones a través de varios interfaces y y su interfaz es que podemos encontrar Hola todo vamos a comenzar un nuevo bloquéame y que hablaremos especial

Por programas están bien escrito vale un error de del programador los errores son situaciones externas a nuestra aplicación y es imposible anticiparnos a ellos imaginemos no que bueno que estamos tratando de acceder a un fichero y el volumen el disco duro en el que está este Cicero tú tiene algún tipo de error hardware imposible de que podamos participar y los de tipo ruta en error perdón run time error de ejecución que son situaciones internas a la aplicación no son externa y de las cuales pues no nos vamos a poder recuperarlo el uso de un tipo u otro tipo vendrá marcado por alguna de las siguientes cuestiones las de tipo chequeado pues la usaremos cuando la excepción es la única manera de detectar el error y no queremos que pase inadvertido que veremos a partir de ahora con el Burguer la noche quedado pues la podremos usar cuándo podemos intentar mejorar el código para que no suceda ese error o la excepción sirve para detectar y corregir uso indebido de la clase vale o errores internos antes los que poco podemos hacer vamos a ver alguna ejemplo de situaciones excepcionales algunas situaciones excepcionales se podrían suceder provocar errores en el momento de compilación de distribución de ella el profe por ejemplo tratamos de trabajar con una variable que no esté inicializada eso sería una instancia de una clase muy particular trimper una instancia de una clase bueno y expectación no ha sido inicializada bueno pues no te vienes ya de aguja o podemos comprobar no podemos usar la clase me si no ha sido inicializada con absolutamente ningún tipo de valor no en otro caso podríamos tener por ejemplo inicializamos expresamente una variable anulo y tratamos de imprimir este va lo podemos comprobar como bueno imprimir un valor nulo sin LN para imprimir rulo bueno pues nosotras sin embargo si tratamos de acceder a un método de un objeto en particular de una instancia de Menem pero esa instancia resiste signo referencia ninguna instancia en valor nulo una excepción de tipo NULL pointer exception y recién estamos intentando acceder a una referencia perdona un objeto a través de una referencia pero esa referencia realmente no está apuntando en este referenciando a ningún objeto esto el buen programador en este caso y podría plantearse el escribir código que permitirán manejar este error otro tipo quizá sea menos posible marcar supongamos que en este caso bueno pues amor en este caso lo dejamos tarde estamos declarando la variable la estamos inicializando con valores literales pensemos en la calculadora que teníamos implementada y en la que bueno pues loca Lorenzo introducir usuario y tratamos de hacer la división de a entrever la división entera sería dividirlo entre 0 la división entre 0 no es posible vale ponte matemáticamente no es posible y entonces se nos produciría una excepción de tipo de tipo aritmético no es posible hacer una división entre cero está excepciones por sería mucho más complicado el poder controlar la excepción que es muy muy complicado de controlar porque si el usuario es que introduciendo los valores pues no sería no sería muy complicado poder anticipar Javan ofrece un mecanismo para el tratamiento de excepciones que vamos a trabajar en el siguiente


# 27 Tratamiento de excepciones 13:36 

[Tratamiento de excepciones](pdfs/27_Tratamiento_de_excepciones.pdf)

## Resumen del Profesor

### 27.1 Tratamiento de excepciones

Se realiza utilizando la siguiente sintaxis:

```java
try {
    instrucciones;
} catch (Exception e) {
    instruccinoes;
} finally {
    instrucciones
}
```

`finally` no es obligatorio, y podemos incluir más de un bloque catch.

### 27.2 Bloque `try`

Debe envolver las sentencias que son susceptibles de provocar uno o varios tipos de excepción. Debemos agrupar las sentencias que vayan a tener un tratamiento idéntico de la situación excepcional.

```java
    try {
            int a = 2;
            int b = 0;
            System.out.println(a/b); //Error de división entre 0            
        } catch(ArithmeticException ex) {
            //ex.printStackTrace();
            System.err.println("Error: " + ex.getMessage());
        }
```

### 27.3 Bloque `catch`

Sirven como manejadores de las situaciones excepcionales. Puede haber más de uno. Cada bloque puede manejar uno o más tipos de excepciones:

```java
        try {
            for (int i = 0; i < 5; i++) {
                System.out.println(mensajes[i].toUpperCase());
            }
        } catch (ArrayIndexOutOfBoundsException | NullPointerException ex) {
            System.err.println("Tratamiento común a las excepciones");
        }
 ```
 
 ```java
        try {
            for (int i = 0; i < 5; i++) {
                System.out.println(mensajes[i].toUpperCase());
            }
        } catch (ArrayIndexOutOfBoundsException ex) {
            System.err.println("Tratamiento particular a las excepción ArrayIndex...");
        } catch (NullPointerException ex) {
            System.err.println("Tratamiento particular a la excepción NullPointer...");
        }
```

### 27.4 Bloque `finally`

Se ejecuta siempre, tanto si hemos terminado correctamente el bloque `try` como el bloque `catch`. Se suele utilizar como código que asegura el cierre de recursos abiertos (ficheros, bases de datos, ...).

## Transcripción

![27_Tratamiento_de_excepciones-1](images/27_Tratamiento_de_excepciones-1.png)

![27_Tratamiento_de_excepciones-2](images/27_Tratamiento_de_excepciones-2.png)

![27_Tratamiento_de_excepciones-3](images/27_Tratamiento_de_excepciones-3.png)

![27_Tratamiento_de_excepciones-4](images/27_Tratamiento_de_excepciones-4.png)

![27_Tratamiento_de_excepciones-5](images/27_Tratamiento_de_excepciones-5.png)

![27_Tratamiento_de_excepciones-6](images/27_Tratamiento_de_excepciones-6.png)

En el anterior hemos presentado la excepción que vamos a ver cómo podemos darle tratamiento ofrece una sintaxis especial para poder dar tratamiento acciones que van a poder provocar algún tipo de excepción y bueno nos vamos a poder recoger que como hablábamos en la terminología utilizada como antes vamos a poder recoger esas pensión y darle tratamiento y adicionalmente vamos a poder tener un bloque de código que será especial lo que salga la estructura sería la que tenemos en pantalla encerrar y amos dentro del bloque trae el código propio de la aplicación es decir el qué es susceptible de general alguna situación excepcional a continuación tendríamos uno más blokkestraat que sería el manejo de esa situación excepcional y por último y de manera optativa podríamos tener bloque finally my que tendríamos diferente instrucciones que se ejecutarían tantos el código lo que trae ha finalizado correctamente como si hay sucedido algún tipo de extensión y le hemos dado tratamiento vale como decíamos finally no me obligatorio puede haber más de un bloque está tener presente que los tipos decisión de venir de más concretos a más genérico porque si hay varios bloques CAD y el primer chat es el de una clase de excepción muy genérica por ejemplo la clase Exception pues directamente eso es lo que va a recoger el tratamiento de esa expresión sobrecitos de especiales hablaremos en vídeo siguiente directamente recogería y si queríamos darle un tratamiento más concreto una excepción por ejemplo de entrada salida con el teclado con la pantalla con jilguero pues escaparía no porque no había recogido el timoma genérico antes tenemos que pensar el que vamos trabajando con primero pon con unos trámites que estén más concreto para posteriormente pasar a algunos más genérico desde las última persiana pescaba si no mal recuerdo desde la Virgen de siete dejado tenemos un operador entre la barra vertical que nos va a permitir recoger en un mismo k dos tipos de sesión distintos que el tratamiento que queremos darle es el mismo una cosa que sería bastante como decíamos el bloque trail debía encerrarme bien volver plaza enfrente que son susceptibles de provocar alguna alguna situación excepcional alguna excepción y deberíamos agrupar las sentencias que vayan a tener un tratamiento idénticos vale no tenemos porque crear block strike centro por ejemplo de un momento todo lo que estáis distintos para sentirse diferente si se ejecutan de manera encadenada o secuencial y bueno van a tener el tratamiento común de un mismo tipo de techno con respecto a los bloques catch incidir en que puede haber más de uno que nos permiten definir dentro de ese bloque CAD lo que llamamos el manejador del error de la excepción y que cada bloque maneja al menos un tipo de excepción aunque puede manejar más de un tipo comedor operador de barra vertical el bloque Saint Alice ejecuta siempre siempre siempre tanto si han terminado de ejecutarse todas las sentencias del bloque trae como sí bueno alguna de ellas ha provocado la situación excepcional y se ha pasado a manejar a través de un caso en el final y se suele incluir código que no asegura el cierre de recurso abierto como fichero o base de datos para asegurarnos que se cierra tanto si hemos escuchado bien la operación como si lo hemos ejecutado a través de una situación excepcional la finalización y abrir algo vamos a ver poco a poco el tratamiento de algunas situaciones excepcionales que hemos visto en el ejemplo anterior de la especiales si quisiéramos anticiparnos al posible error de una división entre 0 bueno pues tendríamos esta es lo que le eche si os parece bien lo vamos a generar de 30 para que veáis cómo cómo podemos incluirlo lo que trae ya desde Eclipse


Cómo podemos comprobar este tipo de error no va a ser de los que no nos podemos anticipar con local eclipse no nos sugiere que va a requerir del uso de un tratamiento excepcional no tendríamos que decir nosotros otra vez el objeto de tipo cesión lo conoceremos en el siguiente bloque nos provee un método que digamos que es el comportamiento por defecto incluso cuando sucede una excepción es decir darle este tratamiento en particular a esta sesión y no darle ninguno sería igual porque aquí lo que hace es imprimir la traza de la pila vale mensajes que sí solamente estuviéramos solamente estuviéramos ejecutando la sentencia sin embargo el club haría que nosotros pudiéramos hacer algo aquí alguna operación adicional o incluso pudiéramos sustituir este este tratamiento incluso poder continuar con nuestra aplicación no hemos podido hacer es operación pero no quiere decir que tengamos que cerrar la aplicación no tiramos un tratamiento al error hemos tenido una situación excepcional en el caso anterior porque el tratamiento que hace la máquina virtual de Java como hemos dicho es inscribir la terraza de la pida terminar las que comprenden todas algo parecido estamos haciendo aquí podemos comprobar trabajar con con excepción con arithmetic exception con una instancia de ella y en particular por ejemplo podríamos tratar de imprimir el mensaje sin tener que parar definitivamente la la ejecución del programa no imprime iríamos solamente el mensaje ha habido un error de división entre 0 y bueno este tratamiento nos permitiría continuar con la excepción podríamos incluso plantearnos el uso de algún bloque finally junto con este tratamiento de infección y quisiéramos incluir el uso de estrictamente necesarias independientemente de que digo ocurre un error on ocurre por ejemplo en este caso la división sea centre doyuno la división se hace correctamente no sucede una excepción y el bloque trae perdones bloque finally se ejecuta si cambiáramos F110 la dirección no se hace correctamente ocurre un error pero independientemente de que haya sucedido correctamente podemos plantearnos el tratamiento de Mapfre una excepción o bloque catch en los cuales como decíamos iríamos de más concreto decepción más concreta hacia una excepción más genérica así tendríamos dos posibles errores uno es el de divisiones tercero y el otro es el de vale llamar a un método a través de una referencia que no está apuntando a ningún objeto que una referencia nula podemos comprobar como producido un error que no esperábamos no esperábamos que si el programa de utilizar una referencia nula o en este caso si estuviéramos haciendo la división la ejecución de esta sentencia pararía aquí porque esto producir produciría una excepción de tipo aritmético con lo cual se va a tratar en este bloque CAD de aquí decir que no se

De aquí esto quiere decir que no se pasa ejecutar estas dos sentencias que además ya hemos comprobado que podían producir un error y que el tratamiento se le da con este bloque CAD de aquí no podríamos plantear otro tipo de excepciones por ejemplo una que suele ser muy cómodo para para los programadores que trabajan con colección eso o con array es el tipo de excepción letra tarde que recorrer una colección de mensaje si comenzáramos así podríamos comprobar como esto se imprime a priori parece correcta vale pero nos damos cuenta que la raíz de 100 mensajes tiene una dos tres cuatro posiciones y que aquí estamos tratando de acceder a una quinta posición que no existe este error se trataría mediante la excepción array index out of bound exception estamos intentando acceder a una posición a un índice de una raíz que está fuera de sus límites en este caso de abajo tenemos un error diferente en este caso tenemos una dos tres cuatro cinco posiciones dentro de la RAE pero tenemos una posición que es una cadena nula si tratamos de imprimir eso en mayúscula pues nos damos cuenta como a la hora de imprimir la segunda cadena al tratar de pasarlo mayúscula estamos llamando a un método sobre una referencia que es nula con lo cual produce un pointer excepto el uso de este operador de la barra vertical la que está en la en la tecla del uno nos permite darle un tratamiento como a estas dos excepciones a la primera o a la segunda podemos ver como este mensaje te dan un tratamiento a los errores lo también como existe aparte de existe. Aunque hemos utilizado para imprimir mensaje existe system Earth en digamos que es una consola que como una la de salida a la auto pero que bueno en Eclipse lo único que va a hacer eso imprimirlo errores en en un color distinto color rojo esto viene heredado desde antiguo cuando puedas pues los sistemas informáticos podían tener una consola de salida y una consola diferente un monitor diferente incluso para para los posibles errores incluso podríamos configurar la ejecución de nuestro proyecto para que los errores los primeros por aquí no suena de dirigiendo hacia otro sitio por ejemplo hacia hacia un fichero para tener una especie de sistema de Loomis no de registro bitácora deja de error tendríamos un tratamiento que sería si llamo anterior a a Java 7 el que no ofrece el de la barra del pickup en el que bueno podemos comprobar como para tratar una excepción de tipo a reír de autobox o de grupo Intercom con un tratamiento particular vale pues lo haríamos así si no le queremos dar el mismo tratamiento tendremos diferentes bloques CAD no si me lo trataríamos el grupo interés que la excepción es el run o sí RR tipo array autofox de tipo array index out of bounds vale con esto terminamos el tratamiento de excepciones vamos a pasar ahora a conocer alguna de las excepciones más comunes alguno de los tipos de sesión más comunes que no


## 28. Excepciones más comunes 4:49 

[Excepciones más comunes](pdfs/28_Clases_de_excepción_más_comunes.pdf)

## Resumen del Profesor

CLASE DE EXCEPCIÓN | USO
-------------------|----
ArithmeticException |	Errores en operaciones aritméticas
ArraryIndexOutOfBoundsException |	Índice de array fuera de los límites
ClassCastException | Intento de convertir a una clase incorrecta
IllegalArgumentException | Argumento ilegal en la llamada a un método
IndexOutOfBoundsException | Índice fuera de colección
NegativeArraySizeException | Tamaño de array negativo
NullPointerException | Uso de referencia nula
NumberFormatException | Formato de número incorrecto
StringIndexOutOfBounds | Índice usado en String fuera de los límites


### Transcripción

FALTAN IMAGENES

Tras conocer cómo dar tratamiento la excepciones vamos a pasar ahora a conocer algunas de las expresiones más comunes que no ofrecen nada java tiene varias decenas de clases para tratar situaciones excepcionales que pueden ser bueno asociada a diferentes tipos de operaciones por ejemplo podemos tener la excepción que ya hemos conocido errores en el uso de operaciones aritméticas y estamos intentando utilizar un índice fuera de los límites en la RAE la clasca excepción en la cual estamos convertir una clase a través de un casting a un tipo que no es correcto te recojo a ti le notaría la excepción sería un índice pero fuera de una colección de un array y tratamos de crear un array de tamaño negativo nos daría una excepción de tipo negativas ride Side y hemos visto que el uso de una referencia nula para llamar algún método bueno provocó nullpointer si tratamos de formatear un número con un formato incorrecto nos darían number format exception si tratamos de acceder a un String que sabemos que una sucesión de caracteres utilizando alguna índice que está fuera de sus límites también lo sería un error y cómo estás podemos tener un montón de teclas estación todas estas clases de ballet tienen también constructores que incluyen la posibilidad de que le pasamos nosotros un mensaje a la hora de construir no tienen una serie de métodos que no van a permitir obtener información sobre la excepción y suelen tener el método print stack trace que ya hemos conocido antes que es el que se invoca cuando no le damos tratamiento la infección y Pimpinela terraza de la pila para posteriormente cuando lo dejamos tratamientos detener la ejecución del programa si pincháis en el enlace de la slide nos viene directamente a la documentación a lápiz box de la clase precio y podemos comprobar como tenemos un montón de tipos diferentes posibles de excepciones no como desde la clase septiem podemos tener especiales de todo tipo para para diferentes situaciones no por ejemplo si estuviéramos haciendo consulta SQL con una base de datos relacional si hubiera algún problema en esta consulta al procesar los resultados podríamos tener una una excepción de tipo SQL excepción cuando se trabaja con ficheros intentamos acceder a a un tipo de fichero o con flujo podríamos tener excepciones de tipo II o excepción teníamos que había un tipo de expresión especial la ruta en excepción de las cuales pues también tenemos un montón de subtipos que podemos utilizar por ejemplo error de tipo DateTime haciendo DataBinding la especiales aritmética que ya hemos visto las negativas raise exception operación del trabajo anoche que Adán no permitida un montón de excepciones diferentes quejaba pone a nuestra disposición y que podemos utilizar de diferentes maneras no las vamos a conseguir conocer siempre una vez y bueno podremos comprobar como en determinadas ocasiones ama escribiendo un programa que produce alguna excepción que nosotros no habíamos previsto sobre todo las de tipo roca en excepción y que tenemos que elegir si darle un tratamiento darle otro ya que en el mundo de los casos nos podremos anticipar sobre todo si vamos aprendiendo a ser prudente y exigente a la hora de programar o en otros casos pues no nos podremos aceptar ya las de tipo renta y me es más complicado el poder anticiparnos a este tipo de sesión la de las que eran directamente de excepción o será un poco más fácil que podamos anticipar para finalizar el bloque de sesiones y su tratamiento vamos a ver como nosotros podríamos lanzar por relanzar una excepción que haya sucedido o bueno lanzar una nueva experiencia que nosotros queremos darle ese tratamiento


## 29. Lanzamiento y propagación de excepciones 11:25 

[Lanzamiento y propagación de excepciones](pdfs/29_Lanzamiento_y_propagación_de_excepciones.pdf)

## Resumen del Profesor

### 29.1 Lanzamiento de excepciones

Cualquier código puede lanzar excepciones (hecho por java, por nosotros o de terceros). Si no vamos a tratar las excepciones en un método, tenemos que indicar que se relanzarán hacia arriba (`throws`).

#### 29.1.1 Uso de `throws`

Un método cuyo código puede producir excepciones puede capturarlas y tratarlas, o relanzarlas para que sea otro quien las trate. `throws` se escribe a continuación de la firma del método y antes de la apertura del cuerpo, y espera la excepción o excepciones (lista separada por comas) que se pueden lanzar.

```java
public static void writeList() throws IOException {

}
```

#### 29.1.2 Uso de `throw`

Nos permite lanzar una excepción en un momento determinado. También se puede usar en el bloque catch, para tratar una excepción, pero aun así relanzarla.

```java
public void sacarDinero(double cantidad) throws SaldoNegativoException {
     saldo -= cantidad;
     if (saldo < 0) {
          throw new SaldoNegativoException(saldo);
     }
}
```

### 29.2 Excepciones propias

Podemos crear nuestros propios tipos, extendiendo a `Exception`. Nos permiten manejar nuestras propias situaciones. Es buena práctica añadir el sufijo `...Exception`.

```java
public class SaldoNegativoException extends Exception {

   public SaldoNegativoException(double saldo) {
      super("La cuenta ha quedado en descubierto (" + Double.toString(saldo) + ")");
   }

}
```

## Transcripción

![29_Lanzamiento_y_propagacion_de_excepciones-1](images/29_Lanzamiento_y_propagacion_de_excepciones-1.png)

![29_Lanzamiento_y_propagacion_de_excepciones-2](images/29_Lanzamiento_y_propagacion_de_excepciones-2.png)

![29_Lanzamiento_y_propagacion_de_excepciones-3](images/29_Lanzamiento_y_propagacion_de_excepciones-3.png)

![29_Lanzamiento_y_propagacion_de_excepciones-4](images/29_Lanzamiento_y_propagacion_de_excepciones-4.png)

![29_Lanzamiento_y_propagacion_de_excepciones-5](images/29_Lanzamiento_y_propagacion_de_excepciones-5.png)


## Contenido adicional 4   

[Excepciones y errores](pdfs/26_Excepciones_y_errores.pdf)

[Tratamiento de excepciones](pdfs/27_Tratamiento_de_excepciones.pdf)

[Excepciones más comunes](pdfs/28_Clases_de_excepción_más_comunes.pdf)

[Lanzamiento y propagación de excepciones](pdfs/29_Lanzamiento_y_propagación_de_excepciones.pdf)
