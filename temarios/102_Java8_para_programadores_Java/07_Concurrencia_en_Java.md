# 7. Concurrencia en Java 65m
   * 29 Programación concurrente 12:51 
   * 30 Programación concurrente 14:07 
   * 31 Runnable, Callable, y ExecutorService 15:16 
   * 32 Código sincronizado y uso de valores atómicos 12:49 
   * 33 Colecciones concurrentes 10:19 
   * Contenido adicional 5
   
# 29 Programación concurrente 12:51 

[Programación concurrente](pdfs/29_Programación_concurrente.pdf)

## Resumen del Profesor

Empezamos un nuevo bloque en el curso de Java 8 para desarrolladores Java profundizando sobre la programación recurrente. 

## Transcripción

<img src="images/29-01.png">
<img src="images/29-02.png">
<img src="images/29-03.png">
<img src="images/29-04.png">
<img src="images/29-05.png">
<img src="images/29-06.png">
<img src="images/29-07.png">
<img src="images/29-08.png">
<img src="images/29-09.png">
<img src="images/29-10.png">

# 30 Thread y su ciclo de vida 14:07 

[Thread y su ciclo de vida](pdfs/30_Hilos_y_su_ciclo_de_vida.pdf)

## Resumen del Profesor

### 30.1 Hilos con la clase `Thread`

Java tiene una clase, `Thread`, para poder crear y manejar hilos diferentes de ejecución al hilo principal.

Sus métodos básicos son:

* `public void run()`: contiene el código que queremos ejecutar en el hilo. **No se debe invocar nunca directamente**.
* `public void start()`: lanza la ejecución del hilo.

El resto de métodos los podemos consultar en la documentación del API.

https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html

### 30.2 Creación de un `Thread`

Una primera forma de crear un hilo es extendiendo la clase `Thread`, y aportando el cuerpo del método `run`:

```java
public class PrimoThread extends Thread {

    //propiedades y constructores

    @Override
    public void run() {
        long n = minimo;
        while(!testPrimalidad(n)) {
            System.out.printf("%d no es primo %n", n);
            ++n;
        }

        System.out.printf("El número primo es %d %n", n);
    }


    public static boolean testPrimalidad(long n) {

        //cuerpo del método
    }
}
```

Para ejecutarlo, tenemos que instanciar la clase, y usar el método `start`:

```java
PrimoThread pt = new PrimoThread(135);
pt.start();
```

### 30.3 Ciclo de vida de un `Thread`

Ciclo de Vida

<img src="images/ciclodevida.jpg">

1. Se llama al constructor de `Thread` para crear el nuevo hilo.
2. Se llama al método `start` para designarlo como ejecutable
3. El planificador lo ejecuta en cuanto el procesador está disponible.
4. El hilo puede pasar a bloqueado por diferentes razones, y no vuelve hasta que pasa de nuevo a ejectuable.
5. Si se utiliza el método `wait`, se pone en estado de espera, y permanece ahí hasta que se ejecuta `notify` o `notifyAll`.
6. El hilo termina cuando finaliza la ejecución de su método `run`.

### 30.4 Pausar la ejecución de un `Thread`

Lo podemos hacer usando el método estático `sleep`. Recibe como argumento un número de *milisegundos*.

```java
Thread.sleep(1000);
```

## Transcripción

# 31 Runnable, Callable, y ExecutorService 15:16 

[Runnable, Callable, y ExecutorService](pdfs/31_Runnable_Callable_y_ExecutorService.pdf)

## Resumen del Profesor

### 31.1 Runnable

Es un interfaz que nos permite crear tareas para ser ejecutadas en *hilos secundarios*. Si nuestra clase ya hereda de otra, no puede heredar a la vez de `Thread`. `Runnable` nos permite solventar esa dificultad. `Thread` tiene un constructor que recibe como argumento un *runnable*.

Podemos utilizar las clases anónimas o las expresiones lambda para crear código más conciso:

```java
//Este trozo de código puede ser muy común si
//el proceso de lanzamiento del hilo está dentro
//de un manejador de eventos, como el click de un
//botón.
new Thread(new Runnable() {
    @Override
    public void run() {
        System.out.println("Hello from Runnable+Thread!!");    
  }
}).start();

//Este código es como el anterior, pero aprovecha la potencia
//de las expresiones lambda.
new Thread(() -> System.out.print("Hello from Lambda Runnable+Thread")).start();
```

### 31.2 `Callable<V>` y `Future<V>`
  
`Runnable` no permite devolver ningún dato a otro hilo, salvo que utilicemos complejos mecanismos de sincronización programados por nosotros mismos. Para facilitar el trabajo, Java nos ofrece el interfaz `Callable<V>` que es, básicamente, un `Runnable` que devuelve un valor.

Para recoger el valor de un `Callable`, necesitamos un `Future`. Se trata de otra interfaz, que representa el resultado de una *computación* asíncrona. Nos permite operaciones como comprobar si la computación ha terminado, cancelarla, esperar a que termine, tomar el valor si ha terminado, … El método `get` nos permite obtener el valor de la ejecución de un `Callable`. Existen diversas formas de obtener un `Future` a partir de un `Callable`, pero siempre nos *invita* al uso de ejecutores.

### 31.3 Ejecutores y pools de hilos

Hasta ahora, el programador tenía que definir y lanzar los hilos de ejecución según su necesidad. Este esquema es válido para aplicaciones pequeñas. Para grandes aplicaciones, hay que separar la administración de los hilos del resto de la aplicación. Esto lo podemos realizar mediante ejecutores (*Executors*).

Java nos ofrece tres tipos de ejecutores (cada uno hereda del anterior)

* `Executor`: soporta el lanzamiento de nuevas tareas, bajo demanda.
* **`ExecutorService`**: **añade a la anterior características que permiten administrar el ciclo de vida**. Este será el más utilizado.
* `ScheduledExecutorService`: añade a la anterior la posibilidad de ejecutar tareas periódicas.

La mejor forma de crear un ejecutor, es utilizando los métodos de los que nos provee `Executors`, a través de un pool de hilos. Este no será más que un conjunto de *worker threads* que estarán siempre dispuestos a ejecutar tareas de tipo `Runnable` o `Callable`.

Los pools pueden ser de tres tipos:

* *Single*: Con un solo hilo de ejecución disponible. Si le pedimos (submit) más de una tarea a la vez, las pone en cola.

* *Fixed*: Indicamos, en el momento de su creación, el número de hilos. Si dispone de n hilos, y enviamos n+1 tareas, las pone en cola.

* *Cached*: Crea hilos conforme enviamos tareas. Reutiliza los hilos cuyas tareas han finalizado, para ejecutar tareas nuevas.

## Transcripción

# 32 Código sincronizado y uso de valores atómicos 12:49 

[Código sincronizado y uso de valores atómicos](pdfs/32_Código_sincronizado_y_uso_de_valores_atómicos.pdf)

## Resumen del Profesor

### 32.1 Introducción

La extensión del texto de esta lección es algo más larga, intentando ofrecer un cierto soporte sobre la sincronización y sus causas. Java ofrece una serie de herramientas de sincronización; su buen uso depende de que el programador maneje conceptos sobre programación concurrente, algunos de los cuales escapan al alcance de este curso.

### 32.2 Interferencia entre hilos

Los hilos se comunican, principalmente, compartiendo el acceso a los atributos y los objetos a los que hacen referencia. Esta comunicación es extremadamente eficiente, pero hace posible dos tipos de errores: errores de interferencia entre hilos y errores de consistencia de memoria. La herramienta necesaria para evitar estos errores es la sincronización.

Supongamos la siguiente clase:

```java
class Counter {
  private int c = 0;

  public void increment() {
    c++;
  }

  public void decrement() {
    c--;
  }

  public int value() {
    return c;
  }
}
```

`Counter` está diseñada para que cada invocación de increment se sume 1 a c, y con cada invocación de decrement se reste 1 de c. Sin embargo, si un objeto contador es referenciado desde varios hilos, la interferencia entre los hilos puede hacer que esto no suceda como se esperaba.

La interferencia ocurre cuando dos operaciones, que se ejecuta en diferentes hilos, pero que actúa sobre los mismos datos, se intercalan. Esto sucede porque las dos operaciones consisten en múltiples pasos, y las secuencias de pasos se superponen.

No parece posible que las operaciones en las instancias de `Counter` se intercalen, ya que ambas operaciones en c son, simples sentencias individuales. Sin embargo, incluso las sentencias simples pueden traducirse en múltiples pasos por la máquina virtual. No vamos a examinar los pasos específicos que la máquina virtual realiza -es suficiente para saber que la única expresión de c++ se puede descomponer en tres pasos:

1. Recuperar el valor actual de c.
2. Incrementar el valor recuperado por 1.
3. Guardar el nuevo valor incrementado en c.

La expresión de c— se puede descomponer de la misma manera, excepto que el segundo paso es un decremento en lugar de un incremento. Supongamos que un hilo A invoca `increment` más o menos al mismo tiempo que un hilo B invoca decrement. Si el valor inicial de c es 0, sus acciones intercaladas pueden seguir esta secuencia:

1. Hilo A: Recuperar c.
2. Hilo B: Recuperar c.
3. Hilo A: Incremento de valor recuperado; resultado es 1.
4. Hilo B: Disminuir el valor recuperado; resultado es -1.
5. Hilo A: Almacena el resultado en c, c es ahora 1.
6. Hilo B: Almacena el resultado en c, c es ahora -1.

El resultado del hilo A se pierde, sobrescrito por el hilo B. Esta secuencia de ejecución es solamente una de las múltiples posibilidades. En otras circunstancias podría ser el resultado del hilo B el que se perdiera, o podría no haber ningún error en absoluto. Debido a que son impredecibles, los errores de interferencia entre hilos pueden ser difíciles de detectar y corregir.

### 32.3 Código `synchronized`

El lenguaje de programación Java proporciona dos métodos básicos sincronización: métodos sincronizados y declaraciones sincronizadas. Para que un método sincronizado, sólo tiene que añadir la palabra clave `synchronized` a su declaración:

```java
public class SyncCounter {
  private int c = 0;

  public synchronized void increment() {
      c++;
  }

  public synchronized void decrement() {
      c--;
  }

  public synchronized int value() {
    return c;
  }
}
```

Si `count` es una instancia de `SyncCounter`, el hacer estos métodos sincronizados tiene el efecto de que no es posible que dos invocaciones a métodos sincronizados sobre el mismo objeto se intercalen. Cuando un hilo está ejecutando un método sincronizado para un objeto, todos los demás hilos que invocan métodos sincronizados para el mismo objeto se bloquean (suspenden su ejecución), hasta que el primer hilo termina con el objeto.

### 32.4 Cerrojos y sincronización

La sincronización se construye alrededor de una entidad interna conocido como el cerrojo intrínseco o monitor de bloque. (La especificación de la API a menudo se refiere a esta entidad simplemente como un “monitor”).

Cada objeto tiene un cerrojo intrínseco asociado con él. Por convención, un hilo que tiene acceso exclusivo y constante a los campos de un objeto tiene que adquirir el cerrojo intrínseco del objeto antes de acceder a ellos, y luego liberarlo cuando termine con ellos. Un hilo se dice que es dueño del cerrojo intrínseco entre el tiempo que se haya adquirido el cerrojo y el que lo haya liberado. Mientras un hilo posee un cerrojo intrínseco, ningún otro hilo puede adquirir el mismo cerrojo. El otro hilo se bloquea cuando intenta adquirir el cerrojo.

### 32.5 Variables atómicas

El paquete `java.util.concurrent.atomic` define clases que soportan operaciones atómicas en variables simples. Todas las clases tienen los métodos `get` y `set`, que funcionan como lectores y escritores en variables volátiles.

Algunas de las clases más usuales son:

* `AtomicInteger`
* `AtomicLong`
* `AtomicBoolean`
* `LongAdder`
* `DoubleAdder`

## Transcripción

# 33 Colecciones concurrentes 10:19 

[Colecciones concurrentes](pdfs/33_Colecciones_concurrentes.pdf)

## Resumen del Profesor

### 33.1 Problemas en colecciones de acceso concurrente

Las colecciones no están exentas de problemas de concurrencia. Uno de los problemas más clásicos es el conocido como productor- consumidor, donde tenemos una colección compartida de tamaño finito, y varios hilos que producen datos y otros hilos que consumen datos. Dados los problemas de *condición de carrera*, podemos tener que los consumidores pueden correr más que los productores, y dejar la colección vacía, o que los productores vayan más rápido que los consumidores, y la colección se llene. Necesitamos un mecanismo de espera y notificación.

### 33.2 `wait` y `notify`

Son método de la clase `Object`, disponibles en cualquier clase Java que implementemos. Nos permiten poner en espera a un hilo, hasta que se cumpla una determinada condición. Posteriormente, podemos notificarle que ya puede continuar con su ejecución, ya que la condición bloqueante ha dejado de cumplirse. Por ejemplo: si la colección se llena, los productores deben esperar a que los consumidores tomen elementos, para poder seguir produciendo.

```java
public synchronized String take() {

   // Esperamos a que esté disponible
     while (empty) {
         try {
             wait();
         } catch (InterruptedException e) {}
     }
     // Modificamos el estado
     empty = true;
     // Notificamos al productor que el estado ha cambiado
     notifyAll();
     return message;
 }

 public synchronized void put(String message) {
     // Esperamos a que el mensaje haya sido leído
     while (!empty) {
         try {
             wait();
         } catch (InterruptedException e) {}
     }
     // Cambiamos el estado
     empty = false;
     // Almacenamos el mensaje
     this.message = message;

     // Notificamos al consumidor que el estado ha cambiado.
     notifyAll();
 }
```

### 33.3 Colecciones concurrentes

Nos evitan reinventar la rueda, programando soluciones como la del productor–consumidor. Existen diferentes tipos, entre los que están:

* **`BlockingQueue`**: **estructura FIFO que bloquea si la cola se queda llena o vacía**.
* `ConcurrentMap`: Map con operaciones atómicas.
* `ConcurrentNavigableMap`: NaviagleMap con búsquedas aproximadas.

#### 33.3.1 `BlockingQueue`

Se trata de una estructura FIFO: first-in-first-out (primero en entrar, primero en salir). conocida en castellano como *cola*. Java nos ofrece diferentes implementaciones:

* `ArrayBlockingQueue`: debemos construirla con una capacidad inicial fija.
* `LinkedBlockingQueue`: su capacidad inicial es `Integer.MAX_VALUE` (el mayor valor entero que podemos almacenar en un `int`).
* `PriorityBlockingQueue`: permite ordenar los elementos según prioridad.
* ...

## Transcripción

## Contenido adicional 5   

[Programación concurrente](pdfs/29_Programación_concurrente.pdf)

[Thread y su ciclo de vida](pdfs/30_Hilos_y_su_ciclo_de_vida.pdf)

[Runnable, Callable, y ExecutorService](pdfs/31_Runnable_Callable_y_ExecutorService.pdf)

[Código sincronizado y uso de valores atómicos](pdfs/32_Código_sincronizado_y_uso_de_valores_atómicos.pdf)

[Colecciones concurrentes](pdfs/33_Colecciones_concurrentes.pdf)



