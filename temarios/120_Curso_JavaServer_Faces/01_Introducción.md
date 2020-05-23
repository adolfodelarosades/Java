# 1. Introducción 49m
   * Presentación del curso y del profesor 2:39 
   * Introducción a JavaServer Faces (JSF) 5:46 
   * Configuración del entorno de Desarrollo 12:27 
   * Crear Facelet Composition Page 11:22 
   * Componentes HTML en JSF 8:16 
   * Componentes Core en JSF 9:07 
   * Contenido adicional 5
   
## Presentación del curso y del profesor 2:39 

[Presentación del curso y del profesor](pdfs/1-presentacion-curso-profesor.pdf)

En este curso estudiaremos 5 lecciones para analizar muchos de los elementos que componen el framework de JSF (JavaServer Faces):

1. Introducción a JavaServer Faces (JSF)

2. ManagedBeans y Navegación en JSF

3. Manejo de Eventos en JSF

4. Validadores y Convertidores en JSF

5. Facelets de JSF

## Introducción a JavaServer Faces (JSF) 5:46 

[Introducción a JavaServer Faces JSF](pdfs/2-introduccion-jsf.pdf)

JSF es una tecnología que fué creada para simplificar la creación de interfaces web de usuario para aplicaciones web JavaEE.

Mediante ejemplos prácticos analizaremos las características de este framework, utilizando diferentes herramientas de desarrollo para crear nuestras aplicaciones web Java con JSF e integrarlas con otras tecnologías Java como EJB y JPA.

Algunas de las características principales de JSF son:

* Es un marco de trabajo (framework) para crear aplicaciones JavaEE basadas en el patrón de diseño MVC (Modelo-Vista-Controlador) y utilizando la API de Servlets.

* Utiliza páginas JSP para generar las vistas, añadiendo una biblioteca de etiquetas propia para crear componentes reutilizables: JavaScript, HTML, CSS, … que podrán ser desplegados en cualquier tipo de cliente (navegadores, móviles, …), ahorrando mucho tiempo en el desarrollo de aplicaciones web. Este concepto se conoce como Render Kits.

* JSF resuelve validaciones, conversiones, mensajes de error e internacionalización (i18n).

* Es extensible, pudiendo crearse nuevos elementos de la interfaz o modificar los ya existentes. JSF dispone de varias implementaciones diferentes, incluyendo un conjunto de etiquetas y APIs estándar que forman el núcleo del framework. Algunas de las implementaciones son: PrimeFaces, RichFaces, IceFaces, cada una de las cuales contiene un número diferente de componentes.

* Soporte nativo para AJAX, por tanto, facilita el tratamiento de peticiones asíncronas.

* Soporte por defecto para el uso de la tecnología de Facelets.

* Y lo que es más importante: forma parte del estándar J2EE.

Arquitectura general:
En el caso de JSF 2 la definición de la interfaz se realiza en forma de páginas XHTML con distintos tipos de etiquetas que veremos más adelante. Estas páginas se denominan páginas JSF. La siguiente figura muestra el funcionamiento de JSF para generar una página por primera vez.

<img src="images/1-arquitectura.png">

El navegador realiza una petición a una determinada URL en la que reside la página JSF que se quiere mostrar. En el servidor un servlet que llamamos motor de JSF recibe la petición y construye un árbol de componentes a partir de la página JSF que se solicita. Este árbol de componentes replica en forma de objetos Java la estructura de la página JSF original y representa la estructura de la página que se va a devolver al navegador. Una vez construido el árbol de componentes, se ejecuta código Java en el servidor para rellenar los elementos del árbol con los datos de la aplicación. Por último, a partir del árbol de componentes se genera la página HTML que se envía al navegador.

<img src="images/1-proceso.png">

* Lado del cliente:

   * Vistas web: HTML, CSS y JavaScript.

* Lado del servidor:

   * Capa de Presentación: JSP, JSF, Ajax, …
   
   * Capa de Negocio (objetos de negocio): EJB

   * Capa de Datos (objetos entidad): JPA, JDBC
   
**MVC con JSF:**

<img src="images/1-mvc.png">

<img src="images/1-mvc2.png">

* **Modelo**: es el encargado de almacenar los datos de la aplicación web. Se puede implementar con clases java (POJO: Plain Old Java Object) o con Managed Bean de modelo.

* **Vista**: define la interfaz de usuario utilizando JSF (Facelets o JSPs), JSTL, EL, ... para desplegar la información del modelo.

* **Controlador**: define el flujo de la aplicación y las interacciones del usuario. Se puede implementar con Managed Bean de control.

El flujo de una aplicación web dinámica que utiliza JSF es análogo al flujo que utilizábamos en el desarrollo web utilizando JSP.

## Configuración del entorno de Desarrollo 12:27 

[Configuración del entorno de Desarrollo](pdfs/3-entorno-desarrollo.pdf)

Para utilizar JSF en nuestros proyectos tenemos que añadir a nuestro entorno configurado en el curso de Desarrollo Web JavaEE, los siguientes ficheros JAR:

* myfaces-api.jar (jsf-api.jar), JavaServer Faces API para representar los componentes.

* myfaces-impl.jar (jsf-impl.jar), Tag libraries para añadir los componentes a la páginas web.

Que podremos descargar desde nuestro IDE Eclipse desde varias fuentes como:

* Oracle Mojarra

* Apache MyFaces

Una vez añadidos los ficheros JAR tendremos que configurar nuestro fichero descriptor web.xml y añadir el fichero faces-config.xml (opcional a partir de la versión JSF 2.0).

### Añadir JSF a nuestro Dynamic Web Project en Eclipse IDE

Para añadir la compatibilidad con JSF a nuestro proyecto de JavaEE tendremos que editar las propiedades de nuestro proyecto: Project properties → Project Facets y añadir la opción: “JavaServer Faces 2.1”:

<img src="images/1-entorno-1.png">

La primera vez que activamos esta opción nos aparece una nueva ventana, que nos permitirá descargar las librerías necesarias, tras pulsar en el mensaje de error “Further configuration required...”

<img src="images/1-entorno-2.png">

a continuación pulsamos en el icono para descargar las librerías y descargamos JSF 2.1 de Apache, seleccionándola y pulsando en “Next”:

<img src="images/1-entorno-3.png">

y aceptamos la licencia para que se inicie la descarga tras pulsar el botón “Finish”:

<img src="images/1-entorno-4.png">

Una vez descargado ya lo tenemos disponible en la ventana de selección de “JSF Capabilities”. El resto de parámetros los dejamos por defecto.

<img src="images/1-entorno-5.png">

Entre los parámetros aparece:

* JSF Configuration File, fichero de configuración faces-config.xml

* JSF Servlet Name y JSF Servlet Class Name, nombre del Servlet especificado en nuestro archivo web.xml

* URL Mapping Patterns: mapeo del Servlet que atenderá las peticiones de JSF. Cualquier petición dirigida a una ruta que contenga /faces/* será atendida por el framework de JSF.

Tras aceptar las modificaciones, la estructura de nuestro proyecto nos muestras los siguientes cambios:

<img src="images/1-entorno-6.png">
<img src="images/1-entorno-7.png">

Si editamos el fichero web.xml podremos comprobar la integración de JSF mediante la incorporación de un Servlet:

Integración de JSF, cualquier petición cuya URL contenga la palabra “faces” será atendida por el framework de JSF.

```xml
.
.
.
<session-config>
    <session-timeout>30</session-timeout>
  </session-config>
  <servlet>
    <servlet-name>Faces Servlet</servlet-name>
    <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>Faces Servlet</servlet-name>
    <url-pattern>/faces/*</url-pattern>
  </servlet-mapping>
  <context-param>
    <param-name>javax.servlet.jsp.jstl.fmt.localizationContext</param-name>
    <param-value>resources.application</param-value>
  </context-param>
.
.
.
```

Si abrimos el fichero faces-config.xml podemos ver que se carga un editor gráfico y que existen otras muchas formas de visualizarlo (Introduction, Overview, Navigation Rule, ManagedBean, Component, Others, Source):

<img src="images/1-entorno-8.png">

y si nos vamos a la vista de “Source” tenemos:

* Etiqueta faces-config

* Versión 2.1 JSF

```xml
<?xml version="1.0" encoding="UTF-8"?>

<faces-config
    xmlns="http://java.sun.com/xml/ns/javaee"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-facesconfig_2_1.xsd"
    version="2.1">

</faces-config>
```

## Crear Facelet Composition Page 11:22 

Para crear nuestro primer JSF, crearemos un nuevo fichero .xhtml dentro del directorio de publicación de nuestra aplicación.

<img src="images/1-jsf-1.png">

Seleccionamos New → HTML File y pulsamos “Next”. El nombre del fichero será index.xhtml:

<img src="images/1-jsf-2.png">

y seleccionaremos el tipo “New Facelet Composition Page”:

<img src="images/1-jsf-3.png">

Contenido base, añade los namespaces para poder importar y utilizar las etiquetas de JSF.

Borramos el resto de código para esta prueba.

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:ui="http://xmlns.jcp.org/jsf/facelets"
	xmlns:h="http://xmlns.jcp.org/jsf/html"
	xmlns:f="http://xmlns.jcp.org/jsf/core">

<ui:composition template="">
	<ui:define name="header">
	    Add your header here or delete to use the default
	</ui:define>
	<ui:define name="content">
	    Add your content here or delete to use the default
	</ui:define>
	<ui:define name="footer">
	    Add your footer here or delete to use the default
	</ui:define>
</ui:composition>
</html>
```

Abrimos el index.xhtml con el editor web de Eclipse (Botón derecho → Open With → Web Page Editor).

<img src="images/1-jsf-4.png">

Desde la paleta de componentes añadimos:

* JSF HTML

* Body

* Output Label, escribimos el contenido “HolaMundo JSF”

Ejecutamos el fichero index.xhtml en Tomcat y comprobamos que se ejecuta correctamente reconociendo que se trata de un JSF (`ruta /faces/*`). En caso contrario se imprimiría la etiqueta outputLabel y no el contenido de dicha etiqueta (“HolaMundo JSF”).

<img src="images/1-jsf-5.png">


## Componentes HTML en JSF 8:16 

[Componentes HTML en JSF](pdfs/6-componentes-html.pdf)

El API de JSF contiene múltiples componentes para mostrar información en HTML (XHTML). La siguiente tabla muestra las clases Java de los componentes de cada una de las etiquetas básicas JSF que se transforman en código HTML (prefijo <h:>):

<img src="images/1-c-1.png">

<img src="images/1-c-3.png">

Ejemplos: http://www.corejsf.com/jsf-tags.html

A continuación añadimos una breve descripción de cada etiqueta:

<img src="images/1-c-5.png">
<img src="images/1-c-9.png">
<img src="images/1-c-11.png">
<img src="images/1-c-15.png">
<img src="images/1-c-23.png">
<img src="images/1-c-25.png">
<img src="images/1-c-35.png">
<img src="images/1-c-37.png">
<img src="images/1-c-43.png">
<img src="images/1-c-45.png">
<img src="images/1-c-53.png">
<img src="images/1-c-55.png">

## Componentes Core en JSF 9:07 

[Componentes Core en JSF](pdfs/7-componentes-core.pdf)

Igualmente, el API de JFS provee de otras etiquetas del núcleo core custom actions (prefijo ). Estas etiquetas no representan un resultado HTML sino que definen acciones asociadas a los componentes o las páginas JSF. Se procesan en el servidor y modifican alguna característica del mismo. Por ejemplo, utilizando estas etiquetas es posible el manejo de eventos, añadir elementos hijos, conversores o validadores a un componente.

Ejemplos: http://www.corejsf.com/jsf-tags.html

A continuación añadimos una breve descripción de cada etiqueta:

<img src="images/1-b-1.png">
<img src="images/1-b-3.png">
<img src="images/1-b-5.png">
<img src="images/1-b-7.png">
<img src="images/1-b-9.png">
<img src="images/1-b-11.png">
<img src="images/1-b-13.png">
<img src="images/1-b-15.png">
<img src="images/1-b-17.png">
<img src="images/1-b-19.png">
<img src="images/1-b-21.png">
<img src="images/1-b-23.png">


## Contenido adicional 5   

[Presentación del curso y del profesor](pdfs/1-presentacion-curso-profesor.pdf)

[Introducción a JavaServer Faces JSF](pdfs/2-introduccion-jsf.pdf)

[Configuración del entorno de Desarrollo](pdfs/3-entorno-desarrollo.pdf)

[Componentes HTML en JSF](pdfs/6-componentes-html.pdf)

[Componentes Core en JSF](pdfs/7-componentes-core.pdf)
