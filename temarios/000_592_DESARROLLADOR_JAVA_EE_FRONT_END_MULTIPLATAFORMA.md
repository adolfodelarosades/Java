# 000 592 DESARROLLADOR JAVA EE FRONT END MULTIPLATAFORMA

# [20201105 Jueves](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201105_Jueves.md) :+1:

## Java EE

* Inicio de Curso
* :scroll: ¿Qué es Java EE?
   * Arquitectura aplicaciones Web
   * Interacción Cliente-Servidor
   * Definición Java EE
   * Tecnologías Java EE
   * Contenedores
   * Servidores de Aplicaciones
   * Servidor Web
   * Aplicación Web
   * Distribución de Aplicaciones
   * :computer: `01_ejemplo_app`
      
   Aplicación básica.
* :scroll: Programación con Servlets
   * ¿Qué es un Servlet?
   * Ciclo de Vida
   * Métodos del Ciclo de Vida
      * `init`
      * `service`
      * `destroy`
   * Concurrencia de peticiones
   * La Clase Servlet
   * Generación de respuestas
* :computer: `02_generador_frases`     
         
   Aplicación que usa Servlets.
* :scroll: Recogida de Parámetros desde un Servlet
   * Formulario HTML
   * Controles gráficos HTML
   * Recuperación de parámetros
* :computer: `03_datos_clientes`
 
   Aplicación Web que recupera parámetros
      
# [20201106 Viernes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201106_Viernes.md) :+1:

* :computer: `04_buscador`     
         
   Aplicación Buscador "Mini Google".
      
* :scroll: Parámetros en URL
* :computer: `05_texto`     
         
   Aplicación que pasa parámetros mediante la URL.
* :scroll: Transferencia de Peticiones
   * Concepto de Transferencia
   * Proceso
      * 1.- Objeto `RequestDispatcher`
      * 2.- Transferencia por medio de los métodos:
         * `forward()`
         * `include()`
   * Métodos `forward()` e `include()`
   * Redireccionamiento
* :computer: `04_buscador` Ajustes    
         
   Aplicación Buscador "Mini Google", cuando no localizabamos información de algún tema nos mostraba una pantalla en blanco, vamos a usar la Transferencia de Peticiones para pintar una pantalla cuando no existan datos.
      
* :computer: `06_buscador_login`
   
   Vamos a realizar un ajuste de la aplicacíon `04_buscador` que permita logearse y si lo hacemos podamos usar el buscador y si no que nos lo indique.
* :scroll: Java Server Pages
   * Definición y características
   * Código Java en JSP
   * Ciclo de vida de una página JSP
* :computer: `07_generador_frase_jsp`   
   
   Vamos a rehacer el ejemplo `02_generador_frase` que hicimos con Servlets haciendolo ahora con JSPs
* :scroll: Mantenimiento de Datos en la Aplicación
   * Mantenimiento de Datos
* :scroll: Atributos de Petición
   * Definición
   * Acceso a Atributos
* :computer: `08_buscador_servlet_jsp`
   
   Basandonos en el proyecto `06_buscador_login` hecho con Servlets lo vamos a rehacer con JSP para reemplazar los Servlets que regresaban HTML.
* :scroll: Atributos de Sesión
   * Características
   * Acceso a Atributos
   * Control de Sesiones
* :scroll: Componentes de una Página JSP
   * Objetos Implícitos
      * `request`
      * `response`
      * `session`
      * `application`
      * `exception`
      * `out`
   * Directivas JSP
      * `page`
      * `include`
      * `taglib`
   * Acciones JSP
* :scroll: Directivas JSP
   * Directiva `page`
   * Directiva `include`
* :computer: `09_buscador_sesion`

   Basandonos en el proyecto `08_buscador_servlet_jsp` vamos a crear `09_buscador_sesion` donde vamos a usar un atributo de sesión para que nos pinte en la parte superior el nombre del usuario en cualquier página que estemos, como esto va a estar en casí todas las páginas usaremos la directiva `include` para tener esa información en un JSP que incluiremos en otras donde lo necesitemos. 

# [20201109 Lunes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201109_Lunes.md)

## Listeners
* :scroll: Eventos de Aplicación
   * Características
   * Interfaces de Escucha
   * Implementación de un Manejador
* :computer: Ejercicio `10_gestion_candidatos` 
   
   Aplcación "Info-Curro" que permite Ingresar Candidatos con Foto y Ver la Lista de Candidatos. Usa el Listener para crear la Lista en la Sesión.
      
* :scroll: Atributos de Aplicación
   * Características
   * Acceso a Atributos
   * Control de Atributos de Aplicación
* :computer: `11_gestion_candidatos_aplicacion`
      
   En el ejemplo `10_gestion_candidatos` cada Cliente de la aplicación tenia su propia lista de candidatos, vamos usar los atributos de aplicación para que se maneje la misma lista para todos los clientes metiendo la lista de candidatos como atributo de aplicación.

* :scroll: Cookies
   * Características
   * Funcionamiento
   * Creación de una Cookie
   * Recuperación de una Cookie
* :scroll: Filtros (FALTA IMAGENES)
* :computer: `12_buscador_cookie_filtros`
      
   Basandonos en proyecto `09_buscador_sesion` que tiene una pantalla de Logeo queremos hacer una nueva aplicación que detecte si existen Cookies de Logeo ya no vaya a la pantalla de Logeo si no a la pantallade Buscar. (FALTA EL CODIGO)
   
(ESTAS PRESENTACIONES NO VAN AQUÍ
* :scroll: Directiva `taglib`
* :scroll: Acciones implícitas JSP
   * Definición y tipos
   * `forward` e `include`
* :scroll: Integración Servlets - JSP
   * Criterios de utilización
* :scroll: El Lenguaje de Expresiones EL
   * Fundamentos
   * Objetos Implícitos
      * `param`
      * `requestScope`
      * `sessionScope`
      * `applicationScope`
      * `cookie`
   * Ejemplo de uso I
   * Ejemplo de uso II
   * Operadores EL
* :scroll: La Librería de Acciones JSTL
   * Java Standard Tag Library
   * Grupos de acciones JSTL
   * Utilización de JSTL en JSP
* :scroll: Principales Acciones JSTL
   * Acción `set`
   * Acción `forEach`
   * `forEach` Atributo `varStatus` 
   * `forEach` como `for` estándar
   * Acción `if`
   * Acción `choose`
   * Utilización de JSTL en JSP
            
# [20201110 Martes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201110_Martes.md) :+1:

## JDBC

* Instalación de MySQL y Workbench
* Acceso a BD en Java
   * JDBC
   * Persistencia JPA
* :computer: `13_gestion_candidatos_basedatos`
   * 1.- BD
   * 2.- Mavenizar el proyecto e incluir dependencias
   * 3.- JavaBean de la Tabla
   * 4.- Conexión a la BD `empresa` (Clase Datos)
   * 5.- Capa de Negocio o Capa de Servicio con JDBC
   * 6.- Servlets
   * 7.- Capa de Vista
   * 8.- Probando la Aplicación
    
## Persistencia JPA

* :scroll: La Capa de Persistencia de una Aplicación
   * ¿Qué es la capa de persistencia?
   * Entidades
   * Frameworks de Persistencia
   * Java Persistence API
   * Ventajas de una Capa de Persistencia
* :scroll: Java Persistence API
   * Java Persistence API
   * Componentes JPA
* :scroll: Creación de la Capa de Persistencia JPA
   * Proceso
      * Creación de Entidades y configuración con anotaciones
      * Configurar con `persistence.xml`
   * BD
   * Creación de la Entidad
   * Principales Anotaciones
      * `@Entity`
      * `@Table`
      * `@Id`
      * `@Column`
      * `@GeneratedValue`
   * `persistence.xml`
   * Utilización motor Hibernate
* :computer: `14_gestion_candidatos_persistencia`
   * 1.- BD `empresa`
   * 2.- Mavenizar el proyecto e incluir dependencias
   * 3.- Añadir la Característica de JPA
      * Crea la carpeta META-INF y dentro el archivo `persistence.xml`
   * 4.- Uso del Asistente para Crear Entidades
      * Crear Conexión a la BD
      * Crear la Entidad `Candidato`
   * 5.- Editar `persistence.xml`
      * Incluir conexión a la BD
      * Incluir Proveedor de Persistencia Hibernate
   * 6.- Capa de Servicio con Persistencia
* :scroll: El API JPA
   * Objeto `EntityManager`
   * Obtención de un `EntityManager`
   * Métodos básicos de `EntityManager`
      * CRUD
         * `persist`
         * `merge`
         * `find`
      * Actualizar las propiedades de la Entidad con los valores de la BD
         * `refresh`
   * Transacciones
      * Objeto `EntityTransaction`
      * Métodos para Gestionar las Transacciones
         * `begin()`
         * `rollback()`
         * `commit()`
    
# [20201111 Miercoles](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201111_Miercoles.md) :+1:

* :scroll: Consultas JPA
   * Fundamentos
   * El lenguaje JPQL
   * Objeto `Query`
      * `createQuery()` de `EntityManager`
   * Métodos de `Query`
      * `getResultList()` Devuelve un `List`
      * `getSingleResult` Devuelve una única entidad
      * `executeUpdate()` para instrucciones de acción
   * Objeto `TypedQuery` Subinterfaz de `Query`
   * Métodos de `TypedQuery`
      * `getResultList()` Devuelve un `List` tipada
      * `getSingleResult` Devuelve una única entidad tipada
* :scroll: Consultas Parametrizadas
   * Definición
      * Parámetros
         * Con un nombre
         * Con una posición
   * Asignación de valores a parámetros
      * Métodos de `Query`
         * `setParameter(String nombre, Object value)`
         * `setParameter(int pos, Object value)`
* :scroll: Consultas de Acción
   * Instrucciones JPQL de acción
      * `Update`
      * `Delete`
   * Ejecución
      * `executeUpdate()`
* :computer: 14_gestion_candidatos_persistencia Continuación...         
   * 6.- Capa de Servicio con Persistencia (ya no usamos el Objeto EntityManager usamos los objetos `Query`, `TypeQuery`y `EntityTransaction`)      
   * 7.- Servlets (Sin cambios)
   * 8.- Vista (Sin cambios)
   * 9.- Probar la Aplicación
* :computer: `15_gestion_candidatos_persistencia_eliminacion` 
   * Funcionalidad de eliminar el Contacto por Email
* :scroll: Named Queries o Consultas Nominadas
   * Definición
   * Creación
      * Anotación `@NamedQuery`
   * Utilización
      * Método `createNamedQuery()` de `EntityManager`
* :computer: `16_gestion_candidatos_persistencia_namedquery`
   * 1.- Entidad con `@NamedQuery`
   * 2.- Cambiar el Service para usar `createNamedQuery` en lugar de `createQuery`
   * 3.- Probar la Aplicación
      
## Patrón MVC      
* :scroll: Patrón MVC
   * Patrones de diseño
   * Patrón MVC
   * Esquema general
   * El Modelo
   * La vista
   * El Controlador
* :computer: `17_gestion_candidatos_persistencia_mvc`
   * Este cambio principalmente afecta a los Servlets y la Capa de Vista.
   * 1.- Cambiar los Servlets por Actions
   * 2.- Crear el `FrontController`
   * 3.- En la Vista usar referencias a `FrontController?option=doAlgo`
   * 4.- Probar la Aplicación
# [20201112 Jueves](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201112_Jueves.md) :+1:

* :computer: `18_formacion_v1`
   * Nuevo proyecto partiendo de cero, usando BD, persistencia y patrón MVC.
   * 1.- BD `Formacion`
   * 2.- Crear proyecto en Eclipse
   * 3.- Mavenizar el Proyecto y añadir dependencias
   * 4.- Añadir la Característica JPA al Proyecto
   * 5.- Generer las Entidades `Alumno` y `Curso` con el Asistente
   * 6.- Completar el archivo `persistence.xml`
   * 7.- Crear el Service
   * 8.- Crear los Controladores de Acción
   * 9.- Crear el FrontController
   * 10.- Creación de las Vistas
   * 11.- Probar la Aplicación

## Patrón Factory
* Uso del Patrón Factory.
* :computer: `19_formacion_factoria`
   * 1.- Renombrar las Clases de Services
      * `AlumnosService` a `AlumnosServiceImpl` y `CursoService` a `CursoServiceImpl`
   * 2.- Generar las Interfaces a través de las Clases
   * 3.- Crear el Factory
   * 4.- Cambiar los Actions
   * 5.- Probar la Aplicación

## EJBs

# [20201113 Viernes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201113_Viernes.md) :-1:

* Instalación de Web Logic
* :computer: `20_gestion_candidatos_ejb_weblogic`
* (FALTA)

# [20201116 Lunes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201116_Lunes.md) :+1:

* :computer: `21_formacion_ejb_weblogic`
      
   Partiendo del proyecto `19_formacion_factoria` vamos a realizar una versión usando EJB.
      
   * 1.- Creación del Data Source en WebLogic
   * 2.- Creación Proyecto en Eclipse
   * 3.- Mavenizar Proyecto
   * 4.- Dar Características JPA
   * 5.- Modificación del Archivo `persistence.xml`
   * 6.- Creación del EJB. (Antes se usaban Clases, Interfaces y Factoria. Con EJBs solo Clases, Interfaces, el Factory  EJB nos lo proporciona implícitamente.)
   * 7.- Modificar Actions para que Inyecten el EJB.
   * 8.- FrontController igual.
   * 9.- Vistas igual.
   * 10.- Probar la aplicación.
      
## Relación Entre Entidades

* :scroll: Relación Entre Entidades 
   * Concepto
   * Tipos de Relaciones
      * Uno a Uno
      * Uno a Muchos
      * Muchos a Uno
      * Muchos a Muchos
   * Definición de Entidades
   * Configuración de Relaciones con Anotaciones
      * `@OneToOne`
      * `@OneToMany`
      * `@ManyToOne`
      * `@ManyToMany`
   * Configuración de Relaciones II
      * En las relaciones Uno a Muchos y Muchos a Uno, La Entidad del lado Muchos es la PROPIETARIA DE LA RELACIÓN.
      * El atributo del lado Muchos incluye la anotación `@JoinColumn` con la información de la relación
      * En las relaciones Muchos a Muchos, cualquiera puede incluir la información de la relación con `@JoinColumn`
   * Diagrama Relación Uno a Muchos.
   * Diagrama Relación Uno a Muchos - Muchos a Uno.

## Relación Uno a Muchos

* :computer: 22_ejemplo_relaciones
   
   Este proyecto nuevo nos va a servir para ver algunos ejemplos de Relación Entre Entidades, no tiene parte visual, solo sirve para ver las relaciones existentes entre las Tablas `Cursos` y `Preguntas` de la BD Formacion.
      
   * 1.- BD `formacion`
   * 2.- Creación del Proyecto Eclipse
   * 3.- Mavenizar el Proyecto e incluir las dependencias de Hibernate.
   * 4.- Creación de una Nueva Conexión con MySQL 5 para evitar error de duplicados
   * 5.- Generar las Entidades con el Asistente RELACIÓN UNO A MUCHOS, cada `Curso` tiene muchas `Preguntas`.
   * 6.- Creación de los EJBs.
   * SIN PRUEBAS
* :scroll: JOINS
   * Definición
      * Dos Tipos:
         * JOINs implícitos
         * JOINs explícitos
   * JOIN Implícito 
   * JOIN Explícito
* :scroll: Claves Primarias Compuestas
   * Fundamentos
   * Clase Primary Key
   * Definición de Primary Key en Entidad

## Relación Uno a Muchos y Muchos a Uno

* :computer: `23_formacion_ejb_weblogic_v2`   
      
   Partiendo del proyecto `21_formacion_ejb_weblogic` vamos a realizar una versión. Un alumno puede estar matriculado en uno o más cursos y un curso puede pertenecer a varias matriculas
     
   * 1.- Generación de Entidades Con el Asistente RELACIÓN UNO A MUCHOS y RELACIÓN MUCHOS A UNO. (Creación de MatriculaPK)
   * 2.- Ajustes en las Entidades (entre ellos `insertable = false, updatable = false`)
   * 3.- Ajustes `persistence.xml` para manejo de Transaccionalidad.
   * 4.- Añadir Métodos en los EJBs.
   * 5.- Añadir Actions
   * 6.- FrontController
   * 7.- Añadir Vistas
   * 8.- Probar la Aplicación
* Otros Querys que podemos usar con JPA      
      
# [20201117 Martes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201117_Martes.md) :+1:
   
## Spring

* :scroll: Introducción a Spring
   * ¿Qué es Spring?
   * Principales Módulos Spring
   * Spring Core
   * Otros Módulos
* :scroll: Aplicaciones Web con Spring
   * Características
   * Estructura General
   * Interacción Modelo - Controlador
      * Spring instancia Componentes
      * Inyección de dependenicas (del Modelo al Controlador)
   * Configuración en Spring
      * Controlador `mvcConfig.xml o .java`
      * Modelo `springConfig.xml o .java`
* Generación de un Nuevo Workspace.
* Instalación de Spring Tools 3(Standalone Edition) 3.9.14.RELEASE
* :computer: `01_buscador_base`
  
   Aplicación Base para ver como va evolucionando cuando empecemos a usar Spring. No usa BD, EJBs, Factoria, Interfaces. ACTION ESTA TOTALMENTE ACOPLADO CON LA CAPA DE SERVICIO.
      
   * 1.- JavaBean
   * 2.- Capa de Servicio
   * 3.- Servlets
   * 4.- Vistas
   * 5.- Probar la Aplicación

* :computer: `02_buscador_spring`
      
   Partiendo de `01_buscador_base` vamos a aplicar Spring dentro de la Capa de Negocios.
      
   * 1.- Mavenizar la Aplicación
      * Dependencias `Spring-Core` y `Spring-Context`
   * 2.- Modificaciones a Nivel de Código
      * Implentar Clase e Interface en la Capa de Servicio. 
      * Anotar con `@Service` la Clase del Servicio 
      * En el Servlet Inyectar la Interfaz con `@Autowired` 
   * 3.- Añadiendo las Configuraciones XML 
      * Añadir la dependencia `spring-web`
      * Añadir Archivo `web.xml`
         * Registrar el `ContextLoaderListener`
         * Con parámetro `springConfig.xml`
      * Añadir Archivo `springConfig.xml`
         * 1.- Habilite la configuración mediante anotaciones
         * 2.- Escanee los paquetes en los que se encuentran las clases que debe instanciar
   * 4.- Probar la Aplicación (FALLA)
   * 5.- Dar Acceso a Spring desde el Servidor de Aplicaciones
      * Sobreescribir el método `init` del Servlet para que le informa al servidor de aplicaciones que Spring va a realizar inyección de objetos en este servlet
   * 6.- Probar la Aplicación (TODO FUNCIONA)  

# [20201118 Miercoles](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201118_Miercoles.md) :+1:

## Spring DataSource

* :computer: `03_gestion_candidatos_basedatos`
   * 1.- Incorporar las Dependencias de Spring en el archivo `pom.xml`
   * 2.- Adaptar nuestra Capa de Servicio para que tenga Clase e Interface.
   * 3.- Modificar los Servlets
   * 4.- Añadir la Configuración XML
   * 5.- Probar la Aplicación
   * 6.- DataSources con Spring
   * 7.- Modificar el Servicio para que llame al DataSource
   * 8.- Ajustes en la JSP
   * 9.- Ajustes en los Servlets.
   * 10.- Probar la Aplicación
   * 11.- Anotación @Qualifier("data")
   * 12.- Usar DataSource del Servidor
   * 13.- Configurar Archivos de Tomcat
   * 14.- Usar el DataSource del Servidor
   * 15.- Probar la Aplicación
   
## Acceso a Datos con Spring-JDBC

* :scroll: Acceso a Datos con Spring-JDBC
   * Características
   * El Objeto `JdbcTemplate`
   * Métodos del `JdbcTemplate`
   * La Capa de Repositorio

* :computer: `04_gestion_candidatos_spring-jdbc`
   * 1.- Crear la Clase `JdbcTemplate`
   * 2.- Cambios en la Capa de Servicio
   * 3.- Probar la Aplicación
   
* :computer: `05_gestion_candidatos_ofertas`
   * 1.- Añadir Tabla `inscripciones` a la BD `empresa`.
   * 2.- Añadir el JavaBean `Inscripcion`
   * 3.- Capa de Servicio
   * 4.- Actions
   * 5.- FrontController
   * 6.- Vistas
   * 7.- Probar la Aplicación

* [20201119 Jueves](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201119_Jueves.md) :+1:

## Spring - Persistencia
### Anotación `@Transactional`
* `06_gestion_candidatos_spring_jpa`
   * 1.- Dependencias
   * 2.- Añadir Manualmente Anotaciones al JavaBean para convertirlo en Entidad
   * 3.- Modificar la Capa de Servicio para Manejar Persistencia
   * 4.- Configuración XML
   * 5.- Probar la Aplicación

* `07_gestion_candidatos_ofertas_jpa`
   * 1.- Añadir las Dependencias `spring-orm` y `hibernate-core` y quitamos `spring-jdbc` en `pom.xml` 
   * 2.- Vamos a activar la Característica JPA
   * 3.- Crear las Entidades con el Asistente
   * 4.- Capa de Servicio
   * 5.- Eliminar `persistence.xml` y Características JPA.
   * 6.- Probar la Aplicación
   
* `08_gestion_candidatos_ofertas_jpa_v2`
   * 1.- Cambios en las Entidades
   * 2.- Cambios en la Capa de Servicios
   * 3.- Actions
   * 4.- Controller
   * 5.- Vistas
   * 6.- Probar la Aplicación
   
* :scroll: Ajustes en Relaciones
   * Carga de datos relacionados
      * Atributo `fetch`
         * `FetchType.EAGER`
         * `FetchType.LAZY`
   * Actualizaciones en Cascada
      * Atributo `cascade`
         * `CascadeType.PERSIST`
         * `CascadeType.MERGE`
         * `CascadeType.REMOVE`
         * `CascadeType.REFRESH`
         * `CascadeType.ALL`

* [20201120 Viernes]()

* [20201123 Lunes]()
* [20201124 Martes]()
* [20201125 Miercoles]()
* [20201126 Jueves]()
* [20201127 Viernes]()

* [20201128 Lunes]()
* [20201129 Martes]()
* [20201130 Miercoles]()
* [20201201 Jueves]()
* [20201202 Viernes]()
