# 000 592 DESARROLLADOR JAVA EE FRONT END MULTIPLATAFORMA

* [20201105 Jueves](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201105_Jueves.md) :+1:
* [20201106 Viernes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201106_Viernes.md) :+1:

* [20201109 Lunes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201109_Lunes.md)
* [20201110 Martes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201110_Martes.md) :+1:
   * Instalación de MySQL y Workbench
   * Acceso a BD en Java
      * JDBC
      * Persistencia JPA
   * :computer: `13_gestion_candidatos_basedatos`
      * 1.- BD
      * 2.- Mavenizar el proyecto e incluir dependencias
      * 3.- JavaBean de la Tabla
      * 4.- Conexión a la BD (Clase Datos)
      * 5.- Capa de Negocio o Capa de Servicio con JDBC
      * 6.- Servlets
      * 7.- Capa de Vista
      * 8.- Probando la Aplicación
   * La Capa de Persistencia de una Aplicación
      * ¿Qué es la capa de persistencia?
      * Entidades
      * Frameworks de Persistencia
      * Java Persistence API
      * Ventajas de una Capa de Persistencia
   *  Java Persistence API
      * Java Persistence API
      * Componentes JPA
   * Crear la Capa de Persistencia
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
   * Acceso a la Capa de Persistencia con Métodos Básicos
      * Objeto EntityManager
      * Obtención de un EntityManager
      * Métodos básicos de EntityManager
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
      
* [20201111 Miercoles](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201111_Miercoles.md) :+1:

   * Consultas JPA
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
   * Consultas Parametrizadas
      * Definición
         * Parámetros
            * Con un nombre
            * Con una posición
      * Asignación de valores a parámetros
         * Métodos de `Query`
            * `setParameter(String nombre, Object value)`
            * `setParameter(int pos, Object value)`
   * Consultas de Acción
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
   * Named Queries o Consultas Nominadas
      * Definición
      * Creación
         * Anotación `@NamedQuery`
      * Utilización
         * Método `createNamedQuery()` de `EntityManager`
   * :computer: `16_gestion_candidatos_persistencia_namedquery`
      * 1.- Entidad con `@NamedQuery`
      * 2.- Cambiar el Service para usar `createNamedQuery` en lugar de `createQuery`
      * 3.- Probar la Aplicación
   * Patrón MVC
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
* [20201112 Jueves](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201112_Jueves.md) :+1:
* [20201113 Viernes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201113_Viernes.md)

* [20201114 Lunes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201116_Lunes.md) :+1:
* [20201115 Martes](000_592_DESARROLLADOR_JAVA_EE_FRONT_END_MULTIPLATAFORMA/20201117_Martes.md)
   * Spring
   * Introducción a Spring
* [20201116 Miercoles]()
* [20201117 Jueves]()
* [20201118 Viernes]()

* [20201121 Lunes]()
* [20201122 Martes]()
* [20201123 Miercoles]()
* [20201124 Jueves]()
* [20201125 Viernes]()

* [20201128 Lunes]()
* [20201129 Martes]()
* [20201130 Miercoles]()
* [20201201 Jueves]()
* [20201202 Viernes]()
