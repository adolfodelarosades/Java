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

Una expresión de cálculo lambda

λx.x+1
Esto define una función anónima o lambda con un solo argumento x. El cuerpo sigue el punto y añade uno a ese argumento.
Década de 1950 y LISP
En la década de 1950, John McCarthy inventó LISP mientras estaba en el MIT. Este era un lenguaje de programación diseñado para modelar problemas matemáticos y estaba fuertemente influenciado por el cálculo lambda.

Usó la palabra lambda como operador para definir una función anónima.

He aquí un ejemplo:

Una expresión LISP

(lambda (arg) (+ arg 1))
Esta expresión LISP se evalúa como una función que, cuando se aplica, tomará un solo argumento, lo vinculará argy luego 1lo agregará.

Las dos expresiones producen lo mismo, una función para incrementar un número. Puedes ver que los dos son muy similares.

El cálculo lambda y LISP han tenido una gran influencia en la programación funcional. Las ideas de aplicar funciones y razonar sobre problemas utilizando funciones se han trasladado directamente a los lenguajes de programación. De ahí el uso del término en nuestro campo. Una lambda en cálculo es lo mismo que en los lenguajes de programación modernos y se usa de la misma manera.

¿Qué es una lambda?
Entonces, en términos simples, una lambda es solo una función anónima. Eso es todo. Nada especial. Es solo una forma compacta de definir una función. Las funciones anónimas son útiles cuando desea transmitir fragmentos de funcionalidad reutilizable. Por ejemplo, pasar funciones a otras funciones.

Muchos lenguajes principales ya admiten lambdas, incluidos Scala, C#, Objective-C, Ruby, C++(11), Python y muchos otros.
