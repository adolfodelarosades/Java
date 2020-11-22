# 20201118 Miercoles

## :computer: `03_gestion_candidatos_basedatos`

   Vamos a partir del proyecto `13_gestion_candidatos_basedatos` el cual tiene una Clase Datos para realizar la conexión a la BD `empresa` y usa JDBC. Vamos a ver que nos aporta Spring para evolucionar esta aplicación.
   
### 01. Incorporar las Dependencias de Spring en el archivo `pom.xml`

`pom.xml`

```html
<dependencies>
   <!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
   <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>8.0.19</version>
   </dependency>
   <!-- https://mvnrepository.com/artifact/org.springframework/spring-core -->
   <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-core</artifactId>
      <version>5.2.9.RELEASE</version>
   </dependency>
   <!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
   <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-context</artifactId>
      <version>5.2.9.RELEASE</version>
   </dependency>
   <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-web</artifactId>
      <version>5.2.9.RELEASE</version>
   </dependency>
</dependencies>
```

### 02. Adaptar nuestra Capa de Servicio para que tenga Clase e Interfaz.

`CandidatosService`

```java
...
public interface CandidatosService {
   void altaCandidato(Candidato candidato);
   void eliminarCandidato(int idCandidato);
   List<Candidato> recuperarCandidatos();
}
```

`CandidatosServiceImpl`

```java
...
@Service
public class CandidatosServiceImpl implements CandidatosService {
	
   @Override
   public void altaCandidato(Candidato candidato) {

   ...
```

**Como esta Clase la debe instanciar Spring la anotamos con `@Service`**.

### 03. Modificar los Servlets

* En lugar de Instanciar la Clase de Servicio que teniamos antes inyectamos la Interfaz creada con: 

   ```java
   @Autowired
   CandidatosService service;
   ```

   Esto lo hacemos en nuestros dos Servlets `AltaCandidato` y `EliminarCandidato`.

* Además debemos sobreescribir el método `init` en ambos Servlets.

   ```java
   @Override
   public void init(ServletConfig config) throws ServletException {
      //le informa al servidor de aplicaciones que Spring va a realizar inyección
      //de objetos en este servlet
      SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
      super.init(config);
   }
   ```

### 04. Añadir la Configuración XML

* Añadir el archivo `web.xml` y añadir el registro del Listener.

   ```html
   <context-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>/WEB-INF/springConfig.xml</param-value>
   </context-param>
   <listener>
      <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
   </listener>
   ```

* Añadir el `springConfig.xml` (Usando el Pluging) o copiar de otro proyecto.

   ![03-00-01-s-ej](images/03-00-01-s-ej.png)
   
   ![03-00-02-s-ej](images/03-00-02-s-ej.png)
   
   Añadimos los NameSpaces que vayamos a utilizar en la pestaña `NameSpaces`
   
   ![03-00-03-s-ej](images/03-00-03-s-ej.png)
   
   Añadimos las siguientes anotaciones.

   ```html
   <!-- 1. Hailite la configuración mediante anotaciones -->
   <context:annotation-config />
	
   <!-- 2. Escanee los paquetes en los que se encuentran las clases que debe instanciar -->
   <context:component-scan base-package="service" />
   ```

### 05. Probar la Aplicación

Hasta aquí la Aplicación debe funcionar como lo hacia antes pero usando Spring.

**Hasta aquí el aporte de Spring es el mismo que en el proyecto anterior.**
**Spring instancia las Clases (anotadas con `@Service`) y las Inyecta donde las necesitemos**

## DataSources con Spring


### 06. DataSources con Spring

**UNA DE LAS COSAS QUE NOS APORTA SPRING Y QUE SIN ESTE FRAMEWORK NO SE PUEDE HACER ES QUE CON SPRING LA PROPIA APLICACIÓN PUEDE CREAR UN DATASOURCE, SIN NECESIDAD DE DEPENDER DEL SERVIDOR DE APLICACIONES.** Pero si se prefiere usar el del Servidor de Aplicaciones se puede hacer.

Spring tiene una Clase para crear un DataSource con la misma eficiencia que el Servidor de Aplicaciones. 

Por lo tanto en nuestro proyecto importado podemos eliminar la Clase `Datos` y usar el DataSource de Spring.

Si se quiere usar una Clase de Spring no se crea con el `new` en ningún sitio. Las clases de Spring se crean en el archivo `springConfig.xml`. 

Pero primero que nada necesitamos añadir una nueva dependencia que es la que nos va a permitir usar los DataSources, esa **dependencia es `spring-jdbc`**:

```html
<dependency>
   <groupId>org.springframework</groupId>
   <artifactId>spring-jdbc</artifactId>
   <version>5.2.9.RELEASE</version>
</dependency>
```

Una vez añadida la dependencia en `pom.xml`, en el archivo `springConfig.xml` podemos auxiliarnos de la pestaña `beans` para añadir los Objetos de Spring que necesitemos.

![03-01-s-ej](images/03-01-s-ej.png)

Presionamos `New Bean...` para crear un Objeto o Bean de Spring, le asignamos un `Id` y un `Name`.

![03-02-s-ej](images/03-02-s-ej.png)

En `Class` debemos indicar la Clase de Spring que queremos crear que en este caso es un `DriverManagerDataSource`

![03-03-s-ej](images/03-03-s-ej.png)

Aun que nos muestre error un error damos en Siguiente.

![03-04-s-ej](images/03-04-s-ej.png)

El Objeto `DriverManagerDataSource` necesita unas propiedades para que pueda trabajar y que nos van a ser familiares.

![03-05-s-ej](images/03-05-s-ej.png)

Debemos presionar `Add` para poder añadir las propiedades.

![03-06-s-ej](images/03-06-s-ej.png)

Gracias a que añadimos la dependencia `spring-jdbc` al insertar los nombres de las propiedades ya me las reconoce.

![03-07-s-ej](images/03-07-s-ej.png)

Ingreso el valor de la propiedad `url`.

![03-08-s-ej](images/03-08-s-ej.png)
![03-09-s-ej](images/03-09-s-ej.png)

Repito el proceso para `DriverManager`.

![03-10-s-ej](images/03-10-s-ej.png)
![03-11-s-ej](images/03-11-s-ej.png)

Repito el proceso para `username`.

![03-12-s-ej](images/03-12-s-ej.png)
![03-13-s-ej](images/03-13-s-ej.png)

Y finalmente para `password`

![03-14-s-ej](images/03-14-s-ej.png)
![03-15-s-ej](images/03-15-s-ej.png)

Al presionar Finish se crea mi Bean `data` que me representa un Objeto DataSource de Spring.

![03-16-s-ej](images/03-16-s-ej.png)

Lo que se ha generado en el archivo `springConfig.xml` es:

```html
<bean id="data" name="data" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
   <property name="url" 
      value="jdbc:mysql://localhost:3306/empresa?serverTimezone=Europe/Madrid">
   </property>
   <property name="driverClassName"
      value="com.mysql.cj.jdbc.Driver">
   </property>
   <property name="username" value="root"></property>
   <property name="password" value="root"></property>
</bean>
```

**NOTA:** ***Parece ser que el Pool de Conexiones que se crea es de una conexión y habría que añadir otras propiedades para poder modificarlo.***

ESTA ES LA FORMA EN QUE SPRING CREA LOS OBJETOS DE SU PROPIEDAD. PERO DE IGUAL MANERA PODRÍMAOS USAR LA ETIQUETA `<bean` PARA QUE SPRING INSTANCIE LOS OBJETOS QUE NOSOTROS HEMOS CÓDIFICADO EN LUGAR DE USAR LA ANOTACIÓN `@Service`, REGISTRARIAMOS EN `springConfig.xml` UN NUEVO BEAN CON LA INFORMACIÓN DE MI CLASE. A ESTO ES LO QUE LLAMAN CONFIGURACIÓN XML, PERO ACTUALMENTE ESTA SIENDO SUSTITUIDO CON LAS ANOTACIONES. **CON LAS CLASES DEL PROPIO SPRING NO TENGO OTRA ALTERNATIVA QUE INSTANCIARLAS EN EL `springConfig.xml`**. 

Con esto podemo eliminar la clase `Datos.java` que habíamos arrastrado del proyecto anterior. Ya no le vamos a pedir las conexiones directamente a la BD sino que lo vamos a solicitar directamente a nuestro DataSource que hemos incluido.

### 07. Modificar el Servicio para que llame al DataSource 

En nuestra Clase de Servicio actualmente usamos

`CandidatosServiceImpl`

```java
try(Connection con=Datos.getConnection()){
   ...
```

Pero ya no contamos con `Datos` queremos usar el `DriverManagerDataSource` que esta instanciando Spring por lo que en nuestra clase de Servicio debo inyectar la Interface `DataSource` cuyo objeto instanciado en `springConfig.xml` me la implementa.

Por lo que nuestro Servicio cambiado nos queda así:

`CandidatosServiceImpl`

```java
...
@Autowired
DataSource datasource;
	
@Override
public void altaCandidato(Candidato candidato) {
   try(Connection con = datasource.getConnection()){
   
   ...
   
@Override
public void eliminarCandidato(int idCandidato) {
   try(Connection con = datasource.getConnection()){
   
   ...
   
@Override
public List<Candidato> recuperarCandidatos(){
   List<Candidato> candidatos = new ArrayList<>();
		
   try(Connection con = datasource.getConnection()){   
   
   ... 
```

**Lo debemos cambiar en nuestros tres métodos**

### Conclusiones.

* La clase `DriverManagerDataSource` de Spring nos permite crear un DataSource dentro de la propia aplicación.
* La clase `DriverManagerDataSource` la incluyo en `springConfig.xml` para que Spring la pueda instanciar.
* Uso la Inyección de Dependencias para poder usar un Objeto `DataSource`

### 08. Ajustes en la JSP

Debemos realizar unos pequeños ajustes en la JSP por que en la aplicación copiada accediamos directamente a la Capa de Servicio cosa que no debe ser.

`candidatos.jsp`

```html
...
<%CandidatosService service=new CandidatosService();
  List<Candidato> empleados= service.recuperarCandidatos();
  for(int i=0;i<empleados.size();i++){ %>
     <tr><td> 
     ...   	    
```

Lo cambiamos por esto

```html
<%List<Candidato> empleados = (List<Candidato>)request.getAttribute("candidatos");
  if (empleados.size() > 0){
     for(int i=0;i<empleados.size();i++){%>
	<tr><td> 
     ...   	
```

**EN LOS JSP NO HAY INYECCIÓN DE DEPENDENCIA. SERÍA UN PLATEAMENTO ERRONEO**

Esto implica cambios en los Servlets para enviarle ese atributo `"candidatos"`.

### 08. Ajustes en los Servlets.

`BuscarCandidatos`

```java
@WebServlet("/BuscarCandidatos")
public class BuscarCandidatos extends HttpServlet {
   private static final long serialVersionUID = 1L;

   @Autowired
   CandidatosService service;
	
   @Override
   public void init(ServletConfig config) throws ServletException {
      //le informa al servidor de aplicaciones que Spring va a realizar inyección
      //de objetos en este servlet
      SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
      super.init(config);
   }
	
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setAttribute("candidatos", service.recuperarCandidatos());
         request.getRequestDispatcher("candidatos.jsp").forward(request, response);
   }
}
```

`EliminarCandidato`

```java
@WebServlet("/EliminarCandidato")
public class EliminarCandidato extends HttpServlet {
   private static final long serialVersionUID = 1L;

   @Autowired
   CandidatosService service;
	
   @Override
   public void init(ServletConfig config) throws ServletException {
      //le informa al servidor de aplicaciones que Spring va a realizar inyección
      //de objetos en este servlet
      SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
      super.init(config);
   }
	
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
      int idCandidato=Integer.parseInt(request.getParameter("idCandidato"));
      service.eliminarCandidato(idCandidato);
      request.getRequestDispatcher("BuscarCandidatos").forward(request, response);
   }
}
```

### 09. Probar la Aplicación

Si probamos aquí la aplicación FUNCIONA correctamente pero usando un DataSource Spring dentro de la aplicación.


