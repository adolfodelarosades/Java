# Capítulo 1. Introducción a EJB: Bienvenido a EJB

**Enterprise JavaBeans es fácil**. Bueno, al menos cuando compara EJB con lo que tendría que hacer para escribir su propio servidor empresarial escalable, transaccional, seguro y concurrente. En este capítulo, desarrollaremos, implementaremos y ejecutaremos una aplicación EJB, antes de profundizar en los detalles. Antes de que terminemos, veremos el uso, los beneficios y las características de EJB, y veremos (brevemente) cómo funcionan los contenedores EJB. Echaremos un vistazo de alto nivel a la arquitectura de EJB y aprenderemos sobre los tres tipos de beans. Cuanto más comprenda de este capítulo, menos tendrá que memorizar más adelante, así que no se lo salte. (Si es un experto en EJB, probablemente pueda salirse con la suya con un vistazo rápido).


## OBJETIVOS

Descripción general de Enterprise Javabeans

#### Oficial:

1.1 Identificar el uso, beneficios y características de la tecnología Enterprise Javabeans, para la versión 2.0 de la especificación EJB.


#### Lo que realmente significa:

Necesita saber cómo funciona EJB en general, para qué sirve, qué proporciona y qué no .

Debe comprender la arquitectura general de EJB y cómo esa arquitectura admite las funciones de EJB. Por ejemplo, debe saber que EJB admite transacciones, seguridad y simultaneidad, pero no garantiza el equilibrio de carga, la conmutación por error o la agrupación en clústeres. Debe saber que **EJB admite tres tipos de beans**: **session(de sesión)**, **entity(de entidad)** y **message-driven(controlados por mensajes)**, y que los beans de sesión pueden ser **stateless(sin estado)** o **stateful(con estado)**.


## ¿De qué tratan los EJB?

**Desarrollo basado en componentes**

Con enterprise javabeans, puede desarrollar componentes básicos ( --EJB components-- ) que usted u otra persona pueden ensamblar y volver a ensamblar en diferentes aplicaciones. Por ejemplo, puede crear un **Customer bean** ( ***bean*** es otra palabra para ***componente*** ) que representa a un cliente en una base de datos. Puede usar ese bean Customer en un programa de contabilidad, un sistema de carrito de compras de comercio electrónico, una aplicación de soporte técnico o prácticamente cualquier otra aplicación que pueda necesitar representar a un cliente. De hecho, con algunos beans, es posible que el desarrollador de beans y el ensamblador de la aplicación no trabajen para la misma empresa ni se conozcan entre sí.

Si es un desarrollador de beans, puede crear un **Order bean**, un **Payroll bean** o un **ShoppingCart bean** que los desarrolladores de alguna empresa no relacionada puedan comprar y usar para construir sus propias aplicaciones personalizadas.

Una belleza del desarrollo basado en componentes es que lleva la reutilización de código a un nivel completamente nuevo. En lugar de reutilizar las clases de Java , puede reutilizar una mayor parte de la funcionalidad. ¡A menudo, puede modificar la forma en que funciona un bean sin siquiera tocar su código Java! Aprenderá en este capítulo que cuando implementa un bean en un servidor, puede configurar y personalizar el bean de forma declarativa, a través de un *descriptor de implementación basado en XML*, para cambiar la forma en que se comporta el bean en tiempo de ejecución.

**Con el desarrollo basado en componentes, lleva la reutilización de código a un nivel completamente nuevo. Con el desarrollo OO, reutiliza las clases, pero con los componentes, reutiliza una mayor parte de la funcionalidad y puede personalizarlos sin tocar el código**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/53f13c79-0673-402b-aa56-91fb264a7863)

Fred ensambla una aplicación de compras en línea utilizando dos componentes que compró en Beans-R-Us, más un tercer componente que Fred desarrolló en su empresa.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/454729b6-5a24-4d1b-8ee2-fc73a73c57ef)

Bill ensambla una aplicación de soporte técnico utilizando dos componentes que compró de Beans-R-Us, más dos componentes que desarrolló él mismo.

## ¿Qué me da realmente EJB?

**EJB le permite concentrarse en la lógica comercial de su negocio y dejar los servicios subyacentes (transacciones, redes, seguridad, etc.) al proveedor del servidor EJB.**

Imagina que trabajas para Guitar Land, una empresa que vende equipos de músicos en línea. Tiene mejores cosas que hacer que trabajar 90 horas a la semana, entonces, ¿dónde le gustaría pasar su tiempo? ¿No preferiría concentrarse en cómo Guitar Land hace negocios en línea, en lugar de escribir su propio servidor de administración de transacciones seguro y en red? ¿Por qué no trabajar en lo que mejor conoce (lógica comercial para su negocio en particular) y dejar el trabajo pesado (es decir, los grandes servicios de infraestructura que obtiene del servidor) a otra persona?

El modelo EJB permite que todos hagan lo que mejor saben hacer: los proveedores de servidores se concentran en la infraestructura que necesitan la mayoría de las aplicaciones empresariales, mientras que los desarrolladores comerciales se concentran en su propia lógica comercial.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/982a5ea6-a989-4a16-bb73-f8cf394469f3)

**¡EJB le permite personalizar y configurar componentes reutilizables en el momento de la implementación, sin tocar el código fuente!**

Puede cambiar la forma en que un bean usa los servicios subyacentes simplemente modificando un documento XMl en el momento de la implementación. Por ejemplo, puede definir completamente el control de acceso de seguridad para los métodos de un bean dentro de XML (declarativamente) en lugar de hacerlo dentro del código fuente del bean (mediante programación). Y puede personalizar la forma en que se ejecutan los métodos de un bean en las transacciones, todo dentro del descriptor de implementación, sin tener que codificar los límites y comportamientos de la transacción. Eso simplemente mola.

**Los servidores EJB le brindan un montón de servicios, para que no tenga que escribirlos usted mismo:**

* *Gestión de transacciones*
* *Seguridad*
* *Concurrencia*
* *Redes*
* *Administracion de recursos*
* *Persistencia*
* *Mensajería*
* *Personalización del tiempo de implementación*

<hr>

**NOTA**

Alguien ya escribió y probó todo esto, así que no tienes que hacerlo tú.
<hr>

![image](https://github.com/adolfodelarosades/Java/assets/23094588/6bb101bb-47b8-4755-9f95-4e525167dfeb)

### ¡No más bloqueo de proveedores!

**Enterprise beans son portátiles, no solo a diferentes JVM , sino también a diferentes servidores EJB.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/df5c53ea-a8cd-435d-87c5-036427b14f00)

Una de las razones por las que todos amamos Java es su portabilidad en múltiples plataformas. Todo el asunto de escribir una vez, *ejecutar* en cualquier lugar (WORA).

EJB lleva la portabilidad a un nuevo nivel, en lugar de escribir una vez ejecutar en cualquier lugar, es escribir una vez **implementar** en cualquier lugar (WODA). Así como WORA lo libera de verse obligado a trabajar en un solo sistema operativo, WODA lo libera de estar a merced de su proveedor de servidor de aplicaciones. Y luego, por supuesto, está YODA, pero estamos divagando.

En los viejos tiempos, cada proveedor de servidores de aplicaciones tenía su propia API patentada. Lo aprende, trabaja con él y, finalmente, pone en funcionamiento sus aplicaciones empresariales. Y luego adivina qué? Necesitas una nueva función. Y luego adivina qué? Su proveedor dice: "Estamos considerando eso para el tercer trimestre... del próximo año". ¿Ahora que? Como un traficante de drogas, te han enganchado, y ahora es demasiado doloroso considerar renunciar a ellos. ¿Renunciar a ellos para qué? Otro proveedor y otra API propietaria y más bloqueo.

Uno de los beneficios cruciales de EJB es WODA. Y ahora los vendedores tienen que competir no solo para venderte en primer lugar, sino para *mantenerte*. Porque como todo el mundo sabe, puedes empacar tus beans e irte a otra parte.

<hr>

**NO HAY PREGUNTAS TONTAS**

***P: ¿Cuál es la diferencia entre EJB y J2EE?***

R: Tanto J2EE como EJB son especificaciones para un servidor. Pero EJB es en realidad un subconjunto de J2EE. En otras palabras, un servidor J2EE debe incluir un contenedor EJB. Hemos usado la palabra servidor en estas primeras páginas, pero técnicamente, lo que ejecutan los javabeans empresariales se llama contenedor EJB. Por lo tanto, cada servidor J2EE debe incluir un contenedor EJB (junto con un contenedor web que pueda ejecutar servlets y JSP).

Este examen trata sobre la parte EJB de J2EE, mientras que el examen SCWCD(Desarrollador de componentes web certificado por Sun) trata sobre la parte web de J2EE.

Más adelante en este capítulo, profundizaremos en los detalles de cómo encajan J2EE y EJB.

En el resto de este libro, usaremos los términos servidor EJB, contenedor y servidor de manera intercambiable. Si la diferencia entre los términos importa, lo dejaremos claro.


***P: ¿Puedo usar componentes EJB sin un servidor de aplicaciones compatible con EJB?***

R: No. Los componentes EJB no pueden vivir fuera de un contenedor EJB. No tienen un método principal, e incluso si agrega uno a su clase de bean, el bean no sería muy útil por sí solo. La mayoría de los métodos en un bean empresarial son llamados por el propio contenedor y no tienen significado fuera del servidor. Recuerde, el objetivo de un servidor EJB es brindarle todos los grandes servicios (seguridad, transacciones, etc.), y sin el servidor, perdería todo menos su lógica comercial básica. Y si esa lógica empresarial se basa en el contenedor (por ejemplo, llamar a métodos en las interfaces proporcionadas por el contenedor), incluso la lógica empresarial fallaría.

***P: ¿Puedo diseñar y escribir mi código de tal manera que la mayor parte de la lógica comercial esté en una clase Java simple y antigua, y solo tener los métodos de llamada de bean en esa clase? De esa manera todavía podría reutilizar la lógica de negocios...***

R: Sí, puede hacerlo y, de hecho, muchos diseñadores escriben clases reutilizables separadas que no son beans y luego hacen que los beans invoquen métodos en esas clases. Si su bean llama a un método en una clase Java que no es un bean, ese método todavía está bajo el control del contenedor, por lo que en lo que respecta al contenedor, ese método que no es un bean es solo parte de la funcionalidad del bean.

***P: ¿Cuál es la diferencia entre javabeans normales y javabeans empresariales?***

R: ¡ Felicitaciones! Eres la persona número 3 millones que ha hecho esa pregunta.

El término "javabean" significa un componente reutilizable. Los beans normales que no son de empresa (y beans son solo una forma más corta de javabeans), son componentes reutilizables que siguen una convención de nomenclatura que pueden usar las herramientas de desarrollo.

Con mucho, el tipo más común de javabean es cualquier componente GUI (como un botón Swing o un campo de texto). Casi todos los IDE de Java son compatibles con javabean, por lo que si está trabajando en una herramienta de diseño visual, puede hacer clic en un botón y aparece una hoja de propiedades donde puede establecer el color, el tamaño, la fuente, etc. La herramienta sabe qué propiedades que tiene el bean porque el bean sigue convenciones para getters y setters.

Pero los javabeans regulares no son solo para componentes de GUI; otras tecnologías de Java, incluidos Jini y Servlets, pueden usar funciones de javabean.

Enterprise javabeans también son componentes reutilizables, pero ahí es donde termina la similitud. La parte 'bean' de un javabean normal se usa principalmente en tiempo de desarrollo , como una forma de facilitar o acelerar el enlace de eventos de un bean a los métodos de otro bean, o establecer valores de propiedad (que a menudo significan lo mismo que valores de variables de instancia ). Un bean normal se ejecuta en una JVM, como cualquier otra clase Java normal. Pero la parte del "bean" de un bean empresarial se activa en tiempo de ejecución, y un bean empresarial debe ejecutarse bajo el control de un contenedor EJB.

Para el resto del libro, cuando decimos bean, nos referimos al bean empresarial.
<hr>

### ¿Cómo funciona todo?

**Sus beans se ejecutan bajo el control (y protección) del servidor EJB.**

**El servidor interviene en medio de cada llamada de método de un cliente a un bean e inserta los "servicios" como seguridad, transacciones y persistencia.**

Sus beans viven y se ejecutan en el servidor, y el servidor hace prácticamente todo para administrar transacciones, seguridad, persistencia e incluso la vida o muerte de sus objetos. Y hace todo esto interviniendo cada vez que un cliente realiza una solicitud (es decir, llama a un método comercial en el bean). El servidor salta y comienza a hacer preguntas como:

*"¿Este cliente tiene autorización de seguridad para llamar a este método?"* o

*"¿Es necesario que este bean se ejecute como parte de una transacción más grande?"* o

*"¿Este bean necesita actualizarse con datos de la base de datos antes de ejecutar ese método para el cliente?"*

![image](https://github.com/adolfodelarosades/Java/assets/23094588/ff31ceda-0629-4cbb-80e0-dad966f92da5)

### Detras de Escena...

![image](https://github.com/adolfodelarosades/Java/assets/23094588/bbfbc533-88bd-4d59-807c-f7bc4f509ed8)

![image](https://github.com/adolfodelarosades/Java/assets/23094588/8df29ecd-898d-4e25-9c8e-b5f46e7d458d)

![image](https://github.com/adolfodelarosades/Java/assets/23094588/a068415e-88ed-41bb-ad75-d1a31e80bbf9)

### Los Beans vienen en tres sabores.

**Entity(Entidad)**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/aa03533c-7040-4421-84de-3c3a8c6c0f3b)

Utilice un **entity bean** para representar una *cosa* en un almacén persistente. Eso casi siempre significa algo en una base de datos, donde una instancia de un bean de entidad representa **una fila en una tabla** (aunque si la base de datos está normalizada, el bean podría extraerse de filas en varias tablas). Un ejemplo típico de entidad es Customer, donde una entidad podría representar a **Bo Olean (ID# 343)** y otra entidad podría representar a **Trixia Lin (ID# 870)**.

**Message-driven(Impulsado por mensajes)**

Utilice un **message-driven bean(bean controlado por mensajes)** solo cuando necesite un JMS consumer. En otras palabras, un bean que **puede escuchar mensajes de un servicio de mensajería JMS(JMS messaging service)**. Los clientes nunca llaman directamente a beans controlados por mensajes; para que un bean controlado por mensajes haga algo, un cliente debe enviar un mensaje a un servicio de mensajería. Eso significa que un bean controlado por mensajes no tiene EJBObject porque el servidor recibe las solicitudes del cliente directamente de un servicio de mensajería en lugar de una llamada del cliente al bean. Un bean controlado por mensajes típico podría ser un suscriptor NewCustomerNotification.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/720ba6b5-ecae-45ca-8195-068ca6b1e7d4)

**Session(Sesión)**

Use un bean de sesión para... todo lo demás. Casi cualquier tipo de servicio de back-end puede (y a menudo debe) comenzar con un bean de sesión. Donde un bean de entidad representa una cosa, un bean de sesión típicamente representa un proceso. Para decirlo de otra manera, cuando piense en beans de entidad, piense en sustantivo, y cuando piense en beans de sesión, piense en verbo. Una sesión de compras es un ejemplo típico de un bean de sesión, mientras que un sistema de procesamiento de tarjetas de crédito podría ser otro bean de sesión.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/4e9107ad-d29c-4692-914e-59158a7af68c)

### Los beans de sesión pueden ser sin estado o con estado

AQUIIIIIIIIIIIIIII!!!!!


Repasaremos todo esto en detalle en el capítulo Session Bean. Por ahora, debe saber que los beans de sesión se pueden marcar (en el momento de la implementación) como stateless o stateful .

Un bean con estado puede recordar el estado conversacional entre llamadas a métodos, mientras que un bean sin estado no recordará nada sobre el cliente entre invocaciones a métodos.

La frase "estado conversacional" en realidad significa "estado específico del cliente", y un ejemplo típico es un carrito de compras. No sería divertido si usted (el comprador) tiene un carrito, pone algo, pero cuando va a poner la segunda cosa, la primera desaparece del carrito. No demasiado fácil de usar. Por lo tanto, un buen carrito de compras mantendrá el estado de comprador del cliente (es decir, los artículos en el carrito) mientras la sesión de compras esté activa . (Explicaremos lo que queremos decir con vivo en el capítulo Session Bean).

Los beans sin estado simplemente se olvidan del cliente una vez que se completa la llamada al método. Entonces, los beans sin estado son para servicios que no requieren una conversación continua entre el cliente y el servicio. Eso no significa que el cliente no seguirá llamando a métodos en el bean sin estado, pero sí significa que el cliente no puede depender de que el bean recuerde nada sobre las llamadas a métodos anteriores.

¡MÍRALO!
¡Los beans sin estado PUEDEN tener estado! (Simplemente no es un estado específico del cliente).

Algunas personas piensan que “sin estado” significa “sin estado”. Un bean sin estado puede tener variables de instancia como cualquier otro objeto; simplemente no puede usarlos para mantener valores específicos para un cliente en particular.

NO HAY PREGUNTAS TONTAS

P:

P: Escuché que solo los beans de sesión sin estado son escalables y que nadie debería usar beans de sesión completos . ¿Es eso cierto?

A:

R: No, no completamente. Escierto que los beans de sesión sin estado generalmente son más escalables que los beans de sesión con estado debido a la forma en que el contenedor administra los beans sin estado . Verá las razones de esto en el capítulo Session Bean.

Pero... eso no significa que nunca debas usar beans con estado. Debe considerar beans con estado cuando necesite un estado conversacional, y cuando las alternativas para guardar ese estado (como usar el cliente para almacenar el estado, o usar un servlet para almacenar el estado, o usar una base de datos para almacenar el estado entre cada llamada de método del cliente ) afectan más el rendimiento que la naturaleza menos escalable de los beans de sesión con estado.

HAZ QUE SE PEGUE
Un bean de entidad ES algo. Un bean de sesión HACE algo.

SACA PUNTA A TU LÁPIZ

Conozca sus tipos de frijol.

Mire la descripción del problema a la izquierda y coloque una marca de verificación para el tipo de bean que mejor se adapte al problema. No hay una respuesta correcta perfecta para esto... puede decidir que un tipo de bean funcionará si lo aborda de una manera, pero otro bean funcionará si resuelve el problema de una manera diferente.

 	
Entidad

Impulsado por mensajes

frijol de sesión

(encierre en un círculo sin estado, con estado o ambos)

Reservar una entrada para un concierto de rock







con estado

apátrida

Una cuenta bancaria







con estado

apátrida

Búsqueda de una base de datos de productos







con estado

apátrida

emparejamientos de servicios de citas







con estado

apátrida

Recibir los informes de gastos presentados y enviarlos para su aprobación







con estado

apátrida

Diagnóstico experto en línea: usted describe un síntoma y el sistema lo ayuda a determinar la causa







con estado

apátrida

Los libros en una biblioteca







con estado

apátrida

ESCUCHADO EN EL TIKUIBEAN LOUNGE

FRIJOL DE SESIÓN: Estoy tan cansada de hacer todo el trabajo y no obtener nada de la gloria.

CANTINERO:  ¿Qué quiere decir con "nada de la gloria"? ¿No eres el único bean que ha requerido la especificación desde el principio? ¿Desde EJB 1.0?

BEAN DE SESIÓN:  ESO me hace mucho bien. De lo único que todos quieren hablar ahora es de beans de entidad. Beans de entidad, beans de entidad, beans de entidad. No es que no me gusten, algunos de mis mejores amigos son frijoles de entidad, pero me gustaría que la gente hablara sobre lo que hago.

CANTINERO:  Ahora que lo menciona, los beans de entidad son principalmente de lo que habla la gente aquí en el bar, con las grandes mejoras de CMP en EJB 2.0.

SESSION BEAN:  Y eso es otra cosa... ¿Cuál es el Gran Trato con CMP? ¡Simplemente va a una base de datos! En serio, dime ¿QUÉ tiene eso de especial? “¡Ooohhh mira! ¡Actualizó un registro!” Por favor.

CANTINERO:  Sí, pero a los programadores de aquí parece gustarles no tener que hacer todo el código de la base de datos ahora. Y hay algo acerca de las relaciones persistentes, simplemente no puedo recordar...

FRIJOL DE SESIÓN: CMR. Relaciones gestionadas por contenedores. Vale, incluso yo tengo que admitir que CMR facilita mucho las cosas a los desarrolladores. Pero eso no es lo que me molesta: SÉ que a todos les gustan los beans de entidad, pero ¿qué hay de MÍ? ¿Qué pasa con todo lo que hago? Los beans de entidad representan cosas en el sistema, pero sin mí, esas cosas no sirven de mucho. Tal vez una entidad tenga algunos getters y setters y algunas consultas, seguro, pero no mucha lógica empresarial. Para usar beans de entidad en una aplicación, TIENE que usar beans de sesión para realizar el procesamiento comercial. Por ejemplo, un bean de entidad podría representar las bebidas que vende aquí y los clientes individuales, pero ¿de qué sirven las bebidas y los clientes sin un cantinero? ¡Necesitas a alguien que realmente reúna las entidades (las bebidas y los clientes) de una manera significativa! Y eso es lo que hacen los beans de sesión. Hacemos los tratos. Trabajamos con el cliente para hacer algo, mientras que las entidades simplemente se sientan allí esperando que los beans de sesión los usen. Oye, ¿puedo conseguir otro de esos? Y ni siquiera me hagas empezar con beans controlados por mensajes...

[Continuará.]

PUNTA DE BALA

EJB es un modelo de desarrollo basado en componentes.

Los componentes son fragmentos reutilizables de funcionalidad que puede modificar para diferentes aplicaciones sin tocar el código fuente de Java.

Un beneficio de EJB es WODA—Write-Once-Deploy-Anywhere. Puede implementar sus componentes EJB 2.0 en cualquier servidor de aplicaciones que sea compatible con EJB 2.0.

WODA significa que debe aprender solo una API estándar en lugar de las API específicas del proveedor.

La arquitectura EJB usa un EJBObject para interceptar llamadas de clientes a un bean. Esto le da al servidor/contenedor la oportunidad de intervenir y agregar servicios.

Los servicios EJB incluyen transacciones, seguridad, gestión de recursos, redes y persistencia.

Los beans vienen en tres sabores: Entidad, Sesión y Mensaje.

Los beans de entidad representan una cosa identificable de forma única en un almacén persistente; por lo general, eso significa una fila en una tabla de base de datos.

Los beans controlados por mensajes son consumidores de servicios de mensajería JMS.

Los beans de sesión son... todo lo demás .

Los beans de sesión pueden ser con estado o sin estado.

Los beans con estado pueden recordar el "estado conversacional" con un cliente, mientras que los beans sin estado no pueden.


































