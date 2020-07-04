# 2. Sistaxis básica de Java 16:10
   * 05 Tipos de datos y variables I 02:34
   * 05 Tipos de datos y variables II 04:46
   * 06 Operadores 04:11
   * Ejercicio práctico I 04:39
   
# 05 Tipos de datos y variables I 02:34

A partir de esta lección vamos a adentrarnos en el conocimiento de la sintaxis del lenguaje Java y empezamos por los elementos principales de cualquier lenguaje de programación como son sus tipos de datos y las variables donde se almacena.

En Java distinguimos dos grandes grupos de tipos de datos.

Por un lado tenemos los tipos primitivos que harían referencia a los datos básicos de cualquier programa como números datos del tipo lógico y caracteres.

Aquí ves cuatro ejemplos que hacen referencia a los tipos primitivos que utilizamos en Java que serían los números enteros números decimales datos lógicos palabras reservadas TRUE FALSE o los caracteres que se representarían entre comillas simple Por otro lado tenemos los tipos objetos en Java hay miles de objetos que podríamos manejar a partir de los que podríamos crear nosotros por los proporcionados por las ediciones Java estándar Edition.

Como te hemos comentado elecciones anteriores y también son datos manejados en un programa vamos a dejar de momento los tipos objetos de lado y centrémonos en los tipos primitivos.

En la siguiente tabla tienes una lista con todos los nuevos serían los ocho tipos primitivos que podemos utilizar en el lenguaje Java antes decíamos que eran cuatro tipos porque realmente los tipos enteros tenemos cuatro subtipos en Java que sería el bait El XOR el in y el Long dependiendo de a qué rango queremos llegar de número.

Por ejemplo que Convit solamente tenemos 8 bits con lo cual llegaríamos con nada más que alcanzar números entre menos 128 y 128 según vamos aumentando en bits podemos abarcar un rango mayor.

Por eso tenemos hasta cuatro tipos para los tipos más pequeñitos y más grandes que serán con el.

Por otro lado tenemos los tipos bullían que solamente hace referencia a las palabras reservadas True False Verdadero false vale los decimales que también tenemos dos subtipos el float para decimales de pequeño rango podríamos decir y el doble para abarcar los decimales de un rango muy alto hasta 64 bits 64 bits sería el tamaño que ocuparía en memoria un dato de tipo doble.

Y por último tenemos los Char tipo Char hace referencia a cualquier caracter que internamente se representa con su código Unicode de 16 bits su combinación Unicode en el siguiente vídeo vamos ya a adentrarnos en el estudio de las variables.

# 05 Tipos de datos y variables II 04:46

En la primera parte de esta lección hemos estado hablando de los tipos de datos del lenguaje Java nos hemos centrado en los tipos primitivos.

Ahora vamos a analizar las variables las variables es el elemento de programación que utilizamos para almacenar los datos dentro de un programa.

Qué es exactamente una variable.

No es ni más ni menos que un espacio de memoria una caja la podríamos imaginar donde se almacena un dato de un determinado tipo a las variables se les asigna un nombre o identificador a la hora de definir identificadores para las variables.

Podríamos utilizar en principio cualquier combinación de caracteres y símbolos.

Sin embargo hay que tener en cuenta una serie de reglas en primer lugar no podríamos utilizar como identificador una palabra reservada de Java class for son palabras reservadas y no podemos utilizarlos como identificadores además los identificadores pueden contener.

Como hemos dicho cualquier letra números y los caracteres de Subrayado y dólar por ejemplo puntos guiones comas no podríamos utilizar como parte del nombre del identificador aunque puede contener letras números y estos dos caracteres.

Todo identificador debe comenzar o bien por una letra o por uno de estos dos caracteres dólar y subrayado nunca por un número bien aunque sí lo pueden contener el resto de la parte del identificador las variables hay que declararlas antes de ser utilizadas en la declaración es cuando le vamos a indicar ese identificador que queremos asignar a la variable y de qué tipo es.

Esta sería la sintaxis Java para declarar una variable el tipo de dato que va a almacenar identificador asignado.

Por supuesto terminado en puntico aquí tienes un ejemplo de cómo se declararía la variable de la transparencia anterior también podemos declarar la variable y en la misma línea la misma instrucción asignarle un valor.

Se pueden declarar varias variables en la misma línea separándolas por comas algunas se les puede dar un valor inicial y otras como en este caso oiré no una vez que ya se declaró una variable se le puede usar asignándole un valor o incluso utilizándolo dentro de un programa para hacer operaciones con ella.

En este caso cogemos la variable la multiplicamos por un número y el resultado se asigna a. 

En este caso otra vez a la misma variable.

Como ves siempre las instrucciones en Java la asignación de datos es de derecha a izquierda bien ámbitode una variable qué es eso del ámbito de una variable o solamente una variable que básicamente se refiere a donde podemos declarar una variable y además utilizarla realmente en Java hay dos ámbitos posibles o dos lugares posibles en donde se puede declarar una variable al principio de la clase.

Es decir fuera de cualquiera de los métodos de la clase a esas variables.

Como en este caso data la llamamos variables atributos y podrían ser utilizadas por cualquier método que estuviera definido dentro de esa clase a su vez.

Cada método puede tener sus propias variables como en este caso el método 1 tiene declaró la variable P En este caso estamos hablando de variables locales utilizadas únicamente dentro de esos métodos como es este ejemplo del método 2 podría evidentemente acceder a la variable data porque es una variable atributo y es compartida podríamos acceder a ella tanto aquí como aquí pero no podríamos acceder a la variable pe puesto que es local al método 1 otra cosa que tenemos que conocer sobre las variables es qué valores se les asignan a las variables por defecto cuando se declaran bien.

Hay que distinguir si estamos hablando de variables atributos o variables locales porque las variables atributos si se inicialización implícitamente cuando se declaran las variables que sean de tipo entero se van inicializar automáticamente a cero las decimales 0.0 las cáracter a lo que llamaríamos el carácter nulo que es esta combinación hexadecimal se puede representar así les va rabu y cuatro ceros.

Las variables de tipológico Gülen se inicializar automáticamente a false pero qué pasa con las variables locales cuando tú declara es una variable local y no le asigna un valor esa variable no tiene ningún valor.

Aquí tienes una variable atributo que automáticamente adquiere el valor 0 o como acabamos de decir en la narración anterior pero si declara una variable local y no le asigna un valor esa variable no tiene valor por lo tanto intentar hacer una operación con ella sin haberla asignado previamente de manera explícita un valor daría un error de compilación como tienes.

# 06 Operadores 04:11

Recursos de esta clase Leccion6_Operadores.pdf

Operadores
Operadores Utilizados en Java
Los operadores son símbolos que se emplean en un programa para operar con los datos del mismo. Por ejemplo:  

int a=5; //asignación a una variable  

int b=10; //asignación a una variable  

int c=a+b;  //suma de dos variables y asignación a otra  

 

En Java existen muchos operadores, que podemos clasificar en los siguientes grupos en función del tipo de operación que realizan  

Aritméticos  

Asignación  

Condicionales  

Lógicos  

Otros  

Operadores aritméticos
Se emplean con tipos numéricos para realizar operaciones aritméticas en un programa. La siguiente tabla te muestra cuales son estos operadores y la operación que realizan.  

   

Operador        

Descripción      

+        

Suma dos valores numéricos.        

-        

Resta dos valores numéricos.      

*        

Multiplica dos números.      

/        

Divide dos números. El tipo de resultado   depende de los operandos, pues en el caso de que ambos sean enteros, el resultado   de la división siempre será entero.      

%        

Calcula el resto de la división entre   dos números.      

++        

Incrementa una variable numérica en una   unidad y deposita el resultado en la variable.      

--        

Decrementa una variable en una unidad y   deposita el resultado en la variable.      

   

A continuación te presento algunos ejemplos:  

int a=3, b=8;  

int c=b/a; //el resultado es 2, la división entre enteros es siempre entero  

int n=a%2; //resto de dividir a entre 2  

a++; //equivale a a=a+1  

n--; //equivale a n=n-1;  

 

Respecto a los operadores ++ y --, hay que tener en cuenta que y pueden ir delante o detrás de la variable. Aunque depende de donde se pongan, pueden afectar de forma diferente:   

int a=3, b;  

b=a++; //b toma el valor 3  



int a=3, b;  

b=++a; //b toma el valor 4  

 

Fíjate en el primer caso, cuando el operador se coloca después de la variable, la operación de asignación se realiza antes del incremento.  

Operadores de asignación
Asignan el resultado de la expresión que aparece a la derecha del operador a la variable que se indica a la izquierda del mismo:  

variable = expresión  

La siguiente tabla resume los operadores de asignación existentes en Java:  

Operador        

Descripción      

=        

Asigna la expresión de la derecha, a la   variable situada a la izquierda del operador.      

+=        

Suma la expresión de la derecha, a la   variable situada a la izquierda del operador y deposita el resultado en la   variable      

-=        

Resta la expresión de la derecha a la   variable situada a la izquierda del operador y deposita el resultado en la   variable      

*=        

Multiplica la expresión de la derecha   con la variable y deposita el resultado en la variable.      

/=        

Divide la variable situada a la   izquierda entre la expresión de la derecha, depositando el resultado en la   variable.      

%=        

Calcula el resto de la división entre la   variable situada a la izquierda y la expresión de la derecha, depositando el   resultado en la variable.      

   

Ejemplos:  

int a=3, b=2;  

a+=10;  //equivale a a=a+10;  

b*=2; //equivale a b=b*2;  

b%3; //equivale a b=b%3;  

 

Operadores condicionales
Evalúan dos operandos y dan como resultado un valor boolean (true o false). Habitualmente se emplean en instrucciones de control de flujo.  

En la siguiente tabla te muestro los operadores condicionales empleados en Java. Fíjate en el primero de ellos (==), utilizado para comprobar la igualdad de dos datos, se utiliza un doble igual en lugar del simple:  

Operador        

Descripción      

==        

Compara dos valores, en caso que sean   iguales el resultado de la operación será true      

<        

Si el operando de la izquierda es menor   que el de la derecha el resultado es true      

>        

Si el operando de la izquierda es mayor   que el de la derecha el resultado es true      

<=        

Si el operando de la izquierda es menor   o igual que el de la derecha el resultado es true      

>=        

Si el operando de la izquierda es mayor   o igual que el de la derecha el resultado es true      

!=        

Si el valor de los operandos es   diferente el resultado es true.      

   

Ejemplos:  

int a=3;  

int c=5;  

if(a>c) //comprueba si a es mayor que c  

if(a==3) //comprueba si a es igual a 3  

if(c!=0) //comprueba si c es diferente a 0  

 

Operadores lógicos
Evalúan expresiones de tipo boolean, dando como resultado también un boolean. Son tres los operadores lógicos de Java:  

Operador        

Descripción      

&&        

Operador AND. El resultado es verdadero   únicamente si ambos operando son verdaderos      

||        

Operador OR. El resultado es verdadero   si alguno de los operandos es verdadero      

!        

Operador NOT. Se aplica sobre un único   operando, su resultado es el contrario al valor del operando      

   

A continuación te mostramos algunos ejemplos:  

int a=3;  

int c=9;  

int n=0;  

if(a>n && a<c) //verdadero  

if(a==2 || c>10) //falso   if(!(n==0)) //falso

 

Otros operadores
Además de los que te he presentado, Java dispone de otros operadores que no entran en una categoría específica. Entre los más importantes están:  

* new. Se utiliza para crear objetos a partir de una clase. Lo veremos en la sección de arrays  

* instanceof. Se emplea para comprobar si un objeto es de un determinado tipo. De momento, no veremos su uso  

* Operador ternario (?:). Se utiliza para realizar una operación u otra, en función de una condición:  

variable = (condicion)?expresion1:expresion2;  

Si la condición es verdadera, se ejecutará la expresión1 y el resultado se almacenará en la variable, pero si la condición es falsa se ejecutará expresión2 y será este resultado el que se guarde en la variable  

En el siguiente ejemplo se guarda en la variable div el resultado de dividir el mayor entre el menor de dos números:  

int a=3;  

int b=9;  

int div;    div=(a>b)?a/b:b/a;

 

Precedencia de operadores
En Java, salvo las que implican asignación, las operaciones se ejecutan de izquierda a derecha. Sin embargo, hay operaciones que tienen preferencia sobre otras. Por ejemplo, dada la siguiente instrucción:  

int a=3+4*5;  

¿Cuál sería el valor de la variable a?. La respuesta es 23, pues aunque primero aparece la suma y después la multiplicación, como esta tiene preferencia sobre la primera, se ejecuta antes la operación 4*5 y después, el resultado se suma a 3.  

Si quisiéramos realizar primero la suma, podemos recurrir al uso de paréntesis o corchetes:  

int a=(3+4)*5; //el resultado es 35  

La siguiente tabla nos muestra la preferencia de los operadores Java en orden decreciente, de modo que los operadores de la parte superior tienen más preferencia que los de la parte inferior:  

Operador      

() []      

++ --      

* / %      

+ -      

> >= < <=      

== !=      

&&      

||      

?:      

= += -= *= /= %=      


# Ejercicio práctico I 04:39   

Bueno de momento los tipos de datos variables y operadores no podemos hacer grandes programas aún en Java pero te vamos a mostrar este ejercicio práctico donde ponemos en práctica algunos de los operadores que hemos visto la lección anterior.

El enunciado del ejercicio consiste en realizar un programa que a partir de los números que vamos a tener almacenados en dos variables nos muestra el resultado dividir el mayor entre el menor de ambos números.

Para ello nos vamos a ir a nuestro entorno de desarrollo Eclipse.

Aquí tenemos el ejercicio que hicimos cuando creamos la primera aplicación el primer programa de  ejemplo vamos a aprovechar para recordar los pasos que había que hacer para crear un programador con Eclipse fail new Java Proyect.

Y ahí nos aparecerá un cuadro de diálogo en el que nos van a pedir el nombre del proyecto la localización donde tuviéramos ya los países que creamos al principio donde teníamos el primer programa hicimos una carpeta se va a crear este otro 02 vamos a llamarle ejercicio práctico no así finalizamos se creará el proyecto y como sabes lo siguiente que tenemos que hacer es crear una clase con su método main que es donde vamos a crear todo el código de nuestro primer programa.

El segundo programa realmente un primer ejercicio práctico que va a ser muy sencillo porque lo conocemos hasta ahora pues aún es bastante poco entonces con el botón derecho sobre el proyecto ni clase pues nos aparece el cuadro diálogo para crear la clase vamos a crear la app a ver divide números.

Fíjate un pequeño detalle un convenio en Java es que los nombres de clases ya lo hemos comentado antes pero bueno no conviene recordarlo los nombres de clases como digo siguen la nomenclatura está de que la primera letra se pone en mayúscula y el resto minúsculas y es una palabra compuesta.

La primera letra de cada palabra se escribirá en mayúscula.

Bien pues elegimos método main para que no lo cree.

Y sobre ese método pues es donde vamos a crear todo el código de este sencillo programa que vamos a hacer.

Declaramos dos variables con dos números cualquiera en una vamos a poner por ejemplo el tres a poner más pequeño.

La verdad que da igual pero bueno en otras vamos a poner pues el 14 por ejemplo y vamos a declarar una variable donde vamos a almacenar el resultado de la decisión.

Cómo calculamos la división entre el mayor y el menor de los dos números.

Pues vamos a aplicar el operador ternario operador ternario se establece una condición por ejemplo mayor de ver la pregunta que vamos a hacer y si fuera mayor debe entonces lo que vamos a devolver sería la resultado dividir a entrevé si no pues viviríamos Ventre a el resultado de la operación se va a almacenar en la variable y por lo tanto es mayor pues a entrevé que no entra siempre obtenemos como resultado la división entre el mayor y el menor de ambos números como una división entera pues el resultado va a ser entero también es decir se va a despreciar los decimales con la instrucción System punto a punto Frin Elaine mostramos un mensajito vamos a ver que diga división y con el operador más lo concatenados lo unimos a la variable cuyo resultado queremos mostrar al final y por eso el programa muy sencillo lo vamos a ejecutar.

4 Un derecho reúnas Java Application y ahora aquí en la consola y en la consola como aparece división.

4.

Finalmente se ha dividido 14 entre 3 y 4 como algo bueno pues se desprecian los decimales y eso lo que sale si hubiéramos puesto mayor entonces la división sería a entrevé.

Vamos a verlo para que ver que efectivamente siempre va a garantizar que se divide mayor entre.

