# UNIDAD 2 APLICACIONES WEB CON JAVA Y PHP PARTE 1

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido

1. Introducción, objetivos y software recomendado
   * 1.1 NetBeans

2. Programación web con Java. Introducción a JSP
   * 2.1 Ciclo de vida de una JSP
      * 2.1.1 Escribir una página JSP
      * 2.1.2 Sintaxis JSP básica
      * 2.1.3 Elementos de scripting
      * 2.1.4 Directivas
      * 2.1.5 Documentos JSP

3. Programación web con Java. Trabajo con Servlets
   * 3.1 Ciclo de vida de un Servlet
   * 3.2 Gestión de los eventos del ciclo de vida
   * 3.3 Inicialización del Servlet
   * 3.4 Métodos de servicio
   * 3.5 Invocación de un Servlet
   * 3.6 Peticiones y respuestas HTTP
   * 3.7 Generación de la respuesta
   * 3.8 Finalización de un Servlet

4. Programación web con Java. Seguridad en JSP

5. Programación web con Java. Introducción a Enterprise Java Beans
   * 5.1 El ecosistema EJB
   * 5.2 El despliegue de EJB
   * 5.3 El administrador del sistema
   * 5.4 Tipos de Beans

6 Programación web con Java. Introducción al patrón MVC
   * 6.1 Arquitectura o patrón de Software

7. Programación web conPHP. Introducción a PHP
   * 7.1 Introducción e instalación de Apache, PHP y MySQL
      * 7.1.1 Instalación de XAMPP
      * 7.1.2 Panel de control del Xampp
      * 7.1.3 Administrar los módulos
   * 7.2 Sintaxis de PHP
      * 7.2.1 Etiquetas de PHP
      * 7.2.2 Separación de Instrucciones
      * 7.2.3 Comentarios
      * 7.2.4 Variables
      * 7.2.5 Referencias indirectas a variables
      * 7.2.6 Superglobales
      * 7.2.7 Tipos de datos básicos
         * 7.2.7.1 Los enteros (int)
         * 7.2.7.2 Números de tipo punto flotante (float)
         * 7.2.7.3 Cadenas de caracteres (String)
         * 7.2.7.4 Booleanos (Boolean)
         * 7.2.7.5 Nulo (null)
      * 7.2.8 Arreglos o Matrices (Arrays)
      * 7.2.9 Constantes
      * 7.2.10 Operadores
      * 7.2.11 Estructuras de Control
         * 7.2.11.1 Estructuras condicionales
         * 7.2.11.2 Estructuras de bucle
      * 7.2.12 Funciones
      
## Introducción

La combinación de lenguajes de programación distintos a la hora de desarrollar una aplicación software es bastante común. Ello es debido a que determinados lenguajes aportan ventajas sobre otros.  

En el caso del uso mixto de Java y PHP, se trata de una combinación muy frecuente, sobre todo, debido a la gran expansión del uso de aplicaciones web que ha tenido lugar en la última década.  

Por un lado, PHP ofrece un lenguaje sencillo de aprender y utilizar, totalmente especializado a entornos de internet. Además, desde la introducción de la orientación a objetos en PHP, el uso de estandares y patrones de diseño es mucho más fácil.  

Por otro lado, Java aporta las facilidades de portabilidad entre sistemas, la robustez y el amplio grado de difusión entre todo tipo de empresas, lo que son atributos que complementan perfectamente a las bondades de PHP.  

Por este motivo, queda claro que un profesional del desarrollo software no tiene mejores alternativas, si quiere enfocarse al desarrollo web, que utilizar esta combinación que a su vez se apoya en otras tecnologías muy difundidas y en muchas ocasiones abiertas, que potencian todavía más el ecosistema: XML, gestores de bases de datos relacionales, etc. 

## Mapa conceptual

<img src="images/c2/4-0-1.png">

<img src="images/c2/4-0-2.png">

## 1. Introducción, objetivos y software recomendado

Hablar de tecnología y ver el avance en el desarrollo de los lenguajes de programación ligados a Internet, nos da una idea de la forma tan vertiginosa con la que ha evolucionado todo desde la generalización en el uso del software online.   

A pesar de toda esta evolución, los orígenes de estas tecnologías están conectados profundamente con los sistemas tradicionales de visualización basados en textos de los primeros lenguajes de programación. Lo que ocurre es que, a medida que se han ido superando las limitaciones de capacidad de almacenamiento y memoria que presentaban los ordenadores más antiguos, los lenguajes de programación se han vuelto más flexibles y potentes. 

A medida que las capacidades de computación han ido progresando, se ha visto clara la necesidad de innovar aceleradamente durante los últimos años y migrar a un medio más gráfico y usable.   

En este mismo contexto podemos decir que esta evolución ha ido de la mano del desarrollo de nuevas herramientas requeridas para generar código y desarrollar software empleando estas nuevas tecnologías.  

Los creadores de software, en la actualidad, tratan de aprovechar todo el abanico de posibilidades que presentan las nuevas tecnologías, por lo cual necesitan herramientas de programación cada vez más robustas.  

Por este motivo y para satisfacer esta demanda de los programadores informáticos, se han diseñado y comercializado muchas herramientas dirigidas a los desarrolladores web. Igualmente se han creado nuevos lenguajes específicos como HTML, PHP, ASP o JAVA, para ayudar a los programadores a diseñar y lanzar sus aplicaciones informáticas en Internet.   

Cada una de estas herramientas ya tiene unos cuantos años de evolución en el mercado, lo que les ha permitido ir mejorando y proporcionando a los desarrolladores web actuales un conjunto de instrumentos de una potencia increíble.   

Sin embargo, a pesar de que estas herramientas adquieren fuerza con el paso del tiempo, aún se presentan ciertas diferencias que separan claramente lo que son las aplicaciones de Internet, de las aplicaciones tradicionales de escritorio. 

<img src="images/c2/4-1-1.jpg">

**Modelo petición - respuesta**

En el ámbito visual o interfaz gráfica de usuario, probablemente la diferencia más notoria es que al ser una interfaz web, esta requiere de realizar una petición continua de páginas. Por tanto, para que ocurra cada interacción en una aplicación web, una nueva petición se realiza al servidor. Para ejecutar estas peticiones se debe recargar la página con el propósito de obtener la información actualizada que provee el servidor al cliente (que usualmente será un navegador web).   

Esta limitación no está impuesta específicamente por los navegadores, sino que es debido a que el proceso se basa en el protocolo HTTP, que está basado en un sistema de peticiones y respuestas al que deben ajustarse todos los navegadores.  

Sin embargo y, aunque en teoría, esta manera de funcionamiento es viable, los desarrolladores han comenzado a exigir un sistema más dinámico y flexible, de manera que los tiempos de respuesta de sus aplicaciones puedan reducirse hasta niveles similares a los de las aplicaciones de escritorio. 

Las aplicaciones web presentan una serie de ventajas, pero también de desventajas o, si lo preferimos, denominémoslo como inconvenientes. 

Por ejemplo, en cuanto a las ventajas de las aplicaciones web sobre las de escritorio, las segundas suelen presentar el problema de la incompatibilidad. Es decir, que una aplicación creada para una plataforma o para un sistema operativo no pueda funcionar en otro sistema operativo, de modo que se obliga al desarrollador a realizar distintas versiones para cada uno de ellos.

Por lo contrario, las aplicaciones web o de Internet son más sencillas de adaptar a los variados navegadores que existen en el mercado, con independencia del sistema operativo donde esté corriendo dicho navegador.

Esto unido a que la mayor parte de los usuarios utilizan los mismos navegadores, ofrece una vía más sencilla para la publicación de aplicaciones y de este modo, alcanzar a más clientes o usuarios con una menor inversión en el desarrollo del software.

Así mismo, también debemos tener en cuenta que una de las más notables ventajas es que para las aplicaciones web se tiene y se mantiene un solo código fuente centralizado, mientras que las aplicaciones de escritorio deben contar con varias versiones de modo que para poder corregir algún error debemos volver a compilar todo el programa para hacerlo funcionar en el ordenador y eso complica conocer quién ha tocado el programa fuente en cada ocasión que se introduce algún cambio.

Contrariamente, las aplicaciones web se ubican en un servidor único al que pueden acceder todos los clientes. Cualquier cambio en la funcionalidad del código se realiza directamente en el servidor y de esta forma se encuentra disponible de forma inmediata para los usuarios. Además, se mantiene un registro de seguridad que controla quién fue el desarrollador que realizó la mejora en el código en cada momento.

Por otro lado, es verdad que también encontramos algunos inconvenientes que se pueden presentar en las aplicaciones web. Por ejemplo, la velocidad de respuesta que nos ofrezca el servidor donde se encuentra alojada dicha aplicación puede lastrar el rendimiento de la aplicación, ya que éste depende del ancho de banda de Internet y de las veces que las páginas deban de cargarse para ofrecer una respuesta oportuna al cliente. Por ejemplo, una aplicación web que en un momento puntual está siendo utilizada por muchos usuarios puede incluso llegar a bloquearse. Esto, por lo contrario, no ocurre con las aplicaciones de escritorio, ya que al hacer click sobre un botón, obtenemos lo que necesitamos al disponer de recursos de memoria y procesamiento en local.  

Los resultados ofrecidos por las aplicaciones web están ligados a que éstas producen de forma dinámica páginas codificadas en HTML o XHTML, que las puede interpretar cualquier navegador web. Es aquí donde entra en escena la fase cliente – servidor, donde en el lado del servidor se emplean lenguajes tales como php, Java, etc., para incluir elementos que permitan al cliente visualizar una interfaz de usuario más interactiva, y así el usuario pueda disfrutar de una experiencia dinámica con las páginas web.  

Por otra parte, esa información que puede visualizar el cliente está alojada en un servidor en Internet, que, enviándola al navegador web, la interpreta para luego ser vista de forma interactiva por parte del usuario final.   

Para el desarrollo de aplicaciones web los lenguajes más recomendados son Java, PHP, Python, Ruby, Perl, Javascript, entre otros. Cuando un programador tiene experiencia previa en el desarrollo de aplicaciones de escritorio es necesario que cambie considerablemente sus hábitos para convertirse en un buen desarrollador web. Por ejemplo, puede ocurrir que el programador esté acostumbrado a entornos de diseño concretos o a utilizar algún editor de texto determinado para luego probar las aplicaciones en algún navegador web.  

No significa que ahora no podamos utilizar esta forma de trabajar, pero a medida que la tecnología avanza, la complejidad de las aplicaciones desarrolladas también aumenta y es necesario contar con un número mayor de herramientas que nos apoyen en este arduo trabajo, como pueden ser algunas de las que comentaremos a continuación. 

### 1.1 NetBeans

<img src="images/c2/4-1-2.png">

No es un simple editor típico para desarrollo web, sino que se trata más bien de un entorno de desarrollo completo e integrado de código abierto. Auspiciado por Sun Microsystems, hoy parte de Oracle, es una excelente alternativa para desarrollar aplicaciones web, ya que posee un completo soporte a partir de su versión 6.5.  

Una de las principales características de NetBeans para aplicaciones web es que nos permite completar el código y encontrar algún error mientras vamos programando, así como también permite depurar el código desde el mismo entorno al usar la herramienta Findbugs.  

Dentro de este marco, al utilizar NetBeans, tendremos a nuestra disposición un panel que vigilará todas las peticiones del servidor. Los lenguajes de servidor que soporta NetBeans son Java (JSP o Servlets), PHP, Ruby o Grove. Es importante señalar que, si se trabaja con el gestor de base de datos MySQL, se podrá administrar todo nuestro proyecto desde el mismo entorno de trabajo. 

#### Enlace de interés

En el siguiente enlace podrás descargar, de forma gratuita, el entorno de desarrollo NetBeans. 

https://netbeans.org/

#### Ejemplo práctico

A continuación, encontrarás un ejemplo práctico sobre una aplicación web: 

<img src="images/c2/4-1-2.png">

[PDF](pdf/Ejemplo_practico_1.1.pdf)

<img src="images/c2/4-1-3.png">

<img src="images/c2/4-1-4.png">

## 2. Programación web con Java. Introducción a JSP

La tecnología JSP (Java Server Pages) facilita la creación de contenido web por medio de componentes estáticos y también dinámicos. Es una extensión de los Java Servlets, que proporcionan un acercamiento más adecuado a la generación de contenidos. Ciertamente JSP admite la creación de Servlets a partir de ficheros de texto que contienen una mezcla de HTML (o cualquier otro lenguaje de marcado) y scripts de código.

Una página JSP es un documento de texto que posee dos tipos de textos: datos estáticos, que se representan por medio de algún formato de texto (HTML, WML, XML, etc.); y elementos JSP, que sirven de base para desarrollar el contenido dinámico.

**Extensión sugerida**

La extensión sugerida para el fichero origen de una página JSP es .jsp, aunque puede tener otras como .jspf, si la página solamente genera un fragmento de otra página JSP, o .jsf si se trata de una aplicación Java Server Faces.

**Elementos de una página**
Los elementos de una página JSP pueden representarse en dos sintaxis (estándar y XML), no obstante, no pueden alternarse ambas dentro de un mismo fichero.

**Contenidos web**

JSP es un complemento a los Servlet, pero no es un sustituto de los mismos. Existen dos clases de contenidos web:

* Contenido estático:
   Son las partes de una página web que no varían, como por ejemplo el nombre y apellido de un paciente en el sistema de gestión médica de un hospital.
   
<img src="images/c2/4-2-1.png">

[Video](https://www.youtube.com/watch?v=ed-OyXDxNjM&feature=emb_logo)   

### 2.1 Ciclo de vida de una JSP

Cómo hemos comentado anteriormente, una JSP sirve peticiones como un Servlet. Por tanto, el ciclo de vida y algunas características de la JSP (particularmente, los aspectos dinámicos) están determinadas por la tecnología Java Servlet. 

Cuando una petición es recibida por una JSP, el contenedor web verifica si el Servlet de la JSP es más antiguo que la JSP. En caso positivo, el contenedor web interpreta la JSP a un Servlet y compila la clase que resulta del proceso. Todo este ciclo es automático.  

Siguiendo el ciclo, a continuación, se presentaría la fase de traducción, donde cada tipo de datos de la JSP se trata de forma diferente. La información estática se convierte en código fuente que irá directamente al flujo de la respuesta. No obstante, los componentes de la JSP se manipulan de la siguiente forma: 

1. Las directivas se utilizan para controlar cómo el contenedor web traduce y ejecuta la página JSP. 

2. Los elementos de scripting se agregan en el Servlet de la página JSP. 

3. Las expresiones del lenguaje se pasan como parámetros al evaluador de expresiones de JSP. 

4. Los elementos `jsp:[set│get]Property` se transforman en las llamadas correspondientes a los métodos de los JavaBeans. 

5. Los elementos `jsp:[include│forward]` se convierten en peticiones al API Java Servlet. 

6. Los elementos `jsp:plugin` se convierten en el código de marcado determinado para activar un applet. 

7. Las llamadas a etiquetas personalizadas se convierten en llamadas al manejador de etiquetas. 

<img src="images/c2/4-2-2.png">

[Video](https://www.youtube.com/watch?v=gOpnLcXDmpA&feature=emb_logo)  

Tanto en la traducción como en la compilación pueden ocurrir errores que se mostrarán cuando se hace la solicitud a la página por primera vez. Si el error se encuentra durante cualquiera de estas dos fases, el servidor devolverá una excepción JasperException y un mensaje que presenta el nombre de la página JSP y la línea en la que ha ocurrido el error.  

Una vez que la página ha sido traducida y compilada, el Servet de la JSP sigue el ciclo de vida del Servlet: 

1. Si no existe ninguna instancia del Servlet de la JSP, el contenedor:  

* Carga la clase del Servlet de la JSP. 
* Instancia la clase del Servlet de la JSP. 
* Inicializa la instancia del Servlet llamando al método jspInit. 

2. El contenedor invoca al método `_jspService`, pasándole los objetos de petición y respuesta. 

3. Si el contenedor necesita eliminar el Servlet de la JSP, llama al método jspDestroy. 

#### 2.1.1 Escribir una página JSP

Una página JSP posee tres clases de elementos, cada cual con su etiqueta propia parecida a HTML: 

**Scriptlets**

Scriptlets  Sentencias Java ejecutadas cuando la página es cargada. Cada una de estas sentencias se encierra entre etiquetas &lt; % y % &gt; 

**Declaraciones**

Declaraciones  Sentencias para crear variables de instancia y manejar otras tareas de configuración necesarias en la presentación de la página. Están encerradas entre etiquetas &lt; % y % &gt; 

**Expresiones**

Expresiones  Expresiones Java que son evaluadas, produciendo una salida visualizada en la página. Están encerradas entre etiquetas &lt; % y % &gt;

<img src="images/c2/4-2-3.png">

[Video](https://www.youtube.com/watch?v=vxLphsdkNPU&feature=emb_logo)

#### 2.1.2 Sintaxis JSP básica

A continuación, se presenta la sintaxis básica que se puede utilizar para desarrollar una JSP. 

<img src="images/c2/4-2-4.png">

**Ejemplo práctico**

El siguiente ejemplo contiene una página JSP que incluye una expresión, es una llamada al constructor Java.until.Date(). Este constructor produce una cadena de texto que contiene la fecha y hora actual. Esto se puede escribir en cualquier editor de texto o en los entornos de programación Java que se tengan disponibles.    

```html
<html> 
   <head>
      <title>Fecha y hora actual</title>
   </head>  
   <body>
      <h1 align="Center">
      <%= new java.util.Date() %>
      </h1>
   </body> 
</html>  
```

#### 2.1.3 Elementos de scripting

Estos elementos definen el código contenido en una JSP y se codifican según la sintaxis de la estructura Java. A continuación, se muestran estos elementos principales: 

<img src="images/c2/4-2-5.png">

**Elementos de scripting**

#### 2.1.4 Directivas

Las directivas proporcionan las propiedades de las JSP y del Servlet resultante. Se trata de elementos de preprocesado que se evalúan durante el tiempo de compilación. Existen tres tipos de directivas que se presentan a continuación: 

<img src="images/c2/4-2-6.png">

**Tipos de directivas**

#### 2.1.5 Documentos JSP

Cuando hablamos de documentos JSP, estamos hablando de páginas JSP escritas en XML. Es por ello que, un documento JSP es también un documento XML, por lo que permite la flexibilidad y las ventajas de este tipo de tecnología: 

1. Se puede emplear cualquier herramienta XML para modificar páginas JSP, de tal forma que se garantice que el documento JSP esté bien formado. 

2. Se puede validar el documento JSP con su correspondiente DTD. 

3. Puede existir una anidación de los espacios de nombres en los documentos JSP.

4. Se puede emplear un documento JSP para intercambiar datos entre aplicaciones Web y XML en el momento de la compilación. 

A continuación, se presenta un resumen de cómo convertir la sintaxis de una JSP estándar a un documento JSP: 

<img src="images/c2/4-2-7.png">
Tabla. Conversión entre sintaxis JSP estándar y sintaxis XML JSP. 

<img src="images/c2/4-2-8.png">

<img src="images/c2/4-2-9.png">

## 3 Programación web con Java. Trabajo con Servlets

Un Servlet es un componente Java que se ejecuta en el servidor y que se encarga de administrar conexiones HTTP guiado por el ciclo de vida que repasaremos más adelante. El Servlet procesa la petición del cliente y proporciona una respuesta adecuada.   
No obstante, los Servlet también se pueden emplear para sincronizar peticiones concurrentes o reenviar peticiones a otros Servlets o a otros componentes web. 

<img src="images/c2/4-3-1.jpg">

**Modelo de respuesta a peticiones HTTP**

<img src="images/c2/4-3-2.png">

[Video](https://www.youtube.com/watch?v=ICSrmaxxThU&feature=emb_logo)

### 3.1 Ciclo de vida de un Servlet

Un Servlet tiene un ciclo de vida que se detalla en la interfaz javax.servlet.Servlet y todos los Servlets siguen el mismo ciclo de vida 

<img src="images/c2/4-3-3.png">

**Ciclo de vida del Servlet**

<img src="images/c2/4-3-4.png">

[Video](https://www.youtube.com/watch?v=CZzyi_0ImwI&feature=emb_logo)

### 3.2 Gestión de los eventos del ciclo de vida

Es factible visualizar y reaccionar a los eventos del ciclo de vida del Servlet añadiendo oyentes (listeners) con métodos que se llaman cuando suceden dichos eventos. Estos oyentes son clases que implementan una interfaz definida, así como se detalla a continuación. Cuando un método de un oyente es invocado, envía información relacionada con dicho evento. Por ejemplo, el evento HttpSessionEvent posee información sobre la sesión HTTP. 

<img src="images/c2/4-3-5.png">

**Eventos del ciclo de vida de un Servlet**


### 3.3 Inicialización del Servlet

Cuando el contenedor web carga e instancia el Servlet, previamente a recibir peticiones de los clientes, el servlet debe ser inicializado. Este proceso de inicialización puede ser personalizado para leer datos de configuración de la capa de persistencia. Por ejemplo, para inicializar recursos o cualquier otra acción. Cuando no ocurre la inicialización por algún motivo, se lanzaría una excepción del tipo UnavailableException.  

El proceso de inicialización va a depender del origen de la misma. Si los parámetros inciden a los Servlet de forma individual, entonces se emplea el objeto ServletConfig. Si, por lo contrario, la inicialización se realiza en común a todos los Servlet, se utilizaría el objeto ServletContext. 

#### ¿Sabías que...?

La Excepción UnavailableException generalmente implica que el Servlet se compiló inicialmente con clases que el servidor no puede localizar. 

### 3.4 Métodos de servicio

Los Servlet proporcionan un servicio donde implementan el método service de GenericServlet en los métodos doXXXX de HttpServlet o en otros métodos del protocolo que siga la clase que implementa la interfaz Servlet.  

Sin embargo, estos métodos están vacíos, por lo que al escribir un Servlet es indispensable sobreescribirlos. Dado el caso de un HttpServlet, los métodos que se necesitan implementar son: 

**`doGet()`**

El método GET de HTTP es uno de los más comunes. Se solicita cuando un usuario pulsa sobre el enlace URL en su navegador. Una petición GET puede contener varios parámetros. Por ejemplo:

`http://algunsitio.com/login.htm?usuario=nombre&tipo=estud`

El primer parámetro de la lista está indicado por un signo de interrogación y el valor se especifica con el signo ‘=’. Los demás parámetros se separan con el signo ‘&’.

**`doPost()`**

Se utiliza en formularios HTML y permite el envío de grandes volúmenes de datos ocultos en el cuerpo de la petición. 

**`doHead()`**

Funciona exactamente como el método GET, la diferencia es que devuelve la cabecera HTTP. Se utiliza para verificar la disponibilidad del enlace. 

**`doPut()`**

Es similar a FTP, ya que sube archivos al servidor, pero su uso es poco común. 

### 3.5 Invocación de un Servlet

Un Servlet HTTP recibe una petición HTTP oculta en un objeto HttpServletRequest, que posee la URL de la petición y cualquier otra información. Esta se pasa con el formato `http://[host]:[port][request path]?[query string]`, donde: 

**Ruta de contexto (Context path)**  

Es la unión de la barra de dirección y el contexto raíz de la aplicación web del Servlet. 

**Ruta del Servlet (Servlet path)**  

Es la porción de la ruta que identifica al componente cuyo alias se activa con esta petición.  

**Información de ruta (Path info)**  

Es la parte de la ruta de la petición (request path) que no pertenece ni a la ruta del Servlet ni a la ruta del contexto. 

**Cadena de consulta**  

Está formada por un conjunto de atributos y sus valores. </p>

### 3.6 Peticiones y respuestas HTTP

Los Servlet son llamados cuando una petición HTTP hace referencia al mismo, ya sea directamente, como en el caso de un Servlet Java, o indirectamente por medio de una JSP. Fundamentalmente, el Servlet se nutrirá de la información contenida en la petición, la procesará y generará los resultados insertándolos en una respuesta HTTP (ver imagen).  

<img src="images/c2/4-3-6.jpg">

**Funcionamiento básico de un Servlet**

Las peticiones HTTP poseen la información enviada desde cliente y es factible acceder a ella. Ésta puede ser a través del objeto javax.servlet.HttpServletRequest, que define los métodos utilizados para obtener esa información, si se trata de un Servlet, o, si se trata de una JSP, a través del objeto implícito, con los mismos métodos del caso anterior.  

Si vemos el caso de la respuesta HTTP, el Servlet la construye a partir de un objeto tipo javax.servlet.HttpServletResponse que puede ser manipulado directamente (si hablamos de un Servlet) o indirectamente (si hablamos de una JSP). 

### 3.7 Generación de la respuesta

En este proceso, la respuesta del Servlet posee los datos devueltos al cliente como respuesta al procesamiento de la información que éste proporcionó. En un Servlet, todas las respuestas instauran la interfaz ServletResponse que incluye métodos para diversos aspectos: 

1. Adquirir el flujo de salida utilizado para enviar los datos al cliente. Esto facilita el envío de caracteres con el PrinterWritter devuelto por el método getWriter() o enviar datos MIME en el cuerpo de la respuesta a través del ServletOutputStream que proporciona el método getOutputStream(). 

2. Señalar el tipo de contenido de la respuesta (por ejemplo, text/html o application/pdf) con el método setContentType. Lógicamente, este método debe invocarse antes que se genere la respuesta. 

3. Establecer si se guarda la salida en un buffer o no, con el método setBufferSize(int). Este almacenamiento permite escribir la salida antes de hacer efectivo el envío al cliente, de forma que el Servlet tenga más oportunidad para diseñar las cabeceras o para esperar los resultados de otro componente web. 

4. Especificar la información de localización con el locale (configuración regional) y el juego de caracteres utilizados. 

Específicamente, en el caso de HTTP, el manejo de las peticiones de los clientes que lleva a cabo el método service se suele confiar a los métodos doGet y doPost, dependiendo del tipo de petición. 

### 3.8 Finalización de un Servlet

Una vez que el contenedor de Servlet nota que el Servlet debe ser borrado (esto ocurre cuando el contenedor necesita más memoria o cuando el contenedor se esté apagando), entonces, el contenedor llama al método destroy del Servlet. Este método permite liberar los recursos que esté utilizando el Servlet y almacenar cualquier estado persistente. Todos los métodos de servicio se deben completar antes de que el Servlet sea borrado. 

<img src="images/c2/4-3-7.png">

<img src="images/c2/4-3-8.png">

<img src="images/c2/4-3-9.png">

<img src="images/c2/4-3-10.png">

<img src="images/c2/4-3-11.png">


## 4. Programación web con Java. Seguridad en JSP

La seguridad en los sitios web es imprescindible, ya que en estos se maneja mucha información relevante y confidencial de todos los usuarios que acceden a la aplicación mientras navegan por Internet. Es por ello que existe una serie de protocolos de seguridad que son aplicados a las JSP y los Servlet. A continuación, se enumeran y describen cada uno de ellos:

#### Autenticación (authenticate)

Este método certifica a un usuario por medio de un proceso de inicio de sesión configurado en el Servlet. La sintaxis se muestra a continuación:

boolean authenticate(HttpServletResponse response)

Este método de autenticación se ve representado en la siguiente figura.

<img src="images/c2/4-4-1.png">

**Proceso de Autenticación Servlet – JSP**

El flujo anterior muestra claramente el proceso a seguir. Cuando la autenticación resulta verdadera, el resultado de la validación es satisfactorio. En caso contrario, si la información suministrada es incompleta o errónea, se presenta un error java.io.IOException cuando se está generando la respuesta.

#### Usuarios y roles (login)

Este método permite a los clientes validarse por medio de un identificador y una clave de acceso. Estos usuarios deben tener roles asignados para que la seguridad sea mayor, ya que los servidores web asocian los roles de los usuarios a las restricciones de seguridad y a algunos recursos de las JSP. La sintaxis utilizada es la que se presenta a continuación:

login(java.lang.String username, java.lang.String password)

Donde el username es el identificador que se emplea para acceder a la JSP y el password es la clave.

En este punto puede ocurrir una excepción ServletException: si el módulo para iniciar sesión no aguanta la autenticación del identificador de usuario y clave, si ya se ha certificado con anterioridad (antes de la llamada al inicio de sesión) o si la verificación del identificador de usuario y la clave suministrada no es correcta.
 
#### Finalizar sesión (logout)

con este método estaremos finalizando la sesión de usuario y deshabilitando la sesión HTTP. Este proceso tiene varios pasos:

* Elimina las cookies.

* Inhabilita la sesión HTTP.

* Borra el usuario de la memoria caché de autenticación.

* Especifica el tipo de autenticación en null.

Después de que se cierra la sesión, se necesita volver a iniciar sesión para poder acceder a los recursos de la JSP. La sintaxis para el método finalizar sesión es: logout()

#### Enlace de interés

Para conocer más sobre la seguridad JSP, te recomiendo el siguiente enlace:

[Métodos de seguridad de Servlet](https://www.ibm.com/support/knowledgecenter/es/SSEQTP_9.0.5/com.ibm.websphere.base.doc/ae/rsec_secgetru.html)

<img src="images/c2/4-4-2.png">
[Video] (https://www.youtube.com/watch?time_continue=2&v=cEle0k0MIfA&feature=emb_logo)

<img src="images/c2/4-4-3.png">

<img src="images/c2/4-4-4.png">

## 5. Programación web con Java. Introducción a Enterprise Java Beans

Enterprise JavaBeans (EJB) es una arquitectura de componentes del lado del servidor que simplifica el proceso de creación de aplicaciones distribuidas de clase empresarial en Java. Al utilizar EJB, se pueden escribir aplicaciones escalables, confiables y seguras sin crear tu propio marco complejo de componentes distribuidos.   

EJB se trata de un entorno de desarrollo rápido de aplicaciones para el lado del servidor. Permite construir rápida y fácilmente los componentes del lado del servidor en Java mediante el uso de una infraestructura distribuida. EJB está diseñado para admitir la portabilidad y la reutilización de las aplicaciones en todos los servicios de middleware de la empresa.   

Define un acuerdo (contrato) entre componentes y servidores de aplicaciones que permite que, cualquier componente, se ejecute en cualquier servidor de aplicaciones. Los componentes de EJB (llamados Enterprise Beans) son desplegables y pueden importarse y cargarse en un servidor de aplicaciones que aloje dichos componentes. Los tres beneficios principales de EJB son los siguientes: 

1. La industria está de acuerdo en hacer un uso generalizado de este enfoque. Debido a la democratización de su aplicación, cada vez es más fácil contratar ingenieros que entiendan los sistemas de la empresa (ya que pueden tener experiencia previa con EJB en otras organizaciones), aprender las mejores prácticas para optimizar un sistema, asociarse con otras empresas (la tecnología es compatible) y vender software (ya que los clientes aceptarán más fácilmente una solución con estas características). Se aplica el concepto de “entrenar una vez, codificar en cualquier lugar”. 

2. La portabilidad es más fácil. La especificación EJB se publica y está disponible de forma gratuita para todos. Dado que EJB es un estándar, no es necesario apostar por una arquitectura propia y exclusiva de un proveedor determinado. Y aunque la portabilidad nunca será gratuita, sí que será más barata que si no hubiese un estándar. 

3. Desarrollo rápido de aplicaciones. Una aplicación se puede construir más rápido, porque obtiene servicios de infraestructura de middleware, como transacciones, agrupación, seguridad, etc. del servidor de aplicaciones. 

La arquitectura EJB solo soporta el lenguaje Java por ahora. Aunque suene un poco restrictivo, lo positivo es que Java es uno de los lenguajes más adecuados para la construcción de componentes por los siguientes motivos:  

**Separación de interfaz / implementación**

Necesitamos un lenguaje que admita una separación clara entre la interfaz e implementación para mantener al mínimo las actualizaciones y el mantenimiento de los componentes. Java admite esta separación a un nivel sintáctico, a través de las palabras clave de la interfaz y la clase. 

**Segura**  

La arquitectura de Java es mucho más segura que otros lenguajes de programación tradicionales. En Java, si un hilo muere, la aplicación permanece activa. Los punteros ya no son un problema. Las pérdidas de memoria ocurren menos frecuentemente. Java también tiene un amplio conjunto de bibliotecas, de modo que Java no es sólo la sintaxis propia de un lenguaje, sino que incluye todo un conjunto de librerías preescritas y depuradas que evitan a los desarrolladores reinventar la rueda de una manera tediosa. Esta seguridad es extremadamente importante para aplicaciones de misión crítica. Bien es verdad que, la sobrecarga requerida para lograr este nivel de seguridad, puede hacer que una aplicación sea más lenta, pero el 90% de los programas empresariales son interfaces gráficas de usuario (GUI) accediendo a bases de datos, lo que no implica un gran consumo de recursos.  

### 5.1 El ecosistema EJB

Para que una implementación de EJB se ejecute con éxito, necesita más que un servidor de aplicaciones y componentes. De hecho, el estándar EJB fomenta la colaboración de múltiples actores diferentes. Cada uno de estos elementos es un experto en su campo y es responsable de una parte clave de la implementación exitosa de EJB. Debido a que cada parte es un especialista, el tiempo total requerido para construir una implementación de clase empresarial se reduce significativamente. Juntos, estos elementos forman el ecosistema EJB.   

Cuando una compañía pretende introducirse en el ecosistema EJB debe conocer quiénes son los elementos de dicho ecosistema EJB. De este modo, podrá analizar sus necesidades y su modelo de negocio y determinar qué rol puede cubrir de forma más competitiva dentro de ese escenario. 

#### Para saber más...

Es posible que hayas oído hablar de otro estándar llamado JavaBeans. Los JavaBeans son completamente diferentes de los Enterprise JavaBeans. En pocas palabras, los JavaBeans son clases Java que tienen métodos get / set. Son componentes Java reutilizables con propiedades, eventos y métodos (similares a los controles ActiveX de Microsoft) que se pueden conectar fácilmente para crear aplicaciones Java, normalmente muy visuales. El marco JavaBeans es ligero en comparación con Enterprise JavaBeans. Se pueden usar JavaBeans para ensamblar componentes más grandes o para compilar aplicaciones completas. JavaBeans, sin embargo, son componentes de desarrollo y no son componentes desplegables. Normalmente no se implementa en JavaBean; más bien, JavaBeans ayuda a construir software más grande que es desplegable. Y debido a esto, JavaBeans no necesita vivir en un entorno de ejecución y, por lo tanto, en un contenedor. Como los JavaBeans son solo clases de Java, no necesitan un servidor de aplicaciones para crear instancias, destruirlas y proporcionarles otros servicios. Una aplicación EJB puede usar JavaBeans, especialmente cuando se están compaginando datos de la capa EJB con otras. Por ejemplo, los componentes que pertenecen al nivel de presentación o a una aplicación que no sea J2EE escrita en Java.

### 5.2 El despliegue de EJB

Después de que el ensamblador de aplicaciones genere la aplicación, la aplicación debe desplegarse (y ponerse en funcionamiento) en un entorno operativo de ejecución. Algunos de los desafíos que se presentan aquí son los siguientes:  

1. Asegurar la implementación con un firewall (hardware o software) y otras medidas de protección.  

2. Integrarse con los repositorios de políticas de seguridad de la empresa, como por ejemplo los servidores LDAP, Novell Directory Server o Microsoft Active Directory.  

3. Selección del hardware que proporcione el nivel de calidad y rendimiento requerido.  

4. Disponer de hardware redundante y otros recursos para incrementar la confiabilidad y la tolerancia a fallos. 

5. Ajuste fino (fine tunning) del sistema.

Con frecuencia, el ensamblador de aplicaciones, que normalmente es un desarrollador o analista de sistemas, no está familiarizado con estos problemas. Aquí es donde el despliegue EJB puede fallar y por ello, la necesidad de contar con el rol del “deployer”, que conoce los requisitos operativos específicos para realizar las tareas necesarias.  

### 5.3 El administrador del sistema

Una vez que se implementa el EJB, aparece otro rol, el administrador del sistema. Éste interviene para supervisar la estabilidad de la solución desplegada. El administrador del sistema es responsable del mantenimiento y la supervisión del sistema implementado y puede hacer uso de las herramientas de administración y monitorización en tiempo de ejecución que proporciona el servidor EJB.  

Por ejemplo, un servidor EJB sofisticado podría avisar a un administrador del sistema si se produce un error grave que requiera atención inmediata. Algunos servidores EJB mejoran estas funcionalidades mediante la integración con productos de monitorización profesional. 

### 5.4 Tipos de Beans

Podemos encontrar tres tipos diferentes de beans empresariales, tal y cómo se muestra en la imagen que aparece a continuación: 

<img src="images/c2/4-5-1.png">

**Interacción con componentes EJB**

**Beans de sesión**

Los beans de sesión modelan los procesos de negocio. Son como los verbos, porque realizan acciones. La acción podría ser cualquier cosa: agregar nuevos números a una agenda, acceder a una base de datos, llamar a un sistema heredado o llamar a otros beans empresariales. Ejemplos de beans de sesión pueden ser: un motor de fijación de precios en la web de una compañía aérea, un motor de workflow, un gestor de catálogo, una pasarela de pago con tarjeta o un bróker de acciones.

**Beans de entidad**

Dan forma a los datos del modelo de negocio. Son como sustantivos, porque son objetos de datos, es decir, objetos de Java que almacenan información de la base de datos. Por ejemplo: un producto, un pedido, un empleado, una tarjeta de crédito o una acción de la Bolsa de Madrid. Los beans de sesión suelen aprovechar los beans de entidad para lograr objetivos comerciales, como hace el sistema de fijación de precios de una aerolínea (bean de sesión) cuando establece el precio para un billete de avión (bean de entidad).

**Beans controlados por mensaje**

Los beans controlados por mensaje son similares a los beans de sesión porque realizan acciones. La diferencia es que solamente se puede llamar a este tipo de beans de forma implícita enviándoles mensajes. Por ejemplo, un bean que recibe una petición de compra de un billete de avión y otra para realizar el pago con una tarjeta de crédito. (Estos beans controlados por mensajes también pueden llamar a otros beans empresariales).

<img src="images/c2/4-5-2.png">

<img src="images/c2/4-5-3.png">

## 6. Programación web con Java. Introducción al patrón MVC

El Modelo-Vista-Controlador (MVC) es uno de los paradigmas, de las llamadas arquitecturas software, que hay en el mundo de la programación.  

Previo al abordaje por completo de este paradigma, vamos a tratar de entender lo que es un patrón de software o también llamada arquitectura, y así comprender mejor de que se trata. 

### 6.1 Arquitectura o patrón de Software

A grandes rasgos, Eugenia Bahit define la arquitectura de Software como “la forma en la que se organizan los componentes de un sistema, interactúan y se relacionan entre sí y con el contexto, aplicando normas y principios de diseño y calidad, que fortalezcan y fomenten la usabilidad a la vez que dejan preparado el sistema, para su propia evolución”  

Los patrones facilitan crear software con propiedades de alta calidad. Estos atributos de calidad, cuando se cumplen, hacen que el producto resultante sea totalmente satisfactorio.  

**Criterios de calidad deseables**  

A continuación, se enumeran algunos de los criterios de calidad deseables en un software durante su ejecucion:   Disponibilidad de uso Confidencialidad Respeto de la funcionalidad Rendimiento del sistema adecuado respecto a la magnitud del procesamiento realizado Confiabilidad Seguridad externa e interna 

**Propiedades de calidad**  

Y, las propiedades de calidad en cuanto a la programación del software:  

1. Configurabilidad a los usuarios 
2. Integrabilidad 
3. Integridad 
4. Interoperabilidad 
5. Modificabilidad 
6. Mantenibilidad 
7. Portabilidad 
8. Reusabilidad 
9. Escalabilidad 
10. Testeabilidad 

El patrón Modelo-Vista-Controlador (MVC) es el patrón de diseño más adecuado y recomendado para responder a la interactividad de las aplicaciones, las cuáles dividen sus funcionalidades entre los diferentes objetos que contienen, de forma que se acoplen de manera satisfactoria.

MVC divide una aplicación interactiva en tres áreas: procesamiento, salida y entrada. Para esto, utiliza las siguientes abstracciones:
 
<img src="images/c2/4-6-1.png">

**Patrón Modelo-Vista-Controlador**

**Modelo**

Encapsula la información que maneja el sistema, incluyendo la información de negocio y las lógicas de acceso. El modelo avisa a la vista cuando se produce alguna modificación de los datos del modelo y permite consultar el estado de los mismos. También, permite al controlador acceder a las funcionalidades de la aplicación encapsuladas por el modelo. El modelo es independiente de cualquier representación de salida y/o comportamiento de entrada.

**Vista**

Es la interfaz de usuario, es decir, decide cómo se presenta la información del modelo al usuario, actualizando la interfaz cuando se produce alguna modificación. La vista también reenvía la entrada del usuario. Pueden existir múltiples vistas del modelo. Cada vista tiene asociado un componente de controlador.

**Controlador**

Recibe las entradas, normalmente como eventos que codifican los movimientos o pulsaciones de botones del ratón, pulsaciones de teclas, etc. Responde a dichos eventos modificando el modelo y pudiendo producir, por tanto, cambios en la vista. Así pues, el controlador interpreta la entrada del usuario y la correspondencia en acciones que serán llevadas a cabo por el modelo. Un controlador escoge la siguiente vista a mostrar basándose en las interacciones del usuario y los resultados de las operaciones del modelo.

La capa de presentación se puede implementar, cuando nos guiamos por el patrón MVC, mediante el framework Java Server Faces (JSF).   

Para implementar la vista, JSF propone el uso de páginas JSP (Java Server Pages). Cada página JSP contiene componentes web como formularios, cajas de texto o botones. Estos componentes se definen mediante etiquetas JSTL (JSP Standard Tag Library). Cada vez que el usuario interactúa con estos componentes (por ejemplo, pulsando sobre algún botón) ocurre un evento. Este evento es notificado vía HTTP a un Servlet especial, que se sitúa en el lado del servidor denominado Faces. Este Servlet Faces constituye el controlador de JSF. FacesServlet viene incorporado en el framework y no necesita ser implementado por el desarrollador. Constituye el auténtico motor de las aplicaciones JSF. Cada aplicación, aun ejecutándose en el mismo servidor que otras, tiene un Servlet propio. Por último, la parte del modelo recae sobre los beans de respaldo o backing beans. Éste es el que muestra los atributos y la lógica de los objetos asociados con la interfaz que utilizan los usuarios, empleando para ello una JSP. Por otra parte, los atributos del backing bean están enlazados a un componente. Un backing bean también maneja un conjunto de procedimientos que ejecutan acciones para los mencionados componentes, tales como asegurar sus datos y manipular los eventos que ejecuta, entre otros. 

**Enlace de interés**

En el siguiente enlace podrás encontrar información sobre el framework Java Server Faces (JSF): 

[Introducción a JavaServer Faces](http://www.jtech.ua.es/j2ee/publico/jsf-2012-13/sesion01-apuntes.html)

#### Para saber más...

Un Framework es un marco para trabajar o esquema que permite escribir un programa o código en un lenguaje de programación determinado. 

<img src="images/c2/4-6-2.png">

<img src="images/c2/4-6-3.png">

## 7. Programación web conPHP. Introducción a PHP

El lenguaje de programación PHP sirve para procesar hipertextos y es el que más se ha empleado en la programación de las aplicaciones de visualización online. Este lenguaje introduce una separación entre los aspectos de visualización en la web y el gestor de la base de datos.

Para trabajar con PHP debemos contemplar tanto los aspectos que tienen que ver con la conexión con la base de datos, así como con el formato del contenido que queremos que contenga la salida por la web.

El mencionado lenguaje de programación PHP puede ejecutarse en el servidor directamente, aunque para una etapa de programación eficaz es más adecuado utilizar un entorno de desarrollo que esté capacitado para ejecutar los comandos específicos del lenguaje.

PHP es una tecnología de open source, cuyo código se genera en el servidor y está encapsulado para el usuario web. Es un lenguaje de programación con el que es muy ventajoso trabajar, puesto que posee una comunidad de programadores muy amplia y existe muy buena información sobre este lenguaje accesible a través de distintos medios (internet, libros, academias, etc).

<img src="images/c2/4-7-1.jpg">

**Programación web con PHP**

El mencionado lenguaje de programación opera bajo el paradigma orientado a objetos, pero, de igual forma, es eficiente trabajarlo de manera estructurada. Esto, dependerá de las destrezas de cada programador y de sus objetivos y necesidades.

PHP posee alguna sintaxis similar a otros diversos lenguajes de programación como Perl, C, shell, e incluso Java. Realmente, es un lenguaje híbrido, que toma las mejores funciones de otros lenguajes y crea un lenguaje de scripting potente y fácil de usar. 

<img src="images/c2/4-7-2.png">

[Video](https://www.youtube.com/watch?v=9d2BJsxff-g&feature=emb_logo)

### 7.1 Introducción e instalación de Apache, PHP y MySQL

Apache es un servidor web, es decir, es un sistema que ejecuta una aplicación que se encuentra del lado del servidor y genera conexiones en dos direcciones o en una dirección, de forma síncrona o asíncrona con un usuario y ejecutando o dando una respuesta (en algún lenguaje de programación o alguna aplicación), a demanda por parte del cliente. Además, puede ser parte de una red que dota de servicios a otros equipos, es decir, un servidor web local.   

Por tanto, podemos decir que Apache es un servidor web local desarrollado en software libre y de código abierto, de forma que los desarrolladores web puedan disponer de él gratuitamente y sin limitaciones. Fue desarrollado por Apache Software Foundation y es una herramienta que los programadores pueden utilizar para probar sus sistemas web antes de ser subidos a un servidor web público (que podría ser también Apache o de otro fabricante). 

Este servidor está diseñado de forma modular, lo que permite integrar otros elementos como:   

* Bases de datos (como el gestor MySQL) 
* Diversos lenguajes de programación (PHP, Python o Perl)  

Y de esta manera disponemos de un entorno completo para generar páginas y sistemas web.  

<img src="images/c2/4-7-3.png">

Apache está incluido en varios paquetes comerciales y de libre distribución que permiten instalar no solo el servidor (Apache) sino también el lenguaje de programación (PHP) y MySQL como gestor de la base de datos. Algunos de estos paquetes son XAMPP, WAMP o LAMP.  

A continuación, veremos la configuración del paquete XAMPP. Los demás son muy similares y poseen las mismas funcionalidades del XAMPP y no resultaría muy diferente su instalación y configuración. 

#### 7.1.1 Instalación de XAMPP

Los pasos para la instalación de XAMPP son:

1. Descargar

   Para versiones con PHP 5.5, 5.6 o 7, este paquete se descarga sin coste alguno.

2. Ejecutar archivo.exe

   Cuando el paquete es descargado en nuestro ordenador, se debe pulsar sobre el archivo.exe para ejecutarlo.

3. Iniciar asistente de instalación
   
   En este punto aparecerá una pantalla de instalación, en la cual pulsaremos el botón next.
   
   <img src="images/c2/4-7-4.jpg">
   
   **Pantalla inicio para instalar Xampp**
   
4. Seleccionar los componentes a instalar

   En este apartado se podrán seleccionar o deseleccionar algunos componentes que se consideren no apropiados para nuestro servidor. No obstante, se sugiere dejar seleccionados los componentes que vienen predeterminados en el servidor, como se puede observar en la imagen siguiente:
   
   <img src="images/c2/4-7-5.jpg">
   
   **Componentes para la instalación del Xampp**
   
5. Seleccionar directorio

   En este momento se escoge la carpeta donde se desea instalar el Xampp. Si en el paso anterior se seleccionó la opción por defecto, el alojamiento de la instalación será ubicado en el disco C donde se creará una carpeta llamada xampp. Tal y cómo se puede observar en la siguiente imagen:

   <img src="images/c2/4-7-6.jpg">
   
   **Directorio para la instalación del Xampp**
   
6. Arrancar proceso de instalación

   En este punto se iniciará la instalación del servidor, en la ubicación seleccionada para tal fin. Dicho proceso puede tardar un poco, y su progreso puede verse con una barra, tal y cómo se observa en la imagen siguiente:

   <img src="images/c2/4-7-7.jpg">
  
   **Progreso de la instalación del Xampp**
 
7. Configuración de Firewall

   Cuando iniciamos la instalación del servidor es probable que aparezca en el asistente de instalación una pantalla que indique un bloqueo de firewall. Aquí podemos marcar el check que permite la comunicación de Apache en una red de trabajo o en una red privada. No es recomendable emplearlo en red pública por motivos obvios de seguridad.
   
   <img src="images/c2/4-7-8.png">
  
   **Alerta de bloqueo de Firewall**

8. Fin de la instalación

   Una vez terminado el proceso de instalación, aparecerá una pantalla que permitirá pulsar encima del botón Finish para terminar con la misma. También tendremos la opción de marcar sobre la casilla correspondiente para ir al panel de control de Xampp.
   
   <img src="images/c2/4-7-9.jpg">
  
   **Finalización instalación del Xampp**
   
   
#### Enlace de interés

En este enlace puedes descargar este paquete para las versiones con PHP 5.5, 5.6 o 7:  

[Descargar XAMPP](https://www.apachefriends.org/download.html)
   
#### 7.1.2 Panel de control del Xampp

En la imagen siguiente se muestra la imagen del panel de control del Xampp, donde podremos configurar (activar y desactivar) los servicios que este servidor nos provee, siendo una interfaz de usuario muy intuitiva y usable. 

<img src="images/c2/4-7-10.png">

**Panel de control del Xampp.**

#### Servicios que se pueden configurar  

A continuación, vemos los servicios que se pueden configurar:  

* **Config**: para configurar XAMPP, así como otros componentes aislados. 
* **Netstart**: muestra todos los procesos que están en funcionamiento en el ordenador local. 
* **Shell**: lanza una ventana de comandos UNIX. 
* **Explorer**: abre la carpeta XAMPP en el explorador de Windows. 
* **Services**: muestra todos los servicios en funcionamiento. 
* **Help**: incluye enlaces a foros de usuarios. 
* **Quit**: se usa para salir del panel de control. 

#### Artículo de interés

Accede a este enlace y aprende cómo instalar tu servidor local xampp: 

[XAMPP: instalación y primeros pasos](https://www.ionos.es/digitalguide/servidores/herramientas/instala-tu-servidor-local-xampp-en-unos-pocos-pasos/)

#### 7.1.3 Administrar los módulos

Los módulos que posee el paquete Xampp tienen, cada uno, su propio administrador “Admin” con funciones específicas para ellos. Las podemos enumerar de la manera siguiente: 

1. Cuando se hace click en el botón “Admin” de Apache, podremos ingresar a la ruta web del servidor por medio del navegador web que posea tú ordenador. Una vez allí, el navegador nos conducirá a la página de inicio de XAMPP en el servidor local (localhost). Si se introdujo la URL localhost/dashboard/ podremos ingresar a la página principal del servidor Apache, que se muestra en la siguiente imagen:

   <img src="images/c2/4-7-11.jpg">

   **Página principal del servidor Apache**


2. Para poder tener acceso al gestor de base de datos MySQL, es necesario pulsar sobre el botón “Admin” del mismo y se podrá entrar a su administrador en phpMyAdmin, que es el responsable de soportar y gestionar las bases de datos de nuestros proyectos web. Si deseamos ingresar a la interfaz gráfica de usuario mediante el servidor web, debemos introducir en la URL de nuestro navegador Web localhost/phpmyadmin/.

   <img src="images/c2/4-7-12.png">
   
   **Interfaz gráfica del phpMyAdmin**
   
#### Enlace de interés

Accede a este enlace para conocer más sobre Localhost: 

[Localhost (127.0.0.1)](https://www.ionos.es/digitalguide/servidores/know-how/localhost/)

#### Ejemplo práctico

A continuación, encontrarás algunos ejemplos y/o sugerencias para probar la instalación correcta del Xampp: 

[Descarga ejemplo práctico](/pdf/Ejemplo_practico_7.1.3.pdf)

### 7.2 Sintaxis de PHP

A lo largo de este apartado veremos los aspectos básicos de la sintaxis de PHP necesarios para elaborar cualquier programa.

La sintaxis es el conjunto de reglas que hay que seguir para que el programa funcione. Si cometemos errores en la sintaxis no obtendremos los resultados que esperamos. Por este motivo, debemos conocer las etiquetas que se utilizan en PHP, como declarar las variables o los tipos de datos, entre otros aspectos. 

#### 7.2.1 Etiquetas de PHP

En el momento en que el lenguaje de programación PHP revisa un archivo, localiza las etiquetas de inicio y de fin, que son `<?php` y `?>`. Éstas, le indican al lenguaje dónde iniciar y dónde culminar la lectura del código. Esta estructura permite incrustar PHP en los archivos HTML, puesto que lo que esté ubicado fuera de las etiquetas de inicialización y cierre de PHP será interpretado de la manera que se identifique en cada documento, en nuestro caso particular como HTML.   

Si un archivo posee únicamente programación PHP, se recomienda obviar la etiqueta de fin de PHP, una vez terminado el código. De esta forma, se evita la inclusión de espacios en blanco posteriores a la etiqueta antes mencionada, que produciría efectos negativos dentro de la programación.  

#### Ejemplo práctico

A continuación, encontrarás un ejemplo práctico sobre las etiquetas de PHP: 

[Descarga Ejemplo práctico](/pdf/Ejemplo_practico_7.2.1.pdf)

#### 7.2.2 Separación de Instrucciones

El lenguaje PHP necesita que las sentencias finalicen en punto y coma (;) al concluir cada instrucción, automáticamente si existe una nueva sentencia y está presente el punto y como (;), asumirá esta como nueva.  

<img src="images/c2/4-7-13.png">

#### 7.2.3 Comentarios

Lo siguiente que vamos a aprender sobre PHP es cómo escribir comentarios, porque casi todos los códigos de los buenos programadores tienen comentarios. Puedes escribir comentarios de tres diversas formas: 

<img src="images/c2/4-7-14.png">

Los tipos de comentarios que poseen "una sola línea" se toman como comentarios sólo hasta que llega el fin de la línea comentada de código de PHP. Significando entonces que, el código HTML que pueda estar escrito a posteriori de “// ... ?&gt;” o “# ... ?&gt;”, el compilador lo imprimirá en pantalla. 

#### 7.2.4 Variables

Las variables en PHP son bastante diferentes de otros lenguajes de programación como es el caso de C y Java. Debido a su naturaleza de tipo débil, que en resumen significa que no es requerido definir las variables previamente a su utilización, no es necesario declarar su tipo y, consecuentemente, una variable podrá cambiar el tipo de su valor como lo desee.   

Las variables en PHP están precedidas por el signo $, y se definen de modo similar a algunos de los lenguajes actuales. Podrán iniciar con una letra (A-Z a-z) o _ (guion bajo) y pueden tener tantos caracteres alfanuméricos y guiones bajos como deseemos. 

##### Ejemplos nomenclaturas  

Estos son algunos ejemplos de la nomeclatura de variables:  

* `$contar` 
* `$_Objeto` 
* `$A123` 

##### Ejemplos que no usar  

Estos son algunos ejemplos de los nombres de variables que no pueden utilizarse:   

* `$123`  
* `$*ABCA` 

Como ya indicamos, no es necesario declarar las variables o su tipo antes de usarlas en PHP. El código siguiente es un ejemplo del uso de las variables: 

<img src="images/c2/4-7-15.png">

Podemos recalcar que ninguna de las variables se declara antes de usarlas. Además, el hecho que $PI es una variable tipo float y $radio (un entero) no se declara tampoco antes de su inicialización y ambas funcionan perfectamente.  

PHP no admite variables globales como muchos otros lenguajes de programación. Las variables son locales a su alcance, y si se crean en una función, solo están disponibles durante el tiempo que la variable esté activa en esa función. Las variables que se crean en el script principal (no dentro de un procedimiento) no son variables globales. No puedes ver dentro de las funciones, pero puedes llegar a ellas usando una matriz especial $ GLOBALS [], empleando el nombre dado a la variable como una cadena. El ejemplo presentado anteriormente se reescribirá de la siguiente manera:  

<img src="images/c2/4-7-16.png">

#### 7.2.5 Referencias indirectas a variables

Una característica extremadamente útil de PHP es que podrás ingresar a las variables usando referencias indirectas, es decir, puedes crear y acceder a las variables en tiempo de ejecución por su nombre. Veamos el ejemplo siguiente:  

<img src="images/c2/4-7-17.png">

Este código presenta como resultado la impresión de “Usuario registrado” La línea en negrita usa un $ adicional para acceder a la variable con el nombre especificado por el valor de $nombre ("Juan") y cambiando su valor a "Usuario registrado" (al tiempo que se crea una variable llamada $Juan). Puedes usar tantos niveles de direccionamiento indirecto como desees agregando signos “$” adicionales delante de una variable. 

#### 7.2.6 Superglobales

PHP no admite variables globales (variables a las que se puede ingresar automáticamente desde cualquier ámbito) como regla general. Sin embargo, ciertas variables internas especiales se comportan como variables globales similares a las de otros lenguajes. Estas variables se denominan superglobales y están predefinidas por PHP para su uso. Algunos ejemplos de estas variables superglobales son los que ves en la tabla a la derecha.  

Es importante saber que puedes llegar, desde cualquier parte de tú código, a estas variables, ya sea función, método, o alcance global. No tienes que usar la matriz $ GLOBALS [], que permite acceder a las variables globales sin tener que declararlas de antemano ni utilizar la palabra clave global en desuso. 

**`$_GET [ ]`**

Una matriz que incluye todas las variables GET que PHP recibió del navegador del cliente.

**`$_POST [ ]`**

Una matriz que incluye todas las variables POST que PHP recibió del navegador del cliente.

**`$_COOKIE [ ]`**

Una matriz que incluye todas las cookies que PHP recibió del navegador del cliente.

**`$_ENV [ ]`**

Una matriz con las variables identificadas como de entorno.

**`$ _SERVER [ ]`**

Un arreglo con los valores de las variables del servidor web.

#### 7.2.7 Tipos de datos básicos

Existen ocho tipos diferentes de datos en PHP: cinco de estos son escalares. Las variables presentadas anteriormente pueden contener valores de algunos de estos, sin declarar explícitamente su tipo. La variable "se comporta" de acuerdo al tipo de dato que contiene.  

* Los enteros (int) 
* Números de tipo punto flotante (float) 
* Cadenas de caracteres (String)  
* Booleanos (Boolean) 
* Nulo (null) 

##### 7.2.7.1 Los enteros (int)

El tipo que representa a estas variables son números enteros y están limitados al rango de valores disponible en el compilador. Eso significa que un int con signo de 32 bits tiene un rango entre –2,147,483,648 y + 2,147,483,647. Los enteros se pueden escribir en decimal, hexadecimal (con el prefijo 0x) y notación de octetos (con el prefijo 0) y pueden incluir signos +/-.  

Ejemplos  

Algunos ejemplos de números enteros incluyen:   

* `240000` 
* `0xABCD` 
* `007`
* `-100`
 
##### 7.2.7.2 Números de tipo punto flotante (float)

Este tipo de datos float (llamados también números reales) representan números decimales y son equivalentes al doble del tipo que posee el compilador. En las plataformas más comunes, el tamaño de estos es de 8 bytes y poseen un rango de aproximadamente 2.2E –308 a 1.8E + 308. Los números float poseen un punto decimal y pueden incluir un signo +/- y un exponente. 

Ejemplos  

Algunos ejemplos serían:  

* `3.14`  
* `+ 0.9e-2``
* `-170000.5` 
* `54.6E42`

##### 7.2.7.3 Cadenas de caracteres (String)

Las cadenas en PHP son una lista de caracteres que siempre son terminadas en nulo internamente. No obstante, en contraposición a otros lenguajes de programación como C, PHP posee el nulo de terminación para medir el tamaño de una cadena, por lo que recuerda su longitud internamente.  

Esto permite un fácil manejo de los datos binarios en PHP, por ejemplo, creando una imagen sobre la marcha y enviándola al navegador. La longitud máxima de las cadenas varía según la plataforma y el compilador, pero podemos esperar que admita al menos 2 GB. No es recomendable escribir programas que lleguen a este límite, porque es probable que primero se alcance el límite de memoria del ordenador.   

Al escribir valores de cadena en el código fuente, puedes usar comillas dobles (") y comillas simples ('). A continuación, explicamos cada uno de ellos: 

* Comillas dobles:   

Algunos ejemplos son:  

* "PHP: lenguaje de programación” 
* "Alguna palabra"  
* "1234567890"   

Las cadenas pueden contener prácticamente todos los caracteres. Sin embargo, algunos caracteres no pueden escribirse tal y cómo vienen dados y requieren una notación especial: 

<img src="images/c2/4-7-18.png">

*Caracteres con notación especial, comillas dobles.*

Una característica adicional de las cadenas de comillas dobles es que ciertas notaciones de variables y expresiones se pueden incrustar directamente dentro de ellas. Sin entrar en detalles, aquí hay algunos ejemplos de cadenas válidas que incorporan variables. Los indicadores a las variables se reemplazan automáticamente con los valores de las mismas, y si los valores no son cadenas, se convierten a sus representaciones de cadena correspondientes (un ejemplo podría ser el integer 123, que se convertiría primero en un string "123").   

* "El resultado es `$resultado \n "` 
* " El desplazamiento de la matriz `$i` contiene `$arreglo [$i] "`  

En los casos de querer concatenar cadenas con valores (como variables y expresiones) y esta sintaxis no te funciona, puedes utilizar el . (punto) como operador para concatenar dos o más cadenas.  

* Comillas simples:   

Además de las anteriores, las comillas simples también pueden limitar las cadenas. La siguiente tabla incluye los dos únicos escapes admitidos por comillas simples:  

Ejemplos: 
* `‘Hola Mundo’` 
* `‘Esta es una prueba de cadenas encerradas en comilla simple’``

<img src="images/c2/4-7-19.png">

*Caracteres con notación especial, comilla simple.*

<img src="images/c2/4-7-20.png">

[Video](https://www.youtube.com/watch?v=YMyJLs22uY4&feature=emb_logo)

##### 7.2.7.4 Booleanos (Boolean)

Los tipos de datos booleanos se introdujeron por primera vez en PHP 4 y no existían en versiones anteriores. Un valor booleano podrá ser verdadero o falso. Como ya mencionamos anteriormente, PHP convierte automáticamente los tipos cuando es necesario. Boolean es posiblemente el tipo de los datos que se convierten más frecuentemente en la encapsulación. Esto es debido a que, en cualquier script que contenga un condicional o algún bucle, etc., los tipos se transforman en booleanos para verificar si se cumple la condición. Además, los operadores llamados de comparación dan como respuesta un valor de tipo booleano. Revisemos el siguiente código: 

Código:

```php
$numerador = 1;
$denominador = 5;
if ($denominador == 0) {
print " El denominador tiene que ser diferente de cero. \n";
}
```

La respuesta del operador igual, que es un booleano, en nuestro código, sería falso y, por ende, no se ingresaría al condicional if (). Veremos ahora el siguiente fragmento de código:

```php
$numerador = 1;
$denominador = 5;
if ($denominador) {
/* Realizar el cálculo */
} else {
print " El denominador debe ser un número distinto de cero. \n";
}
```

Puedes ver que no se utilizó ningún operador de comparación en este ejemplo. Sin embargo, PHP automáticamente convirtió $denominador internamente o, para ser más preciso, el valor 5 en su equivalente booleano, verdadero, para ejecutar la sentencia if () y, por lo tanto, ingresa al cálculo.

##### 7.2.7.5 Nulo (null)

Null es un tipo que sólo podrá tener un valor posible: el valor NULL. Marca las variables como vacías, y es especialmente útil para diferenciar entre la cadena vacía y los valores nulos de las bases de datos. El operador isset ($ variable) de PHP devuelve false para NULL y verdadero para algún tipo de datos diferente, siempre y cuando la variable exista. A continuación, un ejemplo de la utilidad de NULL:   

```php
$valor = NULL; 
```

#### 7.2.8 Arreglos o Matrices (Arrays)

Un arreglo en PHP es una colección de pares clave / valor. Esto quiere decir que asigna claves (o índices) a los valores. Los índices de matriz pueden ser enteros o cadenas, mientras que los valores pueden ser de cualquier tipo (incluidas otras matrices).

Tipos de arreglos:

##### Constructor array

Arreglo que se puede declarar mediante este constructor array () y que, generalmente, toma la siguiente forma (los elementos entre paréntesis, son opcionales):

array([key =>] value, [key =>] value, ...)

La clave es opcional y cuando no se especifica, la clave se asigna automáticamente (comenzando con 0). Se puede combinar el uso con y sin la clave, incluso dentro de la misma declaración. El valor en sí puede ser de cualquier tipo válido de PHP, incluida una matriz. Las matrices que contienen matrices dan un resultado similar a las matrices multidimensionales en otros lenguajes. Se verán varios ejemplos a continuación:

<img src="images/c2/4-7-21.png">

*Constructor array*

##### `$ arr[clave]`

Se podrá ingresar a los elementos del array empleando la notación $ arr [clave], donde clave es un entero o una expresión de cadena. Cuando uses una cadena constante para clave, debemos asegurarnos de no olvidar las comillas simples o dobles, como $arr ["clave"]. Esta notación se puede utilizar tanto para leer elementos de una matriz, como para modificar o crear nuevos elementos.

##### Lectura de valores de una matriz

Podemos utilizar la notación $arr [clave] para acceder a los valores. A continuación, ejemplos que explicarán mejor la teoría:

<img src="images/c2/4-7-22.png">

*Lectura de valores de una matriz*

##### Acceso a matrices anidadas(o matrices multidimensionales)

Al acceder a matrices anidadas, podemos agregar tantos corchetes como sea necesario y así alcanzar al valor relevante. A continuación, un ejemplo para identificar matrices anidadas:

<img src="images/c2/4-7-23.png">

##### ¿Sabías que...?

Las matrices en PHP se implementan utilizando tablas hash, lo que significa que el acceso a un valor tiene una complejidad promedio de O (1).

El estudio de la denominada complejidad computacional requeriría un curso específico, pero podrás profundizar en ello si te llama la atención este concepto a través de referencias como la siguiente:

https://plato.stanford.edu/entries/computational-complexity/

También, seguramente, hayas oído hablar de la computación cuántica que transformará el modo en que se programa y se realizan algoritmos. El aspecto más importante de la computación cuántica es que los niveles de complejidad computacional varían totalmente.

De nuevo puedes profundizar en esto en el siguiente artículo:

[Computación cuántica](https://retina.elpais.com/retina/2018/09/06/tendencias/1536224415_863634.html)

#### 7.2.9 Constantes

En PHP puedes definir nombres, llamados constantes, para valores simples. Como su nombre indica, no puedes cambiar estas constantes una vez que representan un valor. Los nombres de las constantes tienen las mismas reglas que las variables de PHP, excepto que no tienen el signo de dólar inicial. Es una práctica común en muchos lenguajes de programación, incluido PHP, usar letras mayúsculas para nombres de constantes, aunque no es obligatorio.   

Las constantes, al contrario de las variables, una vez definidas, son accesibles globalmente. No debes (y no puedes) volver a declararlas en cada nueva función y archivo PHP. Para definir una constante, usa la siguiente función:  

`define ("NOMBRE DE CONSTANTE", valor [, según el caso])`  

Donde:  

1. “NOMBRE DE CONSTANTE" es una cadena.  

2. valor es cualquier expresión PHP válida, excluyendo matrices y objetos.

3. La parte final de la definición es un valor booleano, según el caso, (verdadero / falso) y es opcional.   Por defecto, es verdadero. 

##### Para saber mas...

Es mejor que cuando uses constantes te preocupes de ir diferenciando entre minúsculas y mayúsculas y así tus constantes sean consistentes, con los modelos de codificación aceptados, y otros programadores que revisen tu código pueden entender tu escritura de mejor modo. Y también, porque no está claro si las constantes no escritas de este modo, distinguiendo entre mayúsculas y minúsculas, continuarán siendo compatibles con versiones futuras de PHP, lo que te obligaría a llevar una revisión de tu código. 

A continuación, se añade un sencillo ejemplo para definir y usar una constante: 

<img src="images/c2/4-7-24.png">

#### 7.2.10 Operadores

PHP posee operadores de tres tipos: operadores unarios, operadores binarios y un operador ternario.   

Los operadores binarios se utilizan situándolos entre dos operandos:   

* `2 + 3`
* `14 * 3.1415`  
* `$i - 1`

Estos ejemplos también son ejemplos simples de expresiones. PHP solo puede efectuar operaciones binarias en dos operandos que poseen el mismo tipo. Sin embargo, si los dos operandos tienen tipos diferentes, PHP convierte automáticamente uno de ellos al tipo del otro, en concordancia con las reglas siguientes (salvo que se señale lo contrario, como es el caso del operador de concatenación). 

* **Operadores Binarios**  

   * **Operadores numéricos**: todos los operadores binarios (excepto el operador de concatenación) funcionan solo en operandos numéricos. Si uno o ambos de los operadores son cadenas, booleanos, nulos o recursos, se convierten automáticamente a sus equivalentes numéricos previo a que se efectúe el cálculo.   
   
   <img src="images/c2/4-7-25.png">
   
   * **Operador de concatenación (.)**: este operador concatena dos cadenas. El siguiente ejemplo imprimirá "El año es 2000":  
      ```php   
      $anio = 2000;  
      print "El año es".$anio;
      ````
      El entero $anio se convierte internamente a la cadena "2000" antes que se una con el prefijo de la cadena "El año es". 
   
* **Los operadores de asignación**:   

Nos permiten transcribir el valor en una variable. El primer operando (el que se localiza a la izquierda del operador) debe estar disponible. El valor de una asignación es el valor final asignado a la variable. Por ejemplo, la expresión $var = 5 tiene el valor 5 (y asigna 5 a $ var).  

Además del operador de asignación normal =, existen otros varios distintos operadores de asignación que son compuestos de un operador seguido de un signo igual. Estos operadores aplican el operador tomando a la variable que se ubica a la izquierda como el operando primero y el valor que se ubica a la derecha (el valor de r) como el operando dos y fija el resultado de la operación a la variable de la izquierda.  

Ejemplo  

Por ejemplo:   

* `$contador + = 2; // Esto es idéntico a $contador = $contador + 2;``

* `$offset * = $contador; // Esto es idéntico a $offset = $offset * ➥ $ contador;  

* La siguiente lista proporciona los operadores de asignación compuesta válidos: `+ =, - =, * =, / =, % =, ^ =, . =, &amp; =, | =, &lt;&lt; =, &gt;&gt; = ``

* **Los operadores de comparación**

    Nos permiten determinar la relación entre dos operandos. Cuando ambos operandos son cadenas, la semejanza se efectúa de forma léxico-gráfica. La semejanza ofrece como resultado un valor booleano. Para los operadores de comparación siguientes, se ejecutan conversiones automáticas de tipo si es necesario.
    
   <img src="images/c2/4-7-26.png">

   *Operadores de comparación.*
    
 * **Los operadores lógicos** primero convierten sus operandos a valores booleanos y luego realizan la comparación respectiva.
 
   <img src="images/c2/4-7-27.png">
   
   *Operadores lógicos.*

* **Los operadores de negación** aparecen antes de su operando. Por ejemplo `! $Var` (! Es el operador, `$var` es el operando)    

   <img src="images/c2/4-7-28.png">
   
   *Operadores de negación.*
   
* **Los operadores incrementar/decrementar** operan solo en variables y no en ningún valor. Esto se debe a que, además de proporcionar el resultado, también cambian el valor de dicha variable.   

   <img src="images/c2/4-7-29.png">
   
   *Operadores incrementar/decrementar*

#### 7.2.11 Estructuras de Control

PHP admite una variedad de éstas, incluyendo las más comunes y disponibles en cualquier otro lenguaje de programación. Básicamente, se podrán separar en dos grupos: estructuras condicionales y estructuras de bucle. Las estructuras condicionales, dividen el camino del código y ejecutan u omiten porciones del programa según unos criterios, mientras que las estructuras de bucle ejecutan un código arbitrariamente según el criterio especificado. 

<img src="images/c2/4-7-30.png">

[Video](https://www.youtube.com/watch?v=b2ZtZndiT1Y&feature=emb_logo)

##### 7.2.11.1 Estructuras condicionales

Las estructuras de control condicional son cruciales para permitir que nuestro programa tome diferentes caminos de ejecución en función de las decisiones que se tomen en tiempo de ejecución. PHP soporta las estructuras de control condicional if y switch.

**Sentencia if**

Su sintaxis a continuación:

```php
if (expresión)
sentencias
elseif (expresión)
sentencias
…
else
sentencias
```

Las sentencias que acabamos de ver son las construcciones condicionales más frecuentes y existen en casi todos los lenguajes de programación. La instrucción en la sentencia if se refiere como instrucción de la verdad. Si la instrucción de verdad evalúa verdadero, la sentencia o la lista de éstas que le siguen, se ejecutan. En caso opuesto, no. Se puede agregar un condicional else a una sentencia if para ejecutar código, sólo si todas las expresiones de verdad en la sentencia if se evalúan como falsas:

```php
if ($var >= 50) {
print '$var está en el rango;
} else {
print '$var es inválida';
}
```

**Sentencia Switch**

Su sintaxis es la siguiente:

```php
switch (expr){
case expr:listado de sentencias
case expr:listado de sentencias
...default:
listado de sentencias
}
```

Puedes usar el constructor de switch para reemplazar ciertas construcciones largas if / elseif. Se le da una expresión y la compara con todos los posibles casos que figuran en su cuerpo. Cuando hay una coincidencia exitosa, se ejecuta el siguiente código, ignorando cualquier otra línea de caso (la ejecución no se detiene cuando se alcanza el siguiente caso). La valoración de la coincidencia se realiza internamente utilizando el operador ==, no el operador idéntico (===). Puedes usar la instrucción break para finalizar la ejecución y saltar al código que sigue a la construcción del switch.

Por lo general, los break aparecen al final de una lista de declaraciones de case, aunque no es obligatorio. Si no se cumple ninguna instrucción del case y la construcción del switch posee el valor predeterminado, se ejecuta la lista de sentencias default. Tengamos en consideración que el default debe ubicarse al final de la lista de casos o, por lo contrario, no debe colocarse en absoluto:

```php
switch ($pregunta) {
case 'y':
case 'Y': print "La respuesta es si\n";
break;
case 'n':
case 'N': print "La respuesta es no\n";
break;
default: print "Error: $pregunta no es una respuesta válida \n";
break;
}
```

<img src="images/c2/4-7-31.png">

[Video](https://www.youtube.com/watch?v=8t5-D5dZu5Y&feature=emb_logo)

##### 7.2.11.2 Estructuras de bucle

Las estructuras de bucle se emplean para repetir ciertas tareas en un programa, como iterar sobre una serie de resultados de búsquedas en la base de datos.

**ciclo While**

Donde su sintaxis sería:

```php
while (expr):
lista de sentencias
endwhile;
```

El ciclo while es el tipo de bucle más simple. Al principio de cada iteración se analiza la verdad de while. Si se considera verdadero, el ciclo se sigue ejecutando y con él, se efectúan las declaraciones internas. Si se evalúa falso, el bucle finaliza y se omite/n la/s declaración/es que están en el interior del bucle. Por ejemplo, aquí vemos una posible implementación del cálculo del factorial de un número, usando un bucle while (asumiendo que $n contiene el número para el cual queremos calcular el factorial):

```php
$resultado = 1;
while ($n > 0) {
$resultado *= $n--;
}
print "El resultado es $resultado";
```

**Ciclo Do-While**

La sintaxis que utiliza es la siguiente:

```php
do
sentencia
while (expr)
```

El bucle do ... while es similar al ciclo while de la sección anterior, a diferencia de que la instrucción de verdad se verifica al concluir cada iteración y no al principio. Lo que quiere decir que el ciclo siempre se ejecutará por lo menos en una ocasión. do ... while, son ciclos que en la mayoría de los casos se usan como una solución para romper fácilmente un módulo de código si una condición es verdadera. Veamos el ejemplo siguiente:

```php
do {
lista de sentencias
if ($error) {
break;
}
lista de sentencias
} while (false);
```

El bucle do ... while se repite al menos una vez, las sentencias dentro del ciclo se ejecutan una vez, y solo una vez. La expresión de la verdad siempre es falsa. Sin embargo, dentro del cuerpo del ciclo, se podrá emplear la instrucción break para parar la ejecución de las instrucciones en algún momento, lo cual es conveniente. Por este motivo, do ... while son los ciclos que se usan más a menudo para propósitos de iteración regular.

**Ciclo For**

Su sintaxis es la siguiente:

```php
for (expr_inicio, expr_verdad; expr_incremento):
lista de sentencias
endfor;
```

La expresión de inicio se evalúa solo una vez cuando se alcanza el bucle. En la mayoría de los casos, se emplea para inicializar la variable de control del ciclo. La expresión de verdad se evalúa al comienzo de cada iteración de bucle. Si es verdadero, las instrucciones dentro del bucle se ejecutarán; Si es falso, el bucle termina. La expresión de incremento se analiza al terminar cada iteración antes de evaluar de nuevo la expresión de verdad. Por lo general, se usa para incrementar la variable de control del bucle, pero también puede usarse para cualquier otro propósito.

```php
for ($i = 0; $i < 10; $i++) {
print " El cuadrado de $i es " . $i*$i . "\n";
}
```

El resultado de ejecutar este código es:

El cuadrado de 0 es 0
El cuadrado de 1 es 1
...
El cuadrado de 9 es 81

Igual que en el lenguaje C, es posible proporcionar los tres parámetros utilizando comas para delimitarlos. Alternativamente, también es factible no proporcionar uno o más de los parámetros. El valor de tales argumentos vacíos será verdadero. Por ejemplo, lo siguiente es un bucle infinito:

```php
for (;;) {
print "Ciclo infinito\n";
}
```

#### 7.2.12 Funciones

Las funciones en PHP pueden ser incorporadas o definidas por el usuario. Sin embargo, ambos casos se denominan de la misma forma. La manera general de llamar a una función es como sigue:  

`func (arg1, arg2, ...)`   

El número de argumentos varía de una función a otra. Cada argumento puede ser cualquier expresión válida, incluidas otras llamadas a funciones.  

**Ejemplo de una función predefinida**

Se muestra un ejemplo a continuación de una función predefinida:

```php
$length = strlen ("Juan");
```

strlen es una función PHP estándar que devuelve el tamaño de una cadena. Por lo tanto, a $length se le asigna la longitud de la cadena "Juan": 4.

**Ejemplo de una función empleada como parámetro de otra función**
Se muestra un ejemplo a continuación de una función que se emplea como un parámetro de otra función:

```php
$length = strlen (strlen ("Juan"));
```

Primero, se ejecuta el strlen interno ("Juan"), por lo que el resultado es el entero 4. Por otra parte, el código se simplifica a $length = strlen (4); strlen () espera una cadena, y por ende (debido al método mágico de PHP de conversión entre tipos) convierte el número entero 4 a la cadena "4", y, en consecuencia, el valor que resulta de $length es 1, que es la longitud de "4".

En resumen, podemos decir que hasta este momento hemos cubierto las características básicas del lenguaje PHP, incluyendo variables, estructuras de control y funciones. Has aprendido mucho sobre la sintaxis para ser productivo con el lenguaje, desde la perspectiva de un lenguaje funcional, obviando por ahora los aspectos relativos a los objetos.  

<img src="images/c2/4-7-32.png">

<img src="images/c2/4-7-33.png">


## BIBLIOGRAFÍA

* Babin, L. (2007). Introducción a AJAX con PHP. Madrid. Ediciones ANAYA Multimedia

* Cadenhead, R. y Lemay, L. (2008). Java 6. Madrid. Ediciones ANAYA Multimedia

* Perens, B. (2004). PHP 5 Power Programming. Indianapolis. Prentice Hall

* Roldán, D., Valderas, P. y Pastor, O. (2010). Aplicaciones Web, un enfoque práctico. México. Alfaomega Ra-Ma

* Roman, E., Rima, P. y Brose, G. (2005). Mastering Enterprise JabaBeans. Indianapolis. Wiley Publishing Inc

* Shach, S. (2005). Análisis y diseño Orientado a Objetos, con UML y el proceso unificado. México. Mc Graw Hill

* Zawodny, J. y Balling, D. (2004). MySQL Avanzado. Madrid. Ediciones ANAYA Multimedia

* Manteniendo el estado. Programación PHP. (23 de septiembre de 2019) Recuperado de 
https://programacion-php.readthedocs.io/es/latest/Tutorial3_Sesiones.md.html

* Los 5 mejores motores de plantillas para PHP. PHP México (23 de septiembre de 2019) Recuperado de
https://www.phpmexico.com/blog/cursos-y-certificaciones/las-5-mejores-plantillas-para-php/

