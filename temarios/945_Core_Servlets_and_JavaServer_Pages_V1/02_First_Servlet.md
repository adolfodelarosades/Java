# Capítulo 2. PRIMER SERVLETS

Temas de este capítulo

* La estructura básica de los servlets.
* Un servlet simple que genera texto sin formato
* El proceso de compilación, instalación e invocación de servlets.
* Un servlet que genera HTML
* Algunas utilidades para ayudar a construir HTML
* El ciclo de vida de los servlets
* Un ejemplo de lectura de parámetros de inicialización
* Un ejemplo que utiliza fechas de inicialización y modificación de página
* Estrategias de depuración de servlet
* Una herramienta para hablar interactivamente con servlets

El capítulo anterior le mostró cómo instalar el software que necesita y cómo configurar su entorno de desarrollo. Ahora realmente quieres escribir algunos servlets. Bien. Este capítulo le muestra cómo, describiendo la estructura que siguen casi todos los servlets, guiándolo a través de los pasos necesarios para compilar y ejecutar un servlet, y brindando detalles sobre cómo se inicializan los servlets y cuándo se llaman los distintos métodos. También presenta algunas herramientas generales que encontrará útiles en el desarrollo de su servlet.


## 2.1. Estructura básica del servlet

El listado 2.1 describe un servlet básico que maneja las solicitudes **`GET`**. Las **`GET`** requests, para aquellos que no están familiarizados con **HTTP**, son el tipo habitual de solicitudes de navegador para páginas web. Un navegador genera esta request cuando el usuario escribe una URL en la línea de dirección, sigue un enlace desde una página web o envía un formulario HTML que no especifica un **`METHOD`**. Los servlets también pueden manejar muy fácilmente las solicitudes **`POST`**, que se generan cuando alguien envía un formulario HTML que especifica **`METHOD="POST"`**. Para obtener detalles sobre el uso de formularios HTML, consulte el Capítulo 16.

Para ser un servlet, una clase debe extender **`HttpServlet`** y anular **`doGet`** o **`doPost`**, dependiendo de si los datos se envían mediante **`GET`** o **`POST`** . Si desea que el mismo servlet maneje tanto **`GET`** como **`POST`** y realice la misma acción para cada uno, simplemente puede hacer que **`doGet`** llame a **`doPost`** , o viceversa.

**Listado 2.1. ServletTemplate.java**

```java
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ServletTemplate extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {

    // Use "request" to read incoming HTTP headers
    // (e.g. cookies) and HTML form data (e.g. data the user
    // entered and submitted).

    // Use "response" to specify the HTTP response status
    // code and headers (e.g. the content type, cookies).

    PrintWriter out = response.getWriter();
    // Use "out" to send content to browser
  }
}
```

Ambos métodos toman dos argumentos: un **`HttpServletRequest`** y un **`HttpServletResponse`**. **`HttpServletRequest`** tiene métodos mediante los cuales puede averiguar información entrante, como datos de formulario(form data), HTTP request headers y el nombre de host del cliente. **`HttpServletResponse`** le permite especificar información saliente, como HTTP status codes (200, 404, etc.), response headers (**`Content-Type`**, **`Set-Cookie`**, etc.), y, lo que es más importante, le permite obtener un **`PrintWriter`** utilizado para enviar el contenido del documento de vuelta al cliente. Para servlets simples, la mayor parte del esfuerzo se gasta en sentencias **`println`** que generan la página deseada. Los Form data, HTTP request headers, HTTP responses, y cookies se analizarán en detalle en los siguientes capítulos.

Dado que **`doGet`** y **`doPost`** arrojan dos excepciones, debe incluirlas en la declaración. Finalmente, debe importar clases en **`java.io`** (para **`PrintWriter`**, etc.), **`javax.servlet`** (para **`HttpServlet`**, etc.) y **`javax.servlet.http`** (para **`HttpServletRequest`** y **`HttpServletResponse`** ).

Estrictamente hablando, **`HttpServlet`** no es el único punto de partida para los servlets, ya que los servlets podrían, en principio, extender el mail, FTP, u otros tipos de servidores. Los servlets para estos entornos extenderían una clase personalizada derivada de **`GenericServlet`**, la clase principal de **`HttpServlet`**. Sin embargo, en la práctica, los servlets se usan casi exclusivamente para servidores que se comunican a través de HTTP (es decir, servidores web y de aplicaciones), y la discusión en este libro se limitará a este uso.


## 2.2. Un Servlet Simple que Genera Texto Sin Formato

El Listado 2.2 muestra un servlet simple que solo genera texto sin formato, con el resultado que se muestra en la Figura 2-1 . La Sección 2.3 (Un servlet que genera HTML) muestra el caso más habitual en el que se genera HTML. Sin embargo, antes de continuar, vale la pena dedicar algún tiempo al proceso de instalación, compilación y ejecución de este sencillo servlet. Encontrará esto un poco tedioso la primera vez que lo pruebe. Ser paciente; dado que el proceso es el mismo cada vez, se acostumbrará rápidamente, especialmente si automatiza parcialmente el proceso mediante un archivo de script como el que se presenta en la siguiente sección.

**Figura 2-1. Resultado del Listado 2.2 (`HelloWorld.java`).**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/95168eda-567e-4c3d-b709-9be99ed69308)


**Listado 2.2. `HelloWorld.java`**

```java
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWorld extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    out.println("Hello World");
  }
}
```

### Compilando e Instalando el Servlet

Lo primero que debe hacer es asegurarse de que su servidor esté configurado correctamente y que su **`CLASSPATH`** se refiera a los archivos JAR que contienen las clases de servlet estándar. Consulte la Sección 1.5 (Instalación y configuración) para obtener una explicación de este proceso.

El siguiente paso es decidir dónde colocar las clases de servlet. Esta ubicación varía de un servidor a otro, así que consulte la documentación de su servidor web para obtener instrucciones definitivas. Sin embargo, hay algunas convenciones moderadamente comunes. La mayoría de los servidores tienen tres ubicaciones distintas para las clases de servlet, como se detalla a continuación.

1. ***Un directorio para las clases de servlet que cambian con frecuencia***.

   Los servlets en este directorio se recargan automáticamente cuando cambia su archivo de clase, por lo que debe usar este directorio durante el desarrollo. Por ejemplo, normalmente es **`install_dir/servlets`** con **Java Web Server de Sun** y **WebSphere de IBM** y **`install_dir/myserver/servletclasses`** para **BEA WebLogic**, aunque la mayoría de los servidores permiten que el administrador del servidor especifique una ubicación diferente. Ni **Tomcat** ni **JSWDK** admiten la recarga automática de servlets. Sin embargo, todavía tienen un directorio similar en el que colocar servlets; solo tiene que detener y reiniciar el mini-servidor cada vez que cambie un servlet existente. Con **Tomcat 3.0**, coloque los servlets en **`install_dir/webpages/WEB-INF/classes`**. Con el **JSWDK 1.0.1**, utilice **`install_dir/webpages/WEB-INF/servlets`**.

2. ***Un directorio para las clases de servlet que cambian con poca frecuencia***.

   Los servlets colocados en esta ubicación son ligeramente más eficientes ya que el servidor no tiene que seguir comprobando sus fechas de modificación. Sin embargo, los cambios en los archivos de clase en este directorio requieren que reinicie el servidor. Esta opción (o la Opción 3 a continuación) es la que se debe usar para los servlets de "producción" implementados en un sitio de gran volumen. Este directorio suele ser algo así como **`install_dir/classes`**, que es el nombre predeterminado con **Tomcat**, **JSWDK** y **Java Web Server**. Dado que **Tomcat** y **JSWDK** no admiten la recarga automática de servlet, este directorio funciona igual que el descrito en la opción 1, por lo que la mayoría de los desarrolladores se quedan con la opción anterior.

3. ***Un directorio para cambiar servlets con poca frecuencia en archivos JAR***.

   Con la segunda opción anterior, los archivos de clase se colocan directamente en el directorio de clases o en subdirectorios correspondientes a su nombre de paquete. Aquí, los archivos de clase se empaquetan en un archivo JAR y ese archivo se coloca en el directorio designado. Con **Tomcat**, **JSWDK**, **Java Web Server** y la mayoría de los demás servidores, este directorio es **`install_dir/lib`**. Debe reiniciar el servidor cada vez que cambie archivos en este directorio.

Una vez que haya configurado su servidor, configure su **`CLASSPATH`** y coloque el servlet en el directorio adecuado, simplemente haga **"`javac HelloWorld.java`"** para compilar el servlet. Sin embargo, en entornos de producción, los servlets se colocan con frecuencia en paquetes para evitar conflictos de nombres con servlets escritos por otros desarrolladores. El uso de paquetes implica un par de pasos adicionales que se tratan en la Sección 2.4 (Packaging Servlets). Además, es común usar HTML forms como front-end para los servlets (consulte el Capítulo 16 ). Para usarlos, deberá saber dónde colocar los archivos HTML normales para que el servidor pueda acceder a ellos. Esta ubicación varía de un servidor a otro, pero con **JSWDK** y **Tomcat**, coloca un archivo HTML en **`install_dir/webpages/path/file.html`** y luego acceda a él a través de http://localhost/path/file.html (reemplace localhost con el nombre de host real si se ejecuta de forma remota). Una página JSP puede instalarse en cualquier lugar donde pueda estar una página HTML normal.

### Invocando el Servlet

Con diferentes servidores, las clases de servlet se pueden colocar en una variedad de ubicaciones diferentes y hay poca estandarización entre los servidores. Sin embargo, para invocar servlets, existe una convención común: use una URL de la forma http://host/servlet/ServletName . Tenga en cuenta que la URL hace referencia a **`servlet`**, en singular, incluso si el directorio real que contiene el código del servlet se llama **`servlets`**, en plural, o tiene un nombre no relacionado, como **`classes`** o **`lib`**.

La Figura 2-1 , que se muestra anteriormente en esta sección, da un ejemplo con el servidor web ejecutándose directamente en mi PC ("localhost" significa "la máquina actual").

La mayoría de los servidores también le permiten registrar nombres para servlets, de modo que se pueda invocar un servlet a través de http://host/any-path/any-file . El proceso para hacer esto es específico del servidor; consulte la documentación de su servidor para obtener más detalles.

## 2.3. Un servlet que genera HTML

La mayoría de los servlets generan HTML, no texto sin formato como en el ejemplo anterior. Para construir HTML, necesita dos pasos adicionales:

1. Dígale al navegador que está devolviendo HTML, y

2. Modifique las instrucciones **`println`** para crear una página web legal.

El primer paso se logra configurando el encabezado de respuesta HTTP **`Content-Type`**. En general, los headers se establecen mediante el método **`setHeader`** de **`HttpServletResponse`** , pero establecer el tipo de contenido es una tarea tan común que también existe un método especial **`setContentType`** solo para este propósito. La forma de designar HTML es con un tipo de **`text/html`**, por lo que el código se vería así:

```java
response.setContentType("text/html");
```
AQUIIIIIIIIIIII
Aunque HTML es el tipo de documento más común que crean los servlets, no es inusual crear otros tipos de documentos. Por ejemplo, la Sección 7.5 (Uso de servlets para generar imágenes GIF) muestra cómo los servlets pueden crear y devolver imágenes personalizadas, especificando un tipo de contenido de imagen/gif . Como segundo ejemplo, la Sección 11.2 (El atributo contentType) muestra cómo generar y devolver hojas de cálculo de Excel, utilizando un tipo de contenido de application/vnd.ms-excel .

No se preocupe si aún no está familiarizado con los encabezados de respuesta HTTP; se discuten en detalle en el Capítulo 7 . Tenga en cuenta que debe configurar los encabezados de respuesta antes de devolver el contenido a través de PrintWriter . Esto se debe a que una respuesta HTTP consta de la línea de estado, uno o más encabezados, una línea en blanco y el documento real, en ese orden. Los encabezados pueden aparecer en cualquier orden, y los servlets almacenan los encabezados y los envían todos a la vez, por lo que es legal configurar el código de estado (parte de la primera línea devuelta) incluso después de configurar los encabezados. Pero los servlets no necesariamente almacenan en búfer el documento en sí, ya que los usuarios pueden querer ver resultados parciales para páginas largas. En la versión 2.1 de la especificación del servlet, elLa salida de PrintWriter no se almacena en búfer en absoluto, por lo que la primera vez que usa PrintWriter , es demasiado tarde para volver atrás y establecer encabezados. En la versión 2.2, los motores de servlet pueden almacenar en búfer parcialmente la salida, pero el tamaño del búfer no se especifica. Puede usar el método getBufferSize de HttpServletResponse para determinar el tamaño o usar setBufferSize para especificarlo. En la versión 2.2 con el almacenamiento en búfer habilitado, puede establecer encabezados hasta que el búfer se llene y se envíe al cliente. Si no está seguro de si se envió el búfer, puede usar el método isCommitted para verificar.

Enfoque central

	
Configure siempre el tipo de contenido antes de transmitir el documento real.


El segundo paso para escribir un servlet que crea un documento HTML es hacer que sus instrucciones println generen HTML, no texto sin formato. La estructura de un documento HTML se discute más en la Sección 2.5 (Utilidades simples de construcción de HTML), pero debería ser familiar para la mayoría de los lectores. El listado 2.3 proporciona un servlet de ejemplo, con el resultado que se muestra en la figura 2-2 .

Figura 2-2. Resultado del Listado 2.3 (HelloWWW.java).



Listado 2.3. HolaWWW.java
