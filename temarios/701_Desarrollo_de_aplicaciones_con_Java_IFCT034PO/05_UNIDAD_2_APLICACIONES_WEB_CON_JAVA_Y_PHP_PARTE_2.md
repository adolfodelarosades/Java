# UNIDAD 2 APLICACIONES WEB CON JAVA Y PHP PARTE 2

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido

* 7. Programación web conPHP. Introducción a PHP
   * 7.3 Librería estándar (i)
      * 7.3.1 Estructuras de Datos
         * 7.3.1.1 Listas doblemente vinculadas
         * 7.3.1.2 Heaps
         * 7.3.1.3 Los arreglos o matrices
         * 7.3.1.4 Mapas
      * 7.3.2 Iteradores
   * 7.4 Librería estándar (ii)
      * 7.4.1 Interfaces
      * 7.4.2 Clases de excepciones SPL
      * 7.4.3 Funciones SPL
      * 7.4.4 Manejo de Archivos
      * 7.4.5 Clases e interfaves misceláneas de SPL
   * 7.5 La programación orientada a objetos
   * 7.6 La orientación a objetos en php7
      * 7.6.1 Objetos
      * 7.6.2 Declarando una clase
      * 7.6.3 Las palabras y sus contructores
      * 7.6.4 Destructores
      * 7.6.5 Propiedades públicas, privadas y protegidas
      * 7.6.6 Métodos públicos, privados y protegidos
      * 7.6.7 Polimorfismo
      * 7.6.8 Métodos Abstractos
      * 7.6.9 Interfaces
   * 7.7 MYSQL
      * 7.7.1 Arquitectura de MySQL
      * 7.7.2 Operaciones principales con las tablas de MYSQL
      * 7.7.3 Interfaces con PHP
      * 7.7.4 Conexiones
      * 7.7.5 Consultas
      * 7.7.6 Modos de obteción de resultados
   * 7.8 SQLITE y XML
      * 7.8.1 Fortalezas y debilidades de SQLite1
      * 7.8.2 Mejores áreas de uso
      * 7.8.3 XML
      * 7.8.4 Sintaxis
   * 7.9 Identificación de usuarios (i)
      * 7.9.1 Manejo de Sesiones
      * 7.9.2 Constantes predefinidas
      * 7.9.3 Progreso de carga de sesión
      * 7.9.4 Sesiones y Seguridad
   * 7.10 Motores de plantillas
      * 7.10.1 Sistemas de plantillas
      * 7.10.2 ¿Por qué usar un sistema de plantillas?
   * 7.11 identificación de usuarios
      * 7.11.1 Funciones de sesión
* 8. Programación Web con PHP. Mantenimiento de estado
* 9. Programación Web con PHP. Servicios Web
* 10. Programación Web con PHP. Herramientas adicionales
   * 10.1 PHP Y Ajax
   * 10.2 ¿Por qué utilizar PHP y Ajax?
* 11. Configuración del servidor. Configuración del servidor Resin
   * 11.1 Instalación
   * 11.2 Conexión con otros web servers
* 12. Configuración del servidor. Instalación de Java Bridge

## Mapa Conceptual

<img src="images/c2/4-7-34.png">

<img src="images/c2/4-7-35.png">

## 7. Programación web conPHP. Introducción a PHP
### 7.3 Librería estándar (i)

La biblioteca estándar de PHP (SPL) es una de las partes más complejas de este lenguaje. Está diseñada para resolver problemas estándar fácilmente y, aunque al principio es algo difícil de entender, aprender SPL es clave para el verdadero dominio de PHP.  

Introducirnos con gran profundidad en SPL probablemente requeriría de un curso o un libro en sí mismo, así que lo estructuraremos de la mejor forma posible para poder avanzar. Antes de comenzar, debemos saber que la mayor parte del esfuerzo para comprender SPL se reduce a entender el concepto de iteradores. Un iterador es un objeto altamente especializado que procesa elementos en una matriz compuesta de componentes similares. Por "matriz" nos referimos a "colección", no pensemos que los iteradores necesitan trabajar sobre matrices PHP.  

Primeramente, mostraremos un pequeño iterador muy sencillo que automatiza la tarea de hacer un bucle a través de archivos y directorios. Se llama DirectoryIterator y lo podrás crear simplemente indicándole el directorio con el que se desea trabajar. 

**Ejemplo**

Esas cuatro líneas de código son suficientes para imprimir todos los archivos y directorios de la unidad C: de un ordenador con Windows. Si estás ejecutando Unix, cámbialo a "/ etc" o a lo que corresponda.  

Lo que realmente sucede aquí es que el bucle foreach llama al DirectoryIterator buscando la siguiente entrada de archivo en el directorio. Esto se devuelve en forma de un objeto, sobre el cual llamamos getFilename (), que es solo una de las varias funciones disponibles. También hay isExecutable (), isReadable (), fileSize (), getPath () y otras. Sus acciones se explican por sí mismas gracias a la convención de nombres fácil de traducir desde el inglés.  

Lo que hemos logrado aquí es hacer una tarea que de otro modo habría requerido un poco más de pensamiento y un poco más también de codificación personalizada y que esencialmente ha acabado reduciéndose a una línea: $archivos = new DirectoryIterator ("c:"). Después de eso, solo se trata de un bucle para extraer el nombre de cada archivo individual. 

<img src="images/c2/4-7-36.png">

Continuando, SPL nos permite hacer que nuestros objetos actúen como matrices en ciertas situaciones. Para hacer esto, necesitamos implementar la interfaz ArrayAccess y sus cuatro funciones: offsetSet (), offsetGet (), offsetExists () y offsetUnset (). De ellas, la primera toma dos parámetros (el nombre de la clave y su valor), y las otras tres toman solo uno (el nombre de la clave).  

Este es un ejemplo simple que permite ver cómo funciona esta sobrecarga de matriz / objeto: 

```php
<?php
class objetoarray implements ArrayAccess { function offsetExists($offset) {
echo "Llamada a offsetExists!\n";
return true;
}
function offsetGet($offset) {
echo "Llamada a offsetGet!\n";
}
function offsetSet($offset, $value) { echo "Llamada a offsetSet!\n";
}
function offsetUnset($offset) {
echo "Llamada a offsetUnset!\n";
}
}
$mi_arreglo = new objarray(); $mi_arreglo[5] = "algun";
echo $mi_arreglo[5];
if (isset($mi_arreglo[5])) { unset($mi_arreglo[5]);
}
?>
```

Esto es lo que produce ese script: 

Llamada a offsetSet! 
Llamada a offsetGet! 
Llamada a offsetExists! 
Llamada a offsetUnset! 

**Para saber más**

El "implementar ArrayAccess" es absolutamente necesario para que el objeto funcione como una matriz. Sin esto, incluso si la clase implementa todas las funciones requeridas, no funcionaría. Esto se debe a que PHP no permite errores, comprueba específicamente la implementación de la interfaz ArrayAccess, y no hay forma de evitarlo. Este es un tema común en SPL. 

Como puedes ver, cuando configuramos, obtenemos, revisamos y desarticulamos nuestro objeto $mi_arreglo objarray, las funciones relevantes se llaman automáticamente. Entonces, ¿qué podemos hacer con esto que sea realmente útil? Aquí es donde las cosas se complican. No desde una perspectiva de codificación, sino que encontrar maneras de utilizar esta tecnología no es tarea fácil.  

Una posibilidad es crear un objeto que cargue y guarde archivos.  

**Ejemplo práctico**

A continuación, encontrarás un ejemplo práctico sobre la creación de que un objeto cargue y guarde archivos: 

[Ejemplo práctico](/pdf/Ejemplo_practico_7.3-1.pdf)

Por supuesto, tratar archivos como arrays es bastante raro, pero hay muchas otras cosas que se podrían hacer. ¿Tal vez la matriz necesita ser serializada y enviada a un servidor cada vez que se escribe? ¿Quizás quieras almacenar la matriz como un arreglo, pero también escribirla en el disco en caso de que la aplicación se bloquee?  

Ahora, veremos el último ejemplo que queremos presentar: el iterador genérico. Recuerda que los iteradores se utilizan para trabajar con grupos de datos similares, (los iteradores se introdujeron en PHP 5) y se usan más comúnmente en los bucles foreach. Una clase que implementa Iterator necesita las siguientes funciones: rewind () (restablecer al principio de la colección), key () y current () (obtener la clave actual de la colección y su valor), next () (mover al siguiente elemento de la colección), y valid () (devuelve si hay más valores para leer en la colección). 

Con eso en mente, ¿qué podemos crear para mostrar los iteradores? Esta es otra cuestión que parece simple, pero que lo es menos cuando se piensa con detalle. Podemos usar un objeto iterador para contar números como se ve a continuación: 

<img src="images/c2/4-7-37.png">

Eso podría contar de 0 a 6, imprimiendo los factoriales de cada número al mismo tiempo. Como se puede ver, el código es nuevamente muy simple, lo que significa que el código está bien hecho.   

Estos ejemplos presentados muestran que SPL abre un nuevo mundo de programación orientada a soluciones con PHP. Si bien la OOP permite reutilizar fragmentos de código, SPL permite reutilizar ideas genéricas y aplicarlas de la mejor manera en tus proyectos individuales. 

#### 7.3.1 Estructuras de Datos

SPL proporciona una serie de estructuras de datos estándar. Se agrupan aquí por su implementación subyacente, que determina su aplicabilidad. 

* Listas doblemente vinculadas 
* Heaps 
* Los Arreglos o Matrices Mapas 

##### 7.3.1.1 Listas doblemente vinculadas

Una lista de doble enlace (DLL) es una secuencia de ítems enlazados entre sí en las dos direcciones. Las operaciones del iterador como el ingreso a los dos extremos, la inserción o el borrado de nodos presentan un coste de O (1). Por tanto, proporciona una implementación apropiada para colas y pilas. 

###### La clase SplDoublyLinkedList

Proporciona las principales funcionalidades de una lista enlazada. Sintaxis:

```php
SplDoublyLinkedList implements Iterator , ArrayAccess , Countabl
e {
/* Constants */
const integer IT_MODE_LIFO = 2 ;
const integer IT_MODE_FIFO = 0 ;
const integer IT_MODE_DELETE = 1 ;
const integer IT_MODE_KEEP = 0 ;
/*Methods */
public __construct ( void )
public add ( mixed $index , mixed $newval ) : void
public bottom ( void ) : mixed
public count ( void ) : int
public current ( void ) : mixed
public getIteratorMode ( void ) : int
public isEmpty ( void ) : bool
public key ( void ) : mixed
public next ( void ) : void
public offsetExists ( mixed $index ) : bool
public offsetGet ( mixed $index ) : mixed
public offsetSet ( mixed $index , mixed $newval ) : void
public offsetUnset ( mixed $index ) : void
public pop ( void ) : mixed
public prev ( void ) : void
public push ( mixed $value ) : void
public rewind ( void ) : void
public serialize ( void ) : string
public setIteratorMode ( int $mode ) : void
public shift ( void ) : mixed
public top ( void ) : mixed
public unserialize ( string $serialized ) : void
public unshift ( mixed $value ) : void
public valid ( void ) : bool
}
```

###### La clase SplStack

Proporciona las funcionalidades principales de una pila empleando una lista enlazada doblemente. Sintaxis:

```php
SplStack extends SplDoublyLinkedList implements Iterator ,
ArrayAccess , Countable {
/* Methods */
__construct ( void )
setIteratorMode ( int $mode ) : void
/* Inherited methods */
public SplDoublyLinkedList::add ( mixed $index , mixed $new
val ) : void
public SplDoublyLinkedList::bottom ( void ) : mixed
public SplDoublyLinkedList::count ( void ) : int
public SplDoublyLinkedList::current ( void ) : mixed
public SplDoublyLinkedList::getIteratorMode ( void ) : int
public SplDoublyLinkedList::isEmpty ( void ) : bool
public SplDoublyLinkedList::key ( void ) : mixed
public SplDoublyLinkedList::next ( void ) : void
public SplDoublyLinkedList::offsetExists ( mixed $index )
: bool
public SplDoublyLinkedList::offsetGet ( mixed $index )
: mixed
public SplDoublyLinkedList::offsetSet ( mixed $index , mixe
d $newval ) : void
public SplDoublyLinkedList::offsetUnset ( mixed $index )
: void
public SplDoublyLinkedList::pop ( void ) : mixed
public SplDoublyLinkedList::prev ( void ) : void
public SplDoublyLinkedList::push ( mixed $value ) : void
public SplDoublyLinkedList::rewind ( void ) : void
public SplDoublyLinkedList::serialize ( void ) : string
public SplDoublyLinkedList::setIteratorMode ( int $mode )
: void
public SplDoublyLinkedList::shift ( void ) : mixed
public SplDoublyLinkedList::top ( void ) : mixed
public SplDoublyLinkedList::unserialize ( string $serialize
d ) : void
public SplDoublyLinkedList::unshift ( mixed $value ) : void
public SplDoublyLinkedList::valid ( void ) : bool
}
```

###### La clase SplQueue

Nos ofrece las principales funcionalidades de una cola que se implementa utilizando una lista enlazada doblemente. Sintaxis:

```php
SplQueue extends SplDoublyLinkedList implements Iterator ,
ArrayAccess , Countable {
/* Methods */
__construct ( void )
dequeue ( void ) : mixed
enqueue ( mixed $value ) : void
setIteratorMode ( int $mode ) : void
/* Inherited methods */
public SplDoublyLinkedList::add ( mixed $index , mixed $new
val ) : void
public SplDoublyLinkedList::bottom ( void ) : mixed
public SplDoublyLinkedList::count ( void ) : int
public SplDoublyLinkedList::current ( void ) : mixed
public SplDoublyLinkedList::getIteratorMode ( void ) : int
public SplDoublyLinkedList::isEmpty ( void ) : bool
public SplDoublyLinkedList::key ( void ) : mixed
public SplDoublyLinkedList::next ( void ) : void
public SplDoublyLinkedList::offsetExists ( mixed $index )
: bool
public SplDoublyLinkedList::offsetGet ( mixed $index )
: mixed
public SplDoublyLinkedList::offsetSet ( mixed $index , mixe
d $newval ) : void
public SplDoublyLinkedList::offsetUnset ( mixed $index )
: void
public SplDoublyLinkedList::pop ( void ) : mixed
public SplDoublyLinkedList::prev ( void ) : void
public SplDoublyLinkedList::push ( mixed $value ) : void
public SplDoublyLinkedList::rewind ( void ) : void
public SplDoublyLinkedList::serialize ( void ) : string
public SplDoublyLinkedList::setIteratorMode ( int $mode )
: void
public SplDoublyLinkedList::shift ( void ) : mixed
public SplDoublyLinkedList::top ( void ) : mixed
public SplDoublyLinkedList::unserialize ( string $serialize
d ) : void
public SplDoublyLinkedList::unshift ( mixed $value ) : void
public SplDoublyLinkedList::valid ( void ) : bool
}
```

##### 7.3.1.2 Heaps

Los heaps o montículos son similares a un árbol, donde cada nodo es igual o mayor que los hijos. 

###### La clase SplHeap

La clase SplHeap proporciona las funcionalidades principales de un heap. Sintaxis:

<img src="images/c2/4-7-38.png">

###### La clase SplMaxHeap

La clase SplMaxHeap ofrece las funcionalidades principales de un heap, manteniendo el máximo en la parte superior. Sintaxis:

<img src="images/c2/4-7-39.png">

###### La clase SplMinHeap

La clase SplMinHeap proporciona las funcionalidades principales de un heap, manteniendo el mínimo en la parte superior. Sintaxis:

<img src="images/c2/4-7-40.png">

###### La clase SplPriorityQueue

La clase SplPriorityQueue proporciona las funcionalidades principales de una cola de prioridad, implementada usando un heap máximo. Sintaxis:

<img src="images/c2/4-7-41.png">

##### 7.3.1.3 Los arreglos o matrices

Los arreglos son estructuras que acumulan los datos de manera secuencial, a los que se puede acceder por medio de índices. Diferente de las matrices PHP las cuáles, se implementan como tablas hash ordenadas. 

**La clase SplFixedArray**

Ofrece las funcionalidades principales de la matriz. Las diferencias más importantes entre un SplFixedArray y un arreglo PHP normal, es que el SplFixedArray es de ancho no variable y solo admite enteros en el índice. Su principal beneficio es que admite una implementación de matriz más rápida. Sintaxis: 

<img src="images/c2/4-7-42.png">

##### 7.3.1.4 Mapas

El mapa es como conocemos a las estructuras de datos que poseen dos clave-valor. Las matrices que utiliza el lenguaje PHP se podrán observar como mapas de números enteros / cadenas de valores. SPL proporciona un mapeo de objetos a datos. Este mapeo se podrá utilizar también como un grupo de objetos. 

**La clase SplObjectStorage**

Proporciona un mapeo de objetos a datos o, al ignorar los datos, un conjunto de objetos. Este doble propósito puede ser útil en muchos casos que impliquen la necesidad de identificar objetos de manera única. Sintaxis de la clase: 

<img src="images/c2/4-7-43.png">

#### 7.3.2 Iteradores

SPL proporciona un conjunto de iteradores para recorrer objetos.  

Las clases de iteradores SPL son: 


##### Arrayiterator
Este elemento iterador accede para cambiar valores cada vez que itera sobre arreglos y objetos.

Cuando se desea iterar la misma matriz repetidas veces, debe instanciarse el ArrayObject y permitir que añada objetos de ArrayIterator que apunten a ella utilizando foreach o haciendo una llamada a su procedimiento getIterator () de forma manual. Su sintaxis es:

```php
ArrayIterator implements ArrayAccess , SeekableIterator , C
ountable , Serializable {
/*Constants */
const integer STD_PROP_LIST = 1 ;
const integer ARRAY_AS_PROPS = 2 ;
/* Methods */
public append ( mixed $value ) : void
public asort ( void ) : void
public __construct ([ mixed $array =
array() [, int $flags = 0 ]] )
public count ( void ) : int
public current ( void ) : mixed
public getArrayCopy ( void ) : array
public getFlags ( void ) : int
public key ( void ) : mixed
public ksort ( void ) : void
public natcasesort ( void ) : void
public natsort ( void ) : void
public next ( void ) : void
public offsetExists ( mixed $index ) : bool
public offsetGet ( mixed $index ) : mixed
public offsetSet ( mixed $index , mixed $newval ) : void
public offsetUnset ( mixed $index ) : void
public rewind ( void ) : void
public seek ( int $position ) : void
public serialize ( void ) : string
public setFlags ( string $flags ) : void
public uasort ( callable $cmp_function ) : void
public uksort ( callable $cmp_function ) : void
public unserialize ( string $serialized ) : string
public valid ( void ) : bool
}
```


* RecursiveArrayIterator.

   Este iterador permite desarmar y modificar valores y claves mientras se itera sobre arrays y objetos de un modo análogo a como lo hace ArrayIterator. No obstante, también cabe la posibilidad de iterar en la entrada del iterador que se esté utilizando. Sintaxis de la clase:
   
   ```php
   RecursiveArrayIterator extends ArrayIterator implements RecursiveIterator {
    /*Inherited constants */
    const integer STD_PROP_LIST = 1 ;
    const integer ARRAY_AS_PROPS = 2 ;
    /*Constants */
    const integer CHILD_ARRAYS_ONLY = 4 ;
    /*Methods */
    public getChildren ( void ) : RecursiveArrayIterator
    public hasChildren ( void ) : bool
    /* Inherits */
    public ArrayIterator::append ( mixed $value ) : void
    public ArrayIterator::asort ( void ) : void
    public ArrayIterator::__construct ([ mixed $array =
    array() [, int $flags = 0 ]] )
    public ArrayIterator::count ( void ) : int
    public ArrayIterator::current ( void ) : mixed
    public ArrayIterator::getArrayCopy ( void ) : array
    public ArrayIterator::getFlags ( void ) : int
    public ArrayIterator::key ( void ) : mixed
    public ArrayIterator::ksort ( void ) : void
    public ArrayIterator::natcasesort ( void ) : void
    public ArrayIterator::natsort ( void ) : void
    public ArrayIterator::next ( void ) : void
    public ArrayIterator::offsetExists ( mixed $index ) : bool
    public ArrayIterator::offsetGet ( mixed $index ) : mixed
    public ArrayIterator::offsetSet ( mixed $index , mixed $newval ) : void
    public ArrayIterator::offsetUnset ( mixed $index ) : void
    public ArrayIterator::rewind ( void ) : void
    public ArrayIterator::seek ( int $position ) : void
    public ArrayIterator::serialize ( void ) : string
    public ArrayIterator::setFlags ( string $flags ) : void
    public ArrayIterator::uasort ( callable $cmp_function ) : void
    public ArrayIterator::uksort ( callable $cmp_function ) : void
    public ArrayIterator::unserialize ( string $serialized ): string
    public ArrayIterator::valid ( void ) : bool
  }
  ```

##### Emptyiterator

La clase EmptyIterator es para un iterador vacío. Sintaxis de la clase:

<img src="images/c2/4-7-44.png">

##### Iteratoriterator

Esta clase de iterador permite la conversión de cualquier elemento que sea transitable con un iterador. La mayoría de las clases que no implementan iteradores, probablemente no permitan el conjunto completo de características del iterador. En ese caso, hay que introducir técnicas que eviten las excepciones y los errores fatales. Sintaxis de la clase:

<img src="images/c2/4-7-45.png">

**AppendIterator.**

Un iterador que itera sobre varios iteradores de forma continua. Sintaxis de la clase:

```php
AppendIterator extends IteratorIterator implements OuterIte
rator {
/* Methods */
public __construct ( void )
public append ( Iterator $iterator ) : void
public current ( void ) : mixed
public getArrayIterator ( void ) : ArrayIterator
public getInnerIterator ( void ) : Iterator
public getIteratorIndex ( void ) : int
public key ( void ) : scalar
public next ( void ) : void
public rewind ( void ) : void
public valid (��void ) : bool
/* Inherited methods */
public IteratorIterator::__construct ( Traversable $iterato
r )
public IteratorIterator::current ( void ) : mixed
public IteratorIterator::getInnerIterator ( void )
: Traversable
public IteratorIterator::key ( void ) : mixed
public IteratorIterator::next ( void ) : void
public IteratorIterator::rewind ( void ) : void
public IteratorIterator::valid ( void ) : bool
}
```

**CachingIterator.**

Este objeto admite la iteración en caché sobre otro iterador. Sintaxis de la clase:

```php
CachingIterator extends IteratorIterator implements OuterIt
erator , ArrayAccess , Countable {
/* Constants */
const integer CALL_TOSTRING = 1 ;
const integer CATCH_GET_CHILD = 16 ;
const integer TOSTRING_USE_KEY = 2 ;
const integer TOSTRING_USE_CURRENT = 4 ;
const integer TOSTRING_USE_INNER = 8 ;
const integer FULL_CACHE = 256 ;
/*Methods */
public __construct ( Iterator $iterator [, int $flags =
self::CALL_TOSTRING ] )
public count ( void ) : int
public current ( void ) : mixed
public getCache ( void ) : array
public getFlags ( void ) : int
public getInnerIterator ( void ) : Iterator
public hasNext ( void ) : void
public key ( void ) : scalar
public next ( void ) : void
public offsetExists ( mixed $index ) : void
public offsetGet ( string $index ) : void
public offsetSet ( mixed $index , mixed $newval ) : void
public offsetUnset ( string $index ) : void
public rewind ( void ) : void
public setFlags ( int $flags ) : void
public __toString ( void ) : void
public valid ( void ) : void
}
```

**FilterIterator.**

Este es un filtro que selecciona los valores no deseados con un iterador genérico. Este es una clase que puede expandirse para ejecutar filtros de iterador personalizados. Es necesario implementar el FilterIterator ::accept () en la subclase. Sintaxis:

<img src="images/c2/4-7-46.png">

**RecursiveFilterIterator.**

Este filtro es un iterador genérico que selecciona los valores que no se desean de RecursiveIterator. Esta clase debe heredarse para ejecutar filtros no automáticos. El RecursiveFilterIterator::accept() debe implementarse en la subclase. Sintaxis:

```php
abstract RecursiveFilterIterator extends FilterIterator imp
lements OuterIterator ,RecursiveIterator {
/* Methods */
public __construct ( RecursiveIterator $iterator )
public getChildren ( void ) : RecursiveFilterIterator
public hasChildren ( void ) : bool
/*Inherited methods */
public abstract FilterIterator::accept ( void ) : bool
public FilterIterator::__construct ( Iterator $iterator )
public FilterIterator::current ( void ) : mixed
public FilterIterator::getInnerIterator ( void ) : Iterator
public FilterIterator::key ( void ) : mixed
public FilterIterator::next ( void ) : void
public FilterIterator::rewind ( void ) :��void
public FilterIterator::valid ( void ) : bool
}
```

**ParentIterator.**

Este FilterIterator extendido permite una iteración recursiva usando RecursiveIteratorIterator, mostrando solo aquellos elementos que tienen hijos. Sintaxis de la clase:

<img src="images/c2/4-7-47.png">


**RegexIterator.**

Este iterador filtra a otro iterador que esté construido en base a una expresión regular. Sintaxis de la clase:

```php
RegexIterator extends FilterIterator {
/* Constants */
const integer MATCH = 0 ;
const integer GET_MATCH = 1 ;
const integer ALL_MATCHES = 2 ;
const integer SPLIT = 3 ;
const integer REPLACE = 4 ;
const integer USE_KEY = 1 ;
/*Methods */
public __construct ( Iterator $iterator , string $regex [,
int $mode = self::MATCH [, int$flags =
0 [, int $preg_flags = 0 ]]] )
public accept ( void ) : bool
public getFlags ( void ) : int
public getMode ( void ) : int
public getPregFlags ( void ) : int
public getRegex ( void ) : string
public setFlags ( int $flags ) : void
public setMode ( int $mode ) : void
public setPregFlags ( int $preg_flags ) : void
/* Inherited methods */
public abstract FilterIterator::accept ( void ) : bool
public FilterIterator::__construct ( Iterator $iterator )
public FilterIterator::current ( void ) : mixed
public FilterIterator::getInnerIterator ( void ) : Iterator
public FilterIterator::key ( void ) : mixed
public FilterIterator::next ( void ) : void
public FilterIterator::rewind ( void ) : void
public FilterIterator::valid ( void ) : bool
}
```

**RecursiveRegexIterator.**

Es un iterador recursivo que filtra a otro iterador también recursivo aplicando una expresión regular. Sintaxis:

```php
RecursiveRegexIterator extends RegexIterator implements Rec
ursiveIterator {
/*Inherited constants */
const integer MATCH = 0 ;
const integer GET_MATCH = 1 ;
const integer ALL_MATCHES = 2 ;
const integer SPLIT = 3 ;
const integer REPLACE = 4 ;
const integer USE_KEY = 1 ;
/*Methods */
public __construct ( RecursiveIterator $iterator , string $
regex [, int $mode = self::MATCH[, int $flags =
0 [, int $preg_flags = 0 ]]] )
public getChildren ( void ) : RecursiveRegexIterator
public hasChildren ( void ) : bool
/* Inherited methods */
public RecursiveIterator::getChildren ( void )
: RecursiveIterator
public RecursiveIterator::hasChildren ( void ) : bool
public RegexIterator::accept ( void ) : bool
public RegexIterator::getFlags ( void ) : int
public RegexIterator::getMode ( void ) : int
public RegexIterator::getPregFlags ( void ) : int
public RegexIterator::getRegex ( void ) : string
public RegexIterator::setFlags ( int $flags ) : void
public RegexIterator::setMode ( int $mode ) : void
public RegexIterator::setPregFlags ( int $preg_flags )
: void
}
```

**InfiniteIterator.**

El InfiniteIterator permite iterar infinitamente sobre un iterador sin necesidad de rebobinar, manualmente, cuando alcanza el fin. Sintaxis de la clase:

<img src="images/c2/4-7-48.png">


**LimitIterator.**

Esta clase permite iterar sobre un subconjunto limitado de elementos del iterador. Sintaxis de la clase:

<img src="images/c2/4-7-49.png">

**NoRewindIterator.**

Este iterador ignora las operaciones de rebobinado. Esto permite procesar un iterador en múltiples bucles foreach parciales. Sintaxis de la clase:

```php
NoRewindIterator extends IteratorIterator {
/* Methods */
public __construct ( Iterator $iterator )
public current ( void ) : mixed
public getInnerIterator ( void ) : iterator
public key ( void ) : mixed
public next ( void ) : void
public rewind ( void ) : void
public valid ( void ) : bool
/* Inherited methods */
public IteratorIterator::__construct ( Traversable $iterato
r )
public IteratorIterator::current ( void ) : mixed
public IteratorIterator::getInnerIterator ( void )
: Traversable
public IteratorIterator::key ( void ) : mixed
public IteratorIterator::next ( void ) : void
public IteratorIterator::rewind ( void ) : void
public IteratorIterator::valid ( void ) : bool
}
```

##### Multipleiterator

Un iterador que itera secuencialmente sobre todos los iteradores adjuntos. Sintaxis de la clase:

<img src="images/c2/4-7-50.png">

##### Recursiveiteratoriterator

Es adecuado para recorrer iteradores recursivos. Sintaxis de clase:

```php
RecursiveIteratorIterator implements OuterIterator {
/*Constants */
const integer LEAVES_ONLY = 0 ;
const integer SELF_FIRST = 1 ;
const integer CHILD_FIRST = 2 ;
const integer CATCH_GET_CHILD = 16 ;
/*Methods */
public beginChildren ( void ) : void
public beginIteration ( void ) : void
public callGetChildren ( void ) : RecursiveIterator
public callHasChildren ( void ) : bool
public __construct ( Traversable $iterator [, int $mode =
RecursiveIteratorIterator::LEAVES_ONLY [, int $flags = 0 ]]
)
public current ( void ) : mixed
public endChildren ( void ) : void
public endIteration ( void ) : void
public getDepth ( void ) : int
public getInnerIterator ( void ) : iterator
public getMaxDepth ( void ) : mixed
public getSubIterator ([ int $level ] ) : RecursiveIterator
public key ( void ) : mixed
public next ( void ) : void
public nextElement ( void ) : void
public rewind ( void ) : void
public setMaxDepth ([ int $max_depth = -1 ] ) : void
public valid ( void ) : bool
/* Inherited methods */
public OuterIterator::getInnerIterator ( void ) : Iterator
}
```

* RecursiveTreeIterator.

   Permite iterar un RecursiveIterator generando un árbol gráfico ASCII. Sintaxis de la clase:

   ```php
   RecursiveTreeIterator extends RecursiveIteratorIterator implements OuterIterator {
   /*Inherited constants */
   const integer RecursiveIteratorIterator::LEAVES_ONLY = 0 ;
   const integer RecursiveIteratorIterator::SELF_FIRST = 1 ;
   const integer RecursiveIteratorIterator::CHILD_FIRST = 2 ;
   const integer RecursiveIteratorIterator::CATCH_GET_CHILD = 16 ;
   /*Constants */
   const integer BYPASS_CURRENT = 4 ;
   const integer BYPASS_KEY = 8 ;
   const integer PREFIX_LEFT = 0 ;
   const integer PREFIX_MID_HAS_NEXT = 1 ;
   const integer PREFIX_MID_LAST = 2 ;
   const integer PREFIX_END_HAS_NEXT = 3 ;
   const integer PREFIX_END_LAST = 4 ;
   const integer PREFIX_RIGHT = 5 ;
   /* Methods */
   public beginChildren ( void ) : void
   public beginIteration ( void ) : RecursiveIterator
   public callGetChildren ( void ) : RecursiveIterator
   public callHasChildren ( void ) : bool
   public __construct ( RecursiveIterator|IteratorAggregate $it [, int $flags =
   RecursiveTreeIterator::BYPASS_KEY [, int $cit_flags =
   CachingIterator::CATCH_GET_CHILD [, int $mode =
   RecursiveIteratorIterator::SELF_FIRST ]]] )
   public current ( void ) : string
   public endChildren ( void ) : void
   public endIteration ( void ) : void
   public getEntry ( void ) : string
   public getPostfix ( void ) : string
   public getPrefix ( void ) : string
   public key ( void ) : string
   public next ( void ) : void
   public nextElement ( void ) : void
   public rewind ( void ) : void
   public setPostfix ( string $postfix ) : void
   public setPrefixPart ( int $part , string $value ) : void
   public valid ( void ) : bool
   /* Inherited methods */
   public RecursiveIteratorIterator::beginChildren ( void ) : void
   public RecursiveIteratorIterator::beginIteration ( void ) : void
   public RecursiveIteratorIterator::callGetChildren ( void ) : RecursiveIterator
   public RecursiveIteratorIterator::callHasChildren ( void ) : bool
   public RecursiveIteratorIterator::__construct ( Traversable $iterator [, int $mode =
   RecursiveIteratorIterator::LEAVES_ONLY [, int $flags = 0 ]]
   )
   public RecursiveIteratorIterator::current ( void ) : mixed
   public RecursiveIteratorIterator::endChildren ( void ) : void
   public RecursiveIteratorIterator::endIteration ( void ) : void
   public RecursiveIteratorIterator::getDepth ( void ) : int
   public RecursiveIteratorIterator::getInnerIterator ( void ) : iterator
   public RecursiveIteratorIterator::getMaxDepth ( void ) : mixed
   public RecursiveIteratorIterator::getSubIterator ([ int $level ] ) : RecursiveIterator
   public RecursiveIteratorIterator::key ( void ) : mixed
   public RecursiveIteratorIterator::next ( void ) : void
   public RecursiveIteratorIterator::nextElement ( void ) : void
   public RecursiveIteratorIterator::rewind ( void ) : void
   public RecursiveIteratorIterator::setMaxDepth ([ int $max_depth = -1 ] ) : void
   public RecursiveIteratorIterator::valid ( void ) : bool
   }
   ```

##### Directoryiterator

Esta clase ofrece una interfaz simple para mostrar lo que contienen las carpetas del sistema de archivos. Sintaxis:

```php
DirectoryIterator extends SplFileInfo implements SeekableIt
erator {
/* Methods */
public __construct ( string $path )
public current ( void ) : DirectoryIterator
public getATime ( void ) : int
public getBasename ([ string $suffix ] ) : string
public getCTime ( void ) : int
public getExtension ( void ) : string
public getFilename ( void ) : string
public getGroup ( void ) : int
public getInode ( void ) : int
public getMTime ( void ) : int
public getOwner ( void ) : int
public getPath ( void ) : string
public getPathname ( void ) : string
public getPerms ( void ) : int
public getSize ( void ) : int
public getType ( void ) : string
public isDir ( void ) : bool
public isDot ( void ) : bool
public isExecutable ( void ) : bool
public isFile ( void ) : bool
public isLink ( void ) : bool
public isReadable ( void ) : bool
public isWritable ( void ) : bool
public key ( void ) : string
public next ( void ) : void
public rewind ( void ) : void
public seek ( int $position ) : void
public __toString ( void ) : string
public valid ( void ) : bool
}
```

* FileSystemIterator.

   Tal y cómo su nombre indica, itera sobre el sistema de ficheros. Sintaxis:

   ```php
   FilesystemIterator extends DirectoryIterator implements SeekableIterator {
   /*Constants */
   const integer CURRENT_AS_PATHNAME = 32 ;
   const integer CURRENT_AS_FILEINFO = 0 ;
   const integer CURRENT_AS_SELF = 16 ;
   const integer CURRENT_MODE_MASK = 240 ;
   const integer KEY_AS_PATHNAME = 0 ;
   const integer KEY_AS_FILENAME = 256 ;
   const integer FOLLOW_SYMLINKS = 512 ;
   const integer KEY_MODE_MASK = 3840 ;
   const integer NEW_CURRENT_AND_KEY = 256 ;
   const integer SKIP_DOTS = 4096 ;
   const integer UNIX_PATHS = 8192 ;
   /* Methods */
   public __construct ( string $path [, int $flags =
   FilesystemIterator::KEY_AS_PATHNAME |
   FilesystemIterator::CURRENT_AS_FILEINFO |
   FilesystemIterator::SKIP_DOTS ] )
   public current ( void ) : mixed
   public getFlags ( void ) : int
   public key ( void ) : string
   public next ( void ) : void
   public rewind ( void ) : void
   public setFlags ([ int $flags ] ) : void
   /* Inherited methods */
   public DirectoryIterator::current ( void ) : DirectoryIterator
   public DirectoryIterator::getATime ( void ) : int
   public DirectoryIterator::getBasename ([ string $suffix ] ) : string
   public DirectoryIterator::getCTime ( void ) : int
   public DirectoryIterator::getExtension ( void ) : string
   public DirectoryIterator::getFilename ( void ) : string
   public DirectoryIterator::getGroup ( void ) : int
   public DirectoryIterator::getInode ( void ) : int
   public DirectoryIterator::getMTime ( void ) : int
   public DirectoryIterator::getOwner ( void ) : int
   public DirectoryIterator::getPath ( void ) : string
   public DirectoryIterator::getPathname ( void ) : string
   public DirectoryIterator::getPerms ( void ) : int
   public DirectoryIterator::getSize ( void ) : int
   public DirectoryIterator::getType ( void ) : string
   public DirectoryIterator::isDir ( void ) : bool
   public DirectoryIterator::isDot ( void ) : bool
   public DirectoryIterator::isExecutable ( void ) : bool
   public DirectoryIterator::isFile ( void ) : bool
   public DirectoryIterator::isLink ( void ) : bool
   public DirectoryIterator::isReadable ( void ) : bool
   public DirectoryIterator::isWritable ( void ) : bool
   public DirectoryIterator::key ( void ) : string
   public DirectoryIterator::next ( void ) : void
   public DirectoryIterator::rewind ( void ) : void
   public DirectoryIterator::seek ( int $position ) : void
   public DirectoryIterator::__toString ( void ) : string
   public DirectoryIterator::valid ( void ) : bool
   }
   ```
   
* GlobIterator.

   Itera a través de un sistema de archivos de modo análogo a glob(). Sintaxis:

   ```php
   GlobIterator extends FilesystemIterator implements SeekableIterator , Countable {
   /* Inherited constants */
   const integer FilesystemIterator::CURRENT_AS_PATHNAME = 32 ;
   const integer FilesystemIterator::CURRENT_AS_FILEINFO = 0 ;
   const integer FilesystemIterator::CURRENT_AS_SELF = 16 ;
   const integer FilesystemIterator::CURRENT_MODE_MASK = 240 ;
   const integer FilesystemIterator::KEY_AS_PATHNAME = 0 ;
   const integer FilesystemIterator::KEY_AS_FILENAME = 256 ;
   const integer FilesystemIterator::FOLLOW_SYMLINKS = 512 ;
   const integer FilesystemIterator::KEY_MODE_MASK = 3840 ;
   const integer FilesystemIterator::NEW_CURRENT_AND_KEY = 256 ;
   const integer FilesystemIterator::SKIP_DOTS = 4096 ;
   const integer FilesystemIterator::UNIX_PATHS = 8192 ;
   /*Methods */
   public __construct ( string $pattern [, int $flags =
   FilesystemIterator::KEY_AS_PATHNAME |
   FilesystemIterator::CURRENT_AS_FILEINFO ] )
   public count ( void ) : int
   /* Inherited methods */
   public FilesystemIterator::__construct ( string $path [, int $flags = FilesystemIterator::KEY_AS_PATHNAME |
   FilesystemIterator::CURRENT_AS_FILEINFO |
   FilesystemIterator::SKIP_DOTS ] )
   public FilesystemIterator::current ( void ) : mixed
   public FilesystemIterator::getFlags ( void ) : int
   public FilesystemIterator::key ( void ) : string
   public FilesystemIterator::next ( void ) : void
   public FilesystemIterator::rewind ( void ) : void
   public FilesystemIterator::setFlags ([ int $flags ] ) : void
   }
   ```

* RecursiveDirectoryIterator.

   Proporciona una interfaz para iterar, recursivamente, sobre los directorios del sistema de archivos. Sintaxis de la clase:

   ```php
   RecursiveDirectoryIterator extends FilesystemIterator implements SeekableIterator ,RecursiveIterator {
   /* Inherited constants */
   const integer FilesystemIterator::CURRENT_AS_PATHNAME = 32 ;
   const integer FilesystemIterator::CURRENT_AS_FILEINFO = 0 ;
   const integer FilesystemIterator::CURRENT_AS_SELF = 16 ;
   const integer FilesystemIterator::CURRENT_MODE_MASK = 240 ;
   const integer FilesystemIterator::KEY_AS_PATHNAME = 0 ;
   const integer FilesystemIterator::KEY_AS_FILENAME = 256 ;
   const integer FilesystemIterator::FOLLOW_SYMLINKS = 512 ;
   const integer FilesystemIterator::KEY_MODE_MASK = 3840 ;
   const integer FilesystemIterator::NEW_CURRENT_AND_KEY = 256 ;
   const integer FilesystemIterator::SKIP_DOTS = 4096 ;
   const integer FilesystemIterator::UNIX_PATHS = 8192 ;
   /* Methods */
   public __construct ( string $path [, int $flags =
   FilesystemIterator::KEY_AS_PATHNAME |
   FilesystemIterator::CURRENT_AS_FILEINFO ] )
   public getChildren ( void ) : mixed
   public getSubPath ( void ) : string
   public getSubPathname ( void ) : string
   public hasChildren ([ bool $allow_links = FALSE ] ) : bool
   public key ( void ) : string
   public next ( void ) : void
   public rewind ( void ) : void
   /* Inherits */
   public FilesystemIterator::__construct ( string $path [, int $flags = FilesystemIterator::KEY_AS_PATHNAME |
   FilesystemIterator::CURRENT_AS_FILEINFO |
   FilesystemIterator::SKIP_DOTS ] )
   public FilesystemIterator::current ( void ) : mixed
   public FilesystemIterator::getFlags ( void ) : int
   public FilesystemIterator::key ( void ) : string
   public FilesystemIterator::next ( void ) : void
   public FilesystemIterator::rewind ( void ) : void
   public FilesystemIterator::setFlags ([ int $flags ] ) : void
   }
   ```

### 7.4 Librería estándar (ii)

Para continuar con la segunda parte de los elementos de la librería SPL, tenemos los siguientes aspectos a contemplar: 

* Interfaces 
* Clases de excepciones SPL 
* Funciones SPL 
* Manejo de Archivos 
* Clases e interfaces misceláneas de SPL 

#### 7.4.1 Interfaces

Pueden ser de varios tipos, a saber:

##### Countabler

Esta interfaz llamada countable, aporta que las clases que la implementan pueden emplear la función count (). Sintaxis de la interface:

<img src="images/c2/4-7-51.png">

##### OuterIterator

Una clase que implemente este interfaz, podrá iterar sobre iteradores. Sintaxis:

<img src="images/c2/4-7-52.png">

##### RecursiveIterator

Las clases que implementan RecursiveIterator se pueden usar para iterar recursivamente sobre iteradores. Sintaxis de la interface:

<img src="images/c2/4-7-53.png">

##### SeekableIterator

El iterador seekable se usa para localizar una posición determinada. Sintaxis:

<img src="images/c2/4-7-54.png">

##### SplObserver

Esta interfaz se usa junto con SplSubject para el patrón del diseño del observador. Sintaxis:

<img src="images/c2/4-7-55.png">

##### SplSubject

Esta interfaz se utiliza en conjunto con SplObserver, para así ejecutar la arquitectura de diseño del observador. Sintaxis:

<img src="images/c2/4-7-56.png">

<img src="images/c2/4-7-57.png">

[Video](https://www.youtube.com/watch?time_continue=1&v=vZr_5SK9Nps&feature=emb_logo)

#### 7.4.2 Clases de excepciones SPL

Las clases de excepciones SPL son: 

##### LogicException

Esta excepción representa un error en la secuencia del código. Excepciones como esta obligan a arreglar el código. Sintaxis de la excepción:

<img src="images/c2/4-7-58.png">

##### BadFunctionCallException

Se genera una excepción si una llamada devuelta señala a una función que no se encuentra definida o que no se hayan especificado los argumentos. Sintaxis de la excepción:

<img src="images/c2/4-7-59.png">

##### BadMethodCallException

Excepción lanzada cuando la retrollamada es referida a un procedimiento que no ha sido definido o, alternativamente, porque no existan algunos argumentos. Sintaxis:

<img src="images/c2/4-7-60.png">

##### DomainException

Se produce una excepción cuando un valor no está dentro del dominio válido de datos. Sintaxis:

<img src="images/c2/4-7-61.png">

##### InvalidArgumentException

Esta excepción se lanza si el argumento no coincide con el esperado. Sintaxis de la excepción:

<img src="images/c2/4-7-62.png">

##### LengthException

Esta excepción es lanzada si la longitud no es válida. Sintaxis de la excepción:

<img src="images/c2/4-7-63.png">

##### OutOfRangeException

Excepción lanzada cuando se solicita un índice no válido. Este tipo de excepciones surgen durante la compilación. Sintaxis de la excepción:

<img src="images/c2/4-7-64.png">

##### RuntimeException

Se produce este tipo de excepción cuando se genera un error que, únicamente, se encontrará en el momento de ejecución. Sintaxis de la excepción:

<img src="images/c2/4-7-65.png">

##### OutOfBoundsException

Excepción lanzada cuando el valor no es una clave válida. Surge con errores que son difíciles de detectar en tiempo de compilación. Sintaxis:

<img src="images/c2/4-7-66.png">

##### OverflowException

Excepción lanzada al añadir un elemento a un contenedor lleno. Sintaxis de la excepción:

<img src="images/c2/4-7-67.png">

##### RangeException

Excepción lanzada para referir errores de rango en el momento de la ejecución del programa. Probablemente, esto indica que ocurrió un error aritmético diferente de subdesbordamiento/ desbordamiento. Es similar a DomainException. Sintaxis:

<img src="images/c2/4-7-68.png">

##### UnderflowException

Se produce esta excepción, por ejemplo, cuando se intenta eliminar un elemento de un contenedor que previamente ya estaba vacio. Sintaxis de la excepción:

<img src="images/c2/4-7-69.png">

##### UnexpectedValueException

Excepción lanzada cuando un valor no coincide con un conjunto de valores. Normalmente ocurre cuando una función que llama a otra función y espera que el valor de retorno sea de un determinado tipo o valor, sin contemplar los errores aritméticos o relacionados con el búfer. Sintaxis de la excepción:

<img src="images/c2/4-7-70.png">

<img src="images/c2/4-7-71.png">

<img src="images/c2/4-7-72.png">

#### 7.4.3 Funciones SPL

Entre las funciones SPL, destacamos:

##### Class_implements

Recupera las interfaces ejecutadas por la clase o interfaz proporcionada. La función retorna un arreglo con los nombres de las interfaces que ejecutan las clases heredadas y sus superclases. Sintaxis:

<img src="images/c2/4-7-73.png">

##### Class_parents

Retorna las clases padre de la clase proporcionada. Esta función devuelve una matriz con el nombre de las superclases. Sintaxis:

<img src="images/c2/4-7-74.png">

##### Class_uses

Retorna los rasgos (traits) empleados por la clase proporcionada. Esta función retorna un arreglo con los nombres de los rasgos que utiliza la clase dada, sin incluir los rasgos de la superclase. Sintaxis:

<img src="images/c2/4-7-75.png">

##### Iterator_apply

Llama a una función para cada elemento en un iterador. Sintaxis:

<img src="images/c2/4-7-76.png">

##### Iterator_count

Cuenta los items en un iterador, pero con iterator_count() no se garantiza retener la posición actual del iterador. Sintaxis:

<img src="images/c2/4-7-77.png">

##### Iterator_to_array

Copia el iterador en una matriz. Sintaxis:

<img src="images/c2/4-7-78.png">

##### Spl_autoload_call

Prueba todas las funciones `__autoload()` registradas para cargar la clase solicitada. Se puede utilizar para buscar manualmente una clase o interfaz mediante las funciones `__autoload` registradas. Sintaxis:

<img src="images/c2/4-7-79.png">

##### Spl_autoload_extensions

Registra y devuelve las extensiones de un fichero por defecto para spl_autoload. Esta función podrá editar y confirmar las generalizaciones de ficheros que utilizará la función de retroceso integrada `__autoload() spl_autoload()`. Sintaxis:

<img src="images/c2/4-7-80.png">

##### Spl_autoload_functions

Devuelve todas las funciones `__autoload()` registradas. Sintaxis:

<img src="images/c2/4-7-81.png">

##### Spl_autoload_register

Insertar la función proporcionada como implementación de `__autoload()`. Si la cola está desactivada, ésta se activará.

Si el programa posee una función `__autoload()`, ella deberá estar en la cola `__autoload`, porque `spl_autoload_register()` sustituirá eficientemente la caché del motor de la función `__autoload()` con `spl_autoload()` o `spl_autoload_call()`.

Si se necesitan diversos procedimientos de carga automática, `spl_autoload_register()` lo admite. Esto lo consigue estableciendo una cola de procedimientos de carga automática que se recorren en el orden establecido. Sin embargo, `__autoload()` solo se puede definir una vez. Sintaxis:

<img src="images/c2/4-7-82.png">

##### Spl_autoload_unregister

Anula el registro de la función como implementación `__autoload()`, eliminándola de la cola de carga automática. Si la cola está activada y vacía, tras eliminar la función dada, la desactivará.

Cuando esta función hace que la cola se desactive, toda función `__autoload` que existiese, anteriormente, no se reactivará. Sintaxis:

<img src="images/c2/4-7-83.png">

##### Spl_autoload

Es la implementación por defecto para `__autoload()`. Se pretende que esta función se use como la implementación predeterminada para `__autoload()`. En caso de no especificar otra posibilidad y si se llama a `spl_autoload_register()` sin parámetros, entonces esta función se utilizará para cualquier llamada posterior a `__autoload()`. Sintaxis:

<img src="images/c2/4-7-84.png">

##### spl_classes

Esta función devuelve una matriz con las clases SPL disponibles actualmente. Sintaxis:

<img src="images/c2/4-7-85.png">

##### spl_object_hash

Devuelve el ID de hash para el objeto dado. Este procedimiento retorna un único identificador para la instancia. Este identificador se podrá emplear como se utilizan las claves hash para recopilar instancias o también reconocer un objeto, mientras que la instancia no sea destruida. Ya, cuando el objeto es destruido, su clave hash podrá ser utilizada para otros objetos. Sintaxis:

<img src="images/c2/4-7-86.png">

##### spl_object_id

Devuelve el identificador de objeto entero para el objeto dado. Esta función devuelve un identificador único para el objeto. La identificación del objeto es única para el ciclo de vida del objeto. Una vez que la instancia se destruye, su id puede utilizarse para otros objetos. Este comportamiento es similar a spl_object_hash(). Sintaxis:

<img src="images/c2/4-7-87.png">

#### 7.4.4 Manejo de Archivos

SPL proporciona una serie de clases para trabajar con archivos. A continuación, presentaremos cada una de ellas: 

##### SplFileInfo

Esta clase proporciona una interfaz orientada a objetos para la información de alto nivel de un archivo individual. Sintaxis:

```php
SplFileInfo {
/* Methods */
public __construct ( string $file_name )
public getATime ( void ) : int
public getBasename ([ string $suffix ] ) : string
public getCTime ( void ) : int
public getExtension ( void ) : string
public getFileInfo ([ string $class_name ] ) : SplFileInfo
public getFilename ( void ) : string
public getGroup ( void ) : int
public getInode ( void ) : int
public getLinkTarget ( void ) : string
public getMTime ( void ) : int
public getOwner ( void ) : int
public getPath ( void ) : string
public getPathInfo ([ string $class_name ] ) : SplFileInfo
public getPathname ( void ) : string
public getPerms ( void ) : int
public getRealPath ( void ) : string
public getSize ( void ) : int
public getType ( void ) : string
public isDir ( void ) : bool
public isExecutable ( void ) : bool
public isFile ( void ) : bool
public isLink ( void ) : bool
public isReadable ( void ) : bool
public isWritable ( void ) : bool
public openFile ([ string $open_mode =
"r" [, bool $use_include_path = FALSE [, resource$context =
NULL ]]] ) : SplFileObject
public setFileClass ([ string $class_name =
"SplFileObject" ] ) : void
public setInfoClass ([ string $class_name = "SplFileInfo" ]
) : void
public __toString ( void ) : string
}
```

##### SplFileObject

La clase SplFileObject proporciona una interfaz orientada a objetos para un archivo. Sintaxis:

```php
SplFileObject extends SplFileInfo implements RecursiveItera
tor , SeekableIterator {
/*Constants */
const integer DROP_NEW_LINE = 1 ;
const integer READ_AHEAD = 2 ;
const integer SKIP_EMPTY = 4 ;
const integer READ_CSV = 8 ;
/*Methods */
public __construct ( string $filename [, string $open_mode
=
"r" [, bool $use_include_path = FALSE [, resource $context
]]] )
public current ( void ) : string|array
public eof ( void ) : bool
public fflush ( void ) : bool
public fgetc ( void ) : string
public fgetcsv ([ string $delimiter =
"," [, string $enclosure = "\"" [, string $escape =
"\\" ]]] ) : array
public fgets ( void ) : string
public fgetss ([ string $allowable_tags ] ) : string
public flock ( int $operation [, int &$wouldblock ] )
: bool
public fpassthru ( void ) : int
public fputcsv ( array $fields [, string $delimiter =
"," [, string $enclosure = '"' [, string $escape = "\\" ]]]
) : int
public fread ( int $length ) : string
public fscanf ( string $format [, mixed &$... ] ) : mixed
public fseek ( int $offset [, int $whence = SEEK_SET ] )
: int
public fstat ( void ) : array
public ftell ( void ) : int
public ftruncate ( int $size ) : bool
public fwrite ( string $str [, int $length ] ) : int
public getChildren ( void ) : void
public getCsvControl ( void ) : array
public getFlags ( void ) : int
public getMaxLineLen ( void ) : int
public hasChildren ( void ) : bool
public key ( void ) : int
public next ( void ) : void
public rewind ( void ) : void
public seek ( int $line_pos ) : void
public setCsvControl ([ string $delimiter =
"," [, string $enclosure = "\"" [, string$escape = "\\" ]]]
) : void
public setFlags ( int $flags ) : void
public setMaxLineLen ( int $max_len ) : void
public valid ( void ) : bool
/* Inherited methods */
public SplFileInfo::getATime ( void ) : int
public SplFileInfo::getBasename ([ string $suffix ] )
: string
public SplFileInfo::getCTime ( void ) : int
public SplFileInfo::getExtension ( void ) : string
public SplFileInfo::getFileInfo ([ string $class_name ] )
: SplFileInfo
public SplFileInfo::getFilename ( void ) : string
public SplFileInfo::getGroup ( void ) : int
public SplFileInfo::getInode ( void ) : int
public SplFileInfo::getLinkTarget ( void ) : string
public SplFileInfo::getMTime ( void ) : int
public SplFileInfo::getOwner ( void ) : int
public SplFileInfo::getPath ( void ) : string
public SplFileInfo::getPathInfo ([ string $class_name ] )
: SplFileInfo
public SplFileInfo::getPathname ( void ) : string
public SplFileInfo::getPerms ( void ) : int
public SplFileInfo::getRealPath ( void ) : string
public SplFileInfo::getSize ( void ) : int
public SplFileInfo::getType ( void ) : string
public SplFileInfo::isDir ( void ) : bool
public SplFileInfo::isExecutable ( void ) : bool
public SplFileInfo::isFile ( void ) : bool
public SplFileInfo::isLink ( void ) : bool
public SplFileInfo::isReadable ( void ) : bool
public SplFileInfo::isWritable ( void ) : bool
public SplFileInfo::openFile ([ string $open_mode =
"r" [, bool $use_include_path = FALSE [, resource $context
= NULL ]]] ) : SplFileObject
public SplFileInfo::setFileClass ([ string $class_name =
"SplFileObject" ] ) : void
public SplFileInfo::setInfoClass ([ string $class_name =
"SplFileInfo" ] ) : void
public SplFileInfo::__toString ( void ) : string
}
```

##### SplTempfileObject

La clase SplTempFileObject proporciona una interfaz orientada a objetos para un archivo temporal. Sintaxis:

```php
SplTempFileObject extends SplFileObject implements Seekable
Iterator , RecursiveIterator {
/*Inherited constants */
const integer SplFileObject::DROP_NEW_LINE = 1 ;
const integer SplFileObject::READ_AHEAD = 2 ;
const integer SplFileObject::SKIP_EMPTY = 4 ;
const integer SplFileObject::READ_CSV = 8 ;
/* Methods */
public __construct ([ int $max_memory ] )
/*Inherited methods */
public SplFileObject::current ( void ) : string|array
public SplFileObject::eof ( void ) : bool
public SplFileObject::fflush ( void ) : bool
public SplFileObject::fgetc ( void ) : string
public SplFileObject::fgetcsv ([ string $delimiter =
"," [, string $enclosure = "\"" [, string $escape =
"\\" ]]] ) : array
public SplFileObject::fgets ( void ) : string
public SplFileObject::fgetss ([ string $allowable_tags ] )
: string
public SplFileObject::flock ( int $operation [, int &$would
block ] ) : bool
public SplFileObject::fpassthru ( void ) : int
public SplFileObject::fputcsv ( array $fields [, string $de
limiter = "," [, string$enclosure = '"' [, string $escape =
"\\" ]]] ) : int
public SplFileObject::fread ( int $length ) : string
public SplFileObject::fscanf ( string $format [, mixed &$..
. ] ) : mixed
public SplFileObject::fseek ( int $offset [, int $whence =
SEEK_SET ] ) : int
public SplFileObject::fstat ( void ) : array
public SplFileObject::ftell ( void ) : int
public SplFileObject::ftruncate ( int $size ) : bool
public SplFileObject::fwrite ( string $str [, int $length ]
) : int
public SplFileObject::getChildren ( void ) : void
public SplFileObject::getCsvControl ( void ) : array
public SplFileObject::getFlags ( void ) : int
public SplFileObject::getMaxLineLen ( void ) : int
public SplFileObject::hasChildren ( void ) : bool
public SplFileObject::key ( void ) : int
public SplFileObject::next ( void ) : void
public SplFileObject::rewind ( void ) : void
public SplFileObject::seek ( int $line_pos ) : void
public SplFileObject::setCsvControl ([ string $delimiter =
"," [, string $enclosure = "\""[, string $escape = "\\" ]]]
) : void
public SplFileObject::setFlags ( int $flags ) : void
public SplFileObject::setMaxLineLen ( int $max_len ) : void
public SplFileObject::valid ( void ) : bool
}
```

#### 7.4.5 Clases e interfaves misceláneas de SPL

Las Clases e interfaces que no encajan en las otras categorías de la librería SPL: **ArrayObject**

Esta clase habilita que los objetos funcionen como arreglos. Sintaxis de la clase: 

```php
ArrayObject implements IteratorAggregate , ArrayAccess , Se
rializable , Countable {
/* Constants */
const integer STD_PROP_LIST = 1 ;
const integer ARRAY_AS_PROPS = 2 ;
/* Methods */
public __construct ([ mixed $input =
array() [, int $flags = 0 [, string $iterator_class =
"ArrayIterator" ]]] )
public append ( mixed $value ) : void
public asort ( void ) : void
public count ( void ) : int
public exchangeArray ( mixed $input ) : array
public getArrayCopy ( void ) : array
public getFlags ( void ) : int
public getIterator ( void ) : ArrayIterator
public getIteratorClass ( void ) : string
public ksort ( void ) : void
public natcasesort ( void ) : void
public natsort ( void ) : void
public offsetExists ( mixed $index ) : bool
public offsetGet ( mixed $index ) : mixed
public offsetSet ( mixed $index , mixed $newval ) : void
public offsetUnset ( mixed $index ) : void
public serialize ( void ) : string
public setFlags ( int $flags ) : void
public setIteratorClass ( string $iterator_class ) : void
public uasort ( callable $cmp_function ) : void
public uksort ( callable $cmp_function ) : void
public unserialize ( string $serialized ) : void
}
```

### 7.5 La programación orientada a objetos

El paradigma de programación orientada a objetos (POO) es la técnica por medio de la cual, es posible utilizar objetos y/o interacciones para poder construir un sistema.  

A continuación, presentamos los elementos que la componen: 

**Clase:**

Podemos definirla como el patrón empleado para la construcción de objetos que poseen características comunes, tales como: identidad, propiedades y métodos. 

**Objeto:**

Es una instancia de métodos (operaciones), atributos, y propiedades (identidad), cuya clase lo representa. 

#### Ejemplo práctico

A continuación, encontrarás un ejemplo práctico sobre la programación orientada a objetos: 

[Ejemplo práctico](/pdf/Ejemplo_practico_7.5.pdf)

El paradigma de la POO, posee una gama de propiedades que presentamos a continuación: 

####  Abstracción

Son las propiedades abstractas y esenciales de una instancia o de una clase, para hacerla más general. Y de esta forma, poder mantenerla aislada de su entorno. 

### Polimorfismo

El carbono existe en la naturaleza en diferentes formas, incluyendo los diamantes más duros y el grafito más suave. En química y geología el fenómeno de la misma sustancia (carbón) que existe en diferentes formas se llama “polimorfismo”, el cual, es un término formado por dos palabras griegas que significan “muchas formas”. En POO el polimorfismo se emplea para describir un fenómeno similar, dónde se tiene la posibilidad de disponer métodos, atributos y propiedades que poseen el mismo nombre, pero que pueden hacer tareas diferentes, sin que difiera uno del otro. 

#### Herencia

Es una característica requerida de la orientación a objetos. La herencia involucra dos clases, una propiedad o un método declarado en la clase de mayor jerarquía que se heredará en las demás clases de menor jerarquía. Sin embargo, un atributo u operación declarado en alguna de las clases de menor jerarquía o nivel inferior será exclusivo de la clase específica. El término herencia se refiere a la relación de arriba hacia abajo. Esto gráficamente lo podemos observar en la imagen siguiente: 

<img src="images/c2/4-7-88.png">

#### Ocultamiento de la información

Es la manera de incrementar la facilidad de mantenimiento del sistema, al volver invisibles los detalles de la implementación fuera de un objeto. El ocultamiento de la información puede lograrse usando atributos privados. Cuando un atributo se declara privado, puede accederse al mismo sólo a través de la parte interna de la clase en la cual se declara. 

### Modularidad

En POO, la modularidad trata de separar o dividir un sistema en módulos o partes, para que éstos sean independientes entre sí y a su vez puedan ser reutilizados. Es una manera de minimizar el tiempo y aprovechar los recursos.  

La POO posee una serie de ventajas, que a continuación detallamos: 

* Promueve la reutilización y expansión de código. 
* Da la posibilidad de desarrollar sistemas con mayor nivel de complejidad. 
* Permite relacionar el sistema con el mundo real. 
* Hace más sencillo el diseño de interfaces gráficas. 
* Facilita la construcción de prototipos. 
* Agiliza el desarrollo de aplicaciones. 
* Promueve y facilita el trabajo multidisciplinar. 
* Ayuda eficientemente a mantener adecuadamente el software.  

En síntesis, la POO es similar a la manera en que las personas piensan cómo resolver problemas en la vida real. 

### 7.6 La orientación a objetos en php7

La versión de PHP que introdujo los aspectos básicos de la programación orientada a objetos (POO) fue la número 3. Aunque utilizable, el soporte fue extremadamente simplista y no mejoró mucho con el lanzamiento de PHP 4, dónde la compatibilidad con versiones anteriores fue la principal preocupación. Debido a la demanda del mercado de un soporte mejorado para la POO, todo el modelo de objetos fue completamente rediseñado para PHP 5, introduciendo una gran cantidad de características y cambios en el comportamiento del “objeto” base en sí mismo. 

**Aspectos principales**

Los aspectos principales que veremos en este apartado son: 

* Los fundamentos del modelo de OO. 
* Creación de objetos y tiempo de vida y cómo se controla. 
* Las palabras clave principales de restricción de acceso, que son tres (público, protegido, y privado) 
* Los beneficios de usar herencia de clase 

#### 7.6.1 Objetos

<img src="images/c2/4-7-89.png">

La diferencia principal en la POO, en oposición a la programación funcional, tiene que ver con que los datos y el código se agrupan en una sola entidad, que se denomina como objeto. Los desarrollos orientados a objetos generalmente se dividen en una serie de objetos que interactúan entre sí. Cada objeto suele ser una entidad del problema, que es independiente y tiene multitud de propiedades y métodos. Las propiedades son las de los datos de los objetos, que fundamentalmente se refieren a las variables que pertenecen al objeto. Los métodos son básicamente las funciones que soporta el objeto. Además, la funcionalidad que está destinada a otros objetos, para ser accedida y utilizada durante la interacción, es llamada mediante una interfaz.  

La siguiente imagen representa una clase. Una clase es una plantilla para un objeto y describe qué métodos y propiedades tendrá un objeto de ese tipo. En el presente ejemplo, la clase representa a una persona. Para cada persona en su momento, es posible hacer una instancia separada de esa clase que represente la información de la persona concreta. Por ejemplo, para dos personas en nuestra aplicación que se llaman Juan y Juana, crearíamos dos instancias separadas de esa clase y llamaríamos al método escogerNombre(). Este método es de cada persona, para inicializar la variable nombre de la persona, $nombre.  

Los objetos que se pueden usar son un contrato de clase. En este ejemplo, los contratos de la persona son los dos conjuntos de nombres y los métodos escogerNombre() y obtenerNombre(). 

#### Ejemplo práctico

A continuación, encontrarás un ejemplo práctico sobre lo que acabamos de estudiar: 

[Ejemplo práctico](Ejemplo_practico_7.6.1.pdf)

#### 7.6.2 Declarando una clase

Cómo has observado en el ejemplo anterior, declarar una clase (una plantilla de objeto) es simple. Utilizamos la palabra clave class, damos un nombre a la clase y enumeramos todos los métodos y propiedades que una instancia de esta clase debe tener: 

<img src="images/c2/4-7-90.png">

También, hemos podido comprobar que, frente a la declaración de la propiedad $nombre, usamos el método private para ella. Explicaremos esta palabra clave en detalle más adelante, pero básicamente significa que, sólo las operaciones de esta clase, permiten el ingreso al atributo $nombre. Obliga a cualquier persona que quiera obtener o configurar esta propiedad a usar los métodos obtenerNombre() y escogerNombre(), que son los que representan la interfaz de la clase para el uso desde otros objetos o código fuente. 

#### 7.6.3 Las palabras y sus contructores

Los objetos que se crean a partir de las clases utilizan la palabra reservada new. En el ejemplo presentado anteriormente, generamos una instancia nueva de la clase Persona usando $juana = new persona(). Lo qué sucede durante la llamada a new, es que una nueva instancia se asigna con sus propios atributos, de las propiedades definidas en su clase y luego el constructor del objeto se llama, en caso de que se haya definido uno. El constructor es un método llamado `__construct()`, el cuál es invocado, automáticamente, por las palabra clave new después de crear el objeto. En la mayoría de los casos, se emplea para realizar automáticamente varias inicializaciones, como, por ejemplo, las inicializaciones de propiedades. Los constructores también pueden aceptar argumentos, en cuyo caso, cuando la palabra clave new es declarada, también es necesario enviar al constructor los parámetros de la función entre paréntesis. 

##### ¿Sabías que...?

Debido a que un constructor no puede devolver un valor, la práctica más común para generar un error dentro del constructor es lanzar una excepción. 

##### Ejemplo práctico

A continuación, encontrarás un ejemplo práctico sobre las claves y sus contructores: 

[Ejemplo práctico](/pdf/Ejemplo_practico_7.6.3.pdf)

#### 7.6.4 Destructores

Las funciones destructoras son lo contrario de los constructores. Se llaman cuando el objeto está siendo destruido (por ejemplo, cuando no hay más referencias al objeto). Como PHP se asegura de que los recursos sean liberados al finalizar cada solicitud, la importancia de los destructores es limitada. Sin embargo, todavía pueden ser útiles para realizar ciertas acciones, como vaciar un recurso o registrar información sobre la destrucción de objetos. Hay dos momentos donde se puede invocar al destructor: en el momento de la ejecución de su código, que es cuando las referencias a un objeto se destruyen, o en el momento que se finaliza el código y PHP termina la solicitud. La última situación es delicada, porque confías en algunos objetos que ya podrían haber tenido sus destructores llamados y no son accesibles. Por lo tanto, hay que utilizarlo con cuidado y no confiar en los destructores de otros objetos.  

Definir un destructor es tan simple como agregar un método `__destruct()` para cada clase: 

<img src="images/c2/4-7-91.png">

En esta sintaxis, cuando `$obj = NULL` se cumple, el único objeto se destruye, y, por lo tanto, se llama el destructor y el objeto de modo definitivo queda destruido.  

#### 7.6.5 Propiedades públicas, privadas y protegidas

Durante la ejecución del método de un objeto, una variable especial llamada $this es definida automáticamente, lo que denota una referencia al propio objeto. Mediante el uso de esta variable y la notación -&gt;, los métodos y propiedades del objeto pueden ser referenciados más adelante. Por ejemplo, puedes acceder a la propiedad $nombre usando $this-&gt; nombre (tengamos presente que no se usa $ previo al nombre del atributo). Es posible acceder a los procedimientos de las instancias de la misma forma. Por ejemplo, en el interior de uno de los procedimientos de la persona, puedes llamar a obtenerNombre() escribiendo $this-&gt; obtenerNombre().  

Un paradigma clave en POO es la encapsulación y la seguridad de acceso a los atributos de la instancia (también conocidos como variables miembro). Los lenguajes OO más comunes tienen tres principales palabras clave para establecer una restricción de acceso: público, protegido y privado.  

Al definir un objeto de la clase, cuando se crea la misma, el desarrollador debe especificar al menos uno de los modificadores de acceso previamente a declarar al miembro. Si estás familiarizado con la arquitectura de objetos de PHP 3 o 4, recordarás que, en todas las clases los miembros se definieron con la palabra reservada var, que es similar a public. 

[Ejemplo práctico]

Este ejemplo es para demostrar el uso de los modificadores de acceso.

<img src="images/c2/4-7-92.png">

A continuación, las definiciones de cada modificador de acceso:

**Public**

Es posible acceder a los objetos públicos desde fuera del objeto usando $obj-&gt; publicMiembro y accediendo desde dentro de miMetodo, por medio de la variable especial $this (por ejemplo, $ this-&gt; publicMiembro). Si otra clase hereda de una clase pública, se aplican las mismas normas y es posible acceder desde fuera de las instancias de la superclase y desde dentro de sus métodos. 

**Protected**

Se puede acceder a los miembros protegidos solo desde el procedimiento de la instancia. Un ejemplo puede ser, $this-&gt; protectedMiembro. Si otra clase hereda un miembro protegido, se aplican las mismas reglas y será posible acceder desde el interior de los procedimientos del objeto derivado a través de la variable especial $this. 

**Private**

Los miembros privados son similares a los miembros protegidos, porque sólo se puede acceder desde el método de un objeto. Sin embargo, son también inaccesibles desde los métodos de un objeto derivado, porque las propiedades privadas no son visibles para las clases heredadas. Dos clases relacionadas pueden declarar las mismas propiedades privadas, pero cada clase verá su propio método privado. 

#### 7.6.6 Métodos públicos, privados y protegidos

Los modificadores de acceso también pueden usarse junto con los métodos del objeto y las reglas son las mismas:  

**Public**

Los procedimientos públicos (public) es posible que sean llamados desde cualquier ámbito. 

**Protected**

Los procedimientos protegidos (protected) solo es posible llamarlos desde uno de sus procedimientos de clase o desde el interior de una clase hereditaria. 

**Private**

Los procedimientos privados (private) solo se pueden llamar desde uno de sus métodos de clase y no de una clase hereditaria. Como con los atributos, los procedimientos privados pueden ser redeclarados al heredar clases. Cada clase verá su propia versión del método. 

#### Para saber más...

Cuando no se proporciona un modificador de acceso a un método, se utiliza público por defecto. 

#### Ejemplo práctico

A continuación, encontrarás un ejemplo práctico sobre los métodos públicos, privados y protegidos: 

[Ejemplo práctico](/pdf/Ejemplo_practico_7.6.6.pdf)

#### 7.6.7 Polimorfismo

El tema del polimorfismo es probablemente el más importante en la programación OO. Utilizando las clases y la herencia se facilita describir una situación de la vida real, en oposición a una colección de funciones y datos de la programación más tradicional. También hace mucho más fácil el escalar los proyectos mediante la reutilización de código principalmente a través de la herencia. Además, escribir código robusto y extensible, generalmente obliga a tener el menor control de flujo posible en las declaraciones (como declaraciones if ()). El polimorfismo da respuesta a todas estas necesidades y más. 

Consideremos el siguiente ejemplo: 

[Ejemplo](/pdf/Codigo_7.6.7-1.pdf)

Se puede ver fácilmente que este ejemplo no es extensible. Por ejemplo, si quisieses extenderlo para agregar los sonidos de tres animales más, tendrías que agregar otros tres bloques if extra imprimirElSonido () para verificar que el objeto que tienes es una instancia de uno de esos nuevos animales y luego tendrías que agregar el código para llamar a cada método de sonido.  

El polimorfismo que usa la herencia resuelve este problema. Te permite heredar de una clase padre todos sus métodos y propiedades y por lo tanto, crear una relación is-a entre ellos. Is-a se puede traducir como una relación del tipo “es un” o “es una”. 

Tomando el ejemplo anterior, crearemos una nueva clase llamada Animal de la que heredarán todos los demás tipos de animales, creando así relaciones is-a desde los tipos específicos, como el perro, hasta el animal padre (o ancestro).  

La herencia se realiza usando la palabra clave extend: 

[Ejemplo (no existe)]()

Puedes ver que con este enfoque que no importa cuántos tipos de animales añadamos a este ejemplo, que no tendremos que hacer ningún cambio en imprimirElSonido(), porque la instancia de Animal los cubre a todos, y la llamada $obj-&gt; hacerSonido() también lo hará. 

#### 7.6.8 Métodos Abstractos

Al diseñar jerarquías de clases, es posible que se desee declarar un método, pero no implementarlo. Supongamos el siguiente ejemplo, que tiene las clases que presentan la jerarquía cómo se muestra en la imagen siguiente: 

<img src="images/c2/4-7-93.png">

Puede tener sentido implementar obtenerCentro ($x, $y) en la clase Forma y dejar la implementación de los métodos dibujar() a las clases concretas Cuadrado y Círculo. Para ello, se tendría que declarar el método dibujar() como un “resumen” del método para que PHP sepa que, intencionalmente, no lo estamos implementando en la clase Forma. La clase Forma se denominará clase abstracta, lo que significa que no es la funcionalidad completa de la clase y solo debe ser heredada.  

No es posible instanciar una clase abstracta. Puedes definir cualquier cantidad de métodos como abstractos, pero una vez que, al menos, un método de una clase se define como abstracto, toda la clase también debe declararse como abstracta. Esta doble definición da la opción de definir un resumen de clase, incluso si no tiene ningún método abstracto.  

El diagrama de clase anterior se traduciría en código PHP similar al siguiente: 

[Ejemplo (no existe)]()

Se puede ver que el método abstracto dibujar() no contiene ningún código.

##### Ejemplo práctico

A continuación, encontrar un ejemplo para entender mejor la definición de los métodos abstractos:  

[Ejemplo práctico](/pdf/Ejemplopractico_7.6.8.pdf)

#### 7.6.9 Interfaces

La herencia de clase permite describir una relación padre-hijo entre clases. Por ejemplo, podemos tener una clase base Forma desde la cual, derivan tanto el cuadrado como el círculo. Sin embargo, a menudo es posible que deseemos añadir más "Interfaces" a las clases, que básicamente significa contratos adicionales a los cuales la clase debe adherirse.   

PHP utiliza interfaces como alternativa a múltiples herencias, que le permite especificar contratos adicionales que una clase debe seguir. Una interfaz se declara similar a una clase, pero solo incluye la función prototipos (sin implementación) y constantes. Cualquier clase que "implemente" esta interfaz tiene definidas automáticamente las constantes de la interfaz. Como clase implementadora necesita proporcionar las definiciones de funciones de la interfaz, que son todos métodos abstractos.  

Para implementar una interfaz, usamos la siguiente sintaxis: 

<img src="images/c2/4-7-94.png">

### 7.7 MYSQL

MySQL y PHP van de la mano, de forma generalizada desde hace mucho tiempo, a la hora de realizar desarrollos web de todo tipo. Es la combinación que es más probable que encuentres hoy y seguramente en los años venideros en tu entorno de trabajo. En consecuencia, esta es también la primera base de datos que debemos aprender a utilizar.  

Una de las características más claras de MySQL, que lo diferencia de otros servidores de base de datos, tiene que ver con el número enorme de opciones que están a disponibles. Desde el punto de vista del servidor, la configuración predeterminada admite muchos cambios para que su funcionamiento sea adecuado en la mayoría de las plataformas hardware. Desde el punto de vista de la construcción de aplicaciones, MySQL proporciona multitud de tipos de datos que podemos seleccionar al crear las tablas para almacenar registros. 

#### 7.7.1 Arquitectura de MySQL

En la figura siguiente presentamos la interfaz general de la lógica de MySQL. No pretende representar la implementación de bajo nivel, que necesariamente es más compleja y menos clara. No obstante, sirve de guía para entender cómo funciona el almacenamiento de MySQL por medio de sus motores.  

La capa superior se compone de los servicios que no son exclusivos de MySQL. Se trata de servicios que necesitan la gran parte de los servidores y herramientas basadas en red, de arquitectura cliente / servidor: seguridad, autenticación, administración de conexiones, etc.   

En la segunda capa reside la inteligencia de MySQL, como es el caso del análisis sintáctico, la evaluación y optimización de sentencias, almacenamiento para su posterior reutilización y todas las funciones internas al sistema. La parte funcional, que también es similar a otros motores de almacenamiento, se encuentra igualmente en esta capa.  

La tercera capa está formada por los motores de almacenamiento. Son los responsables del almacenamiento y posterior recuperación de los datos que se guardan en MySQL. 

<img src="images/c2/4-7-95.png">

*vista lógica de la arquitectura MySQL*

#### 7.7.2 Operaciones principales con las tablas de MYSQL

Las principales operaciones con las tablas de MYSQL son:

##### Select

Cuando se seleccionan registros de una tabla, el servidor debe examinar cada fila para asegurarse de que cumple con las siguientes restricciones:

* Su identificador de creación debe ser menor o igual al número de versión del sistema. De este modo, se asegura que la fila fue creada antes de que comenzara la consulta.

* El identificador de borrado, si su valor no es nulo, debe ser mayor que el actual número de versión del sistema, con lo que garantiza que la fila no se ha borrado antes que se iniciara la consulta.

* Su identificador de creación no puede estar incluido en la lista de consultas en curso, para garantizar que la fila no se ha añadido o modificado por una consulta que aún está en ejecución.

* Las filas que pasan estos filtros son devueltas como resultado de la consulta.

##### Insert

Cuando se añade una fila a una tabla, el servidor que almacena la base de datos registra junto a ella el número actual de versión del sistema en el atributo identificador de creación.

##### Delete

Para borrar una fila, el servidor registra el número de versión del sistema en el identificador de borrado.

##### Update

Cuando se modifica una fila, el servidor crea una nueva copia de la fila, usando el número de versión actual como identificador de creación de la nueva fila y, a su vez, como identificador de borrado de la fila antigua.

#### 7.7.3 Interfaces con PHP

La extensión MySQL incluye lo siguiente: 

* Funcionalidad nativa de enlace / preparación / ejecución 
* Soporte del cursor 
* SQLSTATE 
* Códigos de error 
* Múltiples declaraciones de una consulta 
* Analizador de índice  

En las siguientes secciones, se presenta una descripción general de cómo usar la extensión MySQLi y en qué se diferencia de la antigua extensión MySQL. Casi todas las funciones MySQLi tienen un método o contraparte de propiedad y la siguiente lista de funciones describe ambas. La notación para los métodos es similar a $mysqli-&gt; connect () para métodos regulares, llamando connect() en una instancia de la clase MySQLi.  

La lista de parámetros suele ser la misma de los procedimientos y los métodos de MySQLi, excepto que las funciones en la gran parte de los casos tienen un argumento de objeto. Después de eso, las listas de parámetros de funciones son idénticas a las de su método. 

#### 7.7.4 Conexiones

La tabla, que aparece a continuación, muestra las funciones que están relacionadas con las conexiones MySQLi. 

<img src="images/c2/4-7-95.png">

*Funciones de conexiones MySQLi*

##### Ejemplo práctico

A continuación, encontrarás un ejemplo práctico sobre la teoría que acabamos de estudiar: 

<img src="images/c2/4-7-96.png">

[Ejemplo práctico](/pdf/Ejemplo_practico_7.7.4.pdf)

#### 7.7.5 Consultas

En esta sección se describen las funciones y métodos para ejecutar consultas, como podrás ver en la tabla.  

La función mysqli_query () nos devuelve una instancia de un grupo de resultados. En caso de fallo, se usa la función mysqli_error () o la propiedad $conn-&gt; error para determinar la causa del error: 

<img src="images/c2/4-7-97.png">

#### 7.7.6 Modos de obteción de resultados

Hay tres formas de obtener resultados, como en la antigua extensión MySQL: como un arreglo multidimensional enumerado, como un arreglo multidimensional asociativo o como un objeto (ver Tabla). 

<img src="images/c2/4-7-98.png">

<img src="images/c2/4-7-99.png">

<img src="images/c2/4-7-100.png">

### 7.8 SQLITE y XML

En el momento que apareció PHP 5 se introdujo un nuevo paquete y, por defecto, el sistema de gestión de base de datos disponible era SQLite. 

<img src="images/c2/4-7-101.png">

#### 7.8.1 Fortalezas y debilidades de SQLite1

Esta sección describe las características de SQLite en comparación con otros sistemas gestores de bases de datos: 

FORTALEZAS: 

* Es autónomo, por lo que no se requiere de servidor (SQLite no utiliza un modelo cliente / servidor). Está incrustado en cada aplicación y solo requiere acceso a los ficheros de la base de datos. Esto hace que la integración de SQLite en otras aplicaciones sea más fácil, porque no hay dependencia de un servicio externo. 

* Es fácil de iniciar la configuración de una base de datos nueva. Con SQLite este proceso es extremadamente sencillo y no necesita intervención de los administradores del sistema. 

* El motor SQLite ya está a disposición en el paquete de PHP, desde el lanzamiento de PHP 5. No es necesario instalar paquetes adicionales para que esté disponible.  

* Es una de las bases de datos más ligeras y rápidas porque SQLite tiene poco peso y un diseño muy eficiente. La gran parte de las consultas realizadas a este motor de base de datos están a la par o incluso supera el rendimiento de MySQL. 

* El motor SQLite tiene una interfaz adecuada para PHP, incluyendo soporte orientado a objetos, cosa que hace posible reducir la cantidad de código. 

DEBILIDADES: 

* Al no contar con un servidor propio, lo que es una fortaleza también se puede volver una debilidad. Es decir, aunque este es uno de los puntos fuertes de SQLite puede provocar una variedad de conflictos y problemas a la hora de escalar: bloqueo de archivos y problemas de concurrencia, falta de consulta persistente de las cachés y problemas de crecimiento al manejar volúmenes de datos muy grandes. Además, la única forma de compartir una base de datos entre hosts es compartir el archivo de sistema con el fichero de la base de datos. Esta forma de ejecutar consultas remotas es mucho más lenta que enviar consultas y respuestas a través de un socket de red y también es menos confiable. 

* Otra debilidad de SQLite es que no maneja datos binarios nativamente, por lo que para insertar datos tipo binarios en una base de datos SQLite primero deben ser codificados. Del mismo modo, después de una SELECT, deben decodificarse los datos binarios que fueron codificados previamente. 

* Las transacciones bloquean todas las tablas de las bases de datos (al menos algunas filas) durante gran parte del tiempo de las transacciones y SQLite bloquea la base de datos completa en inserciones, lo que hace el acceso concurrente de lectura / escritura extremadamente lento. 

#### 7.8.2 Mejores áreas de uso

El principal punto de excelencia de SQLite es que es independiente y muy adecuada para entornos de alojamiento web, porque el cliente SQLite trabaja en archivos y no es necesario mantener un segundo grupo de credenciales para el acceso a la base de datos. En otras palabras, si es posible escribir en el fichero de la base de datos, es posible hacer modificaciones en la base de datos. Las empresas de alojamiento (hosting) solo necesitan admitir la extensión PHP SQLite y sus clientes pueden encargarse del resto. Una empresa de alojamiento puede bloquear el tamaño máximo de las bases de datos fácilmente, ya que la base de datos SQLite es solo un fichero que ocupa un lugar dentro del espacio web de su cliente. SQLite sobresale en aplicaciones independientes, especialmente en alojamiento web, con entornos donde hay muchas consultas de lectura y pequeñas consultas de escritura, de modo que la velocidad de SQLite se aprovecha completamente.  

Un ejemplo de tal aplicación podría ser un weblog (blog) donde todos los hits extraen posts de la base de datos, mientras que solo el autor o unos pocos visitantes añaden comentarios. 

#### 7.8.3 XML

XML (eXtendedMarkup Language) es un lenguaje de marcas. Procede de SGML (Standard Generalized Markup Languaje), un metalenguaje diseñado para definir estructuras de datos descriptivas. SGML pese a ser muy potente, es muy complejo para la gran parte de las aplicaciones. Por ello, se creó una versión más flexible y simplificada: XML.  

Al igual que HTML, XML utiliza etiquetas, pero en vez de especificar cómo debe presentarse la información contenida entre las marcas, se limitan a indicar qué significan. Por ejemplo: 

<img src="images/c2/4-7-102.png">

En síntesis, XML, junto con todas sus tecnologías relacionadas, abre un nuevo abanico de posibilidades para poder desarrollar aplicaciones. Una gran ventaja de XML es su orientación al intercambio de información, al ser independiente del software que lo vaya a utilizar. 

La imagen siguiente muestra cómo la información que se encuentra en un único documento tipo XML es visualizada en dispositivos diferentes. Esta facilidad para intercambiar información, ha convertido a XML en la base de gran parte de aplicaciones B2B (Business to Business), es decir, en aquel software que las empresas y las administraciones públicas utilizan para intercambiar información entre ellas. 

<img src="images/c2/4-7-103.png">

*Aplicaciones de XML*

Los documentos XML son un documento tipo texto plano con la estructura siguiente: 

<img src="images/c2/4-7-104.png">

En la primera línea y en la última, encontramos el elemento raíz (), dentro del cual están insertos o anidados todos los demás elementos, los cuales se caracterizan por ser diferentes atributos.  

Los nombres de los atributos no podrán tener espacios en blanco. Los nombres de los elementos pueden elegirse libremente, considerando que se diferencia entre mayúsculas y minúsculas.  

Es posible también añadir comentarios dentro del documento XML, lo cual es una ayuda para poder entender algunas cosas que el autor quiera comentar. 

#### 7.8.4 Sintaxis

La mayor diferencia entre HTML y XML es que, en este último, el documento debe estar bien formado. Existe una diversidad de requerimientos que deben cumplirse para que un documento XML esté bien formado. Los más relevantes son las siguientes: 

##### Estructura de jerarquía de atributos

Los documentos XML tienen que desarrollarse con una estructura obligatoriamente jerárquica respecto a las etiquetas (tags) que limitan sus atributos:

* Un tag tiene que estar correctamente insertada en otro.

* Los atributos con contenido deben estar cerrados correctamente. Ocurre lo contrario con HTML, en XML a cada etiqueta se le asocia siempre otra etiqueta de cierre.

##### Etiquetas vacías

los elementos sin contenido se especifican de la forma `</elemento_sin_contenido/>`.

##### Un solo elemento raíz

En un documento XML únicamente debe existir un elemento inicial.

##### Delimitación delos valores de propiedades

Los valores que toman los atributos en todos los casos se encierran entre comillas.

##### Tipo de letras

XML distingue entre letras mayúsculas y letras minúsculas.

<img src="images/c2/4-7-105.png">

<img src="images/c2/4-7-106.png">

### 7.9 Identificación de usuarios (i)

En los próximos apartados vamos a estudiar todo lo relacionado con la identificación de usuario, como: 

* Manejo de Sesiones 
* Constantes predefinidas 
* Progreso de carga de sesión  
* Sesiones y Seguridad 

#### 7.9.1 Manejo de Sesiones

Una sesión PHP permite que una aplicación almacene información para la actual "Sesión", que se puede definir como un usuario que inicia sesión en su aplicación.  

Una sesión se identifica mediante un identificador de sesión único. PHP crea una ID de sesión que es un hash MD5 de la dirección IP remota, la hora actual y algún elemento de aleatoriedad adicional (representado en una cadena hexadecimal). Este identificador de sesión se puede pasar en una cookie o añadiéndolo a todas las URL para navegar por la aplicación. Por razones de seguridad, es mejor obligar al usuario a tener las cookies habilitadas que pasar la sesión ID en la URL (que normalmente se puede hacer manualmente agregando `PHP_SESSID = <session_id>`, o activando session.use_trans_sid en php.ini). Lo de pasar la sesión en la petición no es conveniente porque podría terminar en los registros del servidor web como `HTTP_REFERER` o ser encontrado por alguna persona malintencionada (hacker) que esté controlando el tráfico de datos del usuario.  

Esa persona malintencionada también podría ver la sesión de cookies, por lo que es posible que se prefiera emplear un servidor con una conexión cifrada SSL y así estar realmente seguros.  

Pero, para continuar hablando sobre las sesiones, vamos a reescribir un ejemplo de cookies usando sesiones. Creamos un archivo llamado session.inc que establece algunos valores de sesión. En el siguiente ejemplo se ilustra esto y se incluirá este archivo al comienzo de cualquier script que esté dentro de la sesión: 

<img src="images/c2/4-7-107.png">

En la primera línea, el parámetro de configuración `'session.use_cookies'` es establecido en 1, lo que significa que las cookies se utilizarán para la propagación de la sesión ID. La línea número dos, 'session.use_only_cookies' se establece en 1, lo que significa que una ID de sesión pasada en la URL al script será descartada. A continuación, la configuración requiere que los usuarios tengan habilitadas las cookies para usar sesiones.   

La función session_start () debe aparecer después de cualquier configuración relacionada con la sesión, que se hace con ini_set (). Session_start () inicializa el bloque de sesión, configurando algunos encabezados (como la cookie de identificador de sesión y algunos encabezados de prevención de almacenamiento en caché), requiriendo su colocación antes de que cualquier salida haya sido enviada al navegador. Si no hay una ID de sesión disponible en ese momento, se llama session_start () y una nueva ID de sesión se crea y la sesión se inicializa con una matriz vacía $_SESSION. Los ítems de la matriz de $_SESSION son sencillos de manipular, como se muestra en el siguiente ejemplo: 

[Ejemplo (sin ejemplo)]()

Cerrar sesión es lo mismo que destruir la sesión y sus datos asociados, como vemos en el script de cierre de sesión: 

<img src="images/c2/4-7-108.png">

Todavía necesitamos inicializar la sesión con session_start (), después de lo cual, se puede borrar la sesión estableciendo el superglobal `$_SESSION` en una matriz vacía. Entonces, destruimos la sesión y sus datos asociados llamando a `session_destroy()`. Se accede a las variables de sesión desde el superglobal `$_SESSION`. Cada elemento contiene una variable de sesión, empleando el nombre de la variable de sesión como clave. En nuestro script `index.php`, movimos la instrucción if que verifica si un usuario inició sesión a una función especial que colocamos en el archivo `session.inc`: 

<img src="images/c2/4-7-109.png">

La función presentada verifica si existe la variable de sesión 'uid' y si el valor de la variable de sesión 'uid' no es 0. Si una de las comprobaciones falla, redirigimos a los clientes a la página de inicio de sesión. De lo contrario, no lo hacemos. Llamamos a la función check_login () en cada página donde requerimos que un usuario inicie sesión. Necesitamos asegurarnos de que la sesión.inc del archivo se incluya antes de que se produzca cualquier salida. Aquí hay un fragmento del script index.php modificado: 

<img src="images/c2/4-7-110.png">

Usar sesiones puede ser tan simple como lo que se muestra aquí, pero también se podrían ajustar algunos parámetros más.  

#### 7.9.2 Constantes predefinidas

Las constantes que se presentan a continuación están especificadas por la extensión de sesiones de PHP, y solo estarán disponibles en el momento que la extensión se pueda compilar en PHP o sea levantada activamente en tiempo de ejecución. Aunque, es verdad que, muchas versiones de PHP en Windows ya incorporan de forma nativa esta extensión de sesiones. 

##### SID (cadena)

Constante que posee el nombre de la sesión y el identificador de la sesión de la manera siguiente: "nombre = ID" o una cadena vacía si la ID de la sesión se configuró en una cookie de sesión. Esta es la misma identificación que la devuelta por session_id (). 

##### PHP_SESSION_DISABLED (int)

Desde el lanzamiento de PHP 5.4.0. es el valor de retorno de session_status () si las sesiones no están habilitadas. 

##### PHP_SESSION_NONE(int)

Tambien desde PHP 5.4.0. corresponde al valor de retorno de session_status () cuando las sesiones están habilitadas, pero no existe ninguna sesión. 

##### PHP_SESSION_ACTIVE(int)

Desde PHP 5.4.0. Valor de retorno de session_status () cuando las sesiones están habilitadas y se encuentra una sesión. 

#### 7.9.3 Progreso de carga de sesión

Cuando la opción INI session.upload_progress.enabled está habilitada, PHP podrá rastrear el progreso de carga de los archivos individuales que se cargan. Esta información no es particularmente útil para la solicitud de carga real en sí, pero durante la carga del archivo, una aplicación puede enviar una solicitud POST a un punto final separado (a través de XHR, por ejemplo) para verificar el estado. 

<img src="images/c2/4-7-111.png">

También es posible cancelar la carga del archivo actualmente en progreso, configurando la clave `$ _SESSION [$ key] ["cancel_upload"]` en TRUE. Al cargar varios archivos en la misma solicitud, solo cancelará la carga de archivos actualmente en progreso y las cargas de archivos pendientes, pero no eliminará las cargas completadas con éxito. Cuando una carga se cancela de esta manera, la clave de error en la matriz `$_FILES` se establecerá en UPLOAD_ERR_EXTENSION.  

Las opciones `INI session.upload_progress.freq` y `session.upload_progress.min_freq` controlan la periodicidad con la que se debe recalcular la información de progreso de carga. Con una cantidad razonable para estas dos configuraciones, la sobrecarga de esta característica es casi inexistente. 

#### 7.9.4 Sesiones y Seguridad

El módulo de sesión no puede avalar que la información almacenada en una sesión solo sea vista por el cliente que inició la sesión. Se necesitan tomar precauciones adicionales para blindar la confidencialidad de la sesión. 

##### Seguridad de sesión

La importancia de los datos transportados en la sesión debe evaluarse y se puede implementar una mayor protección. Esto, generalmente, tiene un coste en forma de menor comodidad para el cliente. Por ejemplo, para cuidar a los usuarios de una táctica simple de ingeniería social, session.use_only_cookies debe estar habilitado. En ese proceso, las cookies deberán habilitarse absolutamente en el lado del cliente o no funcionarán las sesiones. Esto obligará a que el usuario acepte las cookies correspodientes, teniendo en cuenta que, debido a los temores sobre falta de privacidad, cada vez son más los usarios que navegan con las cookies deshabilitadas o en modo incógnito.

Hay diversas maneras de filtrar un identificador de sesión hacia terceros, como, por ejemplo: Inyecciones de JavaScript, ID de sesión en URL, rastreo de paquetes, acceso físico al dispositivo, etc.

Una ID de sesión filtrada permite a un tercero acceder a todos los recursos asociados con esa ID específica. Primero, las URL con ID de sesión. Si hay enlaces a un portal o recurso externo, la dirección que está en el identificador de sesión se podría guardar en los registros del sitio externo. Como segundo punto, un atacante más profesional tendría la posibilidad de escuchar el tráfico de la red (sniffer). Es probable que no esté cifrado y los identificadores de sesión se filtrarán en un texto plano por medio de la red. La solución es implantar un SSL/ TLS en el servidor y que sea obligatorio para todos los usuarios. HSTS debe usarse en este caso para acelerar la seguridad.

##### Regeneración de ID de sesión

Session.use_strict_mode es una buena mitigación, sin embargo, no es suficiente. Los desarrolladores también deben usar session_regenerate_id() para la seguridad de la sesión. La regeneración del identificador de sesión minimiza el riesgo de robo de ID de sesión, por lo que se debe llamar periódicamente a session_regenerate_id(). Por ejemplo, volver a generar la ID de sesión cada 15 minutos para contenido confidencial. Inclusive en el caso de que una ID de sesión sea robada, tanto la sesión del cliente legítimo como la del atacante caducarán en algún momento del tiempo. Dicho de otra manera, el acceso del usuario o del atacante generará un error de ingreso a la sesión antigua más tarde o más temprano.

Los ID de sesión deben regenerarse cuando los privilegios del usuario son más elevados, como ocurre después de la autenticación. Se debe llamar a session_regenerate_id() previo al establecimiento de la información de autenticación en `$ _SESSION`. (A partir de PHP 7.0.0, session_regenerate_id() almacena los datos de la sesión presente automáticamente para almacenar la marca de tiempo en la presente sesión). Es necesario asegurarse de que, solo la nueva sesión, contenga el indicador autenticado.

Los desarrolladores no deben confiar en la caducidad del ID de sesión por session.gc_maxlifetime. Los atacantes pueden acceder periódicamente al ID de sesión de la víctima para evitar su vencimiento y seguir explotándolo, incluida una sesión autenticada.

Por lo contrario, los programadores deben implementar la gestión de información de sesión basada en marca de tiempo.

##### Eliminación de datos de sesión

Los datos de sesión obsoletos deben ser inaccesibles y eliminados. El módulo de sesión no gestiona esto bien. Los datos de sesión obsoletos deben eliminarse lo antes posible. Sin embargo, las sesiones activas no deben eliminarse al instante. Para satisfacer esos requisitos, los desarrolladores deben implementar la administración de datos de sesión basada en marca de tiempo por sí mismos.

Establecer y administrar la marca de tiempo de vencimiento en $ _SESSION es un buen consejo. Prohibir el acceso a la información de sesión desactualizados también es recomendable. Cuando se detecta el acceso a datos de sesión obsoletos, se recomienda eliminar todo el estado autenticado de las sesiones del cliente y obligarlos a autenticarse de nuevo. El acceso a datos de sesión obsoletos puede representar un ataque. Para conseguir estas mejoras de seguridad, los desarrolladores deben hacer un rastreo de todas las sesiones activas de cada usuario.

En resumen, la información de la sesión no debe destruirse con session_regenerate_id () ni session_destroy (), si no que las marcas de tiempo deben usarse para fiscalizar el acceso a la información de la sesión. Y dejar que session_gc () elimine datos obsoletos de los datos almacenados de la sesión.

##### Sesión y bloqueo

Los datos de la sesión están bloqueados por defecto para evitar condiciones de carrera (race conditions). El bloqueo es obligatorio para mantener la información de sesión consistente en todas las solicitudes.

Sin embargo, los atacantes pueden abusar del bloqueo de sesión para realizar ataques DoS (Denegación de servicio). Para reducir el riesgo de un ataque DoS bloqueando la sesión, hay que minimizar los bloqueos. Utilizar sesiones de solo lectura cuando no sea necesario actualizar los datos de la sesión es una buena práctica. Usar la opción 'read_and_close' con session_start(). session_start (['read_and_close' => 1]); Cerrar la sesión lo antes posible después de actualizar `$ _SESSION` utilizando `session_commit()` también son buenas ideas.

El módulo de sesión actual no detecta ninguna modificación de `$ _SESSION` cuando la sesión está inactiva. Es responsabilidad del desarrollador no modificar `$ _SESSION` cuando la sesión está inactiva.

##### Sesiones activas

Los desarrolladores deben realizar un seguimiento de todas las sesiones activas para cada usuario. Y notifcarles cuántas sesiones activas, desde qué IP (y área), cuánto tiempo ha estado activo, etc. PHP no realiza una fiscalización de éstas. Por tanto, se supone que los desarrolladores deben hacerlo a la hora de construir su software.

Hay diversas maneras de implementar esto. Una posible implementación es la configuración de una base de datos que efectúe una fiscalización de los datos necesarios y almacene cualquier información relevante.

Una de las implantaciones más simples es "identificador de sesión con prefijo de ID de usuario" y guardar la información necesaria en `$ _SESSION`. Muchas bases de datos poseen un buen rendimiento para seleccionar una parte de cadena. Los desarrolladores pueden usar `session_regenerate_id()` y `session_create_id()` para esto.

##### Sesión e inicio de sesión automático

Cuando desarrollamos software no debemos usar ID’s de sesión de larga duración para el inicio de sesión automático, porque aumenta el riesgo de sesiones robadas. El desarrollador debe implementar una función de inicio de sesión automático.

Usar una clave hash segura desde un principio como clave de inicio de sesión automático usando setcookie(). Usar un hash seguro más sólido que SHA-2. P.ej. SHA-256 o más con datos aleatorios de random_bytes() o / dev / urandom son buenas recomendaciones.

Si no se ha autenticado el usuario, verifiquemos si la clave de inicio de sesión único es válida o no. Si la autenticación es válida, se autentica al usuario y configuramos la clave nueva hash segura y única. Una clave de inicio de sesión automático solo debe usarse una vez, es decir, nunca reutilicemos una clave de inicio de sesión automático, siempre generemos una nueva.

Una clave de inicio de sesión automático es una clave de autenticación de larga duración, por ese motivo debe protegerse tanto como sea posible. Utilicemos los atributos de cookie path / httponly / secure / SameSite para asegurarlo. Es decir, nunca transmitamos la clave de inicio de sesión automático, a menos que sea totalmente necesario.

El desarrollador debe implementar las características que deshabilitan el inicio de sesión automático y eliminan las cookies de clave de inicio de sesión innecesarias.

### 7.10 Motores de plantillas

Hoy en día, los sitios web han evolucionado y ya no se trata de páginas web sencillas y estáticas como antaño, donde las empresas mostraban poco más que sus catálogos de productos y datos de contacto.  

La mayoría de los sitios web ahora son más complejos y desarrollan actividades de negocio completas como vender libros, entradas, billetes de avión, etc.   

Es más, muchos desarrolladores de aplicaciones software complejas utilizan los sitios web como interfaces para sus programas informáticos. Por ejemplo, para ofrecer programas de contabilidad online, etc.   

Durante estos últimos años, PHP ha sido una de las mejores opciones disponibles para los desarrolladores web, entre otros motivos por ser un lenguaje de código abierto. Con el aumento de la complejidad de las aplicaciones PHP, surgió un nuevo problema que fue cómo separar el código del programador (PHP) del código de los diseñadores gráficos (HTML) o, más técnicamente, cómo separar la capa de contenido de la de presentación. 

#### 7.10.1 Sistemas de plantillas

La funcionalidad básica de un sistema de este tipo es la introducción de un mecanismo para separar la interacción entre programadores y diseñadores. Podemos ver en el siguiente ejemplo, como el diseño de un sitio web puede entenderse: 

<img src="images/c2/4-7-112.png">

Los diseñadores construyen la cara visible del sitio web con imágenes, estilos de texto, tablas, etc. Muchos diseñadores han desarrollado plantillas óptimas sobre cómo organizar el contenido en cada página.  

La única información que necesitan los diseñadores es cómo debe verse el sitio y cuáles son las necesidades de contenido: noticias, catálogo de productos, otras informaciones, etc.  

Por otro lado, los programadores codifican la aplicación usando PHP para manipular datos (lógica de negocios). No les interesa cómo se verá el sitio web (colores, imágenes, estilos de texto) o dónde cada contenido será presentado en la página. Todo lo que necesitan hacer es pasar el contenido a las plantillas usando nombres de variables que acuerdan con los diseñadores, para que haya concordancia entre el trabajo de ambas partes.  

Así es, más o menos, cómo funcionan los sistemas de plantillas. A partir de esta funcionalidad básica, cada plantilla tiene un conjunto de características que facilita a los diseñadores y programadores utilizarlas de la mejor manera. 

#### 7.10.2 ¿Por qué usar un sistema de plantillas?

Crear un sitio web es similar a crear cualquier otro software. Se puede hacer construyéndolo desde cero, comenzando a escribir código para intentar llegar a un resultado final resolviendo los problemas que surjan por el camino, o puede hacerse diferenciando los componentes del proyecto en capas separadas y construyendo el sitio web teniendo en cuenta estas capas. Esto se llama software multinivel o arquitectura multinivel. Si el sitio web es pequeño y contiene solo unas pocas líneas de código PHP, la opción primera podría funcionar (e incluso podría ser más rápida y barata). Simplemente sería necesario crear algunas entidades en una base de datos, comenzar a codificar con PHP, quizás crear algunos banners gráficos, generar algunas tablas y depurar a cada paso. A muchos ingenieros de software con poca experiencia les gusta esta manera rápida y fácil.  

Cuando se trata de proyectos web más complicados, como portales web, sitios de comercio electrónico, sistemas ERP, etc., la opción primera puede funcionar, pero es probable que en la gran parte de los casos sea muy complicado lograr un buen resultado. Además, con el mercado tan competitivo que hay en los negocios online, para que un sitio web tenga una oportunidad de éxito, debe poseer un diseño excelente y que sea adecuado al modelo de proyecto que se está construyendo y, por supuesto, el código tiene que ser estable y estar probado en todas las situaciones, incluso en aquellas más complejas y críticas.   

Por este motivo, los profesionales involucrados en el diseño de sitios web se especializan en hacer diseños geniales (diseñadores gráficos, expertos en usabilidad, etc.) y otros se especializan en hacer una muy buena programación (programadores web). No es frecuente ver a un diseñador web que escriba un buen código libre de errores, ni a un buen programador que realice diseños atractivos. 

Las compañías de software que crean sitios web, generalmente, tienen un departamento de diseño y un departamento de programación y la mayoría de los proyectos web, medianos y grandes, incorporan ambos perfiles (un programador y un diseñador trabajando colaborativamente o grupos de varios programadores y diseñadores en los proyectos de mayor calado).  

Los programadores tienen diferentes formas de codificar aplicaciones y si usan solo PHP sin un motor de plantillas, el diseñador deberá estar familiarizado con la forma de organizar el código de cada programador, nombrar variables, etc. Además, el programador deberá comprender el estilo del diseñador, y generar el código para imprimir código HTML desde PHP donde el diseñador lo desee.  

Por tanto, como la gran mayoría de creadores de webs requieren un sistema de plantillas PHP, es que han surgido una gran diversidad de ellas, entre las cuales mencionaremos las siguientes: 

* Platillas Blade para Laravel 
* Plantillas Smarty 
* Plantillas de Twig 

<img src="images/c2/4-7-113.png">

[Video](https://www.youtube.com/watch?v=5AgaZ-rK2m8&feature=emb_logo)

### 7.11 identificación de usuarios

Al asegurar la configuración de INI relacionada con la sesión, los desarrolladores pueden mejorar la seguridad de la sesión. Algunas configuraciones importantes de INI no tienen configuraciones recomendadas por defecto. Por lo que, los desarrolladores son responsables de fortalecer la configuración de la sesión.   

A continuación, se presentan las principales funciones que se pueden emplear para dicha configuración: 

#### Session.cookie_lifetime = 0

0 posee un significado particular. Informa a los navegadores que no deben almacenar la cookie en un almacenamiento permanente. Por lo tanto, cuando el navegador culmina su proceso de conexión e interacción, la cookie de identificador de sesión se elimina de inmediato. Si los desarrolladores configuran esto de manera diferente a 0, pueden estar consintiendo que otros usuarios usen la ID de sesión. Gran parte de las aplicaciones deben usar "0".

Si se requiere una función de inicio de sesión automático, los programadores pueden implantar su propia función segura de inicio de sesión automático. No debemos usar ID’s de sesión de larga duración para esto.
 
#### Session.use_cookies = Activado

Aunque las cookies HTTP sufren algunos problemas, las cookies siguen siendo la forma preferida de administrar las ID de sesión. La mayoría de las aplicaciones deberían usar una cookie para la ID de sesión.
 
#### Session.use_only_cookies = Activado

Si session.use_only_cookies = Off, el módulo de sesión utilizará los valores de ID de sesión establecidos por GET / POST / URL siempre que la cookie de identificación de sesión no se haya inicializado.
 
#### Session.use_strict_mode = Activado

Aunque habilitar session.use_strict_mode es obligatorio para sesiones seguras, la realidad es que está deshabilitado por defecto.

Esto evita que el módulo de sesión use una ID de sesión no inicializada. Es decir, el módulo de sesión solo acepta ID’s de sesión válidas producidas por el módulo de sesión. Rechaza cualquier ID de sesión proporcionada por los usuarios.

Debido a la especificación de cookies, los atacantes pueden colocar cookies de identificación de sesión no eliminables configurando localmente una base de datos de cookies o inyecciones de JavaScript. session.use_strict_mode puede evitar que se use un ID de sesión inicializado por el atacante.
 
#### Session.cookie_httponly = Activado

Rechaza el acceso a la cookie de sesión desde JavaScript. Esta configuración evita que las cookies sean arrebatadas por una inyección de JavaScript.

Es posible usar una ID de sesión como un token CSRF, pero esto no se recomienda.

El mundo de la ciberseguridad cada vez es más complejo y todo desarrollador debería tener unas nociones básicas.

Los desarrolladores no deben escribir IDs de sesión en páginas web para una mejor seguridad. En la mayoría de las aplicaciones deben usar la propiedad httponly para la cookie de ID de sesión.
 
#### Session.cookie_secure = Activado

Permitamos el acceso a la cookie de ID de sesión, sólo cuando el protocolo sea HTTPS. Si sólo se puede acceder a un sitio web a través de HTTPS, debes habilitar esta configuración. Aunque el protcolo HTTPS, hasta hace poco, estaba reservado a páginas web de bancos, administraciones públicas, etc., en los últimos tiempos su uso se ha generalizado para todo tipo de webs. Por tanto, cada vez será más común que cualquier desarrollo web incorpore esta capa de seguridad.

HSTS debe considerarse para sitios web accesibles solo a través de HTTPS.
 
#### Session.cookie_samesite = "Lax" o session.cookie_samesite = "Strict"

A partir de PHP 7.3, el atributo "SameSite" se puede configurar para la cookie de ID de sesión. Este atributo es una forma de mitigar los ataques CSRF (Cross Site Request Forgery).

La diferencia entre Lax y Strict es la accesibilidad de la cookie en las solicitudes que se originan desde otro dominio que emplea el método de HTTP GET. Las cookies que usan Lax serán accesibles en una solicitud GET originada en otro dominio, mientras que las cookies que usan Strict no lo serán.
 
#### Session.gc_maxlifetime = [elija el más pequeño de ser posible]

session.gc_maxlifetime es una configuración para eliminar un ID de sesión obsoleta. No es recomendable confiar en esta configuración. Al igual que hemos comentado para otras circunstancias, de nuevo, los desarrolladores deben administrar la vida útil de las sesiones con una marca de tiempo por sí mismos.

La sesión GC (recolector de basura o garbage collection) se realiza mejor usando session_gc (). La función session_gc () debe ser ejecutada por un administrador de tareas, por ejemplo: cron en sistemas UNIX.

GC se realiza por defecto en base a la probabilidad. Al ser una gestión de tipo probabilístico, esta configuración no nos garantiza que se elimine una sesión desactualizada. Aunque los desarrolladores no pueden confiar en esta configuración, se recomienda especificarla con el menor valor posible. Ajustando session.gc_probability y session.gc_divisor conseguiremos que las sesiones obsoletas se eliminen con la periodicidad más adecuada posible. Si se requiere una función de inicio de sesión automático, los desarrolladores, nuevamente, deben implementar su propia función segura de inicio de sesión automático. Nunca debemos usar una ID de sesión de larga duración para esta función.

#### Session.use_trans_sid = Desactivado

El uso de una gestión de ID de sesión transparente no está prohibido. Los desarrolladores pueden emplearlo cuando sea necesario. Sin embargo, deshabilitar la administración transparente de ID de sesión mejorará la seguridad en general del identificador de sesión al eliminar la posibilidad de una inyección y / o fuga de ID de sesión.
 
#### Session.trans_sid_tags = [etiquetas limitadas]

Está disponible en las versiones de PHP superiores a 7.1.0. Los desarrolladores no deberían reescribir etiquetas HTML innecesarias. El valor por defecto es el adecuado para la gran parte de los usos. Las versiones anteriores de PHP usan url_rewriter.tags en su lugar.
 
#### Session.trans_sid_hosts = [hosts limitados]

También se incorpora a partir de la versión 7.1.0 de PHP. Este INI define los hosts de la lista blanca que permiten la reescritura de trans sid. Nunca debemos agregar hosts no confiables, por ejemplo, aquellos que están fuera de nuestra organización o entorno de confianza. El módulo de sesión solo permite `$ _SERVER ['HTTP_HOST']` cuando esta configuración está vacía.
 
#### Session.cache_limiter= nocache

Asegurarnos de que el contenido HTTP esté sin caché para las sesiones autenticadas. Permite guardar en caché, solo, en el momento que el contenido no sea privado. En caso contrario, el contenido podría quedar expuesto. Debemos tener en cuenta que "privado" puede transmitir datos privados almacenados en caché por clientes compartidos y "public" solo debe usarse en el momento que el contenido HTTP no contiene datos privados.
 
#### Session.sid_length = "48"

Aparece en PHP 7.1.0 para modificar la longitud del ID de sesión. Las IDs de sesión más largas dan como resultado IDs de sesión más fuertes y robustas. Los desarrolladores deben considerar una configuración de la longitud de ID de sesión de 32 como mínimo.
 
#### Session.sid_bits_per_character = "6"

Desde PHP 7.1.0. Cuantos más bits haya en un carácter de ID de sesión, más fuerte será la ID de sesión generada por el módulo de sesión para una longitud de ID de sesión idéntica.
 
#### Session.hash_function = "sha256"

También incorporado en PHP 7.1.0. Una función hash más robusta generará una ID de sesión más fuerte. Aunque la colisión de hash es poco probable incluso con el algoritmo de hash MD5, los desarrolladores deben usar SHA-2 o un algoritmo de hash más fuerte como sha384 y sha512. Los desarrolladores deben asegurarse de alimentar una entropía lo suficientemente larga para la función de hashing utilizada.

#### Para saber más...

Las funciones hash o resumen son un concepto muy usando en seguridad informática. Puedes conocer más sobre el concepto hash aquí. 

[¿Qué son las funciones Hash y para que se utilizan?](https://www.cysae.com/funciones-hash-cadena-bloques-blockchain/)

#### 7.11.1 Funciones de sesión

A continuación, el listado y explicación de las funciones que poseen las sesiones: 

* session_abort: Descarta los cambios de la matriz de sesión y cierra la sesión. 
* session_cache_expire: Devuelve el vencimiento de la caché presente. 
* session_cache_limiter: Establece el limitador de caché presente. 
* session_commit: pseudónimo de session_write_close. 
* session_create_id: Crea una nueva ID de sesión. 
* session_decode: Decodifica datos de sesión de una cadena codificada de sesión. 
* session_destroy: Destruye todos los datos registrados en una sesión. 
* session_encode: Codifica los datos de la sesión actual como una cadena codificada de sesión. 
* session_gc: Realiza la recolección de la basura de datos de sesión. 
* session_get_cookie_params: Obtiene los parámetros de la cookie de sesión. 
* session_id: Obtiene y/o establece el id de sesión actual. 
* session_is_registered: Averigua si una variable global está registrada en una sesión. 
* session_module_name: Obtiene y/o establece el módulo de sesión actual. 
* session_name: Obtiene y/o establece el nombre de la sesión actual. 
* session_regenerate_id: Actualiza el ID de sesión actual con uno recién generado. 
* session_register_shutdown: Función de apagado de sesión. 
* session_register: Registra una o más variables globales con la sesión actual. 
* session_reset: Reinicializa la matriz de sesión con valores originales. 
* session_save_path: Obtiene y/o establece la ruta de guardado de la sesión actual. 
* session_set_cookie_params: Establece los parámetros de la cookie de sesión. 
* session_set_save_handler: Establece funciones de almacenamiento de sesión a nivel de usuario. 
* session_start: Inicia una sesión nueva o reanuda la existente. 
* session_status: Devuelve el estado actual de la sesión. 
* session_unregister: Anula el registro de una variable global de la sesión actual. 
* session_unset: Libera todas las variables de sesión. 
* session_write_close: Escribe datos de sesión y finaliza sesión. 

<img src="images/c2/4-7-114.png">

<img src="images/c2/4-7-115.png">

## 8. Programación Web con PHP. Mantenimiento de estado

El protocolo HTTP no posee un estado como otros protocolos, por lo que cuando un servidor web culmina la solicitud que hace un cliente de una página web, desaparece su conexión.   

En este contexto y para solventar que HTTP no tiene estado, mencionaremos varias técnicas para hacer seguimiento de sesión entre las partes involucradas. 

#### Campos ocultos

En los formularios podemos colocar campos ocultos: como PHP trabaja los campos ocultos como campos normales, se pueden utilizar perfectamente para pasar la información. Por tanto, los valores de esos campos que coloquemos ocultos estarán disponibles para los métodos GET y POST. 

#### Cookies

Si te encuentras en una página web cualquiera y vas a la página siguiente (como cuando pulsas un enlace o introduciendo una URL diferente la barra de tu navegador), los datos se han ido. Una forma sencilla de mantener los datos entre las diferentes páginas de una web, es la aplicación de cookies. Las cookies son enviadas por PHP a través del servidor web utilizando la función setcookie() y se almacenan en el navegador. Si se establece un momento de espera para la cookie para que no caduque al momento, el navegador incluso recordará la cookie cuando el usuario restablezca su ordenador. Sin el tiempo de espera establecido, el navegador olvida la cookie tan pronto como el navegador se cierra. También se puede configurar una cookie para que sea válida solo para un subdominio específico.  

#### Sesiones

Es otra técnica que permite mantener el estado en PHP. Como se mencionó en secciones anteriores a ésta, una sesión PHP permite que una aplicación almacene información para la actual "Sesión", que se puede definir como un usuario que inicia sesión en su aplicación. Con la función session_start se crea una sesión mediante una solicitud a los métodos GET o POST, o también, se puede pasar mediante una cookie y con la función session_destroy se elimina la sesión. 

#### Reescribir la dirección URL

Es una técnica un poco tediosa, que permite el mantenimiento de la información por medio de la escritura de algún identificador de usuario (por ejemplo, en las URL’s de todas las páginas), y, de esta manera, se mantiene dicha información en toda la aplicación creada. 

<img src="images/c2/4-7-116.png">

<img src="images/c2/4-7-117.png">

<img src="images/c2/4-7-118.png">

<img src="images/c2/4-7-119.png">

<img src="images/c2/4-7-120.png">

## 9. Programación Web con PHP. Servicios Web

Un servicio web o web service es un mecanismo basado en distintos protocolos y estándares que facilita el intercambio de datos entre aplicaciones.  

Estas aplicaciones, incluso, pueden encontrase en distintos equipos y haber sido desarrolladas en distintos lenguajes de programación. Debido al auge de internet como red abierta, cada vez es más común el uso de servicios web. Para que el mercado de servicios web sea fácilmente interoperable, organizaciones como OASIS y W3C se ocupan de definir arquitecturas y reglamentos para estandarizar.  

Algunos ejemplos de servicios web interesantes para desarrollar nuestras aplicaciones en PHP son los siguientes: 

#### Services_ExchangeRates

Se puede ampliar para trabajar con cualquier fuente que nos proporcione datos de tipos de cambio de divisas. Esta clase, descarga tipos de cambio junto con el nombre de cada moneda (dólar estadounidense, euro, lira maltesa, etc.) y realiza conversiones entre dos de las monedas disponibles (el número real de monedas admitidas depende del listado de tasas de cambio disponibles).

#### Services_Weather

Services_Weather busca ubicaciones determinadas y recupera datos meteorológicos actuales y, dependiendo del servicio utilizado, también pronósticos. Hasta ahora, este web service está preparado para integrar datos del servicio GlobalWeather de la empresa CapeScience, también integra Weather XML de EJSE (con información metereológica solamente de EE. UU.). También se comunica eficientemente con un servicio SOAP de la conocida página web Weather.com, así como con el servicio gubernamental METAR de la web noaa.gov. Además de estos proveedores de información metereológica que son soportados de forma nativa por este servicio web, el fabricante informa que se incluirán más servicios, cuando estén disponibles, cuando tengan una API utilizable y están debidamente documentados.

#### OAuth

Esta extensión proporciona enlaces entre consumidores y proveedores de servicio. OAuth es una regla de autorización creada sobre HTTP que permite a las aplicaciones acceder de manera segura a los datos sin tener que guardar nombres de usuario y contraseñas.

#### SCA

SCA para PHP hace posible que un programador de PHP escriba componentes reutilizables, que se pueden llamar de varias maneras, con una interfaz idéntica y con un mínimo de esfuerzo. En la actualidad, los componentes pueden llamarse entre sí localmente o mediante servicios web, pero en el futuro se espera que sean posibles otras formas. Proporciona al programador una forma de hacerlo que será lo más natural posible en PHP. El modelo de programación SCA para PHP se puede ampliar para admitir varios tipos de servicios, como REST y Atompub. Sin embargo, si consultamos la documentación del fabricante, comprobamos que los servicios web (más exactamente, WSDL, servicios SOAP / HTTP), son el único tipo actualmente especificado.

#### SOAP

Implementación de protocolo y servicios SOAP.

#### YAR

Yar es un marco RPC que tiene como objetivo proporcionar una manera simple y fácil de hacer comunicación entre aplicaciones PHP. Tiene la capacidad de llamar simultáneamente a múltiples servicios remotos.

#### XML_RPC

Estas funciones se pueden usar para escribir servidores y clientes XML-RPC.

<img src="images/c2/4-7-121.png">

<img src="images/c2/4-7-122.png">

## 10. Programación Web con PHP. Herramientas adicionales

Existen herramientas adicionales que nos ayudan a crear aplicaciones más completas y seguras con PHP. Ajax (Asynchronous JavaScript And XML) nos permitirá intercambiar información con el servidor de manera asíncrona, de forma que no es necesario recargar toda la página web, por ejemplo, cuando enviamos un formulario.  

#### Enlace de interés

Accede a este enlace y conoce al detalle todo lo relacionado con PHP:

[Manual de PHP](https://www.php.net/manual/es/index.php)

### 10.1 PHP Y Ajax

A pesar que el concepto de Ajax ofrece un buen conjunto de posibilidades para crear acciones interactivas, si no aprovechamos su capacidad al máximo para conectar con el servidor, simplemente estaremos utilizando JavaScript básico. Esto no es malo, pero la verdadera potencia se esconde en combinar la funcionalidad del lado de cliente de JavaScript donde la programación se encuentra, con el lado del servidor PHP, aplicando el concepto de Ajax. 

### 10.2 ¿Por qué utilizar PHP y Ajax?

PHP es y seguirá siendo una tecnología completamente abierta. No confundamos el concepto abierto con que la programación de PHP se ejecute del lado del servidor y permanezca oculta para el usuario web.   

El secreto, de porqué PHP y Ajax hacen tan buena pareja, reside en su funcionalidad. PHP es un lenguaje de programación orientado a objetos fuertemente fiable. JavaScript también es razonablemente fiable, y también comparte características con los lenguajes bajo el paradigma de orientación a objetos. Ciertamente, al combinar estos dos lenguajes, que se encuentran en una etapa de madurez considerable, obtenemos lo mejor de dos mundos, encontrándonos en disposición de empezar a mezclarlos para lograr resultados exitosos. 

<img src="images/c2/4-7-123.png">

<img src="images/c2/4-7-124.png">

## 11. Configuración del servidor. Configuración del servidor Resin

Resin es un servidor web y un servidor de aplicaciones Java de Caucho Technology. Además de Resin (GPL), Resin Pro está disponible para entornos empresariales y de producción con una licencia comercial. Resin es afín con el estándar Java EE, así como con un motor similar a mod_php / PHP llamado Quercus.   

El mundo de las licencias de software es muy complejo y seguro que has oído hablar de software propietario, del freeware, del software libre, etc. 

<img src="images/c2/4-7-125.png">

#### Artículo de interés

Si quieres comprender mejor el significado de la licencia GPL puedes profundizar en el siguiente enlace. 

[GNU General Public Licence (GPL)](https://web.archive.org/web/20061205204428/http://www.es.gnu.org/modules/content/index.php?id=8)

Si bien Resin (GPL) es de uso gratuito en producción, Resin Pro (de pago) incluye optimizaciones como: 

* Almacenamiento en caché incorporado. 
* Agrupación pública / privada / híbrida. 
* Administración avanzada del sistema de monitorización. 
* Replicación de sesión HTTP. 
* Replicación de caché distribuida. 
* Recuperación automática e informes de diagnóstico.  

Para la configuración del servidor Resin para la plataforma Windows se necesita: el JDK de Java instalado y descargar en el Resin en la página oficial. 

#### Enlace de interés

Accede a este enlace para poder descargar Resin:

[Caucho](https://caucho.com/)


### 11.1 Instalación

Se descarga un archivo .zip que se descomprimirá en la carpeta del ordenador que esté destinada a la instalación del servidor. Por ejemplo, c:
esin.&nbsp; Los pasos para la configuración son: 

#### Básico 

1. Agregar al classpath el archivo jsdk23.jar que se encuentra en el directorio C:\resin\lib. Esto es necesario para compilar los objetos web.
   a. Configurar las siguientes preferencias.
      * Servlet directory = C:\resin\doc\WEB-INF\classes
      * Static content base URL = /images
      * Static content directory seen from client = c:\resin\doc\images
2. Copiar la gxclassr.zip y el jar o zip correspondiente a los drivers jdbc al directorio C:\resin\doc\WEB-INF\lib
3. Para levantar el Resin ejecutaremos el programa C:\resin\bin\httpd.exe
4. Pruebas:
   a. Para verificar que el RESIN se haya levantado bien, llamaremos al servlet que viene de ejemplo accediendo de la siguiente forma: http://localhost:8080/examples/basic/servlet/HelloServlet
   b. Para verificar que se están incorporando las clases standard accedemos a: http://localhost:8080/servlet/com.genexus.webpanels.gxver
5. Para llamar al panel desde nuestro navegador, la URL será:
   * http://localhost:8080/servlet/hnomwbp
   * http://localhost:8080/servlet/com.empresa.miaplic.hnomwbp si se especificó un ‘Package Name’
   
#### Avanzada

Trabajar con WARs

Resin nos ofrece la oportunidad de tener directorios distintos por aplicación, para que de esa forma se puedan compartir en el mismo servidor aplicaciones que utilicen distintas versiones del archivo gxclassr.zip, y que no haya necesidad de agregar un ‘package name’ para poder tener diferentes aplicaciones en el mismo servidor.

Para hacerlo hay que armar el war correspondiente a cada aplicación con el War Deployment y copiarlo al directorio:

C:\resin\webapps.

Automáticamente al bajar y subir el RESIN se instalará la aplicación con todo lo necesario para su ejecución.

Para llamar al panel la URL será:

http://localhost:8080/nombre_de_aplicación/servlet/hnomwbp

### 11.2 Conexión con otros web servers

Resin es multiplataforma y soporta tener conexiones con Apache, IIS, Netscape y&nbsp;O'Reilly.  

La documentación de cómo utilizar estos servidores se instala con el Resin, y se puede acceder, una vez finaliza la instalación, desde nuestro ordenador local.  

Con estas URLs se puede acceder a través de nuestro odenador a las las fuentes de la información:  

* Apache UNIX: http://localhost:8080/ref/cse-apache-unix.xtp 
* Apache Win32: http://localhost:8080/ref/cse-apache-win.xtp 
* IIS: http://localhost:8080/ref/cse-iis.xtp Netscape: 
* http://localhost:8080/ref/cse-netscape.xtp 
* O'Reilly: http://localhost:8080/ref/cse-oreilly-website.xtp 

<img src="images/c2/4-7-126.png">

<img src="images/c2/4-7-127.png">

## 12. Configuración del servidor. Instalación de Java Bridge

En apartados anteriores explicamos la instalación del paquete Xampp, el cual, como recordaremos, contiene Apache, MySQL y PHP. Para instalar Java Bridge necesitaremos, en caso de no haber instalado previamente Xampp o algún otro paquete equivalente: 

#### Archivo JDK

El archivo JDK, el cual lo podremos descargar de la página oficial de http://www.oracle.com

#### Descargar el Apache Tomcat

También necesitaremos descargar el Apache Tomcat, que lo podemos conseguir en su página oficial http://www.apache.org Aquí podremos descargar su instalador o el archivo comprimido .zip. Es más recomendable hacerlo mediante el zip, ya que posee los ficheros indispensables para la configuración del Tomcat en NetBeans (este aspecto ya fue explicado en el apartado 2.2).

#### Descargar el archivo zip de JavaBridge

Con estos dos archivos instalados procedemos a descargar el archivo zip de JavaBridge en el enlace siguiente: https://sourceforge.net/projects/php-java-bridge/

#### Mover archivo JavaBridge.war

En el archivo comprimido encontraremos dentro un fichero llamado JavaBridge.war. Tomamos dicho archivo y lo movemos a la carpeta webapps del Tomcat instalado.

#### Incluir JavaBridge en el directorio htdocs del Xampp

A continuación, se creará un directorio llamado JavaBridge. Esta carpeta se deberá incluir en el directorio htdocs del Xampp, instalado en nuestro ordenador.

#### Modificar fichero Java.inc

Posteriormente, seleccionamos el fichero Java.inc y lo modificamos, donde quitaremos los comentarios de la línea siguiente: define (“JAVA_HOSTS”, “127.0.0.1:8080”);

#### Crear programa en algún proyecto php

Luego, crearemos un programa en alguno de los proyectos php que tengamos y de esta manera lo probamos.

<img src="images/c2/4-7-128.png">

#### Instalación exitosa

Si podemos ver las propiedades del sistema, podemos decir que la instalación ha sido exitosa.

#### Para saber más...

Si quieres añadir librerías Java para emplearlas en los proyectos PHP, solamente será necesario incluirlas en el directorio WEB_INF/librerías de JavaBridge.war y se incorporan en el Tomcat.  

<img src="images/c2/4-7-129.png">

<img src="images/c2/4-7-130.png">

## Resumen Final

En la medida que la tecnología se actualiza, las aplicaciones web toman mayor importancia en el campo de trabajo de los programadores y desarrolladores web. Esto es debido a que ofrecen una serie de ventajas que hacen que sus funcionalidades sean más potentes y que sean más usables para los clientes y usuarios en general.  

Es por ello que, existen muchos lenguajes de programación y entornos de desarrollo que se benefician de este avance (entre los que se encuentran PHP, Java, Python, Perl, etc.) y entornos de desarrollo como NetBeans, que ofrece una herramienta de trabajo apropiada para varios de los lenguajes mencionados.  

Una página con la extensión .jsp está basada en una tecnología que permite la creación de contenido web estático (representado por algún formato de texto) y dinámico (que son los elementos JSP propiamente dichos). La tecnología JSP permite la creación de Servlets a partir de archivos de texto, donde se integra algún lenguaje de marcado y un script.  

Los Servlets son componentes Java que se generan del lado del servidor y que son los encargados de gestionar conexiones HTTP a través de un ciclo de vida. Este ciclo de vida tiene las siguientes fases: 

1. Inicialización del Servlet. 
2. Petición del cliente. 
3. Respuesta del servidor. 
4. Finalización del Servlet. 

La seguridad es fundamental para el mantenimiento de cualquier aplicación web y esto no es ajeno a las páginas JSP. Existen varios métodos que proporcionan soporte para el aseguramiento de nuestras aplicaciones. Estos son: 

1. Autenticación de usuarios. 
2. Validación de los usuarios por un medio de un identificador y una clave. 
3. Finalizar sesión, de esta forma se deshabilita la sesión HTTP.  

EJB es un entorno de programación que fue diseñado para trabajar del lado del servidor. Facilita el uso de una infraestructura distribuida con el lenguaje de programación Java. Este entorno fomenta la portabilidad y la reutilización de los servicios.  

Para que la implementación de un EJB sea exitosa, no se requiere nada más que un servidor de aplicaciones y los componentes asociados él.  

El patrón de diseño MVC es el más idóneo y recomendado para dar respuesta a los elementos de dinamismo en las aplicaciones web. Este patrón está formado por tres elementos principales: 

* El Modelo que incluye la lógica del negocio. 
* La Vista que es la interfaz que maneja el usuario.  
* El Controlador que responde a los eventos entre la vista y el modelo. 

En esta unidad hemos cubierto las características básicas del lenguaje PHP, incluyendo variables, estructuras de control y funciones. Se han mostrado los aspectos fundamentales sobre la sintaxis de este lenguaje de programación y con la práctica constante, conseguiremos ser más productivos.  

Además de su sintaxis básica, PHP posee una librería estándar (SPL) que posee elementos más avanzados, como son los iteradores y arreglos que permiten mejorar, aún más, la programación en este lenguaje del lado del servidor.  

Para el mantenimiento de estado de PHP existen varias técnicas que permiten hacer seguimiento de sesión entre los protocolos HTTP. Estas técnicas son, resumidamente, las siguientes: colocar campos ocultos en los formularios con el fin de enviar los datos por medio de los métodos GET o POST, las cookies que permiten mantener activas las páginas que visitemos en los navegadores web, las sesiones y reescribir la dirección URL.  

Los servicios web son herramientas que están basadas en distintos protocolos y estándares y que nos ayudan al intercambio de datos entre diversas aplicaciones.  

Algunos servicios web son los siguientes: 

* Services_ExchangeRates 
* Services_Weather
* OAuth 
* SCA 
* SOAP 
* YAR 
* XML_RPC 

Una de las herramientas adicionales a la programación web con PHP es Ajax, un lenguaje que permite recargar una página sin necesidad de actualizarla constantemente. Es bueno integrarlo con PHP porque es un lenguaje orientado a objetos y confiable. Por tanto, al fusionar estos dos elementos se pueden crear aplicaciones web mucho más profesionales.  

El servidor Resin es un servidor web y, además, es un servidor de aplicaciones Java. Resin Pro está disponible para entornos empresariales con una licencia comercial. Resin es afín con el estándar Java EE, así como con un motor similar a mod_php / PHP llamado Quercus. Hay disponible una versión gratuita.  

En esta unidad se explicaron también los pasos para la instalación del servidor Java Bridge que facilita la conectividad entre Java y PHP. 


## BIBLIOGRAFÍA

* Babin, L. (2007). Introducción a AJAX con PHP. Madrid. Ediciones ANAYA Multimedia
* Cadenhead, R. y Lemay, L. (2008). Java 6. Madrid. Ediciones ANAYA Multimedia
* Perens, B. (2004). PHP 5 Power Programming. Indianapolis. Prentice Hall
* Roldán, D., Valderas, P. y Pastor, O. (2010). Aplicaciones Web, unenfoque práctico. México. Alfaomega Ra-Ma
* Roman, E., Rima, P. y Brose, G. (2005). Mastering Enterprise JabaBeans. Indianapolis. Wiley Publishing Inc
* Shach, S. (2005). Análisis y diseño Orientado a Objetos, con UML y el proceso unificado. México. Mc Graw Hill
* Zawodny, J. y Balling, D. (2004). MySQL Avanzado. Madrid. Ediciones ANAYA Multimedia
* Manteniendo el estado. Programación PHP. (23 de septiembre de 2019) Recuperado de
   https://programacionphp.readthedocs.io/es/latest/Tutorial3_Sesiones.md.html
* Los 5 mejores motores de plantillas para PHP. PHP México (23 de septiembre de 2019) Recuperado de
   https://www.phpmexico.com/blog/cursos-y-certificaciones/las-5-mejores-plantillas-para-php/
