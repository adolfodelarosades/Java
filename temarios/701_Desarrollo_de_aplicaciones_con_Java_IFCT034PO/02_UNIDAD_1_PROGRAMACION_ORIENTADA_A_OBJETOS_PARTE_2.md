# UNIDAD 1: PROGRAMACIÓN ORIENTADA A OBJETOS [PARTE 2]

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido
   
4. Objetos

   4.1 Objetos: definición y funciones

      * 4.1.1 Acceso a métodos y atributos en un objeto

      * 4.1.2 Tipo de retorno de un método

   4.2 Clase Object

      * 4.2.1 toString

      * 4.2.2 Equals

   4.3 Java API

      * 4.3.1 String

      * 4.3.2 StringBuilder

      * 4.3.3 Arrays

      * 4.3.4 ArrayList

5. Ejemplo práctico con objetos

6. Ejemplo práctico con objetos II

7. Interacción entre los elementos

   7.1 Java Swing

   7.2 JFrame

   7.3 JButton

   7.4 JLabel

   7.5 JTextField

8. Ejemplo interacción entre elementos

9. Interfaces II

   9.1 JOptionPane

   9.2 JMenuBar

10. Peculiaridades de Java

   * 10.1 Herencia única

   * 10.2 Es independiente de la plataforma

   * 10.3 Manejo de la programación funcional
   

## 4. Objetos

<img src="images/c1/4-0.png">

<img src="images/c1/4-0-2.png">

Los objetos nos permitirán manejar los datos y estructurarlos. Por tanto, es necesario entender cuál es la forma en la que se utilizan estos objetos. Además, hay que entender cuáles son las herramientas que nos proporciona Java para facilitarnos la creación de objetos y no tener que reinventar la rueda constantemente. De esta forma podremos crear procesos y clases específicamente necesarios para nuestro problema. 

<img src="images/c1/4-0-3.png">

[Video](https://vimeo.com/191773526)

### 4.1 Objetos: definición y funciones

Los objetos son la materialización de una clase con valores específicos, es decir, un objeto es una entidad real con la cual podemos trabajar para crear procesos tan complejos como necesitemos, modificando sus atributos y concatenando métodos de múltiples clases.  

Un objeto puede representar objetos del mundo real, tales como una tarjeta de crédito, un perro, una camisa, etc. Sin embargo, también pueden representar cosas abstractas, por ejemplo, procesos de producción en una fábrica, una ventana de Windows, el evento de un botón, etc. Todo esto con el fin de poder crear un programa capaz de tener un modelo claro y entendible para resolver problemas.

Los objetos son la materialización de una clase con valores específicos, es decir, un objeto es una entidad real con la cual podemos trabajar para crear procesos tan complejos como necesitemos, modificando sus atributos y concatenando métodos de múltiples clases.  

Un objeto puede representar objetos del mundo real, tales como una tarjeta de crédito, un perro, una camisa, etc. Sin embargo, también pueden representar cosas abstractas, por ejemplo, procesos de producción en una fábrica, una ventana de Windows, el evento de un botón, etc. Todo esto con el fin de poder crear un programa capaz de tener un modelo claro y entendible para resolver problemas. 

**Procesador**

Se encarga de realizar los cálculos para ejecutar nuestros procesos.

**Memoria**

Nos permite almacenar los datos para nuestros programas. Esta memoria puede ser volátil, es decir, que los datos se borran cuando se apaga el ordenador como ocurre en una memoria RAM. Pero también puede ser no volátil, como el disco duro del ordenador.

**Periféricos**

Son los dispositivos de entrada y salida de datos.

Los datos de un objeto son almacenados en la memoria RAM, en espacios específicos de dicha memoria. Para su posterior localización se guarda la dirección donde se encuentran dichos valores. Por lo tanto, cada vez que utilizamos la variable de un objeto, no estamos manejando su valor, sino que estamos utilizando la dirección a la cual apuntan los datos de ese objeto. Veamos el siguiente ejemplo para entender este proceso.  

Imaginemos que creamos una clase Gato como se muestra a continuación: 

<img src="images/c1/4-1-1.png">

Esta clase simplemente tiene dos atributos: un nombre y una edad. Ahora vamos a crear una variable de esta clase: 

<img src="images/c1/4-1-2.png">

Cuando declaramos una variable de un objeto primero escribimos el nombre de la clase (Gato) y después ponemos el nombre a la variable (gato). 

En el ejemplo anterior solo se muestra una variable hacia un objeto, sin embargo, esta variable no tiene asignado ningún objeto. Este tipo de variables que son de tipo objeto, a diferencia de las variables de tipo primitivas vistas en el apartado anterior, son conocidas como referencias (también son llamadas punteros). Esto quiere decir que este tipo de variables internamente apuntan a una dirección de memoria. Veamos el siguiente gráfico para entender este concepto: 

<img src="images/c1/4-1-3.png">

En el gráfico podemos ver un conjunto de celdas que representan a espacios para almacenar bytes en la memoria RAM. Un conjunto de estas celdas nos permite almacenar variables de tipo texto o numérico. En este caso, desde el espacio 1 al 4 se utilizan para almacenar la variable nombre y del 5 al 7 serán para la variable edad. Todo este conjunto conforma un espacio disponible para almacenar un objeto de tipo “Gato”. Y como podemos ver en la imagen, nuestra variable “gato” sirve para apuntar a un espacio de memoria de un objeto. Pero cuando solamente se declara una variable, esta, en realidad, no apunta a ningún espacio de memoria como se muestra en la imagen. 

Ahora, cuando creamos un objeto con el operador “new”, como se observa a continuación: 

<img src="images/c1/4-1-4.png">

A nivel de espacios de memoria ocurrirá lo siguiente: 

<img src="images/c1/4-1-5.png">

Ahora podemos ver como nuestra variable ya está asignada a un objeto definido (gracias al operador “=”) en la línea 2. A nivel de memoria el puntero “gato” ahora se encontrará apuntando al espacio de memoria 1 hasta el 7. Sin importar que las variables no tengan ningún valor. 

Veamos ahora que pasa si realizamos la siguiente asignación: 

<img src="images/c1/4-1-6.png">

En la línea 3, a la variable “gato” se le asigna el valor de “null”. Esto significa que la variable “gato” no está apuntando a ninguna dirección de memoria, por lo que nuevamente pasará a estar como en la imagen inicial.  

Otro caso que podemos analizar es el siguiente: 

<img src="images/c1/4-1-7.png">

Para este caso se ha creado una instancia de la clase “Gato”. Esto significa que se ha reservado un espacio de memoria para almacenar el objeto con sus atributos, como fue el caso de los espacios de memoria del 1 al 7. Sin embargo, no existe una referencia hacia esa dirección de memoria, por lo que dicho objeto no es accesible por ninguna referencia. 

**Garbage collected**  

El garbage collected o recolector de basura en español, es un mecanismo automático que tiene Java para eliminar de la memoria a todos los objetos que no están siendo usados por ningún proceso. De esta forma se marca a los objetos que no están siendo utilizados para que posteriormente sean eliminados de la memoria.  

En algunos lenguajes se tienen que definir y eliminar manualmente variables de la memoria para liberarla. Por lo contrario, Java puede eliminar automáticamente, si y solo si, encuentra objetos que no tengan ninguna variable apuntándoles. 

#### 4.1.1 Acceso a métodos y atributos en un objeto

Un objeto contiene métodos y atributos con los cuales podemos trabajar, pero ¿cómo accedemos a estos?, debemos conocer la sintaxis para invocar a un método, pasar parámetros, obtener resultados de un método o acceder a sus atributos.  

Veamos primero cómo acceder a los atributos de un objeto. La notación para esto es "." y el formato es como sigue:  

`<objeto>.<atributo>`

Por ejemplo:

<img src="images/c1/4-1-8.png">

En un método podemos utilizar dicha variable de la siguiente forma:

<img src="images/c1/4-1-9.png">

Hay que tener en cuenta que, si accedemos a la variable de un objeto, necesariamente debe estar siendo utilizado como parámetro de una función. Veamos el siguiente ejemplo: 

<img src="images/c1/4-1-10.png">

Al intentar compilar el método nos mostrará un error. Esto es debido a que estamos accediendo a un atributo sin que se encuentre en alguna función. Aquí veremos otro ejemplo: 

<img src="images/c1/4-1-11.png">

Este código si compilará, pero nos podemos preguntar, ¿cómo compila correctamente si la variable “nombre” no se encuentra como parámetro de un método? Los métodos o funciones normalmente presentan la siguiente forma: 

<img src="images/c1/4-1-12.png">

Sin embargo, existen algunas funciones que no cuentan con nombre o paréntesis para sus parámetros. Estas funciones tienen la forma de operadores matemáticos tales como +, *, /, %, que se utilizan para tipos de datos numéricos. Veamos un ejemplo de esto: 

<img src="images/c1/4-1-13.png">

Podemos ver que la función "+" recibe dos parámetros. Estos se encuentran a los lados del nombre de la función. Podemos ver entonces esta función de adición como sigue: 

<img src="images/c1/4-1-14.png">

Volviendo al tema principal, hemos visto cómo se pueden utilizar las variables de un objeto, ahora veremos cómo invocar métodos con el siguiente ejemplo: 

<img src="images/c1/4-1-15.png">

En este ejemplo podemos ver que invocamos al método mostrarNombre en el método maullar. Solo es necesario poner el nombre del método junto con los paréntesis y en caso de que se necesiten parámetros, tenemos que indicar los valores entre los paréntesis. 

Si no tiene ningún parámetro, solamente abrimos y cerramos los paréntesis. Otro punto importante para analizar en el ejemplo es que el método que invocamos es un procedimiento, por lo que no tiene un valor de retorno. Veamos qué pasa si es que invocamos de la misma forma una función (es decir, un método que devuelve un valor): 

<img src="images/c1/4-1-16.png">

Si intentamos compilar estos métodos, compilarán correctamente, debido a que Java ejecutará el método y el valor retornado no será almacenado en ninguna variable. 

#### 4.1.2 Tipo de retorno de un método

El tipo de retorno de un método almacena el tipo de valor que el método va a retornar. Un método podría o no podría retornar un valor. Un método que no retorne un valor tiene el tipo de “void”. Un método puede retornar a un valor primitivo o un objeto de una clase. El nombre del tipo de retorno puede ser cualquiera de los ocho tipos primitivos definidos en Java, una clase o una interface. 

**Enlace de interés**

En el siguiente enlace puedes aprender un poco más sobre los tipos de retorno de un método: 

[tipo de retorno](https://www.arkaitzgarro.com/java/capitulo-8.html)

En el siguiente código, el método setPeso no retorna ningún valor y el método getPeso retorna un valor: 

<img src="images/c1/4-1-17.png">

Si un método no retorna un valor, no podemos asignar el resultado de este método hacia una variable. ¿Cuál piensas que es el resultado de la siguiente clase TestMetodo, utilizando la clase Telefono anterior?: 

<img src="images/c1/4-1-18.png">

Vemos que en la línea 4 estamos creando un objeto de la clase “Telefono” y en la línea 5 utilizamos el método “setPeso”, sin embargo, esto no compilará debido a que “setPeso” no retorna ningún valor. El return type es “void”. Como el método “setPeso” no retorna ningún valor, no hay nada para que sea asignado a la variable “pesoNuevo”. Por lo tanto, el código fallará al compilar. 

Si un método retorna un valor, el resultado puede ser almacenado o no en una variable. Sin embargo, también pueden darse casos en donde un método tenga un tipo de retorno que la variable no pueda soportar. Por ejemplo, el tipo de retorno de “getPeso” en “Telefono” es “double”. Podemos asignar un valor de retorno de “getPeso” para una variable de tipo “double”, pero no a una variable de tipo “int”. A continuación vemos el código: 

<img src="images/c1/4-1-19.png">

En el código mostrado anteriormente, podemos ver que la línea 5 ahora si compilará correctamente, porque el método “getPeso” retorna un valor de tipo “double” y esto será almacenado en la variable “pesoNuevo”. Sin embargo, en la línea 6 ocurrirá un error en la compilación debido a que el valor retornado es de tipo “double” del método y no puede ser asignado a una variable de tipo “int”. Podemos forzar que suceda, aplicando un “cast” explicito. El proceso de “cast” consiste en forzar una variable a que se comporte como de otro tipo. Lo vemos a continuación: 

<img src="images/c1/4-1-20.png">

De esta forma podemos hacer que el tipo de dato “double” se comporte como un tipo de dato entero. Esto significa que perderá la precisión y los decimales que pueda tener el valor original. Este tipo de “cast” se aplica a tipos que son compatibles. Veamos un ejemplo donde no son compatibles: 

<img src="images/c1/4-1-21.png">

En este ejemplo se nos mostrará un error al compilar debido a que intentamos hacer un “cast” de un tipo de variable “double” a “float”, lo cual es imposible. 

### 4.2 Clase Object

En Java, todos los procesos y variables que modelemos se encuentran dentro de objetos, por lo que podríamos decir que todos los datos que modelemos son objetos. Para que toda esta estructura de clases sea posible, Java ha creado la clase Object. Implícitamente todas las clases que existen o existirán heredan de la clase Object, por lo que tenemos que entender las características de esta herencia.   

En este apartado vamos a hablar sobre los métodos que comparten todas las clases “toString” y “equals”. Y cómo, en cualquier método en herencia, con estos métodos podemos personalizar su comportamiento. 

**Enlace de interés**

En el siguiente enlace puedes aprender un poco más sobre la clase Object y sus métodos: 

[Class object](http://dis.um.es/~bmoros/Tutorial/parte5/cap5-10.html)

#### 4.2.1 toString

Este método es utilizado para mostrar un nombre del objeto o describirlo. Por defecto, el método toString en la clase “Object” retorna el nombre de la clase seguido por el carácter “@” y la representacional en hexadecimal del “hash code” de un objeto. El “hash code” es el valor retornado por el método “hashCode” de la clase “Object”.  

Veamos un ejemplo de esto: 

<img src="images/c1/4-2-1.png">

El resultado del código anterior será algo así: 

<img src="images/c1/4-2-2.png">

En el siguiente ejemplo mostraremos como modificar este comportamiento de la siguiente manera: 

<img src="images/c1/4-2-3.png">

En la línea 19 podemos ver que estamos sobrescribiendo el método “toString” y hemos definido que dicho método retorne el valor de la variable “numero”. Por lo tanto, modificaremos la clase “TestMetodo3”: 

<img src="images/c1/4-2-4.png">

En la línea 4 creamos un objeto de la clase “Telefono” y en su constructor le pasamos de parámetro un literal de tipo “String” para que sea asignado a su variable “numero”. De esta forma, la línea 5 mostrará el siguiente resultado: 

<img src="images/c1/4-2-5.png">

#### 4.2.2 Equals

Recordemos que JAVA usa “==” para comparar valores primitivos y también para evaluar si dos variables apuntan al mismo objeto. Para ver si dos objetos son equivalentes se usa el método “equals”, o al menos esto se hace si el programador implementa el método sobrescribiendo “equals”. En este ejemplo podemos ver que solo una de las dos clases provee una implementación personalizada de “equals”: 

<img src="images/c1/4-2-6.png">

En la línea 3 se utiliza el método “equals” de la clase “String”. Esta clase tiene implementado que si el texto es el mismo, entonces el método “equals” retornará “true”. A diferencia de la clase “StringBuilder”, que usa la implementación por defecto del método “equals” proveído por la clase “Object”. Esto significa que dicho método solo verificará si las dos variables están apuntando al mismo objeto. 

Veamos otro ejemplo de esto: 

<img src="images/c1/4-2-7.png">

Por tanto, en la línea 12 estamos escribiendo nuestra propia definición del método “equals”. De esta forma podemos comparar los objetos “Telefono” y utilizar el método “equals” para evaluar si las variables “numero” son iguales y que entonces el método “equals” retorne “true”. 

### 4.3 Java API

Cuando nos referimos a Java API estamos hablando de un conjunto de clases predefinidas que nos facilitan el desarrollo de programas. A lo largo de los siguientes apartados vamos a analizar las clases más importantes y útiles para el desarrollo de software. 

**Artículo de interés** 

A continuación tienes una guía de consulta desarrollada por IBM sobre la API de Java. 

[API de Java](https://www.ibm.com/support/knowledgecenter/es/SS3HLM_7.1.1.16/com.ibm.tivoli.tpm.osd.doc_7.1.1.16/api/capi_javaapi.htm)

#### 4.3.1 String

La clase “String”, como ya hemos estado viendo en anteriores apartados, nos permite manejar textos. Es decir, una clase “String” representa una cadena de caracteres. Veamos cuales son las formas en las que podemos crear una instancia de dicha clase. 

Podemos crear objetos de la clase “String” usando el operador “new” o usando “String” literales (un texto encerrado entre comillas dobles). Podemos asignar un literal “String” a una variable “String” usando el operador “=”. Ahora analicemos como funciona esto a nivel de objetos.  

Vamos a crear dos objetos “String” con valor” Paul” usando el operador “new”: 

<img src="images/c1/4-2-8.png">

El resultado de la línea 3 será “false”. Esto significa que cada una de las variables “s1” y “s2” tiene almacenado dos objetos diferentes, pero que almacenan un mismo resultado. El operador “==“ como habíamos visto antes compara las direcciones de los objetos que tienen las variables “s1” y “s2”. 

Ahora veremos otro ejemplo para crear e inicializar variables de tipo “String”: 

<img src="images/c1/4-2-9.png">

En el código anterior, en la línea 1 se crea un objeto de tipo “String” y este objeto se queda almacenado en un grupo de objetos “String”. Entonces, cuando nuevamente se crea un literal con el mismo valor no se va a crear otro objeto. En este caso se va a buscar en el grupo de “String” si ya existe dicho objeto con ese valor. En caso de que ya exista, entonces se utilizará ese mismo objeto creado en la línea 1. Por lo tanto, en la línea 3 devolverá “true”, porque las dos variables apuntan al mismo objeto. 

Algunos métodos que nos permitirán manejar los “Strings” son: 

**charAt**

Podemos usar este método para obtener un carácter del texto que almacena el objeto solamente especificando la posición de dicho carácter.

Veamos un ejemplo de esto:

<img src="images/c1/4-2-10.png">

De forma tal que el resultado será el siguiente:

<img src="images/c1/4-2-11.png">

**indexOf**

Con este método podemos buscar dentro de un “String” la ocurrencia de otro “String”. Si el texto que se busca es encontrado dentro del “String”, este método retornará la posición de dicho texto. En caso contrario nos retornará el valor -1.

<img src="images/c1/4-2-12.png">

De este modo tenemos que para la línea 2 el resultado será “1”, porque el primer carácter “B” que se encontró está en esa posición. Para la línea 3 el resultado será -1, porque no se encuentra el texto “S” en la cadena de texto “ABCAB”. Finalmente, la línea 4 devolverá el valor “2”, ya que el inicio de la cadena “CA” dentro de “ABCAB” está en la posición “2”.

**Substring**

El método “substring” nos permite obtener un “String” dentro de otro “String” utilizando los índices para definir el rango de caracteres que deseamos obtener.

<img src="images/c1/4-2-13.png">

El resultado de ejecutar este programa será “acle”. Esto se debe a que el método “substring” de la línea 2 está tomando de parámetro el índice 2, esto significa que el método va a partir desde el carácter 2 hasta el final del texto.

También podemos definir la posición del carácter de inicio y fin que deseamos obtener. Veamos el siguiente ejemplo:

<img src="images/c1/4-2-14.png">

De esta forma hemos seleccionado el “String” que inicia desde el carácter “a” hasta el carácter “c”, por lo que el resultado de la línea 3 será “ac”.

Después de haber visto algunos de los métodos de la clase “String”, tenemos que entender una de las características de esta clase como es la inmutabilidad. Esto significa que un objeto “String” no cambia su valor, lo único que puede hacer para simular un cambio es devolver otro objeto con el nuevo valor. Por lo tanto, cada vez que utilizamos los métodos vistos anteriormente tenemos que asignarlos a una variable, ya que si no lo hacemos el resultado se perderá. Para solucionar este problema existe una clase que es mutable llamado “StringBuilder”. 

#### 4.3.2 StringBuilder

La clase StringBuilder es una clase que trabaja exactamente igual que la clase “String”, pero la principal ventaja es que cada operación que realicemos se ejecutará en el mismo objeto, por lo que el resultado estará reflejado en dicho objeto. Esta clase es útil y trabaja mejor cuando se manejan textos muy largos.  

Veamos cómo construir un objeto de dicha clase: 

<img src="images/c1/4-2-15.png">

Por tanto, ahora podemos modificar el valor de una cadena de texto dentro de un mismo objeto. Los métodos explicados en la clase “String” se utilizan de igual forma para una clase “StringBuilder”. Ahora veremos un método propio de la clase “StringBuilder”. 

El método “append” nos permite agregar al final del texto otro “String”. Este método acepta diferentes tipos de variables, tanto “String” como “double”, “boolean”, etc. Veamos un ejemplo de esto: 

<img src="images/c1/4-2-16.png">

Como resultado de este ejemplo, se va a ir concatenando cada uno de los valores que se ingresan por el método “append”. Por lo que el resultado es: “Holatrue10”. 

#### 4.3.3 Arrays

Un array es un objeto que almacena una colección de valores. Un array es un objeto por si solo y este registra las referencias a los datos que almacena. Los arrays pueden almacenar valores de los tipos: 

* Una colección de datos primitivos. 
* Una colección de objetos. 

Un array de primitivos almacena una colección de valores que está constituido por valores primitivos. Un array de objetos almacena una colección de valores, los cuales son direcciones de memoria hacia un objeto. La dirección que apunta hacia un objeto es lo que se almacena en el array, esto significa que un array de objetos solo almacena la referencia, pero no el objeto en sí mismo, a diferencia de los arrays de primitivos que si almacenan los valores.  

Los miembros de un array son definidos en localizaciones de memoria contiguas y esto nos aporta mayor velocidad para el acceso. 

El siguiente ejemplo de código crea un array de datos primitiva y un array de objetos: 

<img src="images/c1/4-2-17.png">

De esta forma las variables “intArray” y “objArray” almacenan valores de tipo primitivos y objetos respectivamente. Para acceder a los valores de los arrays, tenemos que indicar un índice de la posición de ese valor, para obtenerlo correctamente. Veamos cómo es la sentencia: 

<img src="images/c1/4-2-18.png">

Vemos como en la línea 6 estamos accediendo al valor de la posición 1. Por tanto retornará el valor 2, y para la línea 7 se muestra el “String” de la posición 2. De modo que mostrará el texto “prueba”. 

Este tipo de arrays que hemos visto también son llamados arreglos unidimensionales. De igual modo también existen arrays multidimensionales, que son los que almacenan los datos en estructuras no lineales. Veamos gráficamente a lo que nos referimos: 

<img src="images/c1/4-2-19.png">

Veamos ahora algunas definiciones que nos permitirán manejar mejor los arrays: 

**Declaración de un array**

Para declarar un array se incluye el tipo de variable que va a almacenar y el nombre de la variable. Veamos un ejemplo de esto:

<img src="images/c1/4-2-20.png">

Podemos ver que primero definimos el tipo de valores que vamos a almacenar en el array, en este caso son “enteros”, y después escribimos los corchetes [] para finalmente indicar el nombre de la variable del array. Veamos más ejemplos de cómo declarar arrays:

<img src="images/c1/4-2-21.png">

De esta forma podemos ver que los corchetes pueden estar en el tipo de variable o en el nombre.

Ahora veremos cómo almacenar objetos dentro de ellos.

**Creación de array**

Vamos a ver ahora como crear e inicializar los valores dentro de un array. Lo primero que debemos hacer es construir el objeto array que va a contener las referencias de los valores. Para este paso debemos indicar nuevamente el tipo y la cantidad de valores que va a almacenar. Veamos el ejemplo de esto:

<img src="images/c1/4-2-22.png">

En las líneas 5, 6 y 7 mostramos como construir el array y, en el caso de la línea 7, estamos definiendo un array de dos dimensiones. Dentro de los corchetes [] solo debemos ingresar valores enteros, por tanto, también podemos poner variables enteras o funciones con retornos enteros.

**Inicializar array**

Podemos inicializar un array de la siguiente forma:

<img src="images/c1/4-2-23.png">

Analicemos el siguiente código y determinemos el resultado de la variable:

* En la línea 1 se declara el array de enteros con nombre “array”.
* En la línea 2 se construye la referencia del array y se indica que va a tener 2 elementos. En este momento cada uno de los valores del array tendrá el valor de cero.
* En la línea 3 se crea un “for” para recorrer cada elemento del array y asignarle un valor.
* En la línea 4 se le asigna a cada valor del array con “i + 5” y utilizamos la variable “i” como índice del array.
* De esta forma el resultado de nuestro array será el siguiente: array[0] = 5 y array[1] = 6.

#### 4.3.4 ArrayList

Este objeto es un tipo especial de array que nos permitirá almacenar una lista de objetos sin necesidad de definir una cantidad de almacenamiento específico.  

El ArrayList es una de las clases más usadas entre las colecciones de Java. Esta ofrece las mejores combinaciones de características entre un array y una lista. Podemos entender un ArrayList como un array de tamaño variable. Una vez que hemos construido el objeto, este puede crecer o decrecer en longitud.  

Veamos un ejemplo de cómo crear un ArrayList. 

<img src="images/c1/4-2-24.png">

Esta vez debemos tener en cuenta que hay que importar la clase ArrayList del paquete “útil” de Java. A diferencia de los otros objetos con los que estuvimos trabajado, que eran del paquete “lang” y en los cuales no es necesario añadir el import.

Aquí vemos que crear un objeto ArrayList se realiza de la misma forma que cualquier objeto, excepto porque antes de los paréntesis del constructor se puede, aunque no es necesario, indicar de que tipo es el que vamos a guardar en el array entre los signos de mayor y menor.  

En este ejemplo podemos verificar que, como decíamos, indicar el tipo no es necesario: 

<img src="images/c1/4-2-25.png">

Sin embargo, también podemos dejar sin definir en el lado de la variable como vemos a continuación: 

<img src="images/c1/4-2-26.png">

En este caso, este ArrayList va a almacenar cualquier tipo de objetos. Veamos ahora como almacenarlos dentro de este ArrayList. 

<img src="images/c1/4-2-27.png">

De esta forma añadimos valores al final del ArrayList. Y de la misma forma que un array, cada uno de los valores tiene asignado un índice con el cual podemos obtener el objeto de la lista. De esta forma: 

<img src="images/c1/4-2-28.png">

Por tanto, de la misma forma que un array, en la línea 9 se mostrará el valor “dos”, ya que este elemento está en la posición 1 del array, y utilizando el método “get” se obtiene este valor. 

Finalmente podemos reemplazar el valor de cualquier elemento del array con el siguiente método: 

<img src="images/c1/4-2-29.png">

En este caso ahora se mostrará el valor de “cuatro”, debido a que en la línea 9 se reemplaza en la posición 1 con el valor “cuatro”. Otro método importante es el método “size”, que nos permitirá obtener la cantidad de elementos que tiene el ArrayList. 

<img src="images/c1/4-2-30.png">

<img src="images/c1/4-2-31.png">

## 5. Ejemplo práctico con objetos

Los objetos nos permitirán manejar los datos y estructurarlos. Por ello es imprescindible comprender bien cuál es la forma en la que se utilizan estos objetos. Además, es necesario entender cuáles son las herramientas que nos proporciona Java para facilitarnos la creación de objetos. De esta forma podremos crear procesos y clases específicamente necesarias para nuestro problema. 

Vamos a comenzar con un problema para modelar una clase. Esta clase deberá ser pública y debe llamarse “Festivo”. Esta clase contará con tres variables de instancia.

* Nombre, que es una variable “String”, la cual representa el nombre del festivo.
* Día, variable de tipo “Integer”, que representa el día del mes del festivo.
* Mes, que es una variable de tipo “String”, que representa el mes en el que se encuentra el festivo.

Todas estas variables deben ser accesibles por cualquier clase. 

**Solución**

Veamos como modelamos esta clase en Java.

<img src="images/c1/4-2-32.png">

Continuando con el ejemplo, ahora con la clase Festivo, creamos un constructor, el cual toma un “String”, para que represente el nombre, un “Integer” que represente el día, y un “String” representando el mes como argumentos, y estas variables deben ser asignadas a las variables de la clase. Tengamos en cuenta que este constructor debe ser accesible para cualquier clase.

**Solución**

<img src="images/c1/4-2-33.png">

Como vemos, el constructor tiene tres parámetros de entrada, cada uno de ellos está separado por comas. Dentro del constructor asignamos cada una de las variables de parámetros a las variables de la clase. Debido a que las variables de la clase y los parámetros tienen el mismo nombre, se utiliza la palabra reservada “this” para referenciar a la clase en la que nos encontramos. De esta forma podemos diferenciar entre las variables. Si no utilizamos esta referencia cuando las variables tengan nombres iguales estaríamos asignando los parámetros con sus propios valores. Otra cosa a recordar es que cuando nos indican que el constructor debe estar accesible para todas las clases esto significa que el modificador de acceso debe ser “public”.

Continuaremos el ejemplo escribiendo un método dentro de la clase “Festivo” llamado “esMismoMes”. Recibirá un objeto de tipo “Festivo” y retornará un valor de tipo “boolean”. En caso de que la variable “mes” de la clase sea igual al del parámetro retornara “true” y en caso contrario retornara “false”. Este método debe ser público para todas las clases.

**Solución**

<img src="images/c1/4-2-34.png">

En la línea 13, podemos ver declarado el método que nos pedían en el enunciado del problema. Hemos definido un método que devuelve un valor “boolean” y recibe de parámetro un objeto de tipo Festivo. Ahora utilizamos un “if” el cual se puede traducir como “si el mes de la clase es igual al mes del parámetro entonces retorna true”. Recordemos que utilizamos la palabra “return” para definir cuál es la respuesta del método, de esta forma cuando se llega a la línea 15 del return, es ahí donde acabará el flujo del programa y ya no seguirá con las demás líneas. El “return” nos permite finalizar con el proceso de un método. Por este motivo no es necesario agregar un “else” al “if”, y podemos estar seguros de poner el “return false” sin ningún tipo de condición, debido a que no finaliza dentro del “return true” o en caso contrario deberá devolver “return false”.

Debemos también tener en cuenta que para comparar textos, es decir, valores de tipo “String”, debemos utilizar la función “equals” ya que si utilizamos el operador “==” solo vamos a comparar si es que las variables apuntan al mismo objeto.

A continuación vamos a escribir un método llamado “promedioDia”, el cual toma un array de tipo “Festivo” como un argumento, y retorna “double” que es el promedio del día de las variables del array. Asume que el array se encuentra lleno (es decir sin elementos null).

**Solución**

<img src="images/c1/4-2-35.png">

Podemos ver el método declarado en la línea 20, una lista de objetos se puede definir como “Objeto[]”. Después en la línea 21, se declara la variable “suma” que contendrá la suma de las variables “dia” del “array”. Lo inicializamos con el valor cero, después creamos un “for” para recorrer el “array” listaFestivo. De este modo recorremos el array y utilizamos su atributo “día” con el operador “.”. Así vamos sumando dentro de la variable “suma”. Al finalizar, retornamos el valor de la suma dividido entre la cantidad de elementos del array y de este modo solucionamos el problema.

La siguiente parte del ejemplo será escribir una pieza de código para crear un objeto de tipo Festivo con el nombre navidad, con el día 25 y el mes de diciembre. Pongamos este código en una clase ejecutable dentro del método main.

**Solución**

<img src="images/c1/4-2-36.png">

De este modo recordamos como crear una clase ejecutable. Tenemos que crear un método main como se muestra en la línea 3 y finalmente realizamos una declaración para construir un objeto de tipo Festivo y enviamos los parámetros necesarios para que sean asignados al objeto. 

Ahora trabajaremos con otra clase.

Tenemos que crear la clase “Película”. Esta clase tendrá las siguientes variables:

* Título, que es de tipo “String” y representa el título de una película.
* Estudio, variable de tipo “String” y representa el estudio que hizo la película.
* Rating, el cual es de tipo “String” y representa el rating o calificación de la película.

**Solución**

<img src="images/c1/4-2-37.png">

De esta forma creamos una clase con las características que nos piden. Una cosa importante en la que fijarnos es que los nombres de las variables se escriben siempre con minúsculas.

Lo siguiente que haremos será escribir un constructor para la clase Película, el cual toma un String representando el título de la película, un String representando el estudio y un String representando el rating como argumentos y asignarlos a las variables de la clase.

**Solución**

<img src="images/c1/4-2-38.png">

El constructor está definido en la línea 7 y dentro de los paréntesis estamos definiendo los parámetros que son título, estudio y rating. Recordemos que el constructor es un método especial que no tiene tipo de retorno y su nombre siempre coincide con el nombre de la clase.

Ahora vamos a escribir un segundo constructor para la clase Película que toma como String el título de la película y un String representando el estudio como argumentos y los asigne a las variables de la clase respectivas y, por último, a la variable rating lo asignamos con el literal “PG”.

**Solución**

<img src="images/c1/4-2-39.png">
 
Hay que tener en cuenta que una clase puede tener múltiples constructores que pueden convivir en una clase al mismo tiempo y podemos decidir cuál utilizar para construir un objeto de la clase. En la línea 13 podemos ver el nuevo constructor solo con los dos parámetros que nos piden. De la misma forma, asignamos las variables título y estudio con las respectivas variables de la clase y, finalmente, a la variable rating de la clase le asignamos el valor literal “PG”. Algo a tener en cuenta es que no es necesario agregar la referencia this a la variable rating en este constructor debido a que no hay otra variable en ese ámbito con el mismo nombre, por lo que no habrá problemas al utilizarla.

A continuación escribimos un método obtenerPG, que tomará como parámetro un array de tipo Película y retornará un ArrayList de tipo Película que solo contendrá películas con el valor “PG” en la variable rating. Podemos asumir que el array de entrada está lleno sin valores null.

**Solución**

<img src="images/c1/4-2-40.png">

El método inicia en la línea 19. Aquí es donde tenemos el parámetro array de tipo “Pelicula”. Recordemos que añadir al tipo de variable los corchetes [] indica que vamos a manejar un array de este tipo. Posteriormente, en la línea 20, declaramos un ArrayList de tipo Película. Después, en la línea 21, declaramos un “for” para recorrer el array que tenemos de entrada. Dentro de ese “for” construimos un “if” para filtrar solo aquellos que tengan el valor de rating con “PG”, de esta forma dentro del “if” estamos agregando al ArrayList las películas que cumplan la condición. Finalmente, en la línea 25, retornamos como resultado de la función el ArrayList.

Escribamos ahora una pieza de código para crear una instancia de la clase Película con el título “Titanic”, el estudio “Films Studio” y el rating “PG-13”. Esto tiene que estar en una clase ejecutable.

**Solución**

<img src="images/c1/4-2-41.png">

Finalmente, declaramos y construimos un objeto de tipo Película y enviamos los valores como parámetros del constructor para que sean asignados al objeto.

<img src="images/c1/4-2-42.png">

<img src="images/c1/4-2-43.png">

## 6. Ejemplo práctico con objetos II

En este apartado, continuaremos viendo de forma práctica cómo trabajar con objetos para estructurar los datos de la manera adecuada. La ventaja de la utilización de Java es que podremos crear y adaptar cualquier proceso y clase a las necesidades de cada problema. 

¿Cuál de los siguientes métodos acepta tres enteros como parámetros y retorna la suma de ellos en un resultado con decimales? Este método debe compilar correctamente.

**Solución**

<img src="images/c1/4-2-44.png">

A continuación analicemos cada una de las alternativas.

La opción a es incorrecta. Esto se debe a que el tipo de retorno del método es void, por lo que queda descartado.

Para la opción b, el método acepta los tres parámetros como enteros. Estos pueden ser convertidos automáticamente: byte, int. Además, la suma es almacenada en una variable de tipo double, que puede almacenar decimales. Por lo tanto, es una alternativa correcta.

La opción c es incorrecta debido a que el argumento a3 no puede aceptar un entero.

La opción d es correcta. Los parámetros pueden aceptar enteros y el tipo de retorno es float, el cual puede soportar decimales.

Por lo tanto, las respuestas correctas son la b y la d.

Determina cuales son las alternativas verdaderas.

a) Si el tipo de retorno de un método es int, el método puede retornar un valor de tipo byte.

b) Un método puede o no puede retornar un valor.

c) Si el tipo de retorno de un método es void, este puede definir una sentencia return sin valor, es decir: return ;

d) Un método puede o no recibir parámetros.

e) Un método debería aceptar al menos un parámetro o definir un tipo de retorno.

f) Un método que retorna un tipo de retorno String no puede retornar null.

**Solución**

Analicemos cada alternativa:

a) Es verdadero debido que los dos son de tipo entero y el rango de valores de byte está dentro del tipo int.

b) Es verdadero, un método puede o no puede retornar un valor, es algo opcional.

c) Es verdadero, aunque normalmente no se use. Un método con tipo de retorno void puede utilizar la expresión return para finalizar el método inmediatamente, pero este return no debe devolver ningún valor.

d) Es correcto, un método no necesariamente debe recibir parámetros.

e) Es falso, por lo mencionado en la opción d.

f) Es falso. Cuando un método tiene un tipo de retorno objeto, este puede aceptar retornar valores null, es decir, no retornar un objeto especifico.

Determinemos la salida del siguiente código.


<img src="images/c1/4-2-45.png"> 

a) 218

b) 232

c) 246

d) Error de compilación

**Solución**

La solución es la d. En primer lugar, debemos darnos cuenta que cada uno de los paréntesis que se abren deben tener sus respectivos paréntesis de cierre. Por tanto, en la línea 3 podemos ver que está faltando uno de los paréntesis de cierre. Esto generara un error en el momento de la compilación.

Determinemos el valor de la variable a1.

<img src="images/c1/4-2-46.png"> 
 
**Solución**

Debido a que la clase String es una clase inmutable, cada uno de sus métodos devolverá un valor nuevo y no afectará al actual. Entonces la línea 2 no afectará al objeto “Hola”. Por lo tanto, la única sentencia que si modifica el valor de a1 es la línea 3. Así que el resultado será “Ho”.

Determinemos la salida del siguiente código.

<img src="images/c1/4-2-47.png">  

a) gZmeAZ

b) gZmeAa

c) gZm

d) gZ

e) game

**Solución**

La respuesta es la b. Cuando concatenamos operaciones, los métodos son evaluados de izquierda a derecha. Por tanto, el primer método “replace” es ejecutado y no concat. Los Strings son inmutables. Llamando el método substring en la variable ejg no cambia el contenido de la variable ejg. Esto devuelve un objeto String que no esté asignado a cualquier otra variable en el código. De hecho, ninguno de los métodos definidos en la clase String modifica el valor del objeto. Ellos crean y retornan nuevos Strings.

Determinemos la salida del siguiente código.

<img src="images/c1/4-2-48.png">   

a) gZmeAZ

b) gZmeAa

c) gZm

d) gZ

e) game

**Solución**

La respuesta es la e. La explicación es simple: la clase String maneja objetos inmutables, por lo tanto, en la línea 5 y 6 se están haciendo operaciones con un String pero que no están siendo asignadas finalmente a una variable. Esto significa que todas las operaciones han generado finalmente un String que no ha sido almacenado en ninguna variable y el valor de la variable ejg sigue almacenando el mismo valor “game”.

Determinemos la salida del siguiente código.

<img src="images/c1/4-2-49.png">    

a) 12S512S5

b) 12S12S

c) 1025102S

d) Error al ejecutar

**Solución**

La respuesta es a. Veamos qué pasa con la siguiente operación:

<img src="images/c1/4-2-50.png">   

El operador + va a sumar los números, pero va a concatenar los dos últimos números. Cuando el operador + encuentra un String, trabajará como una operación para concatenar String y retornará un nuevo valor de String. A diferencia de String, StringBuilder son mutables. El método append y delete son métodos definidos en la clase y cambiar el valor original de la variable ejg, por lo tanto, ejg.delete(3, 6) modifica el valor existente a 12S5. Después añade el mismo valor llamando a la función append y el resultado es 12S512S5.

Dado el contenido de la clase MyClass.java seleccionemos las alternativas correctas.

<img src="images/c1/4-2-51.png">  

a) La clase importada, java.util.Date, puede ser accedida solo por la clase Estudiante.

b) La clase importada, java.util.Date, puede ser accedida por ambas clases: Curso y Estudiante.

c) Ambas clases Curso y Estudiante están definidas en el paquete com.test.java.

d) Solo la clase Estudiante está definida en el paquete com.test.java. La clase Curso está definida en el paquete default.

**Solución**

La respuesta son las alternativas b y c. en base a que podemos definir múltiples clases e interfaces en un archivo Java.

La opción a es incorrecta. El import es aplicado a todas las clases dentro de un archivo Java.

La opción d es incorrecta. Si un paquete está definido dentro de un archivo Java, todas las clases dentro de este archivo pertenecen al mismo paquete.

¿Cuál es el significado de “write once, run anywhere”?. Seleccione las alternativas correctas.

a) El código Java puede ser escrito por un solo miembro del equipo y ejecutado por los otros miembros.

b) Esto solo es por propósitos publicitarios.

c) Esto habilita a que los programas en Java puedan ser compilados una sola vez y ejecutados por la JVM sin necesidad de volver a compilar.

d) El viejo código de Java no tiene la necesidad de recompilar cuando existen nuevas versiones del JVM.

**Solución**

La respuesta es la c. La frase hace referencia a la independencia de la plataforma. Esto significa que el código de Java puede ser compilado una vez y puede ser ejecutado en cualquier sistema con JVM.

¿Cuáles de las siguientes sentencias son correctas?

a) El siguiente código se ejecuta sin ningún tipo de error.

<img src="images/c1/4-2-52.png"> 

b) Debido a que Arraylist almacena solo objetos, no podemos pasar elementos de un Arraylist a un switch.

c) Llamando al método clear() o remove() dentro de un ArrayList, eliminará todos los elementos.

d) Si frecuentemente añadimos elementos a un ArrayList, especificando una larga capacidad, conseguiremos que el código sea más eficiente.

e) Llamando al método clon y dentro de un ArrayList creará una copia del objeto. Esto significa que no realizará una copia individual de cada objeto de la lista.

**Solución**

La opción a es incorrecta. El valor por defecto de un literal sin decimales es int. No podemos añadir un int a un ArrayList de tipo Long. Podemos pasar valores de tipo Long al método add.

La opción b es incorrecta. A partir de la versión Java 7 la estructura switch permite variables de tipo String y ya que un String puede ser almacenado en un ArrayList, podemos usar los elementos del ArrayList en un switch.

La opción c es incorrecta. Solamente el método clear es capaz de eliminar todos los elementos del ArrayList.

La opción d es correcta. Un ArrayList internamente tiene un array donde almacena los objetos. Si le indicamos de antemano al ArrayList la cantidad de elementos máximo que vamos a almacenar haremos que el código sea más eficiente debido a que si no se le indica la cantidad, entonces el ArrayList llegará a un límite y tendrá que construir nuevamente el array que gestiona internamente con una capacidad más alta.

La opción e es correcta. Llamando al método clone en un ArrayList se creará una copia del ArrayList pero no de los elementos.

Selecciona las opciones incorrectas.

a) Si un usuario define un constructor privado para una clase publica, Java crea un constructor public por defecto para la clase.

b) Una clase que obtiene un constructor por defecto no tiene constructores sobrecargados.

c) Un usuario puede sobrecargar un constructor por defecto.

d) La siguiente clase tiene un constructor por defecto.

<img src="images/c1/4-2-53.png">  

e) La siguiente clase tiene un constructor por defecto.

<img src="images/c1/4-2-54.png">   

**Solución**

La opción a es incorrecta. Si un usuario define un constructor para una clase con cualquier modificador, ya no podrá tener un constructor por defecto.

La opción b es correcta. Una clase obtiene un constructor por defecto solo cuando no tiene ningún constructor definido por el usuario. Un constructor por defecto no puede existir con otros constructores.

La opción c es incorrecta. Un constructor por defecto no puede coexistir con otros constructores.

La opción d es correcta. Porque esta clase no tiene ningún constructor por lo que Java le creara uno por defecto.

La opción e es correcta. Esta clase tampoco tiene un constructor, lo único que tiene es un método con el nombre de la clase.

<img src="images/c1/4-2-55.png">

<img src="images/c1/4-2-56.png">

## 7. Interacción entre los elementos

A lo largo de este apartado veremos los componentes gráficos que nos provee Java. En los puntos anteriores solamente hemos manejado programas sin interfaces gráficas, es decir, no contaban con ventanas o botones. Sin embargo, desde hace tiempo, todos los programas profesionales que están orientados hacia los clientes deben tener una interfaz fácil de usar para que su uso sea sencillo. 

### 7.1 Java Swing

<img src="images/c1/4-7-1.png">

Java Swing es un conjunto de herramientas de interfaz gráfica de usuario (GUI) de Java que incluye un amplio conjunto de widgets. Forma parte de Java Foundation Classes (JFC) e incluye varios paquetes para desarrollar aplicaciones de escritorio en Java.  

Swing incluye controles integrados como árboles, botones de imagen, paneles con pestañas, controles deslizantes, barras de herramientas, selectores de color, tablas y áreas de texto para mostrar HTML o formatos de texto enriquecido (RTF). Los componentes Swing están escritos completamente en Java y, por lo tanto, son independientes de la plataforma.  

Swing y la mayoría de marcos similares tienen una gama de objetos que se pueden usar como contenedores para otros objetos como botones y cuadros de texto, etc. Cuando comenzamos a usar Swing, podemos abstraernos de lo que es el contenedor, pero a medida que desarrollamos aplicaciones más complejas, necesitaremos comprender mejor qué es lo que está haciendo el contenedor, qué contenedores están disponibles y cómo usarlos. 

Hay tres tipos de contenedor: marcos, cuadros de diálogo y applets. 

**Marcos**

Un marco es una ventana completa. Cuando creamos un marco, obtenemos ventanas móviles totalmente redimensionables separadas de la ventana del navegador. Podemos agregar otros componentes a un marco y también podemos añadir un menú.

**Cuadros de diálogo**

Un diálogo es un tipo especializado de ventana destinada a contener componentes con los que el usuario puede interactuar. Por ejemplo, aparece un cuadro de diálogo, el usuario hace clic en los botones, ingresa el texto y luego desaparece.

**Applets**

El tercer tipo, el applet, permite que un programa Java se ejecute en un navegador. Esto es algo que excede este apartado, así que vamos a profundizar en los conceptos anteriores, el marco y el diálogo.

También tenemos el panel y una serie de variaciones basadas en él, pero este no es un verdadero contenedor, es realmente un componente y, por lo tanto, un tipo de contenedor muy limitado. Todo lo que hace es facilitarnos agrupar componentes dentro de otros contenedores. En resumen, los paneles son bastante simples, pero útiles cuando se desea agrupar el manejo de eventos. 

**Artículos de interes**

A continuación tienes un artículo sobre interfaces gráficas con Swing para que puedas profundizar en la materia: 

[Interfaces gráficas con Swing](http://dalila.sip.ucm.es/~manuel/JSW1/Slides/Swing.pdf)


### 7.2 JFrame

Después de presentar los tres tipos de contenedor, es interesante analizar con más detalle el marco. La razón es que los otros dos son similares en su uso, aunque tienen sus aspectos particulares.   

Un marco está representado por la clase JFrame, para que aparezcan marcos o ventanas en la pantalla, todo lo que tenemos que hacer es crear una instancia de la clase, es decir, un objeto JFrame.  

Para crear una instancia de JFrame, simplemente usamos el mecanismo común de creación de un objeto de su clase, es decir:

```java
JFrame MyFrame = new JFrame ("Texto");  
```

El texto especifica el título utilizado para la ventana que pretendemos mostrar. 

El nuevo objeto MyFrame tiene una variedad de métodos y propiedades que nos permiten controlar la apariencia y el comportamiento.  

Para probar esto, podemos arrancar NetBeans y crear un nuevo proyecto Java llamado contenedor, para lo que aceptamos todos los valores predeterminados. Una vez hemos creado el proyecto, abrimos el archivo container.java. El código que vemos contiene la definición de una clase llamada Contenedor completa con un único método llamado main: aquí es donde comienza el programa.  

<img src="images/c1/4-7-2.png">

Cuando ejecutamos un proyecto, la clase del mismo nombre se utiliza para proporcionar el método principal. 

Si solo se ejecuta el proyecto no ocurre gran cosa porque no hay código en main. Agreguemos un marco al método principal y lo mostramos. Para crear el marco simplemente usamos:  

```java
JFrame MyFrame = new JFrame ("Mi nuevo marco");  
```

El texto que pasamos al constructor se usa como título.  

Después de esto, necesitamos personalizar el objeto JFrame:  

```java
MyFrame.setSize (400, 400); 
MyFrame.setVisible (true);  
```

Cada vez que utilizamos una clase de Swing, o cualquier otro marco, tenemos que agregar una instrucción de importación al inicio del programa para que Java pueda encontrarla.  

En este caso estamos usando dos clases: JFrame y FlowLayout, por lo que debemos agregar:  

```sh
import java.awt.FlowLayout; 
import javax.swing.JFrame; 
```

Veamos el siguiente código de ejemplo: 

<img src="images/c1/4-7-2-2.png">

El resultado será el siguiente:

<img src="images/c1/4-7-2-3.png">

Por lo que se mostrará una ventana vacía con las dimensiones que se configuraron en la línea 9. Otra cosa a tener en cuenta es que el método setVisible nos va a permitir mostrar u ocultar dependiendo del parámetro que ingresemos. 

### 7.3 JButton

Se usa para crear un botón etiquetado. Usando ActionListener resultará en alguna acción cuando se presiona el botón. Hereda la clase AbstractButton y es independiente de la plataforma.  

En este ejemplo vamos a crear un JFrame con el título “ejemplo”. Después, vamos a construir un JButton para este componente, en el constructor nosotros le pasamos un parámetro de tipo String que va a ser utilizado como el texto que se va a mostrar dentro del botón. Finalmente, utilizamos el método setBounds, que nos permitirá definir con sus dos primeros parámetros la posición (x, y) donde queremos que se ubique nuestro componente y con los parámetros siguientes definimos el ancho y el largo que va a tomar el componente. 

Veamos el código:

<img src="images/c1/4-7-2-4.png">

Y el resultado al ejecutar el código anterior: 

<img src="images/c1/4-7-2-5.png">

De esta forma hemos insertado el botón dentro del JFrame. Ahora vamos a añadirle un listener, es decir, un evento que se ejecutará cuando el usuario presione en el botón.   

Veamos el código para agregar un listener a un botón: 

<img src="images/c1/4-7-2-6.png">

Así, podemos definir un método que se va a invocar cada vez que se realice un click sobre el botón. El método es actionPerformed y recibe de parámetro el objeto ActionEvent. Este nos dará información sobre el evento, tales como la cantidad de clicks realizados, la coordenada dónde se hizo click, etc. Es dentro de este método donde podemos añadir todo el código necesario para ejecutar procesos más complejos como el registro de un usuario, el envío de datos a un servidor, etc. Con este evento el código quedaría de la siguiente forma: 

<img src="images/c1/4-7-2-7.png">

Y cada vez que se le haga click al botón aparecerá en la salida del programa el texto “Click”. 

### 7.4 JLabel

Seguro que alguna vez has tratado de completar un formulario online que no tenía instrucciones claras o dónde los campos estaban mal etiquetados. Una aplicación o sitio web amigable proporcionará al usuario instrucciones y orientación clara.  

Al crear aplicaciones visuales usando Java Swing, querremos hacer lo mismo. Para proporcionar información no editable (es decir, no modificable por el usuario), podemos crear una instancia la una clase JLabel.  

JLabel es una clase Java Swing que nos permite mostrar información en un JFrame. Este elemento no puede ser cambiado por el usuario. Sin embargo, sí que puede ser modificado por otras declaraciones del programa. 

Recordemos que la base de todos los componentes Swing es el JFrame. Sin un objeto JFrame no podemos crear nada. Repasemos de nuevo la sintaxis para crear un JFrame: 

<img src="images/c1/4-7-2-8.png">

De la misma forma que ocurría con el JButton, un JLabel recibe de parámetro un String el cual será utilizado como el texto a mostrar por el JLabel. El resultado debería ser como en la imagen: 

<img src="images/c1/4-7-2-9.png">

### 7.5 JTextField

Si deseamos permitir que los usuarios inicien sesión o introduzcan cualquier información en un formulario, necesitaremos un campo de texto. En Java Swing esto es un objeto JTextField, y para ello debemos crear una instancia de la clase JTextField y añadirla a nuestro panel y JFrame.  

Crear un nuevo campo de texto es lo mismo que crear instancias de cualquier objeto. El código aquí crea el JFrame, añade una etiqueta y luego agrega un campo de texto para que el usuario ingrese cierta información:  

```java
TextField textField = new JTextField();  
JTextField textField2 = new JTextField("Texto"); 
```

Veamos ahora un ejemplo de un JTextField dentro de un JFrame: 

<img src="images/c1/4-7-2-10.png">

Y el resultado de la ejecución de este programa es: 

<img src="images/c1/4-7-2-11.png">

Y el método encargado para obtener el texto que se ha escrito dentro del JTextField es getText, el cual nos devolverá un valor de tipo String. 

<img src="images/c1/4-7-2-12.png">

<img src="images/c1/4-7-2-13.png">

<img src="images/c1/4-7-2-14.png">

<img src="images/c1/4-7-2-15.png">

<img src="images/c1/4-7-2-16.png">

<img src="images/c1/4-7-2-17.png">

<img src="images/c1/4-7-2-18.png">

<img src="images/c1/4-7-2-19.png">

## 8. Ejemplo interacción entre elementos

En esta sección vamos a ver los componentes gráficos que nos provee Java. Recordemos que en los apartados anteriores solamente manejábamos programas sin interfaces gráficas, es decir, no contaban con ventanas o botones. Sin embargo, en la actualidad, todos los programas que están orientados hacia usuarios convencionales deben tener una interfaz fácil de usar para que no surjan problemas durante el manejo del programa. 

**Ejercicio 1**

Vamos a definir primero una clase que nos permitirá almacenar y estructurar los datos. Esta clase se llamará Persona y tendrá los siguientes atributos:

* Nombres, de tipo String, para almacenar el nombre de una persona.
* Apellidos, de tipo String, que almacenará los apellidos de una persona.
* Dirección, de tipo String, que almacenará la dirección de una persona.

Todos estos atributos deben ser solamente accesibles por la misma clase. Además, para cada uno de los atributos deben existir dos métodos. Uno de ellos que devuelva el valor del atributo y el otro que asigne un valor al atributo y estos métodos deberán ser públicos. Por último, debemos tener un constructor que reciba los parámetros de nombres, apellidos y dirección y sean asignados a la clase.

**Solución**

[PDF](pdf/Ejercicio1.pdf)

**Ejercicio 2**

Ahora tenemos que crear una interfaz gráfica en donde tengamos tres JTextField para cada uno de los atributos de la clase Persona. Tengamos en cuenta que cada uno de los JTextField deberá estar acompañado de JLabel para indicar que es lo que se está guardando en cada uno de ellos. Y por último debemos añadir un JButton con el texto “Enviar”.

**Solución**

[PDF](pdf/Ejercicio2.pdf)


**Ejercicio 3**

Finalmente, cuando se presione en el botón “Enviar”, vamos a validar que cada uno de los campos se encuentren rellenos. Para esto debemos agregar un último JLabel vacío debajo del botón “Enviar”. Además, después de pasar las validaciones, debemos construir un objeto de tipo Persona con los datos ingresados y sobrescribir el método toString para que muestre los tres campos concatenados con comas.

**Solución**

[PDF](pdf/Ejercicio3.pdf)

<img src="images/c1/4-8-1.png">

<img src="images/c1/4-8-2.png">

## 9. Interfaces II

<img src="images/c1/4-9-1.png">

A lo largo de este apartado vamos a ver otros componentes muy usados y más avanzados para manejar mensajes tales como JOptionPane y para mostrar un menú de opciones con JMenu. 

### 9.1 JOptionPane

Esta clase hace que sea muy fácil generar ventanas estándar para mostrar y solicitar información hacia y desde los usuarios. Estas ventanas, llamadas cuadros de diálogo, se muestran de forma "modal", lo que significa que bloquean la aplicación hasta que se cierran.  

JOptionPane es parte de la biblioteca Swing para manejar la GUI. Esta biblioteca es muy compleja, pero en este momento veremos lo suficiente para mostrar y recibir información hacia y desde el usuario. 

Veamos algunos de sus métodos. 

**showMessageDialog**

Este método crea una ventana que muestra un mensaje indicado en el parámetro del mensaje. El parámetro parentComponent es para indicar la ventana primaria. En este primer caso usaremos nulo para este parámetro.

Veamos un ejemplo de esto:

<img src="images/c1/4-9-1-2.png">

Entonces la salida del programa será lo siguiente:

<img src="images/c1/4-9-1-3.png">

De esta forma hemos creado fácilmente una ventana con un mensaje que nosotros podemos configurar y por defecto se mostrará junto a un botón para aceptar. También podemos personalizar esta ventana con el siguiente método.

**showInputDialog**

Este método es una función que muestra una ventana con un cuadro de texto y dos botones: Aceptar y Cancelar. Si hacemos clic en "aceptar", recibimos una Cadena con el contenido del cuadro de texto como el valor de retorno de la función. Si hacemos clic en "cancelar", recibiremos un resultado nulo.

Veamos un código de ejemplo:

<img src="images/c1/4-9-1-4.png">

Y el resultado al ejecutar es el siguiente:

<img src="images/c1/4-9-1-5.png">

**Ejemplo práctico**

A continuación se muestra un ejemplo en el que pedimos dos datos para que sean introducidos y mostraremos en el resultado diversas operaciones. 

[Enlace]()

**Enlace de interes**

En el siguiente enlace podemos aprender un poco más sobre cómo crear mensajes de diálogo con JOptionPane: 

[Enlace](https://serprogramador.es/programando-mensajes-de-dialogo-en-java-parte-1/)

### 9.2 JMenuBar

JMenuBar es una barra de menú desplegable en la parte superior de la aplicación.   

JPopupMenu es un menú que aparece cuando se presiona el botón derecho del ratón en un área en particular. Los menús se componen de diferentes elementos.  

Los componentes de un menú se pueden construir utilizando las clases JMenuBar, JMenu, JMenuItem, JCheckBoxMenuItem y JRadioButtonMenuItem de manera similar a las clases MenuBar, Menu y MenuItem de AWT.  

Cuando se selecciona cualquiera de los elementos del menú en el objeto Menú "Fondo", el color de fondo del marco cambia al mismo color que el elemento del menú.   

Del mismo modo, cuando se selecciona cualquier elemento del menú en el primer plano, el color de primer plano del marco cambiará al color correspondiente seleccionado en el menú que se muestra en el campo de texto. Así, si se selecciona el elemento de menú Salir del menú de salida, el marco se cierra. 

A continuación veremos un ejemplo simple sobre este componente: 

<img src="images/c1/4-9-2-1.png">

Ahora al ejecutar el código anterior el resultado será el siguiente:

<img src="images/c1/4-9-2-2.png">

<img src="images/c1/4-9-2-3.png">

<img src="images/c1/4-9-2-4.png">

## 10. Peculiaridades de Java

En este punto veremos algunas características que tiene Java que lo diferencian de otros lenguajes. Java es un lenguaje muy potente y de propósito general, por eso es importante entender cuáles son las ventajas competitivas que nos aporta. 

<img src="images/c1/4-10-1.png">

### 10.1 Herencia única

Este comportamiento nos indica que Java no nos permite agregar múltiples herencias hacia una clase, es decir, algo como esto: 

<img src="images/c1/4-10-2.png">

Esto no compilará debido a que Java no nos permite heredar de dos clases. Sin embargo, esto se puede solucionar de la siguiente forma: 

<img src="images/c1/4-10-3.png">

Y ese código nos daría el mismo resultado. 

**Enlace de interés**

En el siguiente enlace podemos ver un ejemplo que ayuda a visualizar la implementación de la herencia única. 

[Implementación de la herencia única](https://stips.wordpress.com/2019/04/09/tipos-de-herencia-de-java-para-principiantes-con-ejemplos/)

### 10.2 Es independiente de la plataforma

Esto quiere decir que cuando compilamos una clase en Java no debemos preocuparnos de si queremos ejecutarla en diferentes sistemas operativos. Esto se debe a que la JVM es la que carga las clases y las ejecuta haciendo como de intermediario entre las clases Java y el sistema operativo.  

Otros lenguajes no tienen esta característica. Por ejemplo C#, creado por Microsoft, solo puede ser ejecutado en sistemas operativos determinados, fundamentalmente basados en Windows.  

Para cada sistema operativo hay disponible una JVM diferenciada que puede leer el archivo .class o el código de bytes. Cuando compilamos su código Java, el archivo .class es generado por el compilador javac. JVM puede leer estos códigos y cada sistema operativo tiene su propia JVM, por lo que JVM depende de la plataforma, pero el lenguaje solo depende del JVM. A esta característica también se le ha denominado como portabilidad. 

### 10.3 Manejo de la programación funcional

Habitualmente, al programar con Java, vamos a trabajar utilizando el paradigma orientado a objetos que vimos en los primeros apartados. Sin embargo, en las últimas versiones del lenguaje Java se están introduciendo algunas herramientas para trabajar con la programación funcional. Esta forma de trabajar nos proporciona agilidad en el momento de crear funciones, declararlas e incluso nos permite crear funciones sin nombre o pasarlas como parámetros.   

Todas estas características hacen que la programación funcional esté presente cada vez más en los lenguajes comerciales y Java no es la excepción. Esto no significa que la programación orientada a objetos ya no se tenga en cuenta, sino que ahora debemos entender los dos tipos de paradigmas para crear clases de forma más rápida y clara. 
   
Para entender cuáles son los beneficios de la programación funcional veamos este ejemplo. Imaginemos que deseamos filtrar una lista de enteros que sean pares y mostrar los valores que tienen. Utilizando lo que ya sabemos lo realizaríamos de la siguiente manera: 

<img src="images/c1/4-10-4.png">

De esta forma el ArrayList lista tiene los elementos y lo recorremos con un “for”. Dentro del “for” mostramos el valor del elemento que tenemos en ese momento, después ponemos un “if” con el que filtramos los que sean pares, y finalmente dentro del “if” agregamos el código para mostrar dicho elemento en la lista de resultados. 

Ahora veremos cómo sería hacerlo si esto fuera programado con programación funcional: 

<img src="images/c1/4-10-5.png">

Como podemos ver, hemos conseguido tener el mismo resultado con los dos algoritmos, pero la gran diferencia es que con el segundo método lo logramos en muchas menos líneas. 

<img src="images/c1/4-10-6.png">

<img src="images/c1/4-10-7.png">

## Resumen Final

En esta unidad hemos estudiado algunos conceptos básicos de la programación orientada a objetos.   

Hemos visto que un algoritmo es un conjunto finito de instrucciones para cumplir un objetivo específico y que la programación es el proceso en el que  creamos algoritmos con el fin de resolver un problema.  

Un lenguaje de programación es un conjunto de instrucciones y reglas que pueden ser procesados por un ordenador y de esta forma nos permite escribir los algoritmos.  

La programación funcional es un paradigma donde se utilizan funciones con una o muchas entradas y salidas como principal herramienta para solucionar un problema. Por su parte, la programación orientada a objetos (POO) es un paradigma cuyo principal enfoque es estructurar los datos y procesos como objetos del plano físico más que como funciones. La POO tiene cuatro pilares fundamentales: Abstracción, herencia, polimorfismo y encapsulamiento.  

Un objeto en la programación orientada a objetos es la representación de un conjunto de propiedades (atributos) y comportamientos (métodos). 

Las clases son la principal herramienta dentro de la programación orientada a objetos para representar un conjunto de datos relacionados. Una clase bien definida tiene un conjunto de atributos y métodos relacionados, es decir, una clase debe cumplir con una responsabilidad específica y no realizar múltiples tareas diferentes. Para ejecutar una clase primero debemos compilarla. El proceso de compilar es el de transformar el código Java a bytecode para que sea ejecutado por el JVM.

Entre los elementos de una clase tenemos: package, comments, imports y la definición de la clase. Existen algunas clases especiales tales como: interfaces y clases abstractas.  

La herencia es un aspecto fundamental entre las clases, ya que nos permiten reutilizar atributos y métodos entre clases. Los modificadores de acceso permiten restringir el uso de miembros entre clases, entre ellos tenemos: public, private, default y protected.  

Hemos estudiado que, en Java, los objetos son la materialización de una clase con valores específicos, cada uno de ellos tienen sus propios valores. Cuando declaramos una variable para un objeto es una referencia hacia una dirección de memoria.  
El API de Java nos provee diversas clases para poder crear procesos tales como String, StringBuilder y ArrayList.  

Las clases pueden tener múltiples constructores. La referencia this nos da acceso a los métodos y atributos de la clase en donde nos encontramos para evitar confusiones con otras variables de igual nombre.  

La herencia entre clases se realiza con la palabra reservada “extends”. La herencia implica que una clase hija va a heredar métodos y atributos de una clase padre. Una clase ejecutable tendrá el método main, el cual permitirá iniciar la ejecución de una clase.  

Los componentes gráficos en Java son proveídos por Java Swing, que contiene una librería de componentes a nuestra disposición. El contenedor principal para mostrar nuestras interfaces se llama JFrame. El componente utilizado para mostrar un botón dentro de un JFrame es el JButton. Además aquí podemos asignarle un evento para ejecutar un método cada vez que se realice un click. El componente encargado de mostrar un label en un JFrame se llama JLabel. Un componente donde el usuario puede introducir un texto se llama JTextField. 

También, hemos visto que la clase JOptionPane es muy potente debido a que podemos usar dicha clase sin necesidad de un contenedor. JOptionPane nos permite mostrar textos y también pedir datos para que sean ingresados, y JMenuBar nos permite crear barras de menú desplegables y dentro de ellas añadir más opciones.  

Para finalizar, hemos aprendido que Java es un lenguaje independiente de la plataforma. Es decir, que no importa en qué sistema operativo nos encontremos que podrá ejecutarse sin problemas gracias a la JVM. Java en las versiones más actuales incorpora las características de la programación funcional,  lo que lo hace mucho más potente. 

<img src="images/c1/4-10-8.png">

<img src="images/c1/4-10-9.png">

<img src="images/c1/4-10-10.png">


## BIBLIOGRAFÍA

* Cadenhead, R., Lemay, L. (2008). Java 6. Madrid. Ediciones ANAYA Multimedia.
* Shach, S. (2005). Análisis y diseño Orientado a Objetos, con UML y el proceso unificado. México. Mc Graw Hill.
* H. M. Deitel y P. J. Deitel, Cómo Programar en C/C++ y Java. (Cuarta edición). Ed. Pearson Educación, 2004.
* B. Eckel. Piensa en Java (2a edición). Prentice Hall. 2002.
* H.M. Deitel, P.J. Deitel. Cómo programar en Java (5a edición).
Pearson Prentice-Hall. 2004.
* Java. Desarrollo web. Recuperado de:
https://desarrolloweb.com/directorio/programacion/java/
* Java EE. Arquitectura Java. Recuperado de: https://www.arquitecturajava.com
* Mapa mental referente a la POO y sus Pilares Fundamentales. UNET. Recuperado de: https://compu2poo.wordpress.com/
* La web del programador. Recuperado de: https://www.lawebdelprogramador.com/

