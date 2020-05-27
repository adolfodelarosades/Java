# 2. Contenedor de inversión de control 42m

* Contenedor de IoC 13:01 
* Mi primer Bean 6:49 
* Inyeccion de dependencias: vía setter vs. vía constructor 12:58 
* Inyeccion automática 9:22 
* Contenido adicional  4

# 06 Contenedor de IoC 13:01 

[PDF 2-1_Contenedor_de_IoC.pdf](pdfs/2-1_Contenedor_de_IoC.pdf)

## Resumen Profesor

### Posibles formas de configuración de metadatos

Spring nos permite configurar los metadatos a través de varias formas:

* XML
* Anotaciones
* Código Java (conocido como Java-Config).

A lo largo del curso cubriremos las 3 formas, si bien comenzaremos con XML.

### Dependencia Maven

Cabe recordar que la dependencia *maven* que necesitamos para comenzar a usar el *Spring Ioc container* es:

```html
<dependency>
  <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.0.8.RELEASE</version>
</dependency>
```

### ClassPathXMLApplicationContext vs. FileSystemXMLApplicationContext

En esta lección hemos visto el uso de ambas clases. Durante el resto de lecciones utilizaremos la primera de ellas.

## Transcripción

<img src="images/6-01.png">

<img src="images/6-02.png">

Tenemos el modulo del *Core Container* el curso esta basado en este modulo sobre todo en la parte de `Context`.

<img src="images/6-03.png">

El Contenedor de Inversión de Control de Spring se basa en el uso de dos paquetes:

* `org.springframework.beans`
* `org.springframework.context`

Los elementos más básicos que utilizaremos seran:

* `BeanFactory` lo más elemental para poder manejar cualquier bean - objeto.
* `ApplicationContext` (la que usaremos) es una interfaz superset de `BeanFactory` que añade más funcionalidades.

<img src="images/6-04.png">

Diagrama de clases que vamos poder tener a nuestra disposición.

* `BeanFactory` Partimos de la raíz el más sencillo de todos.
* `ApplicationContext`: Trabajaremos con esta Interfaz y tiene dos clases principales que la implementan, aun que existen otras.
* `ClassPathXMLApplicatioContext`: Se encargara de cargar el contexto desde un archivo XML que esta ubicado dentro del classpath
* `FileSystemXMLApplicationContext`: Busca la configuración en el sistema de ficheros.
* `WebApplicationContext`: Interfaz para aplicaciones Web.
* `XMLBeanFactory` Esta no la usaremos

Es todo un ecosistema de clases que nos van a permitir construir ese __*Contenedor de Inversión de Control*__.

<img src="images/6-05.png">

El contenedor lo que va a gestionar son *Beans*, un *Bean* no es más que un *objeto* gestionado por el contenedor de Inversión de Control, y que defineremos a partir de una serie de Metadatos, es decir es un como un objeto empoderado.

<img src="images/6-06.png">

Comenzaremos con XML.

<img src="images/6-07.png">

En nuestro primer ejemplo nuestro Contenedor de IoC tendra una estructura parecida a esta:

* Inicializaremos el contexto.
* Utilizaremos los beans.
* Cerraremos el contexto.

### Pasos para crear primer ejemplo

* Crear un nuevo proyecto Maven.
   
   <img src="images/6-08.png">
   
* No seleccionamos ningún arquetipo. Un arquetipo es un esqueleto de proyecto ya definido. 

   <img src="images/6-09.png">

* Maven se basa en la creación de artefactos y los artefactos se basan en un Group Id y un Artifact Id.

   <img src="images/6-10.png">

* Se crea la estructura de nuestro proyecto Maven

   <img src="images/6-11.png">

   Maven arrastra de cierta manera el uso de Java 5.

* Cambiamos a Java 8 pulsando en el proyecto con el botón derecho.

   <img src="images/6-12.png">

   <img src="images/6-13.png">
   
   <img src="images/6-14.png">
   
* Como proyecto Maven se nos genero el archivo `pom.xml` con el siguiente contenido: 

```html
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.openwebinars</groupId>
  <artifactId>141-01-PrimerEjemplo</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <name>141-01-PrimerEjemplo</name>
  <description>Primer ejemplo de uso de Spring</description>
</project>    
```

* Debemos añadir la dependencias de `Spring Context` la podemos obtener de [mvnrepository](https://mvnrepository.com/)

   <img src="images/6-15.png">
   
   <img src="images/6-16.png">
   
   <img src="images/6-17.png">

   Tenemos que incluir:
   
   ```js
   <!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
   <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-context</artifactId>
      <version>5.2.6.RELEASE</version>
   </dependency>
   ```
   
* Por lo que el archivo `pom.xml` quedara así:

```js
<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.openwebinars</groupId>
	<artifactId>141-01-PrimerEjemplo</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>141-01-PrimerEjemplo</name>
	<description>Primer ejemplo de uso de Spring</description>
	<dependencies>
		<!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>5.2.6.RELEASE</version>
		</dependency>

	</dependencies>
</project>
```

   Es importante saber que inmediatamente cuando se inserta una nueva dependencia en `pom.xml` y se salva el archivo se descargan automaticamente todos los `jars` necesarios dentro de la carpeta `Maven Dependencies` y reconstruye el proyecto.
   
   <img src="images/6-18.png">

* Otra parte importante de la estructura creada es que existe una carpeta `src/main/java` donde colocaremos los archivos java y la carpeta `src/main/resources` donde colocaremos nuestross recursos como archivos `html`, `css`, `js`, `properties`, etc.

* Dentro de `src/main/java` creamos un nuevo paquete llamado `com.openwebinars.spring`

   <img src="images/6-19.png">
   
   <img src="images/6-20.png">

* Dentro del nuevo paquete creamos la clase llamada `App` con un `main`.

   <img src="images/6-21.png">
   
   <img src="images/6-22.png">
   
* Una vez que tenemos creada nuestra clase de aplicación, como hemos visto antes el algoritmp básico es 

   * Levantar el contexto (*Usaremos la clase `ClassPathXmlApplicationContext`*
   * Utilizar los beans
   * Cerrar el contexto (La interfaz `ApplicationContext` no tiene método `close` pero si las clases que lo implementan )
   * Definir dentro del Classpath un fichero descriptor XML donde definamos nuestros beans (`src/main/resources`).
   
   Nuestro código queda asi:
   
   ```java
   package com.openwebinars.spring;

   import org.springframework.context.ApplicationContext;
   import org.springframework.context.support.ClassPathXmlApplicationContext;

   public class App {

	public static void main(String[] args) {
		
		//Abrir contexto
		ApplicationContext appContext = new ClassPathXmlApplicationContext("beans.xml");
		
		
		//Cerrar contexto
		((ClassPathXmlApplicationContext) appContext).close();

	}

   }
   ```
   
   Para crear el archivo XML damos:
   
   <img src="images/6-23.png">
   
   <img src="images/6-24.png">
   
   <img src="images/6-25.png">
   
   No seleccionamos ninguno de ellos por que no usaremos en este ejemplo ningún bean
   
   <img src="images/6-26.png">
   
   Ya tenemos nuestro fichero XML.
   
   **NOTA:** La importación rápida se hace con Ctrl+Mayus+O

* Ejecutamos la aplicación, aunque no pasara gran cosa:

   <img src="images/6-27.png">
   
   Simplemente se levanta el contenedor y se cierra.
   
   
   **ESTE SERA EL ESQUEMA QUE UTILIZAREMOS EN LOS PRÓXIMOS EJEMPLOS**
   
# 07 Mi primer Bean 6:49 

[PDF 2-2_Mi_primer_bean.pdf](pdfs/2-2_Mi_primer_bean.pdf)

## Resumen Profesor

### Cómo nombrar un bean

Un bean, normalmente, tiene un solo nombre; y este debe ser único en el contenedor donde esté registrado. Si necesitamos que tenga más de un nombre, deberíamos declarar un alias.

En XML, para indicar el nombre de un bean, podemos usar su propiedad `id`. Los nombres suelen seguir la notación *Camel Case*: `myBean`, `emailService`, ... Si queremos declararle algún alias, podemos usar la propiedad `name`, indicando los nombre separados por comas, punto y comas o espacios.

### Definición de un bean

Durante este ejemplo solo utilizaremos algunas de las propiedades necesarias de un bean, como el `id`, `name` o `class`. A continuación tenemos una lista más completa:

* `class`
* `name`
* `scope`
* `lazy-init`
* `depends-on`
* `init-method`
* `destroy-method`

## Transcripción

# 08 Inyeccion de dependencias: vía setter vs. vía constructor 12:58 

[PDF 2-3_Inyeccion_de_dependencias.pdf](pdfs/2-3_Inyeccion_de_dependencias.pdf)

## Resumen Profesor

### *Inner beans* (beans anidados)

En ocasiones, podemos crear beans anidados (o internos) a otros beans, en lugar de referenciarlos. **¿Cuál sería la ventaja de un *inner bean* frente a otro referenciado?**. La respuesta no es difícil: el bean anidados no será accesible desde fuera el bean externo, mientras que el referenciado puede ser accedido por otros beans.

```html
<bean id="outer" class="...">
    <!-- instead of using a reference to a target bean, simply define the target bean inline -->
    <property name="target">
        <bean class="com.example.Person"> <!-- this is the inner bean -->
            <property name="name" value="Fiona Apple"/>
            <property name="age" value="25"/>
        </bean>
    </property>
</bean>
```

En este ejemplo, el bean de tipo `Person` solo podría ser accedido por el bean `outer`.

### Colecciones

Spring nos ofrece la posibilidad de inyectar valores dentro de una colección. Los tipos soportados son `<list>` (`java.util.List`), `<set>` (`java.util.Set`), `<map>` (`java.util.Map`), `<props>` (`java.util.Properties`).

```html
<bean id="moreComplexObject" class="example.ComplexObject">
    <!-- results in a setAdminEmails(java.util.Properties) call -->
    <property name="adminEmails">
        <props>
            <prop key="administrator">administrator@example.org</prop>
            <prop key="support">support@example.org</prop>
            <prop key="development">development@example.org</prop>
        </props>
    </property>
    <!-- results in a setSomeList(java.util.List) call -->
    <property name="someList">
        <list>
            <value>a list element followed by a reference</value>
            <ref bean="myDataSource" />
        </list>
    </property>
    <!-- results in a setSomeMap(java.util.Map) call -->
    <property name="someMap">
        <map>
            <entry key="an entry" value="just some string"/>
            <entry key ="a ref" value-ref="myDataSource"/>
        </map>
    </property>
    <!-- results in a setSomeSet(java.util.Set) call -->
    <property name="someSet">
        <set>
            <value>just some string</value>
            <ref bean="myDataSource" />
        </set>
    </property>
</bean>
```

## Transcripción

# 09 Inyeccion automática 9:22 

[PDF 2-4_Inyeccion_automatica.pdf](pdfs/2-4_Inyeccion_automatica.pdf)

## Resumen Profesor

### Exclusión de la inyección automática

Podemos excluir un bean de ser *candidato* a inyectarse automáticamente mediante el atributo `autowired-candidate=false`. De esa forma, solo podrá inyectarse de forma explícita.

También podemos limitar los candidatos a ser autoinyectados utilizando un patrón sobre los nombres de los beans y el atributo `default-autowired-candidates` (***este es solo aplicable al elemento raiz `<beans>`***). Por ejemplo, para que todos ellos incluyeran el nombre repository, podríamos usar el patrón `*Repository`.

## Transcripción

# Contenido adicional  4

* [PDF 2-1_Contenedor_de_IoC.pdf](pdfs/2-1_Contenedor_de_IoC.pdf)
* [PDF 2-2_Mi_primer_bean.pdf](pdfs/2-2_Mi_primer_bean.pdf)
* [PDF 2-3_Inyeccion_de_dependencias.pdf](pdfs/2-3_Inyeccion_de_dependencias.pdf)
* [PDF 2-4_Inyeccion_automatica.pdf](pdfs/2-4_Inyeccion_automatica.pdf)
