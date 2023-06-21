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

Core Approach

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

Creando Servlets en Paquetes
Se necesitan dos pasos para colocar servlets en paquetes:

1.
Mueva los archivos a un subdirectorio que coincida con el nombre del paquete deseado.

Por ejemplo, usaré el paquete coreservlets para la mayoría del resto de los servlets de este libro. Por lo tanto, los archivos de clase deben ir a un subdirectorio llamado coreservlets .

2.
Inserte una instrucción de paquete en el archivo de clase.

Por ejemplo, para colocar un archivo de clase en un paquete llamado somePackage , la primera línea del archivo debería decir

paquete algúnPaquete;

Por ejemplo, el Listado 2.4 presenta una variación del servlet HelloWWW que se encuentra en el paquete coreservlets . El archivo de clase va en install_dir /webpages/WEB-INF/classes/coreservlets para Tomcat 3.0, en install_dir /webpages/WEB-INF/servlets/coreservlets para JSWDK 1.0.1 y en install_dir /servlets/coreservlets para Java Web. Servidor 2.0.

Listado 2.4. HolaWWW2.java
							paquete coreservlets;

importar java.io.*;
importar javax.servlet.*;
importar javax.servlet.http.*;

clase pública HelloWWW2 extiende HttpServlet {
  doGet public void (solicitud HttpServletRequest,
                    respuesta HttpServletResponse)
      lanza ServletException, IOException {
    respuesta.setContentType("texto/html");
    PrintWriter out = respuesta.getWriter();
    Cadena docType =
      "<!DOCTYPE HTML PÚBLICO \"-//W3C//DTD HTML 4.0 " +
      "Transicional//ES\">\n";
    out.println(docType +
                "<HTML>\n" +
                "<HEAD><TITLE>Hola WWW</TITLE></HEAD>\n" +
                "<CUERPO>\n" +
                "<H1>Hola WWW</H1>\n" +
                "</BODY></HTML>");
  }
}

Compilando Servlets en Paquetes
Hay dos formas principales de compilar clases que están en paquetes. La primera opción es colocar el subdirectorio de su paquete justo en el directorio donde el servidor web espera que vayan los servlets. Luego, configuraría la variable CLASSPATH para que apunte al directorio sobre el que realmente contiene sus servlets, es decir, al directorio principal de servlets utilizado por el servidor web. Luego puede compilar normalmente desde el subdirectorio específico del paquete. Por ejemplo, si su directorio de servlets base es C:\JavaWebServer2.0\servlets y el nombre de su paquete (y, por lo tanto, el nombre del subdirectorio) es coreservlets y está ejecutando Windows, haría lo siguiente:

DOS>     set CLASSPATH=C:\JavaWebServer2.0\servlets;%CLASSPATH% 
DOS>     cd C:\JavaWebServer2.0\servlets\coreservlets 
DOS>     javac HelloWorld.java
						

La primera parte, la configuración de CLASSPATH , es probable que desee hacerlo de forma permanente, en lugar de hacerlo cada vez que inicia una nueva ventana de DOS. En Windows 95/98 normalmente coloca el conjunto CLASSPATH=...declaración en su archivo autoexec.bat en algún lugar después de la línea que configura CLASSPATH para que apunte a servlet.jar y al archivo JSP JAR. En Windows NT o Windows 2000, vaya al menú Inicio, seleccione Configuración, seleccione Panel de control, seleccione Sistema, seleccione Entorno, luego ingrese la variable y el valor. En Unix (shell C), establece la variable CLASSPATH por

setenv CLASSPATH / install_dir /servlets:$CLASSPATH

Póngalo en su archivo .cshrc para que sea permanente.

Si su paquete tuviera la forma nombre1.nombre2.nombre3 en lugar de simplemente nombre1 como aquí, CLASSPATH aún debería apuntar al directorio de servlet de nivel superior, es decir, el directorio que contiene nombre1 .

Una segunda forma de compilar clases que están en paquetes es mantener el código fuente en una ubicación distinta de los archivos de clase. Primero, coloque los directorios de sus paquetes en cualquier lugar que le resulte conveniente. CLASSPATH hace referencia a esta ubicación . En segundo lugar, utiliza la opción -d de javac para instalar los archivos de clase en el directorio que espera el servidor web. A continuación se muestra un ejemplo. Una vez más, probablemente querrá configurar CLASSPATH de forma permanente en lugar de configurarlo cada vez.

DOS> cd C:\MyServlets\coreservlets 
DOS> set CLASSPATH=C:\MyServlets;%CLASSPATH% 
DOS> javac -d C:\tomcat\webpages\WEB-INF\classes HelloWWW2.java
						

Mantener el código fuente separado de los archivos de clase es el enfoque que utilizo para mi propio desarrollo. Para complicar aún más mi vida, tengo una serie de configuraciones de CLASSPATH diferentes que uso para diferentes proyectos, y generalmente uso JDK 1.2, no JDK 1.1 como espera el servidor web Java. Entonces, en Windows me parece conveniente automatizar el proceso de compilación de servlet con un archivo por lotes servletc.bat, como se muestra en el Listado 2.5 (los saltos de línea en la línea CLASSPATH del conjunto se insertaron solo para mejorar la legibilidad). Puse este archivo por lotes en C:\Windows\Commando en otro lugar de la RUTA de Windows . Después de esto, para compilar el servlet HelloWWW2 e instalarlo con el Java Web Server, simplemente voy a C:\MyServlets\coreservlets y hago " servletc HelloWWW2.java ". El archivo de código fuente en http://www.coreservlets.com/ contiene variaciones de servletc.bat para JSWDK y Tomcat. Puede hacer algo similar en Unix con un script de shell.

Invocando Servlets en Paquetes
Para invocar un servlet que está en un paquete, use la URL

http://host/servlet/nombre del paquete.Nombre del servlet

en lugar de

http://host/servlet/ServletName

Por lo tanto, si el servidor web se ejecuta en el sistema local,

Listado 2.5. servletc.bat
@echo apagado

rem Esta es la versión para Java Web Server.
rem Ver http://www.coreservlets.com/ para otras versiones.

establecer CLASSPATH=C:\JavaWebServer2.0\lib\servlet.jar;
    C:\JavaWebServer2.0\lib\jsp.jar;
    C:\MisServlets
C:\JDK1.1.8\bin\javac -d C:\JavaWebServer2.0\servlets %1%

http://localhost/servlet/coreservlets.HolaWWW2

invocaría el servlet HelloWWW2 , como se ilustra en la Figura 2-3 .

Figura 2-3. Invocar un servlet en un paquete a través de http://hostname/servlet/packagename.servletName .
