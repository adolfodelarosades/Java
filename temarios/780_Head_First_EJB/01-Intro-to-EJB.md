# Capítulo 1. Introducción a EJB: Bienvenido a EJB

![image](https://github.com/adolfodelarosades/Java/assets/23094588/cc605442-67b5-478d-995d-a736ce1a55a0)

**Enterprise JavaBeans es fácil**. Bueno, al menos cuando compara EJB con lo que tendría que hacer para escribir su propio servidor empresarial escalable, transaccional, seguro y concurrente. En este capítulo, desarrollaremos, implementaremos y ejecutaremos una aplicación EJB, antes de profundizar en los detalles. Antes de que terminemos, veremos el uso, los beneficios y las características de EJB, y veremos (brevemente) cómo funcionan los contenedores EJB. Echaremos un vistazo de alto nivel a la arquitectura de EJB y aprenderemos sobre los tres tipos de beans. Cuanto más comprenda de este capítulo, menos tendrá que memorizar más adelante, así que no se lo salte. (Si es un experto en EJB, probablemente pueda salirse con la suya con un vistazo rápido).

![image](https://github.com/adolfodelarosades/Java/assets/23094588/f7645aa0-0f8e-469e-8a91-5f1d4916b05a)

EJB admite tres tipos de beans: 

   * Sesión
      * Sin estado
      * Con estado
   * Entidad
   * Controlados por mensajes


## ¿De qué se trata EJB?

**Desarrollo basado en componentes**

Con **Enterprise JavaBeans**, puede desarrollar componentes básicos --***componentes EJB***-- que usted u otra persona pueden ensamblar y volver a ensamblar en diferentes aplicaciones. Por ejemplo, puede crear un **Customer bean** ( ***bean es otra palabra para componente*** ) que *representa a un cliente en una base de datos*. Puede usar ese bean Customer en un programa de contabilidad, un sistema de carrito de compras de comercio electrónico, una aplicación de soporte técnico o prácticamente cualquier otra aplicación que pueda necesitar representar a un cliente. De hecho, con algunos beans, es posible que el desarrollador de beans y el ensamblador de la aplicación no trabajen para la misma empresa ni se conozcan entre sí.

Si es un desarrollador de beans, puede crear un **Order bean**, un **Payroll bean** o un **ShoppingCart** que los desarrolladores de alguna empresa no relacionada puedan comprar y usar para construir sus propias aplicaciones personalizadas.

Una belleza del desarrollo basado en componentes es que lleva la reutilización de código a un nivel completamente nuevo. En lugar de reutilizar las clases de Java, puede reutilizar una mayor parte de la funcionalidad. ¡A menudo, puede modificar la forma en que funciona un bean sin siquiera tocar su código Java! Aprenderá en este capítulo que ***cuando implementa un bean en un servidor, puede configurar y personalizar el bean de forma declarativa, a través de un descriptor de implementación basado en XML, para cambiar la forma en que se comporta el bean en tiempo de ejecución***.

***Con el desarrollo basado en componentes, lleva la reutilización de código a un nivel completamente nuevo. Con el desarrollo OO, reutiliza las clases, pero con los componentes, reutiliza una mayor parte de la funcionalidad y puede personalizarlos sin tocar el código.***

![image](https://github.com/adolfodelarosades/Java/assets/23094588/b5082bf3-a6ea-4221-9562-b476c63d46a5)

#### Aplicación A: online shopping - compra en línea

Fred ensambla una aplicación de compras en línea utilizando dos componentes que compró en **Beans-R-Us**, más un tercer componente que Fred desarrolló en su empresa.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/bbc7ab3d-7e4b-4ee8-ac86-68e5ef0d35fe)

#### Aplicación B: technical support - soporte técnico

Bill ensambla una aplicación de soporte técnico utilizando dos componentes que compró de **Beans-R-Us**, más dos componentes que desarrolló él mismo.

## ¿Qué me da realmente EJB?

EJB le permite concentrarse en la lógica comercial de su negocio y dejar los servicios subyacentes (transacciones, redes, seguridad, etc.) al proveedor del servidor EJB.

Imagina que trabajas para Guitar Land, una empresa que vende equipos de música en línea. Tiene mejores cosas que hacer que trabajar 90 horas a la semana, entonces, ¿dónde le gustaría pasar su tiempo? ¿No preferiría concentrarse en cómo Guitar Land hace negocios en línea, en lugar de escribir su propio servidor de administración de transacciones seguro y en red? ¿Por qué no trabajar en lo que mejor conoce (lógica comercial para su negocio en particular) y dejar el trabajo pesado (es decir, los grandes servicios de infraestructura que obtiene del servidor) a otra persona?

El modelo EJB permite que todos hagan lo que mejor saben hacer: los proveedores de servidores se concentran en la infraestructura que necesitan la mayoría de las aplicaciones empresariales, mientras que los desarrolladores comerciales se concentran en su propia lógica comercial.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/342cefaf-d8af-4b32-9242-d0206e447d18)

**¡EJB le permite personalizar y configurar componentes reutilizables en el momento de la implementación, sin tocar el código fuente!**

Puede cambiar la forma en que un bean usa los servicios subyacentes simplemente modificando un documento XML en el momento de la implementación. Por ejemplo, puede definir completamente el control de acceso de seguridad para los métodos de un bean dentro de XML (declarativamente) en lugar de hacerlo dentro del código fuente del bean (mediante programación). Y puede personalizar la forma en que se ejecutan los métodos de un bean en las transacciones, todo dentro del descriptor de implementación, sin tener que codificar los límites y comportamientos de la transacción. Eso simplemente mola.

**Los servidores EJB le brindan un montón de servicios, para que no tenga que escribirlos usted mismo:**

* Gestión de transacciones
* Seguridad
* Concurrencia
* Redes
* Administracion de recursos
* Persistencia
* Mensajería
* Personalización del tiempo de implementación

<hr>

**NOTA**

Alguien ya escribió y probó todo esto, así que no tienes que hacerlo tú.

<hr>

![image](https://github.com/adolfodelarosades/Java/assets/23094588/09988011-ef48-46ea-a12f-2ef81ed60edd)


## ¡No más vendor lock-in!

Enterprise beans son portátiles, no solo a diferentes JVM, sino también a diferentes servidores EJB.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/6b931360-8cbf-46fe-b807-2e32e668289a)

Una de las razones por las que todos amamos Java es su portabilidad en múltiples plataformas. Todo el asunto de escribir una vez, ejecutar en cualquier lugar (WORA).

EJB lleva la portabilidad a un nuevo nivel, en lugar de escribir una vez ejecutar en cualquier lugar, es escribir una vez implementar en cualquier lugar (WODA). Así como WORA lo libera de verse obligado a trabajar en un solo sistema operativo, WODA lo libera de estar a merced de su proveedor de servidor de aplicaciones. Y luego, por supuesto, está YODA, pero estamos divagando.

En los viejos tiempos, cada proveedor de servidores de aplicaciones tenía su propia API patentada. Lo aprende, trabaja con él y, finalmente, pone en funcionamiento sus aplicaciones empresariales. Y luego adivina qué? Necesitas una nueva función. Y luego adivina qué? Su proveedor dice: "Estamos considerando eso para el tercer trimestre... del próximo año". ¿Ahora que? Como un traficante de drogas, te han enganchado, y ahora es demasiado doloroso considerar renunciar a ellos. ¿Renunciar a ellos para qué? Otro proveedor y otra API propietaria y más bloqueo.

Uno de los beneficios cruciales de EJB es WODA. Y ahora los vendedores tienen que competir no solo para venderte en primer lugar, sino para mantenerte. Porque como todo el mundo sabe, puedes empacar tus beans e irte a otra parte.

#### NO HAY PREGUNTAS TONTAS

**P: ¿Cuál es la diferencia entre EJB y J2EE?**

R: Tanto J2EE como EJB son especificaciones para un servidor. Pero EJB es en realidad un subconjunto de J2EE. En otras palabras, **un servidor J2EE debe incluir un contenedor EJB**. Hemos usado la palabra servidor en estas primeras páginas, pero técnicamente, lo que ejecutan los enterprise javabeans se llama EJB container. Por lo tanto, cada servidor J2EE debe incluir un EJB container (junto con un contenedor web que pueda ejecutar servlets y JSP).

Este examen trata sobre la parte EJB de J2EE, mientras que el examen SCWCD (Desarrollador de componentes web certificado por Sun) trata sobre la parte web de J2EE.

Más adelante en este capítulo, profundizaremos en los detalles de cómo encajan J2EE y EJB.

En el resto de este libro, usaremos los términos servidor EJB, contenedor y servidor de manera intercambiable. Si la diferencia entre los términos importa, lo dejaremos claro.


**P: ¿Puedo usar componentes EJB sin un servidor de aplicaciones compatible con EJB?**

R: No. Los componentes EJB no pueden vivir fuera de un contenedor EJB. No tienen un método principal, e incluso si agrega uno a su clase de bean, el bean no sería muy útil por sí solo. La mayoría de los métodos en un bean empresarial son llamados por el propio contenedor y no tienen significado fuera del servidor. Recuerde, el objetivo de un servidor EJB es brindarle todos los grandes servicios (seguridad, transacciones, etc.), y sin el servidor, perdería todo menos su lógica comercial básica. Y si esa lógica empresarial se basa en el contenedor (por ejemplo, llamar a métodos en las interfaces proporcionadas por el contenedor), incluso la lógica empresarial fallaría.


**P: ¿Puedo diseñar y escribir mi código de tal manera que la mayor parte de la lógica comercial esté en una clase Java simple y antigua, y solo tener los métodos de llamada de bean en esa clase? De esa manera todavía podría reutilizar la lógica de negocios...**

R: Sí, puede hacerlo y, de hecho, muchos diseñadores escriben clases reutilizables separadas que no son beans y luego hacen que los beans invoquen métodos en esas clases. Si su bean llama a un método en una clase Java que no es un bean, ese método todavía está bajo el control del contenedor, por lo que en lo que respecta al contenedor, ese método que no es un bean es solo parte de la funcionalidad del bean.


**P: ¿Cuál es la diferencia entre javabeans normales y enterprise javabeans?**

R: ¡ Felicitaciones! Eres la persona número 3 millones que ha hecho esa pregunta.

El término **"javabean"** significa un componente reutilizable. Los beans normales que no son enterprise beans (y beans son solo una forma más corta de javabeans), son componentes reutilizables que siguen una convención de nomenclatura que pueden usar las herramientas de desarrollo.

Con mucho, el tipo más común de javabean es cualquier componente GUI (como un botón Swing o un campo de texto). Casi todos los IDE de Java son compatibles con javabean, por lo que si está trabajando en una herramienta de diseño visual, puede hacer clic en un botón y aparece una hoja de propiedades donde puede establecer el color, el tamaño, la fuente, etc. La herramienta sabe qué propiedades que tiene el bean porque el bean sigue convenciones para getters y setters.

Pero los javabeans regulares no son solo para componentes de GUI; otras tecnologías de Java, incluidos **Jini** y **Servlets**, pueden usar funciones de javabean.

Enterprise javabeans también son componentes reutilizables, pero ahí es donde termina la similitud. La parte 'bean' de un javabean normal se usa principalmente en tiempo de desarrollo, como una forma de facilitar o acelerar el enlace de eventos de un bean a los métodos de otro bean, o establecer valores de propiedad (que a menudo significan lo mismo que valores de variables de instancia). Un bean normal se ejecuta en una JVM, como cualquier otra clase Java normal. Pero la parte del "bean" de un bean empresarial se activa en tiempo de ejecución, y un bean empresarial debe ejecutarse bajo el control de un contenedor EJB.

**Para el resto del libro, cuando decimos bean, nos referimos a enterprise bean.**

## ¿Cómo funciona todo?

Sus beans se ejecutan bajo el control (y protección) del servidor EJB.

El servidor interviene en medio de cada llamada de método de un cliente a un bean e inserta los "servicios" como seguridad, transacciones y persistencia.

Sus beans viven y se ejecutan en el servidor, y el servidor hace prácticamente todo para administrar transacciones, seguridad, persistencia e incluso la vida o muerte de sus objetos. Y hace todo esto interviniendo cada vez que un cliente realiza una solicitud (es decir, llama a un método comercial en el bean). El servidor salta y comienza a hacer preguntas como:

*"¿Este cliente tiene autorización de seguridad para llamar a este método?"* o

*"¿Es necesario que este bean se ejecute como parte de una transacción más grande?"* o

*"¿Este bean necesita actualizarse con datos de la base de datos antes de ejecutar ese método para el cliente?"*

![image](https://github.com/adolfodelarosades/Java/assets/23094588/7d00f1f6-103a-42f7-93e0-8d318bfbc3e0)

Una vista ridículamente de alto nivel de la arquitectura EJB

### Entre bastidores...

![image](https://github.com/adolfodelarosades/Java/assets/23094588/a6dff7cb-9dde-412a-8fdf-0db3437ee598)

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e029ef16-514a-4f61-b1bc-780362f5fb01)

![image](https://github.com/adolfodelarosades/Java/assets/23094588/504f9668-a5da-43f5-803e-4b85bd78833d)


## Los Beans  vienen en tres sabores.

### Entity

![image](https://github.com/adolfodelarosades/Java/assets/23094588/c51c3bbc-6fbd-4e9f-8d6a-ac9202c5a804)

Utilice un **entity bean** para representar una *cosa* en un almacén persistente. Eso casi siempre significa algo en una base de datos, donde una instancia de un entity bean representa ***una fila en una tabla*** (aunque si la base de datos está normalizada, el bean podría extraerse de filas en varias tablas). Un ejemplo típico de entity es Customer, donde una entity podría representar a ***Bo Olean (ID# 343)*** y otra entity podría representar a ***Trixia Lin (ID# 870)***.

### Message-driven

Utilice un **message-driven bean** solo cuando necesite un consumidor JMS. En otras palabras,***un bean que puede escuchar mensajes de un JMS messaging service***. Los Clients nunca llaman directamente a message-driven beans(beans controlados por mensajes); para que un message-driven beans haga algo, un cliente debe enviar un mensaje a un servicio de mensajería(messaging service). Eso significa que un message-driven bean no tiene **`EJBObject`** porque el servidor recibe las requests del cliente directamente de un servicio de mensajería en lugar de una llamada del cliente al bean. Un message-driven bean típico podría ser un suscriptor **`NewCustomerNotification`**.


### Session

Use un session bean para... **todo lo demás**. Casi cualquier tipo de servicio de back-end puede (y a menudo *debe*) comenzar con un session bean. Donde un entity bean representa una *cosa*, ***un session bean típicamente representa un proceso***. Para decirlo de otra manera, cuando piense en entity bean, piense en sustantivo, y cuando piense en session bean, piense en verbo. Una sesión de compras es un ejemplo típico de un session bean, mientras que un sistema de procesamiento de tarjetas de crédito podría ser otro bean de sesión.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/5cf3a62e-c342-4199-8174-045ceb78d794)


## Los Session beans pueden ser stateless o stateful(sin estado o con estado)

Repasaremos todo esto en detalle en el capítulo Session Bean. Por ahora, debe saber que los session beans se pueden marcar (en el momento de la implementación(deployment time)) como ***stateless*** o ***stateful***.

Un stateful bean puede recordar el estado conversacional entre llamadas a métodos, mientras que un stateless bean no recordará nada sobre el cliente entre invocaciones a métodos.

La frase "conversational state- estado conversacional" en realidad significa "estado específico del cliente", y un ejemplo típico es un carrito de compras. No sería divertido si usted (el comprador) tiene un carrito, pone algo, pero cuando va a poner la segunda cosa, la primera desaparece del carrito. No demasiado fácil de usar. Por lo tanto, un buen carrito de compras mantendrá el estado de comprador del cliente (es decir, los artículos en el carrito) mientras la sesión de compras esté activa. (Explicaremos lo que queremos decir con vivo en el capítulo Session Bean).

Los Stateless beans(beans sin estado) simplemente se olvidan del cliente una vez que se completa la llamada al método. Entonces, los beans sin estado son para servicios que no requieren una conversación continua entre el cliente y el servicio. Eso no significa que el cliente no seguirá llamando a métodos en el bean sin estado, pero sí significa que el cliente no puede depender de que el bean recuerde nada sobre las llamadas a métodos anteriores.

<hr>

**WATCH IT!**

**¡Los Stateless beans PUEDEN tener estado! (Simplemente no es un estado específico del cliente).**

Algunas personas piensan que “stateless” significa “no state”. Un stateless bean puede tener variables de instancia como cualquier otro objeto; simplemente no puede usarlos para mantener valores específicos para un cliente en particular.

<hr>

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: Escuché que solo los beans de sesión sin estado(stateless session) son escalables y que nadie debería usar beans de sesión con estado(stateful session beans) . ¿Es eso cierto?**

R: No, no completamente. Es cierto que los beans de sesión sin estado generalmente son más escalables que los beans de sesión con estado debido a la forma en que el contenedor administra los beans sin estado. Verá las razones de esto en el capítulo Session Bean.

Pero... eso no significa que nunca debas usar beans con estado. Debe considerar beans con estado cuando necesite un estado conversacional, y cuando las alternativas para guardar ese estado (como usar el cliente para almacenar el estado, o usar un servlet para almacenar el estado, o usar una base de datos para almacenar el estado entre cada llamada de método del cliente ) afectan más el rendimiento que la naturaleza menos escalable de los beans de sesión con estado.

<hr>

<hr>

**HAZ QUE SE PEGUE - MAKE IT STICK**

Un entity bean **ES** algo. Un session bean **HACE** algo.

<hr>

<hr>

**SACA PUNTA A TU LÁPIZ**

**Conozca sus bean types.**

Mire la descripción del problema a la izquierda y coloque una marca de verificación para el tipo de bean que mejor se adapte al problema. No hay una respuesta correcta perfecta para esto... puede decidir que un tipo de bean funcionará si lo aborda de una manera, pero otro bean funcionará si resuelve el problema de una manera diferente.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/3b431947-3556-4955-8535-5db1091ef17d)

![image](https://github.com/adolfodelarosades/Java/assets/23094588/fef60514-2b88-4cf1-994d-44d4cdf63eff)


<hr>

#### ESCUCHADO EN EL TIKUIBEAN LOUNGE

* **SESSION BEAN**: Estoy tan cansada de hacer todo el trabajo y no obtener nada de la gloria.

* **BARTENDER-CANTINERO**:  ¿Qué quiere decir con "nada de la gloria"? ¿No eres el único bean que ha requerido la especificación desde el principio? ¿Desde EJB 1.0?

* **SESSION BEAN**:  ESO me hace mucho bien. De lo único que todos quieren hablar ahora es de entity beans. Entity beans,entity beans, entity beans. No es que no me gusten, algunos de mis mejores amigos son entity beans, pero me gustaría que la gente hablara sobre lo que hago.

* **BARTENDER-CANTINERO**:  Ahora que lo menciona, los entity beans son principalmente de lo que habla la gente aquí en el bar, con las grandes mejoras de CMP en EJB 2.0.

* **SESSION BEAN**: Y eso es otra cosa... ¿Cuál es el Gran Trato con CMP? ¡Simplemente va a una base de datos! En serio, dime ¿QUÉ tiene eso de especial? “¡Ooohhh mira! ¡Actualizó un registro!” Por favor.

* **BARTENDER-CANTINERO**:  Sí, pero a los programadores de aquí parece gustarles no tener que hacer todo el código de la base de datos ahora. Y hay algo acerca de las relaciones persistentes, simplemente no puedo recordar...

* **SESSION BEAN**: CMR. Relaciones gestionadas por contenedores. Vale, incluso yo tengo que admitir que CMR facilita mucho las cosas a los desarrolladores. Pero eso no es lo que me molesta: SÉ que a todos les gustan los entity beans, pero ¿qué hay de MÍ? ¿Qué pasa con todo lo que hago? Los entity beans representan cosas en el sistema, pero sin mí, esas cosas no sirven de mucho. Tal vez una entidad tenga algunos getters y setters y algunas consultas, seguro, pero no mucha lógica empresarial. Para usar entity beans en una aplicación, TIENE que usar beans de sesión para realizar el procesamiento comercial. Por ejemplo, un entity beans podría representar las bebidas que vende aquí y los clientes individuales, pero ¿de qué sirven las bebidas y los clientes sin un cantinero? ¡Necesitas a alguien que realmente reúna las entidades (las bebidas y los clientes) de una manera significativa! Y eso es lo que hacen los beans de sesión. Hacemos los tratos. Trabajamos con el cliente para hacer algo, mientras que las entidades simplemente se sientan allí esperando que los beans de sesión los usen. Oye, ¿puedo conseguir otro de esos? Y ni siquiera me hagas empezar con message-driven beans...

[Continuará.]

<hr>

<hr>

**BULLET POINET**

* EJB es un modelo de desarrollo basado en componentes.
* Los componentes son fragmentos reutilizables de funcionalidad que puede modificar para diferentes aplicaciones sin tocar el código fuente de Java.
* Un beneficio de EJB es WODA—Write-Once-Deploy-Anywhere. Puede implementar sus componentes EJB 2.0 en cualquier servidor de aplicaciones que sea compatible con EJB 2.0.
* WODA significa que debe aprender solo una API estándar en lugar de las API específicas del proveedor.
* La arquitectura EJB usa un EJBObject para interceptar llamadas de clientes a un bean. Esto le da al servidor/contenedor la oportunidad de intervenir y agregar servicios.
* Los servicios EJB incluyen transacciones, seguridad, gestión de recursos, redes y persistencia.
* Los beans vienen en tres sabores: Entidad, Sesión y Mensaje.
* Los beans de entidad representan una cosa identificable de forma única en un almacén persistente; por lo general, eso significa una fila en una tabla de base de datos.
* Los beans controlados por mensajes son consumidores de servicios de mensajería JMS.
* Los beans de sesión son... todo lo demás .
* Los beans de sesión pueden ser con estado o sin estado.
* Los beans con estado pueden recordar el "estado conversacional" con un cliente, mientras que los beans sin estado no pueden.


## Ejemplo: The Advice Guy bean - El Chico de los Consejos bean

Antes de adentrarnos en las entrañas de EJB, veamos cómo desarrollar, implementar y probar un bean de principio a fin. Si aún no está familiarizado con EJB, no entenderá todo aquí. No te preocupes por eso ahora; lo resolveremos todo en capítulos posteriores. Esto es solo para darle una idea de lo que es poner en marcha un bean.

Nuestro primer bean es para el servicio Advice Guy, un servicio remoto que devuelve una cadena de consejos cada vez que el cliente realiza una solicitud. Pasaremos las próximas páginas analizando el proceso, y luego haremos este bean, como un tutorial.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/37df4815-6bb0-48dd-9e1f-9affa801ccc6)

**El Chico de los Consejos [ 1 ]**

Nuestro primer bean es para el servicio Advice Guy. Cada vez que el cliente hace una solicitud(request), el servicio Advice Guy (un enterprise javabean) devuelve un consejo increíblemente útil (y sobrenaturalmente apropiado).

[ 1 ] En Head First Java, implementamos el servicio Advice Guy usando sockets TCP directos. Ahora, por solo cinco veces la cantidad de código y esfuerzo, podemos tener el mismo servicio en EJB. Por supuesto, si uno quisiera, podría argumentar que Advice Guy realmente no necesita todos esos servicios EJB, pero no estamos de acuerdo. Ya estamos planeando la oferta pública inicial para este bebé.

## Cinco cosas que haces para construir un bean:

1. Codifique la **bean class - clase de bean** con todos los business methods.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/a1db7663-fd33-492d-beac-3eb5ff1fd097)


2. Codifique dos **interfaces** para el bean: ***home*** y ***component***.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/ec2ba89e-2891-42b1-92e7-fa8cf3f4a378)


3. Cree un XML **deployment descriptor** que le diga al servidor qué es su bean y cómo debe administrarse. Debe nombrarlo **ejb-jar.xml**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/656a9d13-5b69-4809-aea4-c8ecdca9827e)


4. Coloque el bean, las interfaces y el deployment descriptor en un archivo **ejb-jar**. (Puede haber más de un bean en el **ejb-jar**, pero siempre habrá un solo deployment descriptor).
   
![image](https://github.com/adolfodelarosades/Java/assets/23094588/1eb5f659-1df3-402d-965a-0893bd7293eb)

5. Implemente(Deploy) el bean en el servidor, utilizando las herramientas proporcionadas por el proveedor del servidor.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/20044c2a-f2da-4f45-b4ac-07ba213e98a5)


<hr>

**RELAX**

**No es necesario ser un experto en XML.**

De hecho, no tiene que saber nada sobre cómo funciona XML. Necesita conocer muchas de las tags del deployment descriptor, pero no necesita conocer XML para aprender las etiquetas. Si piensa en las tags como simples etiquetas en un documento, con requisitos muy específicos para lo que puede escribir dentro de esas tags, entonces todo lo que necesita saber para el examen es el nombre y los requisitos, para algunos de los más etiquetas importantes (tags). Veremos esas etiquetas cruciales en varios capítulos.

<hr>

![image](https://github.com/adolfodelarosades/Java/assets/23094588/a96208e5-ef79-471e-a024-dea35430eef7)


1. **bean class**
2. interfaces
3. XMLDD
4. ejb-jar
5. deploy

![image](https://github.com/adolfodelarosades/Java/assets/23094588/88ce36b9-65f9-4933-b976-1337a7ec51ed)

1. Escriba la **bean class - clase de bean** con los métodos de negocios reales que llama el cliente.

   Aquí es donde todo sucede. La implementación de sus métodos de negocios definidos en la interfaz del componente. En otras palabras, escribe su lógica comercial en la clase de bean.

   Hay tres tipos de beans para elegir, **Session**, **Entity**, y **Message-driven**, y cubriremos cada uno en detalle en capítulos posteriores del libro. Sin embargo, antes de crear un bean, debe decidir qué tipo necesita porque su clase de bean debe implementar una de las tres interfaces, según el tipo que elija.

   Hemos elegido un **Session bean - bean de sesión** aquí porque es perfecto para la aplicación **Advice Guy**. **Advice Guy** devuelve un String de consejos cuando invocas el método de nombre sorprendente **`getAdvice()`**. Así que nuestra bean class (en la página siguiente) implementa la **SessionBean interface**. Y **SessionBean** no es solo una interfaz de marcador[ 2 ], tiene métodos que su bean class debe implementar.

   Los métodos que implementa desde la **interfaz SessionBean** se conocen como **container-callbacks**, porque el contenedor los usa para notificarle los hitos importantes en la vida del bean.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/997bd7db-4e58-4e60-9ddc-bc33bfdae4c4)

<hr>

**WATCH IT!**

**Debe saber cómo escribir todo el código a mano, sin usar una herramienta de desarrollo preparada para EJB.**

*Se espera que sepa cómo escribir las dos interfaces y la bean class (o, para message-driven beans, solo la bean class). Eso significa que NO debe usar una herramienta de desarrollo compatible con EJB que cree parte del código de la interfaz o del bean para usted, hasta que esté seguro de que sabe exactamente qué código está creando la herramienta para usted.*

*Hay un montón de reglas que debes saber para el examen, y en los próximos capítulos entraremos en detalles sangrientos. Por ahora, no se preocupe por memorizar nada del código de este ejercicio. Solo sepa que NECESITARÁ aprenderlo todo antes de que terminemos.*

*Sin embargo, hay buenas noticias: PUEDE usar una herramienta para crear el descriptor de implementación XML. ¡El examen no espera que memorice todas las etiquetas XML! (Aunque necesitará conocer algunos elementos; los cubriremos más adelante).*

<hr>

#### Bean class

![image](https://github.com/adolfodelarosades/Java/assets/23094588/6d96c100-f3d8-431d-ab1a-f885298af71e)

**AdviceBean** implementa la **interfaz SessionBean**, por lo que debe implementar los métodos declarados en **`javax.ejb.SessionBean`**. Te interrogaremos sobre todo un poco más tarde, por ahora, solo recuerda que la clase bean es donde va tu lógica comercial real. En otras palabras, la razón por la que tu bean existe en primer lugar. Para el Advice Guy(chico de los consejos), eso significa el método **`getAdvice()`**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/6105f7ac-9538-4191-a453-1e0899720100)

1. bean class
2. **interfaces**
3. XMLDD
4. ejb-jar
5. deploy

![image](https://github.com/adolfodelarosades/Java/assets/23094588/8c8a220c-1c38-4567-9a4d-81760013790f)


2. Escriba las dos **interfaces** para el bean.

   *Estas son las interfaces que ve el cliente. Tenemos un capítulo completo dedicado a estas interfaces, por lo que no es necesario que lo entienda todo ahora.*

   **COMPONENT interface**

   *Aquí es donde se declaran todos los **métodos de negocio**. En otras palabras, es donde pones los métodos que el cliente quiere llamar.*

   ![image](https://github.com/adolfodelarosades/Java/assets/23094588/e165d7e4-7dc3-40b0-ab4d-8e6f8cf2d488)


   **component interface: business methods**

   ![image](https://github.com/adolfodelarosades/Java/assets/23094588/540e7f29-de0e-4f95-bf63-bb29619c6aa0)



   **HOME interface**

   El cliente utiliza la ***home* interface** para solicitar una referencia a la ***component* interface**. El home es el punto de partida del cliente para obtener una referencia a un bean (o al menos lo que el cliente cree que es el bean, pero hablaremos de eso más adelante). Por ahora, piense en el home como una especie de *factory* que elabora y distribuye bean references a los clientes.

   ![image](https://github.com/adolfodelarosades/Java/assets/23094588/3e16a1c0-2ea8-459f-8b6e-191a91c12829)


   **home interface: *a factory for bean references***
   ![image](https://github.com/adolfodelarosades/Java/assets/23094588/986ada2e-b2a6-4bf4-8a6a-81e45c1daafd)



   Hmmm... dos buenas preguntas. En un mundo Java sin beans, la forma en que estamos haciendo las cosas aquí no tendría mucho sentido. Pero el mundo bean tiene reglas y prácticas diferentes. *Podríamos* escribir las interfaces primero, y algunos desarrolladores lo hacen. A veces, la elección de cuál desarrollar primero depende de las herramientas de desarrollo que esté utilizando para construir sus beans. Algunas herramientas, por ejemplo, esperan que primero construya su bean (codificando la lógica comercial real(business logic)), y luego la herramienta construirá las interfaces para que coincidan. Y algunas herramientas hacen todo lo contrario, observan las interfaces y crean una clase bean "su código va aquí", con todos los métodos de la interfaz. Para aprender EJB, nos gusta comenzar con el bean, centrándonos en la lógica de negocio, antes de descubrir las interfaces. Más adelante en el libro, lo haremos al revés.

   En cuanto al bean que no implementa la interfaz del componente, podría hacerlo de esa manera, pero esta vez le recomendamos encarecidamente que no lo haga. En la página siguiente, veremos esto con más detalle.

   ![image](https://github.com/adolfodelarosades/Java/assets/23094588/78c7102e-4955-4016-b787-23738763d05a)

<hr>

#### NO HAY PREGUNTAS TONTAS

**P: Entonces, ¿por qué la clase bean(AdviceBean) no implementa la component interface (Advice) si tiene que implementar los mismos métodos? Las clases de Java pueden implementar más de una interfaz, entonces, ¿cuál es el problema de decir:**

```java
class AdviceBean implements Advice, SessionBean
```

*R: Legalmente, la clase bean puede implementar la interfaz del componente, pero la especificación no lo recomienda. Recuerde, aunque para el cliente parezca que **`AdviceBean`** es el objeto en el que invoca los métodos del cliente (el objeto que implementa, en el verdadero sentido de Java, la interfaz del componente), el cliente realmente invoca métodos en algo llamado **`EJBObject`**, que está implementado por el servidor en tiempo de implementación. El cliente nunca interactúa directamente con el bean. Nunca, nunca, nunca. Más adelante en el libro, verá que si el bean implementa la interfaz del componente, podría colar cosas más allá del compilador que explotarían en tiempo de ejecución. Por lo tanto, **le recomendamos encarecidamente que no haga que su bean implemente la interfaz del componente**.*

*Pero también hay otro problema: la interfaz del componente amplía otra interfaz. En nuestro ejemplo, **`Advice`** amplía **`EJBObject`** y **`EJBObject`** no es una  marker interface. ¡Tiene métodos! Esto significa que cualquier clase que implemente **`Advice`** también debe implementar los métodos de **`EJBObject`**!*

Entonces, su bean terminaría implementando un montón de métodos que nunca debería tener (como **`getHandle()`**, **`getEJBHome()`**...)

**P: Pero hay una solución fácil para ESE problema: puede hacer que el bean amplíe una clase que tenga todas las implementaciones que necesita para satisfacer al compilador, pero que realmente no necesita implementar en su código. Como las clases de escucha de eventos del adaptador en AWT. ¿Por qué no hacer algo así aquí y crear una superclase para su bean que implemente los métodos?**

*R: Sí, podrías hacer eso y sería legal. Pero aún significa que su bean es capaz de invocar métodos que el bean nunca debería conocer. Los métodos de **`EJBObject`** son métodos para que el cliente llame al bean, pero NO para que el bean los implemente realmente. Así que no es la mejor práctica de OO.*

*Y todavía hay otra razón por la que no es una buena práctica que el bean implemente la interfaz del componente: si la interfaz es remota (y **`EJBObject`** lo es, ya que amplía la interfaz **`java.rmi.Remote`**), eso haría que la clase del bean fuera una clase remota, y eso nunca debe ser! El bean está protegido por el servidor, y nunca se debe acceder a él de ninguna otra forma, excepto por el servidor. Es el servidor el que crea el **`EJBObject`** (implementando la interfaz **`Advice`**), que ES remoto y que intercepta todas las llamadas de métodos de negocio al bean.*

**P: Pero si no tiene el bean implementando la interfaz, en otras palabras, si `AdviceBean` no implementa `Advice`, ¿no significa esto que el compilador no lo atrapará(catch ) si el bean falla y no coincide(match ) los métodos de la interfaz?**

*R: Sí, eso es exactamente lo que significa. Y sí, eso hace que la mayoría de los desarrolladores de Java se sientan un poco mareados solo de pensarlo. Después de todo, ese es uno de los beneficios de las interfaces en Java: que el compilador garantiza que tiene todos los métodos de interfaz implementados correctamente.*

*¡Pero no entres en pánico! En nuestro desarrollo en este libro, debemos tener cuidado ya que el compilador no se asegura de que hayamos implementado los métodos de negocio desde la interfaz del componente(component interface). En el mundo real, sin embargo, es casi seguro que utilizará un entorno de desarrollo listo para EJB que se asegurará de proporcionar los métodos, ya sea poniendo una versión del método "su código va aquí" en su clase de bean, o haciendo lo contrario: encontrar el método de negocio en la clase de bean y colocarlo en la interfaz del componente. Como mínimo, la mayoría de los servidores verificarán (antes o en el momento en que implemente el bean) que la interfaz de su componente y la clase de bean tengan métodos coincidentes.*

*Sin embargo, si esto aún le molesta, tenemos una técnica para evitarlo que veremos un poco más adelante. Lo más probable es que no necesite usarlo.*

<hr>

<hr>

**BRAIN POWER**

Viste cómo el bean no implementa la interfaz del componente, aunque el bean debe tener los mismos métodos. Haga una lluvia de ideas sobre una forma (puede haber más de una) en la que podría manejar estos requisitos para el Advice Guy bean:

1. La interfaz del componente (**`Advice`**) debe extender **`EJBObject`**.

2. El bean debe implementar la interfaz **`SessionBean`**. El bean no debe implementar la interfaz del componente (**`Advice`**).

3. Queremos que el compilador verifique que el bean (**`AdviceBean`**) tenga los mismos métodos que los de la interfaz del componente.

(Sugerencia: “los mismos métodos que los de la interfaz del componente” no significa lo mismo que “los mismos métodos que los declarados en la interfaz del componente”).

(Sugerencia: esto requiere solo conocimiento de Java, no conocimiento de EJB).

<hr>

<hr>

**NOTA**

La convención de nomenclatura para beans NO forma parte de la especificación EJB.

**Advice, AdviceHome, AdviceBean...**

¡No está obligado a utilizar estos nombres para enterprise beans! (Sin embargo, es una muy, muy, muy buena idea). Asegúrese de que no se deje engañar por el nombre de una clase o interfaz: es legal tener una interfaz de componente llamada **`AdviceHome`** y una interfaz de componente llamada **`AdviceBean`**, por ejemplo. En el examen, vaya siempre por la declaración de clase o interfaz en lugar del nombre de la clase.

<hr>

<hr>

**OFF THE PATH**

Herramientas de desarrollo compatibles con beans

Hoy en día, muchos programadores de EJB utilizan herramientas de desarrollo expertas en EJB. En otras palabras, un IDE compatible con beans que sabe cómo se relacionan entre sí las tres piezas ( home interface, component interface y bean class ). Muchas de estas herramientas también saben cómo comunicarse directamente con uno o más servidores de aplicaciones, por lo que puede usar la herramienta para desarrollar e implementar su bean, en lugar de cambiar de un entorno de desarrollo al propio del servidor (y, a menudo, menos amigable) herramientas de despliegue. Una de las ventajas de una herramienta de desarrollo EJB es que es posible que no tenga que preocuparse por hacer coincidir los métodos de negocio en la interfaz del componente con la clase de bean real, o viceversa. Un buen IDE compatible con EJB se asegurará de que todo esté sincronizado.

<hr>

1. bean class
2. interfaces
3. **XMLDD**
4. ejb-jar
5. deploy

![image](https://github.com/adolfodelarosades/Java/assets/23094588/995629e5-881e-40ec-b076-31008ce3d74a)

   1. Cree un **deployment descriptor** XML que le diga al servidor qué es su bean y cómo debe administrarse.

   <hr>
   
   **NOTA**
   
   (En este libro, no escribiremos esto nosotros mismos; dejaremos que las herramientas de implementación lo construyan por nosotros).

   <hr>

   El  deployment descriptor (DD) describe la estructura de su bean, incluida la forma en que los tres archivos (component interface, home interface, y bean class) se relacionan entre sí. El servidor no mirará su convención de nomenclatura y averiguará cuál es el home, cuál es el bean, etc. Tiene que decirle al servidor, a través del DD, qué clase es cuál y cómo están conectados. Pero el DD hace mucho más que eso. ¡Y para algunos beans, el DD puede tener varias páginas!

   Para este bean simple, el DD es corto. Recuerde, no necesita memorizar la sintaxis del XML en el DD. Más adelante en el libro (en varios capítulos diferentes), repasaremos los aspectos del DD que necesita saber .

   **No es necesario que escriba el XML a mano si utiliza una herramienta que pueda ayudarlo a crear un deployment descriptor.**

   **Puede usar el J2EE RI bean wizard para que lo haga por usted, ¡y el XML que escupe funcionará en cualquier contenedor EJB 2.0!**

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>

   <!DOCTYPE ejb-jar PUBLIC '-//Sun Microsystems,
   Inc.//DTD Enterprise JavaBeans 2.0//EN' 'http://
   java.sun.com/dtd/ejb-jar_2_0.dtd'>

   <ejb-jar>
     <display-name>Ejb1</display-name>
     <enterprise-beans>

       <session>
         <display-name>AdviceBean</display-name>
         <ejb-name>AdviceBean</ejb-name>
         <home>headfirst.AdviceHome</home>
         <remote>headfirst.Advice</remote>
         <ejb-class>headfirst.AdviceBean</ejb-class>
         <session-type>Stateless</session-type>
         <transaction-type>Bean</transaction-type>
         <security-identity>
           <description></description>
           <use-caller-identity></use-caller-identity>
         </security-identity>
       </session>

    </enterprise-beans>
   </ejb-jar>
   ```

   ![image](https://github.com/adolfodelarosades/Java/assets/23094588/9e29fc16-b0fd-4f5a-9989-71538cfe0a16)


   <hr>
   
   **NOTA**
   
   Por ahora, sepa que cada bean en una aplicación debe tener un elemento en el DD que describa la estructura y el tipo del bean.

   <hr>

1. bean class
2. interfaces
3. XMLDD
4. **ejb-jar**
5. deploy

![image](https://github.com/adolfodelarosades/Java/assets/23094588/1efe60c1-7c8f-4ca1-8c4d-9cb471f51c51)


   2. Coloque el bean, las interfaces y el deployment descriptor en un archivo **ejb-jar**.

   <hr>
   
   **NOTA**

   (en este libro, no usaremos la JAR tool para hacer ejb-bar nosotros mismos; dejaremos que las herramientas de implementación lo hagan)

   <hr>
   
   Como desarrollador de beans (oficialmente llamado  Bean Provider), siempre colocará sus beans en un JAR. La especificación dice que un **ejb-jar** es un archivo JAR que contiene las cosas de las que depende el bean (clases e interfaces, junto con el deployment descriptor).

   **¡No tiene que hacer esto a mano ya que usaremos el RI!** En lugar de escribir el DD XML y usar la **jar tool** para empaquetarlo, usaremos el RI **deploytool** para hacerlo más fácil (y menos propenso a errores). En otras palabras, vamos a combinar los pasos 4 y 5 en uno. Por ahora, necesita saber que un bean no es un bean hasta que crea un archivo JAR con la clase y las interfaces compiladas, y el DD.

   ![image](https://github.com/adolfodelarosades/Java/assets/23094588/8cac687a-39fd-4c0e-8dde-ac308c393e91)


   <hr>

   **WATCH IT!**

   El examen espera que sepa lo que se supone que debe estar en el archivo **ejb-jar** y también lo que no debe estar allí. ¡Las clases e interfaces generadas por el contenedor (aprenderá cuáles son un poco más adelante) no deben estar en el archivo **ejb-jar**! Piense en el **ejb-jar** como algo que usted crea, como un desarrollador de beans. ¡Es tu entrega! El contenedor/servidor tiene sus propios entregables, y esos entregables no van al **ejbjar**. Imagina que trabajas para **Beans-R-Us** y ni siquiera tienes un servidor compatible con EJB. Esa es toda la idea del **ejb-jar**: es donde el desarrollador de beans coloca sus componentes básicos (es decir, beans), que algún otro desarrollador puede usar para ensamblar una aplicación. Puede usar una herramienta de servidor para ayudar a crear el DD XML, pero el DD sigue siendo su entrega, independientemente de quién (o qué) lo cree.

   <hr>

1. bean class
2. interfaces
3. XMLDD
4. ejb-jar
5. **deploy**
 
![image](https://github.com/adolfodelarosades/Java/assets/23094588/54a1731e-78c5-42a5-8dba-969f1733c995)

   3. **Deploy** el bean en el servidor, utilizando las herramientas proporcionadas por el proveedor del servidor.

   Tarde o temprano, tus beans tienen que hacer algo. Deben ensamblarse en una aplicación e implementarse(deployed) en un servidor, esperando que los clientes llamen.

   Este es un gran paso. De hecho, hicimos un poco de trampa, porque en realidad son dos pasos: Ensamblaje y Desplegar la aplicación.

   1. **Application Assembly**

   Esto significa llevar el bean de la etapa de componente reutilizable a ser parte de una aplicación. Para beans simples, eso podría significar simplemente escribir un cliente que pueda acceder al bean (es decir, llamar a los métodos de negocio del bean). En otras palabras, un solo bean podría ser la aplicación completa del lado del servidor. Pero este también podría ser el paso en el que integra múltiples beans (y otras clases de Java) en una aplicación personalizada, y eso generalmente significa tomar diferentes beans (cada uno en su propio **ejb-jar** con su propio DD) y ponerlos en un nuevo, solo **ejb-jar**, con un solo DD que podría describir cómo se relacionan dos o más beans entre sí.

   Durante el ensamblaje, también puede agregar nueva información al DD, para cosas que el desarrollador del bean no conocía. Por ejemplo, el desarrollador del bean podría escribir un código que use una "propiedad" especial específica del bean (llamada *entrada de entorno - environment entry*, que abordaremos en un capítulo posterior) para el monto del impuesto utilizado por esta aplicación. Pero el desarrollador del bean no tiene idea de qué *value* darle a la propiedad del monto del impuesto(tax amount), por lo que deja el valor en blanco en el DD. Luego aparece el ensamblador de la aplicación, ve (al leer el DD) que el bean usa una propiedad, determina cuál debería ser el valor y lo agrega al DD.

   Para el bean Advice, colocar el bean en el **ejb-jar**, construir el DD e implementarlo será un gran paso.

   2. **Deployment - Despliegue**

   Aquí es donde la goma se encuentra con el camino, el bean se encuentra con el servidor, el desarrollador se encuentra con el administrador del sistema. Las dos partes cruciales de la implementación son nombrar el bean (para que el cliente sepa cómo encontrarlo) y poner el bean en el control del contenedor.

   La especificación no dice nada sobre la forma en que implementa sus beans; todo depende del servidor/contenedor EJB que esté utilizando.

<hr>

<hr>

<hr>

[ 2 ] Una marker interface (también llamada  tag interface) no tiene métodos para implementar y existe para que pueda anunciar al mundo que "Sí, puedo hacer esto".

## EJB Roles y Responsibilities

![image](https://github.com/adolfodelarosades/Java/assets/23094588/c058e648-4925-4eba-9e78-4c54ae66f775)

**EJB Role**: ***Bean Provider***

**Deliverable**: archivos **ejb-jar** *(que incluyen uno o más beans y un XML deployment descriptor)*

**Primary responsibility**: *Diseñar y programar  enterprise javabeans.  En otras palabras, **escribe el código del bean***.

**Characteristics**: *Conoce la **lógica de negocio** que debe haber en un determinado tipo de componente, para un determinado dominio.*

![image](https://github.com/adolfodelarosades/Java/assets/23094588/61d9fc1c-f0fe-47b6-a225-4152d3c4b6c7)

**EJB Role**: ***Application Assembler***

**Deliverable**: archivos **ejb-jar** *(que incluyen uno o más beans y un XML deployment descriptor así como información del Bean Provider, así como **application assembly info**). También puede crear clientes o definir la interacción entre otros componentes (como JSP).*

**Primary responsibility**: **combinar uno o más enterprise beans** en una aplicación más grande. A veces puede usar Bean Provider hat, mezclando beans nuevos y existentes para construir una aplicación. Define el comportamiento de seguridad y transacción para la aplicación.

**Characteristics**: **Definitivamente un experto en el dominio**. *Puede que no haga tanta codificación como el Bean Provider*.


<hr>

**WATCH IT!**

El examen cubre diferencias sutiles entre roles.

Preste mucha atención a cualquier mención de roles EJB en este libro, especialmente cuando cubrimos más detalles del deployment descriptor. Cuente con ser probado sobre quién hace qué, y cuente con que esas preguntas sean sutiles. App Assembler y Bean Provider se superponen en varias áreas, al igual que Deployer y App Assembler. Para el examen, debe saber qué función tiene la responsabilidad principal de una tarea en particular (que generalmente tiene que ver con la información del deployment descriptor). El contenido de esta página y la siguiente son solo un comienzo...

<hr>

![image](https://github.com/adolfodelarosades/Java/assets/23094588/38a897a1-aa57-4787-9331-3d9b6cef8a07)

**EJB Role**: ***Deployer***

**Deliverable**: *Enterprise beans que se han personalizado para un **entorno operativo específico** y se han implementado en el servidor.*

**Primary responsibility**: *tomar el entregable del ensamblador de aplicaciones(Application Assembler’s deliverable,), estudiar el deployment descriptor y **resolver las dependencias externas**. Por ejemplo, si el bean se basa en un recurso en particular, el implementador debe asignar el nombre lógico del proveedor de Bean al nombre real del recurso en el servidor. Recuerde, cuando Bill escribió el código del bean, no sabía que terminaría en el servidor de Dick. Bill tuvo que inventar un nombre 'falso' para la base de datos y Dick tuvo que relacionar el nombre falso con algo real.*

**Characteristics**: *Un **experto en un dominio operativo específico**. Conoce los usuarios y roles de seguridad para este sistema, sabe lo que está configurado en el servidor y comprende cómo interpretar la información del deployment descriptor del proveedor de Bean y el ensamblador de aplicaciones.*

![image](https://github.com/adolfodelarosades/Java/assets/23094588/fef024bc-1dab-43f2-92a0-e2bd0b3d28ce)


**EJB Role**: ***Container and Server Provider***

**Deliverable**: EJB 2.0-compliant server, deployment tools, runtime environment para enterprise beans.

**Primary responsibility**: *Implementar la especificación*.

**Characteristics**: *Expertos en objetos y transacciones distribuidas, y otros **servicios del sistema de bajo nivel**.*

## Tutorial:

Vamos alla, deployemos y testemos **AdviceBean**

Escribiremos el código, lo compilaremos, iniciaremos el servidor, iniciaremos deploytool(la herramienta de implementación), usaremos la deploytool (herramienta de implementación) para hacer el DD y el ejb-jar, implementaremos el bean, crearemos un cliente y probaremos el bean usando el cliente. Lo único que no haremos será instalar y configurar el servidor. Asumimos que ya lo hiciste.

Si aún no tiene **J2EE 1.3 RI** funcionando, vaya a http://java.sun.com/j2ee/ y descargue la versión 1.3 de J2EE (incluye instrucciones de configuración), luego regrese y descargue la documentación de la API de J2EE.

<hr>

**NOTA**

¡Recuerde, el examen es para J2EE 1.3, NO 1.4! Hagas lo que hagas, NO estudies para el examen usando la especificación 1.4. Consulte la introducción para obtener más detalles sobre por qué el examen usa 1.3 y no 1.4; la versión corta es: no queremos certificar a la gente en algo que casi nadie usa. La certificación NO se trata de "Conozco el último y mejor lanzamiento". Se trata de “Conozco la tecnología que la gente está usando ahora. Lo he estado usando durante al menos seis meses”.

<hr>

![image](https://github.com/adolfodelarosades/Java/assets/23094588/bf0aef61-4d16-4d2f-b60c-c1097b50a0cb)

¿Qué servidor usaríamos? Usamos el RI para aprender y practicar porque no sabemos qué servidor necesitará usar, y el RI es el más simple de todos los servidores disponibles gratuitamente. Queremos que le resulte lo más fácil posible concentrarse en la tecnología EJB e ignorar las tareas específicas de la herramienta.

Los productos de código abierto como **JBoss** siguen siendo servidores de producción reales, por lo que tienden a tener que hacer frente a muchas más tareas de configuración y administración. El uso de RI le permite pasar más tiempo haciendo las cosas que tendrá que hacer, independientemente del servidor, con la menor cantidad de tiempo dedicado a aprender un enfoque específico del servidor para esas cosas.

<hr>

**RELAX**

**No hay nada en el examen sobre J2EE RI.**

O cualquier otro servidor de aplicaciones. No es necesario que conozca las herramientas de ningún proveedor (incluidas las de Sun) para el desarrollo o la implementación. Necesita saber qué capacidades tendrá cada servidor compatible con EJB, pero no necesita conocer ninguna característica o detalles de configuración específicos del proveedor.

<hr>

### Organice su directorio de proyectos

Todos los beans de este libro están organizados en paquetes, lo que significa que debe ser un poco más cuidadoso con la compilación y la ejecución. Cada instrucción en este capítulo asume que ha organizado su proyecto exactamente como se muestra aquí. Si se desvía de esta estructura, está solo para asignar nuestras fórmulas de implementación y línea de comando a su propia estructura.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/11cd4264-52f7-4f92-9bbf-574646d4ce50)

#### Organizando tu terminal/línea de comandos

![image](https://github.com/adolfodelarosades/Java/assets/23094588/df18a165-94ea-4e3d-bbd9-06c5030453e7)

**compilar** desde el directorio **`src`**

**ejecutar** clientes desde el directorio del proyecto específico

### Compile las dos interfaces y la clase de bean

Hasta ahora, hemos escrito las dos interfaces y la clase de bean, pero todavía tenemos que compilarlas. Después de eso, crearemos el **ejb-jar** (que contiene archivos *class*, no archivos *source*).

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e71c29c5-214f-4935-bc3c-859651427f61)

Estamos usando el **`-d`** compiler flag, por lo que la línea de comando anterior dice: "Compila todos los archivos .java en el directorio 'headfirst' y luego coloca los archivos .class compilados en el directorio 'classes', que encontrarás subiendo un nivel desde el directorio actual (src). Ah, sí, casi lo olvido, asegúrese de poner las clases en su directorio PACKAGE correcto. Busque la estructura del paquete dentro del directorio 'classes', lo que significa que debería ver un directorio llamado 'headfirst', y AQUÍ es donde deben ir los archivos class ... y si NO encuentra el directorio 'headfirst' allí, haga uno para mí. Gracias."

**En este momento, así es como debería verse la estructura de directorios de sus proyectos:**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/7dffdb7c-cbc4-416b-ac0e-8a4b7fa96864)

### Inicie el servidor

**Abra una nueva terminal para el servidor**. Lo dejará en ejecución, y queremos ver el resultado, mientras se ejecuta, así que no use este terminal para nada más. Haga del directorio de consejos su directorio de trabajo.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/ff6b6320-9992-4e6c-8d45-787bbf706224)

### Verás algo como esto

El flag **`-verbose`** (que no es obligatorio, pero nos gusta) imprime un montón de cosas en la terminal.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/8090759d-672f-45d4-a50b-1684f4b9f8ce)

### Iniciar deploytool

**Abra una nueva terminal** para la deploytool. Esta herramienta es parte de **J2EE RI** y tiene todo lo que necesita para crear el **ejb-jar**, el DD y hacer la implementación(deployment) final en el servidor RI.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/ec755119-f4fa-45e7-b2b0-25f598d915a7)

### verás algo como esto

Aparece una hermosa pantalla de inicio y se sienta mientras se carga la aplicación. Si hace clic en la pantalla de inicio, desaparece, así que no se asuste si parece que no pasa nada. Paciencia.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/8ffc5936-6d58-464d-af76-2a4e06420398)

### Hacer una nueva aplicación

El **RI** es un *servidor* J2EE, recuerde, no solo un *contenedor* EJB. Así que tenemos que hacer un poco de J2EEish antes de que podamos hacer el ejb-jar e implementar(deploy) la aplicación. Este paso es donde creamos una nueva aplicación J2EE y, por ahora, puede pensar en la aplicación J2EE como algo que envuelve los beans y agrega un poco más de información para el servidor. La principal diferencia entre una aplicación J2EE y una aplicación EJB es que una aplicación J2EE puede incluir componentes web (servlets y JSP), así como componentes EJB, todos integrados como parte de una sola aplicación.

Elija **File ▸ New ▸ Application**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/3bd64e53-b8a5-4aa6-98b6-f5d9708dd1e4)

<hr>

**NO HAY PREGUNTAS TONTAS**

P: **¿Significa esto que DEBO tener un servidor J2EE si quiero usar servlets y EJB juntos?**

R: *No. Con un servidor J2EE, los componentes web y los componentes EJB están más estrechamente integrados, lo que significa que puede hacer que todos los componentes respeten las transacciones y la seguridad de los demás. Pero siempre puede usar un servlet como cliente de un enterprise bean, incluso si ese bean no se está ejecutando en el mismo servidor de aplicaciones (o incluso en la misma máquina física). Otra ventaja de un servidor J2EE es la facilidad con la que puede implementar ambos tipos de componentes como parte de una aplicación empresarial.*

*Habiendo dicho todo esto, las posibilidades son extremadamente altas de que si está haciendo aplicaciones EJB 2.0, las esté ejecutando en un servidor J2EE. Recuerde, hoy en día hay muy pocos contenedores EJB independientes. Prácticamente todos los proveedores importantes ejecutan sus contenedores EJB dentro de un servidor J2EE.*

<hr>

<hr>

**OFF THE PATH**

Un proveedor de servidores J2EE debe pasar una gran cantidad de pruebas de compatibilidad antes de que el servidor pueda llamarse "compatible con J2EE". Un servidor J2EE 1.3, por ejemplo, *debe* incluir un contenedor EJB 2.0 y ese contenedor *debe* implementar la especificación EJB 2.0.

<hr>

### Asigne un nombre y guarde la nueva aplicación

Esta parte es un poco incómoda. Puede usar el botón Examinar para navegar a través de su propio árbol de directorios, pero la forma más fácil de nombrar y guardar la aplicación es escribir la ruta completa al archivo que está a punto de crear. Lo que estamos haciendo no es el bean en sí mismo; puede pensar en él más como un documento que contiene toda la información sobre la aplicación. Como convención, guardamos la aplicación en el directorio de proyectos/[lo que sea], el directorio correspondiente a ese proyecto en particular. Para el bean Advice, eso significa el directorio **`projects/advice`**. Si inició el servidor desde el directorio **`projects/advice`** (en otras palabras, si advice es su directorio de trabajo actual), obtendrá el nombre y la ubicación correctos de forma predeterminada.

Nombra la aplicación **AdviceApp**

Si es necesario, incluya la ruta completa a **`projects/advice/AdviceApp`**

Haga clic en **OK**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/6e9f7649-598c-4259-bef5-84f2bc3327a5)

No se preocupe por el campo **Application Display Name**; la herramienta lo completará automáticamente con el nombre del archivo del campo **Application File Name**.

### Lo que verá después de crear y nombrar la aplicación

Ahora, estás de vuelta en la pantalla principal de la deploytool. Es posible que deba hacer clic en los íconos de **Files** o **Applications** para expandirlos, pero verá que la herramienta ha creado un directorio **Applications** con algo llamado **AdviceApp** dentro. Haga clic en el icono de **AdviceApp** y verá información sobre la aplicación, incluido el nombre, la ubicación y los contenidos actuales. En este punto, no hay nada más que un directorio **`META-INF`** (que contiene más información sobre la aplicación, que nunca necesitaremos mirar).

Haga clic en el icono de **`AdviceApp`**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/6bbb1cd5-251f-4aae-9d98-fa02d7d980bd)

### Ahora hagamos el nuevo enterprise bean (el ejb-jar y el DD)

Esto es lo que realmente buscamos: el bean actual. Los pasos anteriores (crear la aplicación J2EE) fueron para satisfacer la RI de J2EE porque tenemos que implementar el bean dentro de una aplicación J2EE.

Seleccione **File ▸ New ▸ Enterprise Bean...**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/bfbc97dd-ff5b-44f8-b0da-87fae76142a3)

### Ahora estamos en el genial New Enterprise Bean Wizard

¡Esta parte de la herramienta de implementación es donde sucede casi todo! Las cosas clave que haremos son:

* Crear el ejb-jar

* Coloque la clase de bean y las dos interfaces en el ejb-jar

* Cree el deployment descriptor que describe el bean

Click **Next >**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/17e096df-6d68-4068-9f9a-ed9b3f51d199)

### Crear el nuevo ejb-jar

Por ahora, solo acepte los valores predeterminados. El radio button en la parte superior izquierda de la pantalla muestra que está creando un nuevo JAR dentro de la aplicación **AdviceApp**. Tenga en cuenta que **AdviceApp** es parte de una lista desplegable: si ya hubiera otros **ejb-jars** en la aplicación, podríamos haber optado por colocar el nuevo bean en un JAR preexistente.

La herramienta elige un nombre para mostrar especialmente útil, "Ejb1", y lo verá nuevamente en la pantalla principal de la deploytool cuando hayamos terminado. Ese nombre no se usa en ninguna parte de su aplicación real, por lo que no es gran cosa, pero si tiene más de un JAR en una aplicación, es posible que desee darle un nombre más descriptivo (Cart JAR, Account JAR, etc).

Click **Edit...**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/b59f1044-2a6a-4c24-bf63-7f33d69f3eb9)


### Agregue los tres class files (incluido su package directory) al JAR

¡Esta es la parte más importante de todo el proceso! En otras palabras, no lo arruines. La clave es obtener las clases correctas en el JAR en su estructura de directorios de paquetes, y solo en su estructura de directorios de paquetes. En otras palabras, si coloca los tres archivos de clase en el JAR sin el directorio **headfirst**, su bean no se implementará. O, si incluye el directorio de clases además del directorio **headfirst**, sus beans no se implementarán. Recuerde, **ejb-jar** sigue siendo un archivo JAR, por lo que aquí se aplican las reglas habituales de JAR sobre estructuras de paquetes.

Navegue al directorio **Advice**

Expanda el directorio **classes** para ver el directorio **headfirst**

Seleccione el directorio **headfirst**

Click **Add**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/514cbca9-d892-431e-8b59-f04592d029d4)

Use los controles de navegación aquí para llegar a su directorio **Advice**, donde puede ver sus classes y directorios src. A continuación, seleccione el directorio **headfirst**. No tienes que expandirlo... lo hicimos para que pudieras ver lo que hay ahí.

### Confirme que agregó SOLO el package directory y los class files

Tienes que hacer bien esta parte. Mire la ventana inferior que dice "Contents of Ejb1" y verifique que lo único en el JAR además del directorio META-INF es el directorio **headfirst** (incluido el contenido del directorio). El error clásico que vemos todo el tiempo (no es que lo hagas alguna vez) es agregar solo los *class* files, pero no el *package* directory. Asegúrese de tener el directorio **headfirst** (y no el **classes** directory) con los tres archivos de clase. Otro error común es agregar los source files en lugar de los class files. Así que no te sientas mal si te pasa.

Verifique que tiene las clases correctas (y el package directory)

Si no lo hace, selecciónelos en la ventana inferior, haga clic en Remove y comience de nuevo.

Haga clic en **OK** cuando haya terminado, luego haga clic en **NEXT**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e53394ba-c1ee-4570-86ec-ec5d5ae61425)

### Conviértalo en un Stateless Session bean

Ahora, estamos en el lugar donde le damos a la herramienta la información 'estructural' del bean. Qué tipo de bean es, qué class file es la home interface, etc. Recuerde, la herramienta usa esto para crear el deployment descriptor. Y el contenedor EJB usa el deployment descriptor para descubrir cómo implementar(deploy) y administrar el bean.

El bean **Advice** es simple: el cliente llama a un método en el objeto remoto, el objeto remoto devuelve un valor, luego el objeto remoto olvida todo lo que sucedió. Fin de la historia. Ese escenario es perfecto para una solución de bean de sesión sin estado(stateless session bean). Si el bean **Advice** necesitara *recordar* el consejo(advice) que le dio al cliente y usarlo de alguna manera en futuras invocaciones de ese mismo cliente, entonces lo haríamos con estado(stateful). Pero no lo hacemos, así que no lo haremos.

Y como aprenderá más adelante, no tendría sentido que el bean **Advice** sea una entity o un bean controlado por mensajes(message-driven bean). Pero es demasiado tarde para convertirlo en algo más que un bean de sesión de todos modos: su clase de bean implementa la interfaz **SessionBean**. Así que ya estás comprometido con un tipo de bean. Pero si el bean de sesión es sin estado o con estado(stateless or stateful) puede ser un poco más sutil. Por ahora, solo hazlo sin estado(stateless).

Seleccione el radio button **Session**

Seleccione el radio button **Stateless**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/655dbc49-a740-4b0f-b783-972469c9e74c)

¡No haga clic en el botón **Next**! Tenemos mucho más que hacer en esta pantalla.

### Dígale cuál de los tres class files en el JAR es la BEAN class

Tiene tres class files en el JAR: la home interface (**AdviceHome**), la component interface (**Advice**) y el bean (**AdviceBean**). Pero el EJB container necesita saber cuál es cuál. ¡Recuerde, la convención de nombres no significa nada para nadie más que para usted! El contenedor no mirará las tres classes en el JAR y reconocerá que **AdviceHome** debe ser la home interface, y así sucesivamente [ 3 ]. No, la convención de nomenclatura es para usted y cualquier otra persona que use sus componentes de bean.

Entonces, ahora tiene que decirle a la herramienta cuál de los archivos es la bean class (haremos las dos interfaces en la página siguiente). La herramienta, entonces, pondrá esta información en el deployment descriptor.

Haga clic en el menú desplegable **Enterprise Bean Class**

Seleccione **headfirst.AdviceBean**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/0dbe9bb3-667c-461a-afab-35b2d90ab37a)

<hr>
<hr>
<hr>
[ 3 ] Hay algunas herramientas de proveedores que pueden usar su convención de nomenclatura, entre otras cosas, para averiguar cuál es el hogar, cuál es el bean, etc. Pero el RI no hace esto, y el soporte de la herramienta de desarrollo no es parte de la especificación EJB. Las únicas herramientas requeridas por la especificación son para el **Deployer**, no para el **Bean Provider** o **App Assembler**.

### Dígale cuál es la Home interface y cuál es la Component interface

Ahora, debe hacer lo mismo que hizo con la clase bean, pero con las dos interfaces. Notará que hay dos lugares diferentes donde puede seleccionar interfaces: Local y Remote. Este bean es remoto (lo que significa que es un Java RMI remote service, pero lo abordaremos en el próximo capítulo), por lo que estamos usando solo la sección inferior, para las  Remote interfaces. Simplemente deje la sección Local interfaces en paz.

Lo extraño es que esta pantalla utiliza el término Remote Interface en lugar de Remote Component Interface. Eso es solo un mal diseño de interfaz en la deploytool. (En realidad, es un artefacto de la versión anterior de EJB, cuando solo había remote interfaces. Las Local interfaces son nuevas en EJB 2.0), pero tenemos que vivir con eso.

Haga clic en el menú desplegable en **Remote Home Interface**

Seleccione **headfirst.AdviceHome**

Haga clic en el menú desplegable **Remote Interface**

Seleccione **headfirst.Advice**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/c5428ba9-c944-4e2b-a36e-366b952ab50f)

### ¡Verifique todo en esta pantalla!

¡Elegir la bean class, la home interface y la component interface es una decisión permanente! Una vez que haya terminado con el resto del asistente de bean y se haya creado el deployment descriptor, estará atascado con él. Si mezcla accidentalmente las interfaces de home y component, su bean no funcionará. En el RI, ni siquiera se implementará (algunos servidores le permiten implementar beans estructuralmente defectuosos, lo que significa que explotan en tiempo de ejecución, pero el RI ni siquiera le permitirá ingresar a la puerta del servidor).

Asegúrese de tener la siguiente configuración:

Enterprise Bean Class: **headfirst.AdviceBean**

Remote Home Interface: **headfirst.AdviceHome**

Remote Interface: **headfirst.Advice**

Click **NEXT**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/7a9b095f-1e29-4389-b754-b525eedca98e)

¡Asegúrese de que su pantalla se vea así antes de presionar el botón **Next >**!

### Has terminado, haz clic en Finish

Debido a que este bean es tan simple y no nos importan las transacciones, la seguridad, las entradas del entorno y el acceso a la base de datos, hemos hecho todo lo necesario para crear el deployment descriptor y colocarlo en un JAR con los archivos de clase.

Por lo tanto, puede ignorar la pantalla de Administración de transacciones, aunque se familiarizará con ella más adelante en el libro.

Haga clic en Finalizar

