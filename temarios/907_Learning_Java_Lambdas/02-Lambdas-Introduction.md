# Capítulo 2. Introducción a Lambdas

En este capítulo, presentaremos las ideas de lambdas, haremos:

* Analice algunos antecedentes de lambdas y la programación funcional en general.
* Habla sobre funciones versus clases en Java.
* Mire la sintaxis básica de lambdas en Java.

## λs en programación funcional

Antes de analizar las cosas con más profundidad, veamos algunos antecedentes generales de las lambdas.

Si no lo has visto antes, la letra griega λ ( lambda ) se utiliza a menudo como taquigrafía cuando se habla de lambdas.

### Década de 1930 y el cálculo lambda

En informática, las lambdas se remontan al cálculo lambda. Notación matemática para funciones introducida por Alonzo Church en la década de 1930. Era una forma de explorar las matemáticas utilizando funciones y luego fue redescubierta como una herramienta útil en informática.

Formalizó la noción de términos lambda y las reglas para transformar esos términos. Estas reglas o funciones se corresponden directamente con las ideas modernas de la informática. Todas las funciones del cálculo lambda son anónimas, lo que también se ha tomado literalmente en informática.

A continuación se muestra un ejemplo de una expresión de cálculo lambda:

#### Una expresión de cálculo lambda

```sh
λx.x+1
```

Esto define una función anónima o lambda con un solo argumento x. El cuerpo sigue el punto y añade uno a ese argumento.

### Década de 1950 y LISP

En la década de 1950, John McCarthy inventó LISP mientras estaba en el MIT. Este era un lenguaje de programación diseñado para modelar problemas matemáticos y estaba fuertemente influenciado por el cálculo lambda.

Usó la palabra lambda como operador para definir una función anónima.

He aquí un ejemplo:

#### Una expresión LISP

```sh
(lambda (arg) (+ arg 1))
```

Esta expresión LISP se evalúa como una función que, cuando se aplica, tomará un solo argumento, lo vinculará **`arg`** y luego **`1`** lo agregará.

Las dos expresiones producen lo mismo, una función para incrementar un número. Puedes ver que los dos son muy similares.

El cálculo lambda y LISP han tenido una gran influencia en la programación funcional. Las ideas de aplicar funciones y razonar sobre problemas utilizando funciones se han trasladado directamente a los lenguajes de programación. De ahí el uso del término en nuestro campo. Una lambda en cálculo es lo mismo que en los lenguajes de programación modernos y se usa de la misma manera.

## ¿Qué es una lambda?

Entonces, en términos simples, **una lambda es solo una función anónima**. Eso es todo. Nada especial. ***Es solo una forma compacta de definir una función***. ***Las funciones anónimas son útiles cuando desea transmitir fragmentos de funcionalidad reutilizable. Por ejemplo, pasar funciones a otras funciones***.

Muchos lenguajes principales ya admiten lambdas, incluidos **Scala**, **C#**, **Objective-C**, **Ruby**, **C++(11)**, **Python** y muchos otros.

## Funciones vs Clases

Tenga en cuenta que ***una función anónima no es lo mismo que una clase anónima*** en Java. Aún es necesario crear una instancia de una clase anónima en Java en un objeto. Puede que no tenga un nombre propio, pero sólo puede resultar útil cuando es un objeto.

Por otro lado, una función no tiene ninguna instancia asociada. Las funciones están disociadas de los datos sobre los que actúan, mientras que un objeto está íntimamente asociado con los datos sobre los que actúa.

Puede usar lambdas en Java moderno en cualquier lugar donde anteriormente hubiera usado una interfaz de método único, por lo que puede parecer azúcar sintáctico, pero no lo es. Echemos un vistazo a en qué se diferencian y comparemos las clases anónimas con lambdas; clases versus funciones.

### Lambdas en Java moderno

Una implementación típica de una clase anónima (una interfaz de método único) en Java anterior a 8 podría verse así. El método **`anonymousClassmétodo`** llama al método **`waitFor`** y pasa alguna implementación de **`Condition`**; en este caso, dice, espere a que se apague algún servidor:

#### Uso típico de una clase anónima

```java
void anonymousClass() {
    final Server server = new HttpServer();
    waitFor(new Condition() {
        @Override
        public Boolean isSatisfied() {
            return !server.isRunning();
        }
    });
}
```

La lambda funcionalmente equivalente se vería así:

#### Funcionalidad equivalente a lambda

```java
void closure() { 
     Server server = new HttpServer();
     waitFor(() -> !server.isRunning()); 
 }
```

En aras de la integridad, un método de encuesta ingenuo **`waitFor`** podría verse así:

```java
class WaitFor {
    static void waitFor(Condition condition) throws   
    InterruptedException {
        while (!condition.isSatisfied())
            Thread.sleep(250);
    }
}
```

### Algunas diferencias teóricas

En primer lugar, ambas implementaciones son de hecho closures; la última también es una lambda. Veremos esta distinción con más detalle más adelante en la sección Lambdas vs closures. Significa que ambos tienen que capturar su "environment" en tiempo de ejecución. En Java anterior a 8, esto significa copiar las cosas que el closure necesita en una instancia de una clase (instancias anónimas de **`Condition`**). En nuestro ejemplo, la variable del servidor debería copiarse en la instancia.

Como es una copia, debe declararse final para garantizar que no se pueda cambiar entre el momento de su captura y su uso. Estos dos momentos podrían ser muy diferentes dado que los closures se utilizan a menudo para diferir la ejecución hasta algún momento posterior (consulte la evaluación diferida, por ejemplo). El Java moderno utiliza un ingenioso truco mediante el cual, si puede razonar que una variable nunca se actualiza, también podría ser final, por lo que la trata efectivamente como final y no es necesario declararla explícitamente como final.

Por otro lado, una lambda no necesita copiar su entorno ni capturar ningún término. Esto significa que puede tratarse como una función genuina y no como una instancia de una clase. ¿Cual es la diferencia? Infinidad.

### Funciones vs Clases
AQUIIIIII
Para empezar, funciones; funciones genuinas, no es necesario crear instancias muchas veces. No estoy seguro de si creación de instancias es siquiera la palabra correcta cuando se habla de asignar memoria y cargar un fragmento de código de máquina como una función. El punto es que, una vez que esté disponible, se puede reutilizar, es de naturaleza idempotente ya que no retiene ningún estado. Los métodos de clases estáticas son lo más parecido que tiene Java a las funciones.

Para Java, esto significa que no es necesario crear una instancia de una lambda cada vez que se evalúa, lo cual es un gran problema. A diferencia de la creación de instancias de una clase anónima, el impacto en la memoria debería ser mínimo.

En términos de algunas diferencias conceptuales entonces:

Se deben crear instancias de las clases, mientras que las funciones no.
Cuando se actualizan las clases, se asigna memoria para el objeto.
La memoria sólo necesita asignarse una vez para las funciones. Se almacenan en el área permanente del montón.
Los objetos actúan sobre sus propios datos, las funciones actúan sobre datos no relacionados.
Los métodos de clases estáticas en Java son aproximadamente equivalentes a funciones.
Algunas diferencias concretas
Algunas diferencias concretas entre funciones y clases incluyen su semántica de captura y cómo ocultan las variables.

Capturar semántica
Otra diferencia tiene que ver con la semántica de captura para esto. En una clase anónima, esto se refiere a la instancia de la clase anónima. Por ejemplo, Foo$InnerClassy no Foo. Es por eso que tiene una sintaxis ligeramente extraña, como Foo.this.xcuando se refiere al ámbito adjunto de la clase anónima.

Por otro lado, en lambdas, esto se refiere al alcance adjunto (Foo directamente en nuestro ejemplo). De hecho, las lambdas tienen un alcance completamente léxico , lo que significa que no heredan ningún nombre de un supertipo ni introducen un nuevo nivel de alcance; puede acceder directamente a campos, métodos y variables locales desde el ámbito adjunto.

Por ejemplo, esta clase muestra que lambda puede hacer referencia a la firstNamevariable directamente.

ejemplo de clase pública {
    cadena privada nombre = "Jack";

    ejemplo de vacío público() {
        Función<Cadena, Cadena> agregarApellido = apellido -> {
            // equivalente a this.firstName
            devolver nombre + " " + apellido; // o incluso,   
            este.primerNombre
        };
    }
}
Aquí, firstNamees una abreviatura de this.firstNamey debido a que se refiere al ámbito adjunto (la clase Example), su valor será "Jack".

La clase anónima equivalente tendría que hacer referencia explícita firstNamedesde el ámbito adjunto. No puedes usar esto como en este contexto, esto significa la instancia anónima y no existe firstNameallí. Entonces, se compilará lo siguiente:

ejemplo de clase pública {
    cadena privada nombre = "Charlie";

    public void otro ejemplo() {
        Función<Cadena, Cadena> agregarApellido = nueva Función<Cadena,  
        Cadena>() {
            @Anular
            aplicación de cadena pública (apellido de cadena) {
                return Ejemplo.este.primerNombre + " " + apellido;   
                // DE ACUERDO
            }
        };
    }
}
pero esto no lo hará.

ejemplo de clase pública {
    cadena privada nombre = "Charlie";

  public void otro ejemplo() {
    Función<Cadena, Cadena> agregarApellido = nueva Función<Cadena,   
    Cadena>() {
      @Anular
      aplicación de cadena pública (apellido de cadena) {
        devuelve this.firstName + " " + apellido; // error del compilador
      }
    };
  }
}
Aún puedes acceder al campo directamente (es decir, simplemente llamando a return firstName + " " + surname) pero no puedes hacerlo usando esto. El punto aquí es demostrar la diferencia en los esquemas de captura para esto cuando se usa en instancias lambdas frente a instancias anónimas.

Variables sombreadas
Hacer referencia a variables sombreadas se vuelve mucho más sencillo de razonar con la thissemántica simplificada. Por ejemplo,

clase pública Ejemplo de sombreado {

    cadena privada nombre = "Charlie";

    ejemplo de sombreado público vacío (nombre de cadena) {
        Función<Cadena, Cadena> agregarApellido = apellido -> {
            devuelve this.firstName + " " + apellido;
        };
    }
}
Aquí, debido a que thisestá dentro de lambda, se refiere al ámbito circundante. Entonces this.firstNametendrá el valor "Charlie"y no el parámetro del método del mismo nombre. La semántica de captura lo deja más claro. Si usa firstName(y suelta this), se referirá al parámetro.

En el siguiente ejemplo, utilizando una instancia anónima, firstNamesimplemente se hace referencia al parámetro. Si desea hacer referencia a la versión adjunta, usaría Example.this.firstName:

clase pública Ejemplo de sombreado {

    cadena privada nombre = "Charlie";

    public void anotherShadowingExample(String firstName) {
        Función<Cadena, Cadena> agregarApellido = nueva Función<Cadena,  
        Cadena>() {
            @Anular
            aplicación de cadena pública (apellido de cadena) {
                devolver nombre + " " + apellido;
            }
        };
    }
}
Resumen
Las funciones en el sentido académico son cosas muy diferentes de las clases anónimas (que a menudo tratamos como funciones en Java anterior a 8). Es útil comprender las distinciones para poder justificar el uso de lambdas por algo más que solo su sintaxis concisa. Por supuesto, hay muchas ventajas adicionales en el uso de lambdas (entre ellas la actualización del JDK para utilizarlas en gran medida).

Cuando echemos un vistazo a la nueva sintaxis lambda a continuación, recuerde que aunque las lambdas se usan de manera muy similar a las clases anónimas en Java, son técnicamente diferentes. No es necesario crear una instancia de Lambdas en Java cada vez que se evalúan, a diferencia de una instancia de una clase anónima.

Esto debería servirle para recordarle que las lambdas en Java no son sólo azúcar sintáctico.
