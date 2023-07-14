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
