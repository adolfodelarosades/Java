# Capítulo 2. Descripción general de la arquitectura: EJB Architecture

![image](https://github.com/adolfodelarosades/Java/assets/23094588/c743b4d2-3092-4d05-a515-e0a8ecb83eb0)

**EJB se trata de infraestructura**. Sus componentes son los bloques de construcción. Con EJB, puede crear grandes aplicaciones. El tipo de aplicaciones que podrían ejecutar todo, desde el back-end de Victoria's Secret hasta los sistemas de manejo de documentos en el CERN. Pero una arquitectura con tanta flexibilidad, poder y escalabilidad no es simple. Todo comienza con un modelo de programación distribuida, donde los clientes, servidores e incluso diferentes piezas de la misma aplicación se ejecutan quién sabe dónde en la red. Pero, ¿cómo encuentra el client en un bean? ¿Cómo lo llama el cliente? ¿Por qué hay diferentes tipos de beans? ¿Ben se casará con J-Lo?

<hr>

**OBJETIVOS**

**Background**

Estamos en este capítulo por antecedentes, no por el objetivo de un examen. Aunque, podría decir que cada objetivo en el examen depende de su comprensión de lo que hay en este capítulo.

Pero no te preocupes, tendremos muchos objetivos a partir del Capítulo 3. En el Capítulo 6, recordará con añoranza este capítulo y recordará cómo era no tener ningún objetivo. Extrañarás este capítulo cuando se haya ido, así que saborea los momentos que tienes con él.

<hr>

### Te acuerdas de esta foto...

Pero era un nivel demasiado alto para llevarnos a alguna parte. Piensa en cuánto falta en esta imagen. Por ejemplo, ¿cómo obtiene el cliente una referencia a algo que se ejecuta en una máquina diferente? ¿Cómo se comunica realmente el cliente con el bean? ¿Cómo es que el servidor puede entrar en medio de una llamada de método de cliente a bean?

Debajo de EJB, se encuentra la tecnología distribuida de Java para la invocación de métodos remotos (RMI). Aunque EJB oculta algunas de las complejidades de RMI del desarrollador de beans, todavía está ahí y, a menos que realmente lo entienda, algunas partes nunca tendrán sentido.

Entonces, comenzamos nuestro descenso desde una vista de alto nivel hasta la sangre y las entrañas de EJB con una lección sobre RMI. Si es uno de los afortunados que ya ha trabajado mucho con RMI, puede omitir esto e ir directamente a la parte donde hablamos sobre las formas en que EJB usa RMI. Pero al menos debería hojearlo, incluso si es un desarrollador de EJB experimentado, aunque solo sea para familiarizarse con la terminología y las imágenes que usaremos en el resto del libro.

Bien, volvamos a donde empezamos: ¿qué falta en esta imagen? Comience por mirar los lugares donde ocurre un milagro...

![image](https://github.com/adolfodelarosades/Java/assets/23094588/b0819f2c-68bf-4b86-9fed-bc068f41a6b6)

Una vista ridículamente de alto nivel de la arquitectura EJB

### Hacer una llamada a un método remoto

Cuando escribe un cliente para acceder a un bean, el cliente es *local* o *remoto*. Un cliente local significa que el cliente se ejecuta en la misma JVM que el bean. En otras palabras, tanto el bean como el cliente viven en el mismo heap. Hablaremos de eso mucho más en el capítulo Client View, pero por ahora, recuerde que local significa mismo *heap/JVM*. Lo más probable es que utilice clientes locales solo con entity beans y solo en circunstancias muy especiales.

Utilizará un cliente *remoto* cuando desee que el mundo exterior utilice un bean. La mayoría de las aplicaciones empresariales tienen un cliente remoto, incluso si algunos de los beans *utilizados* en la aplicación se comunican entre sí como clientes locales. (Exploraremos cada detalle sangriento sobre esto antes de que termine el libro).

Entonces, ¿cómo un objeto en un *heap/JVM* llama directamente a un método en una referencia a un objeto que se ejecuta en otro *heap/JVM*? ¡Técnicamente, no es posible! Las referencias de Java contienen bits que no significan nada fuera de la JVM que se está ejecutando actualmente. Si eres un objeto y tienes una referencia a otro objeto, *ese objeto debe estar en el mismo heap que tú*.

**Java RMI (Remote Method Invocation)** resuelve este problema al proporcionar al cliente un objeto proxy (llamado **stub**) que actúa como intermediario entre el cliente y el objeto remoto. El cliente llama a un método en el *stub*, y el *stub* se ocupa de la comunicación de bajo nivel (sockets y streams) con el objeto remoto.

**Con RMI, su client object actúa como si estuviera haciendo una llamada a un método remoto. Pero lo que realmente está haciendo es llamar a un método en un objeto "proxy" que se ejecuta en el mismo heap que el cliente. El proxy se llama "stub" y maneja todos los sockets y streams de red de bajo nivel.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e1803870-9749-4fcd-a16a-cd5ffd15eee1)

### También hay un "helper" en el servidor...

El objeto remoto tiene el método que el cliente desea llamar. Pero cuando el stub establece una conexión de red con el servidor, *algo* en el servidor tiene que tomar la información del stream entrante y convertirla en una llamada de método en el objeto Remote. *Podría* poner el código de red en su objeto Remote, pero eso anula el objetivo de RMI: hacer que sea tan fácil para su cliente llamar a un método en un objeto a través de la red como llamar a un método en un objeto en el mismo heap. El objetivo de RMI es promover la *transparencia de la red*. En otras palabras, el hecho de que los objetos estén en diferentes máquinas debería ser casi transparente para el desarrollador. Lo que significa para usted... menos código, código más simple.

Entonces, con ese objetivo, RMI también se ocupa del lado del servidor de la llamada al método. La cosa en el lado del servidor que acepta la conexión del socket se llama **skeleton**. Es la contraparte del stub del cliente. En las primeras versiones de RMI, para cada código auxiliar(stub) había un objeto skeleton coincidente. Hoy, sin embargo, eso no siempre es cierto. La *funcionalidad* del skeleton tiene que suceder de alguna manera en el lado del servidor, pero un *objeto* skeleton es opcional. No entraremos en ninguno de los detalles porque no hace ninguna diferencia para nosotros con EJB. La forma en que el contenedor elige implementar su comportamiento skeleton depende del proveedor.

Todo lo que nos importa es que haya *algo* en el servidor con el que el stub sepa cómo comunicarse, y que *algo* sepa cómo interpretar el mensaje del stub e invocar un método en el objeto Remote.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/af368741-66c4-4fae-9513-269b84104bd5)

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿Cómo se puede tener “network transparency - transparencia de red”? ¿Qué sucede si la red o el servidor no funcionan cuando el cliente llama al método remoto? Parece que hay MUCHO más que puede salir mal que si el objeto del cliente simplemente está haciendo una simple llamada de método antiguo a otro objeto en el heap.**

R: Sí, sí. Obviamente entiende que la "transparencia de la red" no es solo un mito, es una mala idea. Por supuesto, la llamada al método remoto puede fallar de maneras que no lo haría una llamada al método local, ¡y el cliente debe estar preparado para eso!

Por eso, en Java RMI, todos los métodos remotos deben declarar una **`java.rmi.RemoteException`**, que es una excepción comprobada. Eso significa que el cliente tiene que manejar o declarar la excepción. En otras palabras, el cliente realmente no puede fingir que la llamada al método no es remota.

Pero espera, hay más: el cliente tiene que hacer algo especial para obtener la referencia al objeto Remote en primer lugar. ¿Y cuál es exactamente esa referencia? Es realmente una referencia al proxy del objeto Remote: el stub.

Entonces no, RMI no le brinda una verdadera transparencia de red. Los diseñadores de RMI quieren que el cliente reconozca que las cosas pueden salir terriblemente mal con la invocación de un método remoto.

Aún así, cuando observa todo lo que debe suceder para realizar una llamada de método remoto (conexión de socket de red, flujos, empaquetar argumentos, etc.), el cliente solo tiene que hacer un par de cosas: usar un proceso de búsqueda especial para obtener la referencia al objeto Remote y envuelva(wrap) las llamadas a métodos remotos en un try/catch. Eso es bastante trivial si se considera lo que se necesitaría si el cliente tuviera que gestionar todo el proceso.

(Y hay incluso una forma de hacerlo más fácil para el cliente, utilizando un patrón de diseño EJB que veremos en el último capítulo).

**P: ¿Soy responsable de construir el stub y el skeleton? ¿Cómo sabe el stub qué métodos tiene mi objeto Remote? De hecho, ¿cómo sabe el cliente qué métodos tiene mi objeto Remote?**

R: No, no es necesario que hagas los stubs y los skeletons. Con *plain old RMI, utiliza el compilador RMI (rmic) para generarlos*. Pero para las otras dos preguntas... le dejaremos pensar por un minuto antes de ver los detalles.

<hr>

<hr>
AQUIIIII
**BRAIN POWER**

En Java, ¿cuál es la mejor manera de decirle al cliente qué métodos puede llamar? En otras palabras, ¿cómo expone sus métodos públicos a los demás?

Piense en la relación entre el código auxiliar y el objeto Remoto real. ¿Qué deben tener ambos en común?

NOTA
(Veremos la respuesta dentro de varias páginas)
