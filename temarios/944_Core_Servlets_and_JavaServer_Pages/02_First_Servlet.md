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


## 2.1. Estructura Básica del Servlet

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

### 💻 Estructura Básica del Servlet

Todos los ejemplos de este libro los tendremos en la carpeta **`/Users/adulfodelarosa/Documents/PROYECTOS/Eclipse/944_Core_Servlets_JSP`**, por lo que abriremos ese Workspace en Eclipse.

1. Lo primero que vamos a hacer es que desde las propiedades de Eclipse vamos a configurar la opción para garantizar que los arquetipos de Maven siempre esten actualizados. Vamos a **Eclipse Preferences => Maven**

<img width="627" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/b6fd9061-15d3-4cb7-bdf2-0d50b5b89fa2">

Debemos marcar el check **Download repository index updates on startup**.

<img width="630" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/fcfc7bab-2a15-4a65-a2ba-29ea3bd56a79">

Damos en el botón **Apply and Close**. 

2. Vamos a crear un nuevo proyecto Maven con la opción **File => New => Maven Project** o seleccionando la opción en la parte de la izquierda. 

<img width="383" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a6481f53-9933-41bf-a106-ec4d346ebe11">

<img width="620" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/3c0c5379-3e35-4ade-9195-6e57ccedf903">

Damos en el botón **Next**.

El arquetipo que vamos a usar es **`maven-archetype-webapp`**, en el fitro hemos metido **`webapp`** y nos desplazamos hasta encontrar el grupo **`org.apache.maven.archetypes.`**

<img width="936" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/c5e394f2-9f0f-46d9-a0a0-fe59f668e841">

Vamos a preionar el botón **Next**. Nos pide los siguientes datos.

<img width="933" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ce652eeb-734f-4cd2-b0dd-110953f4b131">

Introducimos los siguientes datos.

<img width="932" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/860b12ae-c5c0-4540-8f59-06832c3ec005">

Presionamos el botón **Finish**.

En la consola nos muestra que todo ha ido bien al crear el proyecto.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/9a8ed93b-d36a-400e-8a44-22617e01c30a">

La estructura básica del proyecto que se ha creado es la siguiente:

<img width="379" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/8d428134-2f5a-416c-80a1-410847aac6c8">

Podemos ver que tenemos el archivo **`pom.xml`**.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/8aa50904-1293-488e-b5f8-fb4d4dfb294a">


```java
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.javaangular</groupId>
  <artifactId>ServletTemplate</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>war</packaging>

  <name>ServletTemplate Maven Webapp</name>
  <!-- FIXME change it to the project's website -->
  <url>http://www.example.com</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>1.7</maven.compiler.source>
    <maven.compiler.target>1.7</maven.compiler.target>
  </properties>

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.11</version>
      <scope>test</scope>
    </dependency>
  </dependencies>

  <build>
    <finalName>ServletTemplate</finalName>
    <pluginManagement><!-- lock down plugins versions to avoid using Maven defaults (may be moved to parent pom) -->
      <plugins>
        <plugin>
          <artifactId>maven-clean-plugin</artifactId>
          <version>3.1.0</version>
        </plugin>
        <!-- see http://maven.apache.org/ref/current/maven-core/default-bindings.html#Plugin_bindings_for_war_packaging -->
        <plugin>
          <artifactId>maven-resources-plugin</artifactId>
          <version>3.0.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>3.8.0</version>
        </plugin>
        <plugin>
          <artifactId>maven-surefire-plugin</artifactId>
          <version>2.22.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-war-plugin</artifactId>
          <version>3.2.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-install-plugin</artifactId>
          <version>2.5.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-deploy-plugin</artifactId>
          <version>2.8.2</version>
        </plugin>
      </plugins>
    </pluginManagement>
  </build>
</project>
```

Como podemos ver el proyecto por default usa **Java 1.7**, podemos modificar y cambiarla a la que desemos, por ejemplo a la versión **Java 17**. En este caso como los ejemplos son de una versión atrasada de Servlets lo voy a dejar así y ya veremos como se comporta.

Otro archivo que tenemos es **`index.jsp`** que podemos ver a contininuación.

<img width="797" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ffc725e7-1862-4616-9f07-7194a53aab37">


Vemos que nos esta marcando un error, esto es por que es necesario añadir una dependencia más a nuestro proyecto, según se indica al inicio del libro las especificaciones que se usan en el libro son, "La Parte I cubre el desarrollo de servlets con las **especificaciones 2.1 y 2.2**. Aunque la versión 2.2 (junto con **JSP 1.1**) es un requisito de Java 2 Platform, Enterprise Edition (J2EE)", vamos a buscar esa especificación en el Maven Repositorio.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a2093667-e875-43e6-862f-4c8cfdc3a758">

<img width="1061" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/dd9a279f-627a-4439-8c88-52a68c2b1033">


```xml
<!-- https://mvnrepository.com/artifact/javax.servlet/servlet-api -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>servlet-api</artifactId>
    <version>2.2</version>
    <scope>provided</scope>
</dependency>
```

La añadimos al archivo **`pom.xml`**.

<img width="1057" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/0d9bdc13-b521-4ce7-a59d-3b2a941a2b4f">


Al dar **Maven => Maven update...** vemos como el error desaparece del archivo **`index.jsp`**.

<img width="1052" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/201ce54e-9db0-4b3d-996c-7bf7571e6403">

Podriamos ejecutar ya la aplicación.

<img width="764" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/8184fb9b-19cd-4bbf-accf-6f6b1e54ed34">

Tenemos que seleccionar el Servidor, vamos a usar Tomcat 8.5. que es el que tengo descargado en mi ordenador en **`/usr/local/apache-tomcat-8.5.89`**

<img width="596" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/de3de3ca-c7e4-41ba-bfbd-a6c08759b7a1">

<img width="595" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/b890afb5-8e01-44f7-82e5-b43a0246be9d">

Se carga la URL **`http://localhost:8080/ServletTemplate/`** y tenemos:

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/20a43614-e97e-4430-9613-b1e641e46d61">

Vamos a editar el archivo **`index.jsp`** para poner otro mensaje.

<img width="1053" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/1306fea7-e81a-4ea1-af7c-cca4cf82c427">

Al refrescar el navegador tenemos:

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/545df282-2845-4553-94ef-f45e1595ce57">

Aquí tenemos un JSP pero la idea de esta aplicación es tener nuestro primer Servlet llamado **`ServletTemplate.java`**. 

Vamos a crear el Servlet **`ServletTemplate.java`** en nuestra carpeta **`main`**.

<img width="598" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/b7a361db-653f-4713-b577-df37809e0809">

Presionamos el botón **Next**.

<img width="598" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e5a580fb-3cc4-4f28-ac0f-9a259aea4f1a">

Introducimos los siguientes datos 

<img width="593" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/fdca8deb-6f97-4d56-bcb7-42927f1407c8">

Pero vemos que tenemos problemas al intentar crear el Servlet. Pero realmente de lo que se quejaba es que no había una carpeta **`java`** dentro de **`src\main`**, la cree y parece que con eso va.

Vamos a crear el Servlet.

<img width="592" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/7075ef9b-6330-4c03-aff8-a77eec8d7057">

La estructura del proyecto nos queda así:

<img width="452" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/2ceb0ec9-bb43-47f5-9232-999b5b1711f2">

Vamos a ver que tenemos en el archivo recien creado.

```java
package com.javaangular;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletTemplate
 */
public class ServletTemplate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTemplate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
```

Y en el archivo **`web.xml`** tenemos:

```xml
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
  <display-name>Archetype Created Web Application</display-name>
  <servlet>
  	<servlet-name>ServletTemplate</servlet-name>
  	<display-name>ServletTemplate</display-name>
  	<description></description>
  	<servlet-class>com.javaangular.ServletTemplate</servlet-class>
  </servlet>
  <servlet-mapping>
  	<servlet-name>ServletTemplate</servlet-name>
  	<url-pattern>/ServletTemplate</url-pattern>
  </servlet-mapping>
</web-app>
```

Vamos a ejecutar el Servlet para ver que nos pinta.

Observemos que la URL para invocar el Servlet es: http://localhost:8080/ServletTemplate/ServletTemplate

<img width="1509" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/812b2922-005c-4377-a6ce-4d47c74d9855">


Podemos seguir invocando nuestro JSP con http://localhost:8080/ServletTemplate/index.jsp
y vemos que sigue trabajando.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/04426500-ba6d-40f7-b49e-164917cdda8f">


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

### 💻 Un Servlet Simple que Genera Texto Sin Formato

Vamos a crear otro Servlet llamado **HelloWorld.java**.

<img width="595" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/fd902abe-9e6d-4263-b886-d0eb63d5676c">


La estructura del proyecto queda así:

Se ha modificado nuestro archivo **`web.xml`**

```xml
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
  <display-name>Archetype Created Web Application</display-name>
  <servlet>
  	<servlet-name>ServletTemplate</servlet-name>
  	<display-name>ServletTemplate</display-name>
  	<description></description>
  	<servlet-class>com.javaangular.ServletTemplate</servlet-class>
  </servlet>
  <servlet>
  	<servlet-name>HelloWorld</servlet-name>
  	<display-name>HelloWorld</display-name>
  	<description></description>
  	<servlet-class>com.javaangular.HelloWorld</servlet-class>
  </servlet>
  <servlet-mapping>
  	<servlet-name>ServletTemplate</servlet-name>
  	<url-pattern>/ServletTemplate</url-pattern>
  </servlet-mapping>
  <servlet-mapping>
  	<servlet-name>HelloWorld</servlet-name>
  	<url-pattern>/HelloWorld</url-pattern>
  </servlet-mapping>
</web-app>
```
Vamos a modificar su código para que nos quede así:

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

<img width="1017" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/46c92f07-bf4b-45d3-a48d-92d3c935b5b6">

Nos marca un Warning **`The serializable class HelloWorld does not declare a static final serialVersionUID field of type long`**. Por ahora lo vamos a dejar así.

Vamos a ejecutarlo.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ec71df47-4229-480d-a8ab-97e0d0a768b9">


## 2.3. Un servlet que genera HTML

La mayoría de los servlets generan HTML, no texto sin formato como en el ejemplo anterior. Para construir HTML, necesita dos pasos adicionales:

1. Dígale al navegador que está devolviendo HTML, y

2. Modifique las instrucciones **`println`** para crear una página web legal.

El primer paso se logra configurando el encabezado de respuesta HTTP **`Content-Type`**. En general, los headers se establecen mediante el método **`setHeader`** de **`HttpServletResponse`**, pero establecer el tipo de contenido es una tarea tan común que también existe un método especial **`setContentType`** solo para este propósito. La forma de designar HTML es con un tipo de **`text/html`**, por lo que el código se vería así:

```java
response.setContentType("text/html");
```

Aunque HTML es el tipo de documento más común que crean los servlets, no es inusual crear otros tipos de documentos. Por ejemplo, la Sección 7.5 (Uso de servlets para generar imágenes GIF) muestra cómo los servlets pueden crear y devolver imágenes personalizadas, especificando un tipo de contenido de **`imagen/gif`** . Como segundo ejemplo, la Sección 11.2 (El atributo **`contentType`**) muestra cómo generar y devolver hojas de cálculo de Excel, utilizando un tipo de contenido de **`application/vnd.ms-excel`**.

No se preocupe si aún no está familiarizado con los HTTP response headers; se discuten en detalle en el Capítulo 7. Tenga en cuenta que debe configurar los response headers antes de devolver el contenido a través de **`PrintWriter`**. Esto se debe a que una HTTP response consta de la status line, uno o más headers, una línea en blanco y el documento real, en ese orden. Los headers pueden aparecer en cualquier orden, y los servlets almacenan los headers y los envían todos a la vez, por lo que es legal configurar el status code (parte de la primera línea devuelta) incluso después de configurar los headers. Pero los servlets no necesariamente almacenan en búfer el documento en sí, ya que los usuarios pueden querer ver resultados parciales para páginas largas. En la ***versión 2.1*** de la especificación del servlet, la salida de **`PrintWriter`** no se almacena en búfer en absoluto, por lo que la primera vez que usa **`PrintWriter`**, es demasiado tarde para volver atrás y establecer headers. En la ***versión 2.2***, los motores de servlet pueden almacenar en búfer parcialmente la salida, pero el tamaño del búfer no se especifica. Puede usar el método **`getBufferSize`** de **`HttpServletResponse`** para determinar el tamaño o usar **`setBufferSize`** para especificarlo. En la ***versión 2.2*** con el almacenamiento en búfer habilitado, puede establecer headers hasta que el búfer se llene y se envíe al cliente. Si no está seguro de si se envió el búfer, puede usar el método **`isCommitted`** para verificar.

**Core Approach**

   :atom: Configure siempre el tipo de contenido **antes** de transmitir el documento real.


El segundo paso para escribir un servlet que crea un documento HTML es hacer que sus instrucciones **`println`** generen HTML, no texto sin formato. La estructura de un documento HTML se discute más en la Sección 2.5 (Utilidades simples de construcción de HTML), pero debería ser familiar para la mayoría de los lectores. El listado 2.3 proporciona un servlet de ejemplo, con el resultado que se muestra en la figura 2-2 .

**Figura 2-2. Resultado del Listado 2.3 (HelloWWW.java).**

<img width="506" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/7bb07c00-5036-4d08-9754-a94fe518ebe2">

**Listado 2.3. HolaWWW.java**

```java
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWWW extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
	             "Transitional//EN\">\n";
    out.println(docType +
		"<HTML>\n" +
		"<HEAD><TITLE>Hello WWW</TITLE></HEAD>\n" +
		"<BODY>\n" +
		"<H1>Hello WWW</H1>\n" +
		"</BODY></HTML>");
  }
}
```

### 💻 Un servlet que genera HTML

Vamos a generar el Servlet **`HolaWWW.java`**

<img width="592" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/2983f39e-0cc4-416c-b363-09e6a35d2466">

<img width="1467" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/4a4063e3-8e57-4dc9-9203-153060a9ae68">

```java
package com.javaangular;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWWW extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   response.setContentType("text/html");
		
	   PrintWriter out = response.getWriter();
		
	   String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " + 
		            "Transitional//EN\">\n";
		
	   out.println(docType + 
		       "<HTML>\n" + 
		       "<HEAD><TITLE>Hello WWW</TITLE></HEAD>\n" + 
		       "<BODY>\n" + 
		       "<H1>Hello WWW</H1>\n" + 
		       "</BODY></HTML>");
	}

}
```

El archivo **`web.xml`** se ha modificado para gestionar el Servlet.

```xml
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
  <display-name>Archetype Created Web Application</display-name>
  <servlet>
  	<servlet-name>ServletTemplate</servlet-name>
  	<display-name>ServletTemplate</display-name>
  	<description></description>
  	<servlet-class>com.javaangular.ServletTemplate</servlet-class>
  </servlet>
  <servlet>
  	<servlet-name>HelloWorld</servlet-name>
  	<display-name>HelloWorld</display-name>
  	<description></description>
  	<servlet-class>com.javaangular.HelloWorld</servlet-class>
  </servlet>
  <servlet>
  	<servlet-name>HelloWWW</servlet-name>
  	<display-name>HelloWWW</display-name>
  	<description></description>
  	<servlet-class>com.javaangular.HelloWWW</servlet-class>
  </servlet>
  <servlet-mapping>
  	<servlet-name>ServletTemplate</servlet-name>
  	<url-pattern>/ServletTemplate</url-pattern>
  </servlet-mapping>
  <servlet-mapping>
  	<servlet-name>HelloWorld</servlet-name>
  	<url-pattern>/HelloWorld</url-pattern>
  </servlet-mapping>
  <servlet-mapping>
  	<servlet-name>HelloWWW</servlet-name>
  	<url-pattern>/HelloWWW</url-pattern>
  </servlet-mapping>
</web-app>
```

Ejecutamos la aplicación.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e258207f-3968-435e-ae7e-c113e2e12ade">

**NOTA**: Todos los ejemplos hasta aquí no deberían estar en paquetes(pero las hemos metido en paquetes) que es lo que se ve en la siguiente sección.

## 2.4. Packaging Servlets

En un entorno de producción, varios programadores pueden estar desarrollando servlets para el mismo servidor. Por lo tanto, ***colocar todos los servlets en el directorio de servlets de nivel superior da como resultado un directorio masivo difícil de administrar y genera conflictos de nombres cuando dos desarrolladores eligen accidentalmente el mismo nombre de servlet***. ***Los paquetes son la solución natural a este problema***. El uso de paquetes da como resultado cambios en la forma en que se crean los servlets, la forma en que se compilan y la forma en que se invocan. Consideremos estas áreas una a la vez en las siguientes tres subsecciones. Los primeros dos cambios son exactamente iguales que con cualquier otra clase de Java que use paquetes; no hay nada específico para los servlets.

### Creando Servlets en Paquetes

Se necesitan dos pasos para colocar servlets en paquetes:

1. Mueva los archivos a un subdirectorio que coincida con el nombre del paquete deseado.

   Por ejemplo, usaré el paquete **`coreservlets`** para la mayoría del resto de los servlets de este libro. Por lo tanto, los archivos de clase deben ir a un subdirectorio llamado **`coreservlets`** .

2. Inserte una sentencia de package en el archivo de clase.

   Por ejemplo, para colocar un archivo de clase en un package llamado **`somePackage`**, la primera línea del archivo debería decir

   ```java
   package somePackage;
   ```

   Por ejemplo, el Listado 2.4 presenta una variación del servlet **`HelloWWW `** que se encuentra en el paquete **`coreservlets`**. El archivo de clase va en **`install_dir/webpages/WEB-INF/classes/coreservlets`** para Tomcat 3.0, en **`install_dir/webpages/WEB-INF/servlets/coreservlets`** para JSWDK 1.0.1 y en **`install_dir/servlets/coreservlets`** para Java Web Server 2.0.

**Listado 2.4. HolaWWW2.java**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWWW2 extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String docType =
      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
      "Transitional//EN\">\n";
    out.println(docType +
                "<HTML>\n" +
                "<HEAD><TITLE>Hello WWW</TITLE></HEAD>\n" +
                "<BODY>\n" +
                "<H1>Hello WWW</H1>\n" +
                "</BODY></HTML>");
  }
}
```
       
### Compilando Servlets en Packages

Hay dos formas principales de compilar clases que están en paquetes. La primera opción es colocar el subdirectorio de su paquete justo en el directorio donde el servidor web espera que vayan los servlets. Luego, configuraría la variable **`CLASSPATH`** para que apunte al directorio sobre el que realmente contiene sus servlets, es decir, al directorio principal de servlets utilizado por el servidor web. Luego puede compilar normalmente desde el subdirectorio específico del paquete. Por ejemplo, si su directorio de servlets base es **`C:\JavaWebServer2.0\servlets`** y el nombre de su paquete (y, por lo tanto, el nombre del subdirectorio) es **`coreservlets`** y está ejecutando Windows, haría lo siguiente:

```sh
DOS>    set CLASSPATH=C:\JavaWebServer2.0\servlets;%CLASSPATH%
DOS>    cd C:\JavaWebServer2.0\servlets\coreservlets
DOS>    javac HelloWorld.java
```
						
La primera parte, la configuración de **`CLASSPATH`**, es probable que desee hacerlo de forma permanente, en lugar de hacerlo cada vez que inicia una nueva ventana de DOS. En Windows 95/98 normalmente coloca la sentencia **`set CLASSPATH=...`** en su archivo **`autoexec.bat`** en algún lugar después de la línea que configura **`CLASSPATH`** para que apunte a **`servlet.jar`** y al archivo JSP JAR. En Windows NT o Windows 2000, vaya al menú Inicio, seleccione Configuración, seleccione Panel de control, seleccione Sistema, seleccione Entorno, luego ingrese la variable y el valor. En Unix (shell C), establece la variable **`CLASSPATH `** por

```sh
setenv CLASSPATH /install_dir/servlets:$CLASSPATH
```

Póngalo en su archivo **`.cshrc`** para que sea permanente.

Si su paquete tuviera la forma **`name1.name2.name3`** en lugar de simplemente **`name1`** como aquí, **`CLASSPATH`** aún debería apuntar al directorio de servlet de nivel superior, es decir, el directorio que contiene **`name1`**.

Una segunda forma de compilar clases que están en paquetes es mantener el código fuente en una ubicación distinta de los archivos de clase. Primero, coloque los directorios de sus paquetes en cualquier lugar que le resulte conveniente. **`CLASSPATH`** hace referencia a esta ubicación. En segundo lugar, utiliza la opción **`-d`** de **`javac`** para instalar los archivos de clase en el directorio que espera el servidor web. A continuación se muestra un ejemplo. Una vez más, probablemente querrá configurar **`CLASSPATH`** de forma permanente en lugar de configurarlo cada vez.

```sh
DOS> cd C:\MyServlets\coreservlets
DOS> set CLASSPATH=C:\MyServlets;%CLASSPATH%
DOS> javac -d C:\tomcat\webpages\WEB-INF\classes HelloWWW2.java
```
						
Mantener el código fuente separado de los archivos de clase es el enfoque que utilizo para mi propio desarrollo. Para complicar aún más mi vida, tengo una serie de configuraciones de **`CLASSPATH`** diferentes que uso para diferentes proyectos, y generalmente uso JDK 1.2, no JDK 1.1 como espera el servidor web Java. Entonces, en Windows me parece conveniente automatizar el proceso de compilación de servlet con un archivo por lotes **`servletc.bat`**, como se muestra en el Listado 2.5 (los saltos de línea en la línea **`CLASSPATH`** del conjunto se insertaron solo para mejorar la legibilidad). Puse este archivo por lotes en **`C:\Windows\Commando`** en otro lugar de la de la **`PATH`** de Windows. Después de esto, para compilar el servlet **`HelloWWW2`** e instalarlo con el Java Web Server, simplemente voy a **`C:\MyServlets\coreservlets`** y hago **`servletc HelloWWW2.java`**. El archivo de código fuente en http://www.coreservlets.com/ contiene variaciones de **`servletc.bat`** para JSWDK y Tomcat. Puede hacer algo similar en Unix con un script de shell.

### Invocando Servlets en Paquetes

Para invocar un servlet que está en un paquete, use la URL

```sh
http://host/servlet/packageName.ServletName
```

en lugar de

```sh
http://host/servlet/ServletName
```

Por lo tanto, si el servidor web se ejecuta en el sistema local,

**Listado 2.5. servletc.bat**

```bat
@echo off

rem This is the version for the Java Web Server.
rem See http://www.coreservlets.com/ for other versions.

set CLASSPATH=C:\JavaWebServer2.0\lib\servlet.jar;
    C:\JavaWebServer2.0\lib\jsp.jar;
    C:\MyServlets
C:\JDK1.1.8\bin\javac -d C:\JavaWebServer2.0\servlets %1%
```

http://localhost/servlet/coreservlets.HolaWWW2

invocaría el servlet **`HelloWWW2`**, como se ilustra en la Figura 2-3.

**Figura 2-3. Invocar un servlet en un paquete a través de http://hostname/servlet/packagename.servletName**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/ad174670-ee9c-40ae-b654-e6f4a80b20cb)

## 2.5. Utilidades Simples de Creación de HTML

Un documento HTML está estructurado de la siguiente manera:

```html
<!DOCTYPE ...>
<HTML>
<HEAD><TITLE>...</TITLE>...</HEAD>
<BODY ...>
...
</BODY>
</HTML>
```

Es posible que sienta la tentación de omitir parte de esta estructura, especialmente la línea **`DOCTYPE`**, teniendo en cuenta que prácticamente todos los principales navegadores la ignoran, aunque las especificaciones de **HTML 3.2 y 4.0** así lo requieran. Desaconsejo firmemente esta práctica. La ventaja de la línea **`DOCTYPE`** es que les dice a los validadores de HTML qué versión de HTML está utilizando, para que sepan con qué especificación verificar su documento. Estos validadores son servicios de depuración muy valiosos, que lo ayudan a detectar errores de sintaxis HTML que su navegador adivina bien, pero que otros navegadores tendrán problemas para mostrar. Los dos validadores en línea más populares son los del **World Wide Web Consortium ( http://validator.w3.org/ )** y del **Web Design Group (http://www.htmlhelp.com/tools/validator/ )**. Le permiten enviar una URL, luego recuperan la página, verifican la sintaxis con la especificación HTML formal y le informan cualquier error. Dado que un servlet que genera HTML parece una página web normal para los visitantes, se puede validar de la manera normal a menos que requiera datos **`POST`** para devolver su resultado. Recuerde que los datos **`GET`** se adjuntan a la URL, por lo que puede enviar una URL que incluya datos **`GET`** a los validadores.

**Core Approach**

   :atom: Utilice un validador de HTML para comprobar la sintaxis de las páginas que generan sus servlets.

Es cierto que es un poco engorroso generar HTML con sentencias **`println`**, especialmente líneas largas y tediosas como la declaración **`DOCTYPE`**. Algunas personas solucionan este problema escribiendo utilidades detalladas de generación de HTML en Java y luego las usan en sus servlets. Soy escéptico sobre la utilidad de una library extensa para esto. En primer lugar, el inconveniente de generar HTML mediante programación es uno de los principales problemas abordados por JavaServer Pages (discutido en la segunda parte de este libro). JSP es una mejor solución, así que no desperdicie el esfuerzo creando un paquete complejo de generación de HTML. En segundo lugar, las rutinas de generación de HTML pueden ser engorrosas y tienden a no ser compatibles con la gama completa de atributos HTML ( **`CLASS`** e **`ID`** para hojas de estilo, controladores de eventos de JavaScript, colores de fondo de celdas de tablas, etc.). A pesar del valor cuestionable de una library de generación de HTML completa, si descubre que está repitiendo las mismas construcciones muchas veces, también podría crear un archivo de utilidad simple que simplifique esas construcciones. Para los servlets estándar, hay dos partes de la página web ( **`DOCTYPE`** y **`HEAD`** ) que es poco probable que cambien y, por lo tanto, podrían beneficiarse si se incorporaran a un archivo de utilidad simple. Estos se muestran en el Listado 2.6 , y el Listado 2.7 muestra una variación de **`HelloWWW2`** que hace uso de esta utilidad. Agregaré algunas utilidades más a lo largo del libro.

**Listado 2.6. ServletUtilities.java**

```java
package coreservlets;

import javax.servlet.*;
import javax.servlet.http.*;

public class ServletUtilities {
  public static final String DOCTYPE = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
				       "Transitional//EN\">";
  public static String headWithTitle(String title) {
	return(DOCTYPE + "\n" +
	       "<HTML>\n" +
	       "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n");
						}
  ...
}
```

**Listado 2.7. `HelloWWW3.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWWW3 extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println(ServletUtilities.headWithTitle("Hello WWW") +
                "<BODY>\n" +
                "<H1>Hello WWW</H1>\n" +
                "</BODY></HTML>");
  }
}
```

**Figura 2-4. Resultado del servlet `HelloWWW3`.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/9ac2049e-8f82-48e6-a76e-e73ecece6de6)

## 2.6. El Ciclo de Vida del Servlet

Anteriormente en este libro, me referí vagamente al hecho de que solo se crea una única instancia de un servlet, y cada request de usuario da como resultado un nuevo hilo que se entrega a **`doGet`** o **`doPost`**, según corresponda. Ahora seré más específico sobre cómo se crean y destruyen los servlets, y cómo y cuándo se invocan los diversos métodos. Daré un breve resumen aquí, luego lo explicaré en las siguientes subsecciones.

Cuando se crea el servlet por primera vez, se invoca su método **`init`**, por lo que es donde se coloca el código de configuración de una sola vez(one-time setup code). Después de esto, cada user request da como resultado un thread(hilo) que llama al método **`service`** de la instancia creada anteriormente. Múltiples concurrent requests(solicitudes simultáneas) normalmente dan como resultado múltiples threads (subprocesos) que llaman al **`service`** simultáneamente, aunque su servlet puede implementar una interfaz especial que estipula que solo se permite ejecutar un único subproceso en un momento dado. Luego, el método **`service`** llama a **`doGet`** , **`doPost`** u otro **`doXxx`** según el tipo de HTTP request que haya recibido. Finalmente, cuando el servidor decide unload(descargar) un servlet, primero llama al método **`destroy`** del servlet.

### El método `init`

El método **`init`** se llama cuando el servlet se crea por primera vez y no se vuelve a llamar para cada user request(solicitud de usuario). Por lo tanto, ***se usa para inicializaciones únicas***, al igual que con el método **`init`** de los applets. ***El servlet se puede crear cuando un usuario invoca por primera vez una URL correspondiente al servlet o cuando el servidor se inicia por primera vez, dependiendo de cómo haya registrado el servlet con el servidor web***. Se creará para la primera user request si no se registra explícitamente, sino que se coloca en uno de los directorios del servidor estándar. Consulte la discusión de la Sección 2.2 (A Simple Servlet Generating Plain Text) para obtener detalles sobre estos directorios.

Hay dos versiones de **`init`**: una que no toma argumentos y otra que toma un objeto **`ServletConfig`** como argumento. La primera versión se usa cuando el servlet no necesita leer ninguna configuración que varíe de un servidor a otro. La definición del método se ve así:

```java
public void init() throws ServletException {
  // Initialization code...
}
```

Para ver ejemplos de este tipo de inicialización, consulte la Sección 2.8 (An Example Using Servlet Initialization and Page Modification Dates) más adelante en este capítulo. La Sección 18.8 (Connection Pooling: A Case Study) en el capítulo sobre JDBC ofrece una aplicación más avanzada donde **`init`** se usa para preasignar múltiples database connections(conexiones de base de datos).

La segunda versión de **`init`** se usa cuando el servlet necesita leer la configuración específica del servidor antes de que pueda completar la inicialización. Por ejemplo, es posible que el servlet necesite conocer la configuración de la base de datos, los archivos de contraseñas, los parámetros de rendimiento específicos del servidor, los archivos de recuento de visitas o los datos de cookies serializados de solicitudes anteriores. La segunda versión de **`init`** se ve así:

```java
public void init(ServletConfig config) throws ServletException {
  super.init(config);
  // Initialization code...
}
```

Observe dos cosas acerca de este código. Primero, el método **`init`** toma un **`ServletConfig`** como argumento. **`ServletConfig`** tiene un método **`getInitParameter`** con el que puede buscar parámetros de inicialización asociados con el servlet. Al igual que con el método **`getParameter`** utilizado en el método **`init`** de los applets, tanto la entrada (el nombre del parámetro) como la salida (el valor del parámetro) son cadenas. Para ver un ejemplo simple del uso de parámetros de inicialización, consulte la Sección 2.7 (An Example Using Initialization Parameters); para un ejemplo más complejo, consulte la Sección 4.5(Restricting Access to Web Pages) donde la ubicación de un archivo de contraseña se proporciona mediante el uso de **`getInitParameter`**. Tenga en cuenta que aunque busque parámetros de manera portátil, los configura de manera específica del servidor. Por ejemplo, con **Tomcat**, incrusta propiedades de servlet en un archivo llamado **`web.xml`**, con **JSWDK** usa **`servlets.properties`**, con el servidor de aplicaciones **WebLogic** usa **`weblogic.properties`** y con **Java Web Server** configura las propiedades de forma interactiva a través de la consola de administración. Para ver ejemplos de estos ajustes, consulte la Sección 2.7 (An Example Using Initialization Parameters).

La segunda cosa a tener en cuenta sobre la segunda versión de **`init`** es que la primera línea del body del método es una llamada a **`super.init`**. ¡Esta llamada es crítica! El objeto **`ServletConfig`** se usa en otra parte del servlet, y el método **`init`** de la superclase lo registra donde el servlet puede encontrarlo más tarde. Por lo tanto, puede causarse grandes dolores de cabeza más adelante si omite la llamada a **`super.init`**.

**Core Approach**

   :atom: Si escribe un método **`init`** que toma un **`ServletConfig`** como argumento, llame **siempre** a **`super.init`** en la primera línea.


### El método `service`

Cada vez que el servidor recibe una request de un servlet, el servidor genera un nuevo thread (hilo) y llama a **`service`**. El método **`service`** comprueba el tipo de HTTP request ( **`GET`**, **`POST`**, **`PUT`**, **`DELETE`**, etc.) y llama a **`doGet`**, **`doPost`**, **`doPut`**, **`doDelete`**, etc., según corresponda. Ahora, si tiene un servlet que necesita manejar las solicitudes **`POST`** y **`GET`** de manera idéntica, puede verse tentado a sobreescribir(override)  el **`service`** directamente como se muestra a continuación, en lugar de implementar tanto **`doGet`** como **`doPost`**.

```java
public void service(HttpServletRequest request,
                    HttpServletResponse response)
    throws ServletException, IOException {
  // Servlet Code
}
```

Esta no es una buena idea. En su lugar, solo haga que **`doPost`** llame a **`doGet`** (o viceversa), como se muestra a continuación.

```java
public void doGet(HttpServletRequest request,
                  HttpServletResponse response)
    throws ServletException, IOException {
  // Servlet Code
}

public void doPost(HttpServletRequest request,
                   HttpServletResponse response)
    throws ServletException, IOException {
  doGet(request, response);
}
```

Aunque este enfoque requiere un par de líneas adicionales de código, tiene cinco ventajas sobre el overriding **`service`**:

1. Puede agregar soporte para otros servicios más adelante agregando **`doPut`**, **`doTrace`**, etc., quizás en una subclase. El Overriding **`service`** excluye directamente esta posibilidad.

2. Puede agregar soporte para fechas de modificación agregando un método **`getLastModified`**. Si usa **`doGet`**, el **`service`** estándar utiliza el método **`getLastModified`** para establecer los headers **`Last-Modified`** y para responder correctamente a las requests **`GET`** condicionales (aquellas que contienen un header **`If-Modified-Since`**). Consulte la Sección 2.8 (An Example Using Servlet Initialization and Page Modification Dates) para ver un ejemplo.

3. Obtiene soporte automático para requests **`HEAD`**. El sistema simplemente devuelve los headers y los status codes que establece **`doGet`**, pero omite el body de la página. **`HEAD`** es un request method útil para clientes HTTP personalizados. Por ejemplo, los link validators(validadores de enlaces) que verifican una página en busca de enlaces de hipertexto muertos a menudo usan **`HEAD`** en lugar de **`GET`** para reducir la carga del servidor.

4. Obtiene soporte automático para las **`OPTIONS`** requests. Si existe un método **`doGet`**, el método **`service`** estándar responde a las **`OPTIONS`** requests devolviendo un header **`Allow`** que indica que se admiten **`GET`**, **`HEAD`**, **`OPTIONS`** y **`TRACE`**.

5. Obtiene soporte automático para **`TRACE`** requests. **`TRACE`** es un request method utilizado para la client debugging: simplemente devuelve los HTTP request headers al cliente.

**Core Tip**
	
   Si su servlet necesita manejar tanto **`GET`** como **`POST`** de manera idéntica, haga que su método **`doPost`** llame a **`doGet`**, o viceversa. No sobreescriba el **`service`** directamente.


### Los métodos `doGet`, `doPost` y `doXxx`

Estos métodos contienen la carne real de su servlet. El noventa y nueve por ciento de las veces, solo te preocupas por requests **`GET`** y/o **`POST`**, por lo que anula **`doGet`** y/o **`doPost`**. Sin embargo, si lo desea, también puede anular **`doDelete`** para **`DELETE`** requests, **`doPut`** para **`PUT`** , **`doOptions`** para **`OPTIONS`** y **`doTrace`** para **`TRACE`** . Recuerde, sin embargo, que tiene soporte automático para **`OPCIONES`** y **`TRACE`**, como se describe en la sección anterior sobre el método **`service`**. Tenga en cuenta que no existe un método **`doHead`**. Esto se debe a que el sistema usa automáticamente la línea de estado y la configuración del encabezado de **`doGet`** para responder a las **`HEAD`** requests.

### La interfaz `SingleThreadModel`

Normalmente, el sistema crea una única instancia de su servlet y luego crea un nuevo subproceso para cada solicitud del usuario, con varios subprocesos simultáneos que se ejecutan si llega una nueva request mientras una request anterior aún se está ejecutando. Esto significa que sus métodos **`doGet`** y **`doPost`** deben tener cuidado de sincronizar el acceso a los campos y otros datos compartidos, ya que varios subprocesos pueden intentar acceder a los datos simultáneamente. Consulte la Sección 7.3 (Persistent Servlet State and Auto-Reloading Pages) para obtener más información al respecto. Si desea evitar este acceso multithreaded(multiproceso), puede hacer que su servlet implemente la interfaz **`SingleThreadModel`**, como se muestra a continuación.

```java
public class YourServlet   extends HttpServlet
                           implements SingleThreadModel {
  ...
}
```

Si implementa esta interfaz, el sistema garantiza que nunca haya más de un request thread accediendo a una sola instancia de su servlet. Lo hace poniendo en cola todas las requests y pasándolas una a la vez a una única instancia de servlet, o creando un pool de múltiples instancias, cada una de las cuales maneja una request a la vez. Esto significa que no tiene que preocuparse por el acceso simultáneo a campos regulares (instance variables - variables de instancia) del servlet. Sin embargo , todavía tiene que sincronizar el acceso a las class variables ( campos **`static`** ) o datos compartidos almacenados fuera del servlet.

*El acceso síncrono a sus servlets puede dañar significativamente el rendimiento (latencia) si se accede a su servlet con mucha frecuencia. Así que piénselo dos veces antes de usar el enfoque **`SingleThreadModel`***.

### El Método `destroy`

El servidor puede decidir eliminar una instancia de servlet previamente cargada, quizás porque el administrador del servidor se lo solicita explícitamente, o quizás porque el servlet está inactivo durante mucho tiempo. Sin embargo, antes de que lo haga, llama al método **`destroy`** del servlet. Este método le da a su servlet la oportunidad de cerrar conexiones de bases de datos, detener subprocesos en segundo plano, escribir listas de cookies o recuentos de visitas al disco y realizar otras actividades de limpieza similares. Tenga en cuenta, sin embargo, que es posible que el servidor web se bloquee. Después de todo, no todos los servidores web están escritos en lenguajes de programación confiables como Java; algunos están escritos en lenguajes (como los que tienen nombres de letras del alfabeto) en los que es fácil leer o borrar los extremos de los arrays, hacer typecasts ilegales o tener punteros colgantes debido a errores de recuperación de memoria. Además, incluso la tecnología Java no evitará que alguien tropiece con el cable de alimentación que va a la computadora. Entonces, no cuentes con **`destroy`** como el único mecanismo para guardar el estado en el disco. Las actividades como el conteo de visitas o la acumulación de listas de valores de cookies que indican un acceso especial también deben escribir proactivamente su estado en el disco periódicamente.

## 2.7. Un Ejemplo Usando Initialization Parameters

El listado 2.8 muestra un servlet que lee los parámetros de inicialización **`message`** y **`repeats`** cuando se inicializa. La figura 2-5 muestra el resultado cuando el **`message`** es **`Shibboleth`**, las **`repeats`** son **`5`** y el servlet se registra con el nombre **`ShowMsg`**. Recuerde que, aunque los servlets leen los parámetros de inicio de forma estándar, los desarrolladores establecen los parámetros de inicio de forma específica del servidor. Consulte la documentación de su servidor para obtener detalles autorizados. El Listado 2.9 muestra el archivo de configuración utilizado con Tomcat para obtener el resultado de la Figura 2-5, el Listado 2.10 muestra el archivo de configuración utilizado con el JSWDK, y las Figuras 2-6 y 2-7 muestran cómo configurar los parámetros de forma interactiva con el servidor web Java. El resultado es idéntico a la figura 2-5 en los tres casos.

**Figura 2-5. El servlet `ShowMessage` con parámetros de inicialización específicos del servidor.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e90be164-cbbd-494f-8d1e-80c707a7eab4)


**Figura 2-6. Registrar un nombre para un servlet con Java Web Server. Los servlets que usan parámetros de inicialización primero deben registrarse de esta manera.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/61a67f80-6db6-4bf9-b80d-0df510d714a0)


**Figura 2-7. Especificación de parámetros de inicialización para un servlet con nombre con Java Web Server.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e2b7ecd6-50a9-4d04-a094-9397c78ed18c)


Debido a que el proceso de configuración de los parámetros de inicio es específico del servidor, es una buena idea minimizar el número de entradas de inicialización separadas que deben especificarse. Esto limitará el trabajo que debe realizar al mover servlets que usan parámetros de inicio de un servidor a otro. Si necesita leer una gran cantidad de datos, le recomiendo que el init parameter solo proporcione la ubicación de un archivo de parámetros y que los datos reales vayan a ese archivo. Se proporciona un ejemplo de este enfoque en la Sección 4.5 (Restricting Access to Web Pages), donde el parámetro de inicialización no especifica nada más que la ubicación del archivo de contraseña.

**Core Approach**

   :atom: Para inicializaciones complejas, almacene los datos en un archivo separado y use los init parameters para dar la ubicación de ese archivo.


**Listado 2.8. `ShowMessage.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/** Example using servlet initialization. Here, the message
 *  to print and the number of times the message should be
 *  repeated is taken from the init parameters.
 */

public class ShowMessage extends HttpServlet {
  private String message;
  private String defaultMessage = "No message.";
  private int repeats = 1;

  public void init(ServletConfig config) throws ServletException {
    // Always call super.init
    super.init(config);
    message = config.getInitParameter("message");
    if (message == null) {
      message = defaultMessage;
    }
    try {
      String repeatString = config.getInitParameter("repeats");
      repeats = Integer.parseInt(repeatString);
    } catch(NumberFormatException nfe) {
      // NumberFormatException handles case where repeatString
      // is null *and* case where it is something in an
      // illegal format. Either way, do nothing in catch,
      // as the previous value (1) for the repeats field will
      // remain valid because the Integer.parseInt throws
      // the exception *before* the value gets assigned
      // to repeats.
    }
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "The ShowMessage Servlet";
    out.println(ServletUtilities.headWithTitle(title) +
        "<BODY BGCOLOR=\"#FDF5E6\">\n" +
        "<H1 ALIGN=CENTER>" + title + "</H1>");
        for(int i=0; i<repeats; i++) {
          out.println(message + "<BR>");
        }
        out.println("</BODY></HTML>");
  }
}
```

El Listado 2.9 muestra el archivo de instalación que se usa para proporcionar parámetros de inicialización a los servlets que se usan con **Tomcat 3.0**. La idea es que primero asocie un nombre con el archivo de clase de servlet, luego asocie los parámetros de inicialización con ese nombre (no con el archivo de clase real). El archivo de instalación se encuentra en **`install_dir/webpages/WEB-INF`**. En lugar de recrear una versión similar a mano, es posible que desee descargar este archivo desde http://www.coreservlets.com/, modificarlo y copiarlo en **`install_dir/webpages/WEB-INF`**.

El listado 2.10 muestra el archivo de propiedades utilizado para proporcionar parámetros de inicialización a los servlets en el JSWDK. Al igual que con Tomcat, primero asocia un nombre con la clase de servlet y luego asocia los parámetros de inicialización con el nombre. El archivo de propiedades se encuentra en **`install_dir/webpages/WEB-INF`**.

**Listado 2.9. `web.xml` (para Tomcat)**

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>

<!DOCTYPE web-app
    PUBLIC "-//Sun Microsystems, Inc.//DTD Web Application 2.2//EN"
    "http://java.sun.com/j2ee/dtds/web-app_2.2.dtd">

<web-app>
  <servlet>
    <servlet-name>
      ShowMsg
    </servlet-name>

    <servlet-class>
      coreservlets.ShowMessage
    </servlet-class>

    <init-param>
      <param-name>
        message
      </param-name>
      <param-value>
        Shibboleth
      </param-value>
    </init-param>

    <init-param>
      <param-name>
        repeats
      </param-name>
      <param-value>
        5
      </param-value>
    </init-param>
  </servlet>
</web-app>
```

**Listado 2.10. `servlets.properties`**

```properties
# servlets.properties used with the JSWDK

# Register servlet via servletName.code=servletClassFile
# You access it via http://host/examples/servlet/servletName
ShowMsg.code=coreservlets.ShowMessage

# Set init params via
#   servletName.initparams=param1=val1,param2=val2,...
ShowMsg.initparams=message=Shibboleth,repeats=5

# Standard setting
jsp.code=com.sun.jsp.runtime.JspServlet

# Set this to keep servlet source code built from JSP
jsp.initparams=keepgenerated=true
```

## 2.8. Un Ejemplo Usando Fechas de Inicialización de Servlet y Modificación de Página

El listado 2.11 muestra un servlet que usa **`init`** para hacer dos cosas. Primero, construye un array de 10 enteros. Dado que estos números se basan en cálculos complejos, no quiero repetir el cálculo para cada request. Así que hice que **`doGet`** busque los valores que calculó **`init`** en lugar de generarlos cada vez. Los resultados de esta técnica se muestran en la Figura 2-8 .

**Figura 2-8. Salida del Servlet `LotteryNumbers`.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/be1f1298-5267-44a2-a914-9d1083765b62)

Sin embargo, dado que todos los usuarios obtienen el mismo resultado, **`init`** también almacena una fecha de modificación de la página que utiliza el método **`getLastModified`**. Este método debería devolver un tiempo de modificación expresado en milisegundos desde 1970, como es estándar con las fechas de Java. La hora se convierte automáticamente a una fecha en GMT adecuada para el header **`Last-Modified`**. Más importante aún, si el servidor recibe una request **`GET`** condicional (una que especifica que el cliente solo quiere páginas marcadas como **`If-Modified-Since`** desde una fecha en particular), el sistema compara la fecha especificada con la devuelta por **`getLastModified`**, solo devolviendo la página si se ha cambiado después de la fecha especificada. Los navegadores realizan con frecuencia estas solicitudes condicionales para las páginas almacenadas en sus cachés, por lo que admitir solicitudes condicionales ayuda a sus usuarios y reduce la carga del servidor. Dado que los encabezados **`Last-Modified`** y **`If-Modified-Since`** usan solo segundos completos, el método **`getLastModified`** debe redondear los tiempos al segundo más cercano.

Las figuras 2-9 y 2-10 muestran el resultado de requests para el mismo servlet con dos fechas ligeramente diferentes **`If-Modified-Since`**. Para establecer los request headers y ver los response headers, utilicé **`WebClient`**, una aplicación de Java que se muestra en la Sección 2.10 (WebClient: hablar con servidores web de forma interactiva) que le permite configurar HTTP requests de forma interactiva, enviarlas y ver los resultados.

**Figura 2-9. Acceso al servlet `LotteryNumbers` con una request `GET` incondicional o con una request condicional que especifica una fecha antes de que la inicialización del servlet dé como resultado la página web normal.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/265c0ca9-1c7f-408a-9171-dbc4afbff78b)

**Figura 2-10. Acceder al servlet `LotteryNumbers` con una request `GET` condicional que especifica una fecha en o después de la inicialización del servlet da como resultado una respuesta 304 ( no modificada )**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/294e43c6-b306-47b6-8145-a654ce9ee34f)


**Listado 2.11. `LotteryNumbers.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/** Example using servlet initialization and the
 *  getLastModified method.
 */

public class LotteryNumbers extends HttpServlet {
  private long modTime;
  private int[] numbers = new int[10];

  /** The init method is called only when the servlet
   *  is first loaded, before the first request
   *  is processed.
   */

  public void init() throws ServletException {
    // Round to nearest second (ie 1000 milliseconds)
    modTime = System.currentTimeMillis()/1000*1000;
    for(int i=0; i<numbers.length; i++) {
      numbers[i] = randomNum();
    }
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "Your Lottery Numbers";
    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=CENTER>" + title + "</H1>\n" +
                "<B>Based upon extensive research of " +
                "astro-illogical trends, psychic farces, " +
                "and detailed statistical claptrap, " +
                "we have chosen the " + numbers.length +
                " best lottery numbers for you.</B>" +
                "<OL>");
    for(int i=0; i<numbers.length; i++) {
      out.println("  <LI>" + numbers[i]);
    }
    out.println("</OL>" +
                "</BODY></HTML>");
  }

  /** The standard service method compares this date
   *  against any date specified in the If-Modified-Since
   *  request header. If the getLastModified date is
   *  later, or if there is no If-Modified-Since header,
   *  the doGet method is called normally. But if the
   *  getLastModified date is the same or earlier,
   *  the service method sends back a 304 (Not Modified)
   *  response, and does <B>not</B> call doGet.
   *  The browser should use its cached version of
   *  the page in such a case.
   */

  public long getLastModified(HttpServletRequest request) {
    return(modTime);
  }

  // A random int from 0 to 99.

  private int randomNum() {
    return((int)(Math.random() * 100));
  }
}
```
