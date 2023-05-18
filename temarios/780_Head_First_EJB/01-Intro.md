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































