# Capítulo 3: Escribiendo su Primer Servlet

* Creando una clase de Servlet
* Configuración de un Servlet para Deployment
* Entendiendo `doGet()`, `doPost()` y otros métodos
* Uso de parámetros y Accepting Form Submissions
* Configuración de su aplicación usando parámetros de inicialización
* Carga de archivos desde un formulario
* Hacer que su aplicación sea segura para Multithreading
* Resumen

### EN ESTE CAPÍTULO

* Creando una clase de Servlet
* Configuración de un Servlet para su deployment
* Comprensión de `doGet()`, `doPost()` y otros métodos
* Usar parámetros y aceptar envíos de formularios
* Configurando su aplicación usando init parameters
* Subir archivos desde un formulario
* Hacer que su aplicación sea segura para múltiples subprocesos (multithreading)

### DESCARGAS DEL CÓDIGO PARA ESTE CAPÍTULO

El código de este capítulo se divide en los siguientes ejemplos principales:

* Proyecto Hello-World
* Proyecto Hello-User
* Proyecto Customer-Support-v1

### DEPENDENCIAS DE NEW MAVEN PARA ESTE CAPÍTULO

En este capítulo, necesitará su primera dependencia de Maven, que se muestra en el siguiente código. Utilizará esta dependencia para cada capítulo a lo largo del resto del libro.

```html
  <dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>3.1.0</version>
    <scope>provided</scope>
  </dependency>
```

En el último capítulo, se familiarizó con los servidores de aplicaciones y los contenedores web y aprendió a ejecutar, implementar y depurar Apache Tomcat 8.0 desde su IDE de Java. En este capítulo, comenzará a crear aplicaciones web explorando primero el mundo de los servlets. A lo largo de este capítulo y el resto del libro, cambiará y mejorará continuamente estas aplicaciones, implementándolas en Tomcat para probarlas y depurarlas.

## CREANDO UNA CLASE SERVLET

En Java Platform, Enterprise Edition, un `Servlet` es lo que recibe y responde a las solicitudes(requests) del usuario final. La especificación de la API de Java EE define un servlet de la siguiente manera:

*Un Servlet es un pequeño programa Java que se ejecuta dentro de un servidor Web. Los servlets reciben y responden a solicitudes de clientes web, generalmente a través de HTTP, el Protocolo de transferencia de hipertexto*.

http://docs.oracle.com/javaee/7/api/javax/servlet/Servlet.html

Los servlets son las clases centrales en cualquier aplicación web, las únicas clases que realizan el trabajo de responder a las solicitudes o delegan ese trabajo a alguna otra parte de la aplicación. A menos que algún filtro termine prematuramente una solicitud (discutida en el Capítulo 9), cada solicitud a su aplicación pasa por algún Servlet. El contenedor web en el que ejecuta su aplicación tendrá uno o más Servlets integrados. Estos servlets manejan el servicio de JavaServer Pages, mostrando listados de directorios (si los tiene habilitados) y accediendo a recursos estáticos, como páginas HTML y gráficos. No tendrá que preocuparse por estos Servlets todavía (en algunos casos, nunca). En este capítulo, aprenderá a escribir y configurar los Servlets personalizados que componen su aplicación.

Cada Servlet implementa la interfaz `javax.servlet.Servlet`, pero generalmente no directamente. `Servlet` es una interfaz simple, que contiene métodos para inicializar y destruir el Servlet y atender las solicitudes. Sin embargo, se llamará al método `service` para cualquier solicitud de cualquier tipo, incluso si no es una solicitud HTTP (en teoría, suponiendo que su contenedor web admita dicha solicitud). Como ejemplo, en el futuro es posible que se agreguen nuevos Servlets a Java EE para admitir el Protocolo de transferencia de archivos (FTP). Por esa razón, existen varias clases de Servlet que puede ampliar en su lugar. A partir de Java EE 7, el único protocolo Servlet admitido actualmente es HTTP.

### QUE EXTENDER

En casi todos los casos, los servlets heredan de `javax.servlet.GenericServlet. GenericServlet` sigue siendo un Servlet independiente del protocolo con el método de servicio abstracto y solitario, pero contiene varios métodos auxiliares para registrar y obtener información sobre la aplicación y la configuración del Servlet (más sobre esto más adelante en la sección "Configuración de un Servlet para la implementación(Deployment)").

Para responder a solicitudes específicas de HTTP, `javax.servlet.http.HttpServlet` extiende `GenericServlet` e implementa el método de servicio para aceptar solo solicitudes HTTP. Luego, proporciona implementaciones vacías para los métodos correspondientes a cada tipo de método HTTP, como se ilustra en la Tabla 3-1.

TABLA 3.1: Implementaciones vacías para tipos de métodos HTTP

![03-01-T](images/03-01-T.png)

**NOTA** *La mayoría de los programadores web están familiarizados con los métodos `GET` y `POST` y los utilizan la mayor parte del tiempo. Si no está familiarizado con los distintos métodos HTTP o le gustaría obtener más información, ahora es el momento de hacer clic en http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html para ver la sección de especificaciones RFC-2616 sobre definiciones de métodos*.

Sin excepciones en este libro, sus Servlets siempre extenderán `HttpServlet`. Proporciona todas las herramientas que necesita para aceptar y responder selectivamente a diferentes tipos de solicitudes HTTP, y sus métodos aceptan los argumentos `javax.servlet.http.HttpServletRequest` y `javax.servlet.http.HttpServletResponse` en lugar de `javax.servlet.ServletRequest` y `javax.servlet.ServletResponse` para que tenga fácil acceso a los atributos específicos de HTTP de las solicitudes de sus servicios de Servlet. Debe comenzar por crear un Servlet nuevo y vacío que amplíe `HttpServlet`:

```java
package com.wrox;
 
import javax.servlet.http.HttpServlet;
 
public class HelloServlet extends HttpServlet {
 
}
```

**NOTA** *Para que este código se compile, debe tener la biblioteca API de Java EE Servlet en su ruta de clase de compilación. Aquí es donde entra en juego el Maven artifact enumerado en la primera página de este capítulo. En cada capítulo, necesitará los artefactos Maven enumerados para compilar los ejemplos de ese capítulo*.

En este formulario, su Servlet ya está preparado para aceptar cualquier solicitud HTTP y responder a ella con un error 405 Method Not Allowed. Así es como puede controlar a qué métodos HTTP responde su Servlet: Cualquier método de Servlet HTTP que no anule será respondido con HTTP `status 405`. Un Servlet que no maneja ninguna solicitud, por supuesto, no es muy útil, así que sobreescriba(override) el método `doGet` para agregar soporte para el método HTTP `GET`:

```java
package com.wrox;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
 
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("Hello, World!");
    }
}
```

Ahora su servlet está listo para responder a las solicitudes `GET` y devolver la respuesta de texto sin formato "Hello, World!" en el response body. El código de este ejemplo es bastante sencillo. Llamar a `getWriter` en el parámetro `response` devuelve un `java.io.PrintWriter`, una clase Java común que se utiliza para escribir texto en un flujo de salida. A continuación, el código llama al método `println` de `PrintWriter` para escribir el texto "Hello, World!" al flujo de salida. Tenga en cuenta que no tiene que preocuparse por ninguno de los detalles de la solicitud o respuesta HTTP sin procesar. El contenedor web se encarga de interpretar la solicitud y leer los encabezados y parámetros del socket. Después de que su método regrese, se encarga de formatear los encabezados y el cuerpo de la respuesta y escribirlos en el socket.

**NOTA** *Observe que no llamó al método `close` de `PrintWriter` que obtuvo de `response`. En términos generales, **en Java solo necesita cerrar los recursos que cree**. El contenedor web creó este recurso, por lo que es responsable de cerrarlo. Incluso si hubiera asignado la instancia a una variable local y hubiera llamado a varios métodos en ella, este sería el caso*.

Obviamente, podría hacer mucho más con este método `doGet`, como usar parámetros de la solicitud, y aún no ha echado un vistazo a los otros métodos. Tenga la seguridad de que pronto llegará a ambos.

### UTILIZAR EL INITIALIZER Y DESTROYER

Mientras obtiene su primer Servlet en funcionamiento, probablemente debería conocer los métodos `init` y `destroy`. Cuando un contenedor web inicia por primera vez un Servlet, llama al método `init` de ese Servlet. Esto es a veces, aunque no siempre, cuando se implementa la aplicación. (Aprenderá a controlar esto en la siguiente sección). Más adelante, cuando el contenedor web cierra el Servlet, llama al método de destrucción del Servlet. Estos métodos no son los mismos que los del constructor y finalizer de Java, y no se llaman al mismo tiempo que el constructor y finalizer. Normalmente, estos métodos no hacen nada, pero puede anularlos para realizar alguna acción:

```java
    @Override
    public void init() throws ServletException
    {
        System.out.println("Servlet " + this.getServletName() + " has started.");
    }
 
    @Override
    public void destroy()
    {
        System.out.println("Servlet " + this.getServletName() + " has stopped.");
    }
```

**NOTA** *Debe saber que otro método `init` acepta un único argumento de tipo `javax.servlet.ServletConfig`. Este método se especifica en la interfaz de `Servlet`, pero `GenericServlet` se encarga de implementar este método por usted y luego llama a la sobrecarga sin argumentos de `init` overridden en el ejemplo de código anterior. De esta manera, no tiene que llamar a `super.init` (servletConig) desde su propia implementación del método `init`*.

*Aunque puede override el método original, no debería hacerlo porque si olvidó llamar al súper método, es posible que el servlet no se inicialice correctamente. Si necesita acceder a `ServletConfig`, es mucho más fácil simplemente llamar al método `getServletConfig`. Aprenderá más sobre la clase `ServletConfig` en las Partes I y II de este libro*.

Puede hacer muchas cosas con estos dos métodos. Más importante aún, **`init` se llama después de que se construye el Servlet pero antes de que pueda responder a la primera solicitud**. A diferencia de cuando se llama al constructor, cuando se llama a `init`, todas las propiedades se han establecido en el Servlet, lo que le da acceso a los objetos `ServletConfig` y `javax.servlet.ServletContext`. (Aprenderá qué hacer con estos en la sección “Configuración de su aplicación usando parámetros de inicialización”). Por lo tanto, *puede usar este método para leer un archivo de propiedades o conectarse a una base de datos usando JDBC, por ejemplo*. El método `init` se llama cuando se inicia el Servlet. Si el Servlet está configurado para iniciarse automáticamente cuando se implementa e inicia la aplicación web, es entonces cuando se llama. De lo contrario, no se llama hasta que se recibe la primera solicitud de ese Servlet.

Del mismo modo, se llama a `destroy` inmediatamente después de que el servlet ya no pueda aceptar ninguna solicitud. Esto suele ocurrir cuando la aplicación web se detiene o anula su implementación o cuando el contenedor web se cierra. Debido a que se solicita inmediatamente después de la cancelación de la implementación o el cierre, no tiene que esperar a que el garage collection active el finalizador antes de limpiar recursos como archivos temporales o desconectarse de bases de datos que ya no están en uso. Esto es particularmente importante porque si su aplicación está anulada pero el servidor continúa ejecutándose, pueden pasar varios minutos o incluso horas antes de que se ejecute garage collection. Si limpia sus recursos en el finalizer en lugar del método `destroy`, esto podría resultar en que su aplicación se cancele parcialmente o no se cancele. Por lo tanto, siempre debe usar el método `destroy` para limpiar los recursos que tiene su Servlet entre solicitudes.

El ejemplo de código anterior utiliza los métodos `init` y `destroy` para registrar cuándo se inicia y se detiene el servlet, respectivamente. Cuando ejecuta su aplicación en la siguiente sección, estos mensajes de registro aparecen en la ventana de salida del depurador de su IDE. Más adelante en este capítulo, utilizará mejor estos métodos.

## CONFIGURACIÓN DE UN SERVLET PARA DESPLIEGUE

Ahora que ha creado su Servlet, es hora de ponerlo en acción. Aunque tiene una clase trabajadora que puede responder a las solicitudes HTTP `GET` con un saludo inteligente, no ha escrito instrucciones para que el contenedor web implemente el Servlet con la aplicación. El Capítulo 1 le presentó el deployment descriptor (`web.xml`) y la estructura de una aplicación web, y en el Capítulo 2 aprendió cómo implementar y depurar una aplicación usando su IDE. En esta sección, crea el archivo `web.xml` en su directorio `WEB-INF` y configura su Servlet para la implementación. Luego, implementa la aplicación usando su IDE y ve ese saludo en su navegador. Finalmente, pones algunos puntos de interrupción en tu código y examinas cuándo se llaman a ciertos métodos.

### AÑADIR EL SERVLET AL DESCRIPTOR

Como ha aprendido, el deployment descriptor indica al contenedor web cómo se debe implementar la aplicación. Específicamente, define todos los listeners, Servlets y filtros que deben implementarse con la aplicación y la configuración que la aplicación debe usar para hacer esto. Primero, eche un vistazo a un archivo `web.xml` (en su mayoría) vacío:

```html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                             http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">
    <display-name>Hello World Application</display-name>
</web-app>
```

**ADVERTENCIA** *Si ha trabajado con deployment descriptors  en versiones anteriores de Java EE, esto puede parecerle un poco desconocido. Esto se debe a que los URI del esquema XML para `web.xml` y otros archivos de configuración han cambiado desde Java EE 6. Debe utilizar los nuevos URI para que su aplicación sea compatible con Java EE 7*.

En el ejemplo anterior, el código en negrita indica al servidor de aplicaciones cuál es el nombre de la aplicación. En la pantalla del administrador de Tomcat que enumera todas las aplicaciones instaladas, el nombre entre las etiquetas `<display-name>` aparece al lado de su aplicación. El atributo `version` en la etiqueta de apertura `<web-app>` indica para qué versión de API de Servlet está escrita la aplicación, en este caso, la versión 3.1.

Ahora debe decirle al contenedor web que cree una instancia del Servlet que escribió anteriormente, por lo que debe agregar una etiqueta de Servlet al archivo descriptor entre las etiquetas `<web-app>` inicial y final:

```html
    <servlet>
        <servlet-name>helloServlet</servlet-name>
        <servlet-class>com.wrox.HelloServlet</servlet-class>
    </servlet>
```

Anteriormente en el capítulo, aprendió sobre el método `init` de Servlet y cuándo se llamaría normalmente. En este ejemplo, se llama al método `init` cuando llega la primera solicitud del Servlet después de que se inicia la aplicación web. Normalmente, esto es suficiente para la mayoría de usos. Sin embargo, si el método init hace muchas cosas, el inicio de Servlet puede convertirse en un proceso que requiere mucho tiempo, y esto podría hacer que la primera solicitud a ese Servlet demore varios segundos o incluso varios minutos. Evidentemente, esto no es deseable. Un simple ajuste a la configuración del servlet puede hacer que el servlet se inicie inmediatamente cuando se inicia la aplicación web:

```java
    <servlet>
        <servlet-name>helloServlet</servlet-name>
        <servlet-class>com.wrox.HelloServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>
```

El código envalentonado(emboldened) indica al contenedor web que inicie el Servlet tan pronto como se inicie la aplicación web. Si varias configuraciones de Servlet contienen esta etiqueta, se inician en el orden de los valores dentro de las etiquetas, con el valor "1" utilizado anteriormente en primer lugar y los números más altos después. Si dos o más Servlets tienen el mismo valor en la etiqueta `<load-on-startup>`, esos Servlets en conflicto comienzan en el orden en que aparecen en el archivo descriptor, aún después de otros Servlets con números más bajos y antes de otros Servlets con números más altos.

### MAPPING EL SERVLET A UN URL

Ha indicado al servidor de aplicaciones que inicie el Servlet, pero aún no le ha dicho a qué solicitudes de URL debe responder el Servlet. Este es un asunto simple:

```html
    <servlet-mapping>
        <servlet-name>helloServlet</servlet-name>
        <url-pattern>/greeting</url-pattern>
    </servlet-mapping>
```

Con esta configuración, todas las solicitudes a la URL `/greeting` relativo a la aplicación son manejadas por `helloServlet`. (Observe que las etiquetas `<servlet-name>` dentro de las etiquetas `<servlet>` y `<servlet-mapping>` coinciden. Así es como el contenedor web asocia las dos). Si la aplicación se implementa en http://www.example.net, el Servlet responde a las solicitudes dirigidas a la URL http://www.example.net/greeting. Por supuesto, no está limitado a este mapeo. Puede asignar varias URL al mismo servlet:

```html
    <servlet-mapping>
        <servlet-name>helloServlet</servlet-name>
        <url-pattern>/greeting</url-pattern>
        <url-pattern>/salutation</url-pattern>
        <url-pattern>/wazzup</url-pattern>
    </servlet-mapping>
```

En este caso, las tres URL actúan como alias para el mismo endpoint lógico: `helloServlet`. ¿Por qué, podría preguntar, necesita dar un nombre a una instancia de Servlet y luego asignar una solicitud al nombre de esa instancia? ¿Por qué no puede simplemente asignar la URL directamente a la clase Servlet? Bueno, ¿qué pasa si tienes dos Servlets de tienda diferentes en una aplicación de compras en línea, por ejemplo? Esas tiendas pueden tener una lógica idéntica pero conectarse a diferentes bases de datos. Esto se puede lograr simplemente:

```html
    <servlet>
        <servlet-name>oddsStore</servlet-name>
        <servlet-class>com.wrox.StoreServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>endsStore</servlet-name>
        <servlet-class>com.wrox.StoreServlet</servlet-class>
    </servlet>
    
    <servlet-mapping>
        <servlet-name>oddsStore</servlet-name>
        <url-pattern>/odds</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>endsStore</servlet-name>
        <url-pattern>/ends</url-pattern>
    </servlet-mapping>
```

Ahora tiene dos instancias de la misma clase de Servlet, pero tienen diferentes nombres y están asignadas a diferentes URL. Hace dos ejemplos, tenía tres URL que apuntaban a la *misma instancia de Servlet*. Sin embargo, en este ejemplo tiene *dos instancias de Servlet diferentes*. Quizás se pregunte cómo las dos instancias diferentes saben qué tiendas son. Una llamada rápida a `this.getServletName()` desde cualquier lugar del código del servlet devuelve "oddsStore" o "endsStore" dependiendo de la instancia que sea. Recuerde que utilizó este método anteriormente cuando registraba llamadas al initializer y al destroyer.

Retrocediendo un poco, ahora tiene el archivo descriptor `web.xml` simple y completo:

```html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                             http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">
 
    <display-name>Hello World Application</display-name>
 
    <servlet>
        <servlet-name>helloServlet</servlet-name>
        <servlet-class>com.wrox.HelloServlet</servlet-class>
    </servlet>
 
    <servlet-mapping>
        <servlet-name>helloServlet</servlet-name>
        <url-pattern>/greeting</url-pattern>
    </servlet-mapping>
 
</web-app>
```

### EJECUTANDO Y DEPURANDO SU SERVLET

Una vez guardada, compile su aplicación y verifique que tenga una configuración de ejecución IDE configurada para ejecutar su proyecto en su instancia local de Tomcat 8.0. (Si no recuerda cómo hacer esto, consulte el Capítulo 2). La aplicación debería implementarse en `/hello-world`. También puede descargar el proyecto **950-03-01-hello-world** IDE; ya está configurado para implementarse correctamente. Una vez hecho esto, siga estos pasos:

1. Haga clic en el icono de depuración en su IDE para iniciar el contenedor web en modo de depuración. Su IDE implementa su aplicación en el contenedor web después de que se inicia.

2. Abra su navegador web favorito y navegue hasta http://localhost:8080/hello-world/greeting. Ahora debería ver la pantalla de la Figura 3-1.

![03-01](images/03-01.png)

3. Una buena forma de entender lo que sucedió es colocar algunos breakpoints en `HelloServlet` y ejecutar este experimento nuevamente. Debe detener su depurador (que apaga Tomcat) para que también pueda alcanzar un punto de interrupción en el initializer. Coloque puntos de interrupción en las líneas individuales de código en los métodos `doGet`, `init` y `destroy` de su Servlet; luego reinicie su depurador. Después de que se inicie Tomcat y se implemente su aplicación, notará que aún no alcanzó ningún punto de interrupción (porque `<load-on-startup>` no está presente en el deployment descriptor).

4. Actualice la página greeting en su navegador y debería llegar al punto de interrupción en el método `init` de su IDE. Esto significa que Tomcat ha activado la inicialización just-in-time de su Servlet: no se inicializó hasta que llegó la primera solicitud.

5. Al igual que si el método `init` tardara mucho en completarse, la solicitud de su navegador permanece en espera hasta que continúe con el depurador, así que hágalo ahora. Debería llegar inmediatamente al punto de interrupción en el método `doGet`. Ahora, el servlet atiende la solicitud, pero su navegador aún espera una respuesta.

6. Continúe con el depurador por segunda vez y ahora la respuesta se envía a su navegador.

En este punto, puede presionar el botón Refresh en su navegador tantas veces como desee, y llegará al punto de interrupción solo en el método `doGet`. El método `init` no se vuelve a llamar hasta que alguna acción destruye el Servlet (por ejemplo, Tomcat se apaga) y luego comienza de nuevo. Hasta este punto, todavía no ha alcanzado el punto de interrupción en el método destroy. Desea hacer eso ahora, pero ***desafortunadamente, si detiene Tomcat de su IDE, desconecta el depurador antes de que se alcance el punto de interrupción, por lo que debe detener Tomcat desde la línea de comandos***. Para hacer esto, siga estos pasos:

1. Abra un símbolo del sistema(consola) y cambie su directorio actual al directorio de inicio de Tomcat (`C:\Program Files\Apache Software Foundation\Tomcat 8.0` en una máquina con Windows, recuerde).

2. Escriba el comando `bin\shutdown.bat` (o `bin/shutdown.sh` si no está ejecutando Windows) y presione Entrar.
   
3. En su ventana IDE, debe alcanzar inmediatamente el punto de interrupción en el método `destroy`. Tomcat no se apaga por completo hasta que continúe con el depurador.
   
Como se mencionó anteriormente, puede cambiar la configuración de su Servlet para que se inicialice cuando se inicie la aplicación. Pruébelo ahora.

1. Actualice su declaración de Servlet en el descriptor de implementación para agregar el código en negrita en el siguiente ejemplo:

```html
    <servlet>
        <servlet-name>helloServlet</servlet-name>
        <servlet-class>com.wrox.HelloServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>
```

2. Con los puntos de interrupción aún en su lugar en su Servlet, inicie su depurador nuevamente. Debe alcanzar inmediatamente el punto de interrupción en el método `init` antes de realizar la primera solicitud al Servlet.

3. Continúe con el depurador y luego actualice su navegador. Ahora debería alcanzar el punto de interrupción solo en el método `doGet`; 
el servlet se inicializó al inicio de la aplicación y no es necesario volver a inicializarlo.

Ahora que ha creado su primer Servlet y está familiarizado con el ciclo de vida de un Servlet, se le anima a experimentar con diferentes llamadas a métodos en el Servlet y en los parámetros de `request` y `response` en el método `doGet`. En la siguiente sección, explorará `doGet`, `doPost` y otros métodos más para comprender mejor `HttpServletRequest` y `HttpServletResponse`.

**NOTA** *Debe consultar (y marcar) la documentación de la API para Java EE 7 que se encuentra en http://docs.oracle.com/javaee/7/api/ para obtener información sobre los métodos disponibles y sus propósitos*.

## COMPRENDER `DOGET()`, `DOPOST()` Y OTROS MÉTODOS

En la sección anterior, aprendió sobre el método doGet y otros métodos que se asignan a los diversos métodos de solicitud HTTP. Pero, ¿qué puede hacer exactamente con estos métodos? Más importante aún, ¿qué debe hacer con estos métodos? Las respuestas breves a estas preguntas son "casi cualquier cosa" y "no mucho", respectivamente. Esta sección explora algunas de las cosas que puede hacer y cómo hacerlo.

¿QUÉ DEBERÍA SUCEDER DURANTE LA EJECUCIÓN DEL MÉTODO DE SERVICIO?
El método de servicio de la clase Servlet, como aprendió anteriormente, atiende todas las solicitudes entrantes. En última instancia, debe analizar y manejar los datos de la solicitud entrante según el protocolo en uso y luego devolver al cliente una respuesta aceptable para el protocolo. Si el método de servicio regresa sin enviar datos de respuesta al socket, es probable que el cliente observe un error de red, como "restablecimiento de la conexión". Específicamente en el protocolo HTTP, el método de servicio debe comprender los encabezados y parámetros que envía el cliente y luego devolver una respuesta HTTP adecuada que al menos incluya los encabezados HTTP mínimos (incluso si el cuerpo de la respuesta está vacío). En realidad, la implementación de esto es compleja (e implica muchos pasos) y puede diferir de un contenedor web a otro.

La belleza de extender HttpServlet es que no tiene que preocuparse por ninguno de estos detalles. Aunque la realidad es que el método de servicio debe hacer muchas cosas antes de responder al usuario, el desarrollador que usa HttpServlet debe hacer poco. En realidad, en el proyecto Hello-World que usó en las dos últimas secciones, si elimina la única línea de código del método doGet y ejecuta la aplicación, ¡todo seguirá funcionando bien! Una respuesta HTTP estructurada correctamente con contenido de longitud cero devuelve al cliente. El único requisito es que anule el método doGet (o doPost o doPut o lo que quiera admitir); no es necesario poner nada en él. Pero, ¿cuán útil es esto realmente?

La respuesta a eso es "en absoluto". El hecho de que pueda devolver una respuesta vacía no significa que deba hacerlo. Aquí es donde entran HttpServletRequest y HttpServletResponse. Estos parámetros en los diversos métodos definidos por HttpServlet le permiten leer los parámetros pasados ​​desde el cliente, aceptar archivos cargados desde un formulario publicado, leer los datos sin procesar contenidos en el cuerpo de la solicitud (para hacer cosas como como manejar solicitudes PUT o aceptar cuerpos de solicitud JSON), leer encabezados de solicitud y manipular encabezados de respuesta, y escribir contenido de respuesta al cliente. Estas son algunas de las muchas cosas que puede hacer al atender una solicitud y, en realidad, generalmente debe hacer una o más de estas cosas.

USANDO HTTPSERVLETREQUEST
La interfaz HttpServletRequest es una extensión de ServletRequest que proporciona información adicional específica del protocolo HTTP sobre una solicitud recibida. Especifica docenas de métodos que puede utilizar para obtener detalles sobre una solicitud HTTP. También le permite establecer atributos de solicitud (diferentes de los parámetros de solicitud).

NOTA Aprenderá sobre los atributos de solicitud y la inspección de los detalles de autenticación en el siguiente capítulo. Este libro no cubre los detalles de cada método (para eso, puede consultar la documentación de la API) pero cubre las características más importantes.

Obtener parámetros de solicitud
Quizás la capacidad más importante de HttpServletRequest, y una que explora a través de ejemplos en la siguiente sección, es recuperar los parámetros de solicitud pasados ​​por el cliente. Los parámetros de solicitud vienen en dos formas diferentes: a través de parámetros de consulta (también llamados parámetros URI), o en un cuerpo de solicitud codificado application / x-www-form-urlencoded o multipart / form-data (generalmente llamado variables de publicación o variables de formulario). Los parámetros de consulta son compatibles con todos los métodos de solicitud y están contenidos en la primera línea de datos en una solicitud HTTP, como en el siguiente ejemplo:

```java
```

```java
```

```java
```

```java
```

```java
```


![03-02](images/03-02.png)
