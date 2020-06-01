# 5. Configuración a través de Java 14m

* 18 Uso de @Configuration 4:48 
* 19 Uso de @Bean 9:49 
* Contenido adicional 2

# 18 Uso de @Configuration 4:48 

[PDF 5-1_Configuracion_a_traves_de_Java.pdf](pdfs/5-1_Configuracion_a_traves_de_Java.pdf)

## Resumen Profesor

No existe.

## Transcripción

hola a todos vamos a continuar con una nueva sección en la que vamos a aprender a configurar nuestra aplicaciones stream a través de Java soportales de la versión 3 la configuración de código Java lo cual nos permite prescindir por completo del uso de XML de hecho podemos utilizar la configuración Java de manera exclusiva o incluso combinarla con otro tipo de configuración cómo sería por ejemplo el uso de anotaciones que sería bastante usual para poder usar la configuración con Java config tenemos que utilizar dos anotaciones concretamente que son configuration a nivel de clase indica que una clase va a tener aspectos de configuración en particular que va a reunir más de un método anotado con a Robin y Robin qué se utiliza nivel de método y qué es equivalente a la declaración de un bien en el XML aquí tenemos un ejemplo de cada comes bastante básico en el que tendríamos una clase anotada con configuración con un método anotado con a Robin qué bueno pues lo que haría en este caso sería crear un nuevo pin el tipo sería el tipo de retorno del método y el objeto creado pues sería este que tenemos aquí dentro vale este objeto que nosotros devolvemos aquí para salir a ser gestionado por nuestra nuestro contenedor de inversión de control cambio en nuestra clase principal en lugar de usar XML application configconfiguration la clase o las clases porque me podremos indicar más de una y de esa manera podremos seguir trabajando y como hemos venido utilizando hasta ahora lo podemos comprobar aquí ejemplo del principio en el que tenemos un vino una clase pollo totalmente sin ningún tipo de anotación y mediante la clase app-config decimos que queremos crear nuevo de tipo saludito invocando el constructor el nombre del vencerá levantamos el contexto haciendo referencia a esta clase de configuración obtenemos el bien y esto funcionará pues tal cual y nos damos cuenta de que no hemos utilizado nuestro fichero XML absolutamente para nada si queremos hacer uso de los estereotipos también que si queremos podemos utilizar el constructor vacío y mediante el método registro y registrando las clases de configuración y refrescando el contexto vale para mí bueno pues resulta algo más cómodo utilizar el constructor dónde se le pasan los argumentos decía que podemos utilizar también el escaneo de componente con la anotación component-scan vale que tendría el comportamiento idéntico al XML también lo podemos hacer programaticamente aunque te digo a mí me gusta algo más a través de la natación lo tendremos por aquí vale en la cual la anotación app-config vale cañería el paquete Java config encontraría pues todas las clases que tenemos anotada y que dejamos en alguno de los capítulos anteriores algunos de los ejemplos anteriores como el de los estereotipos no nuestro servicio repositorio y el resto de componentes que hemos declarado aquí de manera que bueno pues a través de Java config también podemos utilizar la anotación estereotipo que hemos visto que resultaban ciertamente útiles de esta forma podríamos tener un comportamiento muy parecido al del ejemplo 16.2 pero sin la necesidad de manejar Java con esto vamos a terminar de ver bueno pues la configuración a secas y vamos a meternos de lleno en bueno cómo se utiliza la notación a Robin y las posibilidades que tiene


<img src="images/18-01.png">

<img src="images/18-02.png">

<img src="images/18-03.png">

<img src="images/18-04.png">

<img src="images/18-05.png">

<img src="images/18-06.png">

<img src="images/18-07.png">


# 19 Uso de @Bean 9:49 

[PDF 5-2_Uso_de_Bean.pdf](pdfs/5-2_Uso_de_Bean.pdf)

## Resumen Profesor

### ¿Es mejor definir un `@Bean` a través de una interfaz o del tipo concreto de una clase?

Hemos podido ver en el vídeo que el tipo de retorno de un método anotado con `@Bean` puede ser una clase o bien una interfaz (o supertipo).

```java
@Configuration
public class AppConfig {

    @Bean
    public TransferService transferService() {
        return new TransferServiceImpl();
    }
}
```

El uso de una interfaz, en lugar del tipo concreto, limita la visibilidad del bean (en el uso de *autocableado*) al tipo de interfaz especificado (`TransferService`). Si constantemente hace referencia a sus tipos mediante una interfaz de servicio declarada, sus tipos de retorno de los métodos `@Bean` pueden seguir de forma segura esa decisión de diseño. Sin embargo, para los componentes que implementan varias interfaces o para componentes potencialmente referidos por su tipo de implementación, es más seguro declarar el tipo de retorno más específico posible (al menos tan específico como sea requerido por los puntos de inyección referidos a su bean).

### Un ejemplo más completo del uso de `@Bean`

Es posible que con el ejemplo del vídeo no le veamos toda la utilidad a la configuración JavaConfig con `@Bean`. Eso se debe a que estamos trabajando con una serie de clases para las cuales tenemos acceso al código fuente. Es más, las hemos codificado todas, y podemos añadirle los estereotipos. Pero, ¿y si no fuera el caso? ¿Y si quisieramos crear una serie de beans a partir de clases implementadas por terceros, a cuyo código fuente no tenemos acceso y que no están estereotipadas? Ahí, el uso de JavaConfig y `@Bean` cobran más sentido.

A continuación os dejo el código fuente de un ejemplo completo de nuestro curso de Hibernate:

```java
package com.openwebinars.hibernate.hbnpost.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class DatabaseConfig {

    /**
     * Definición del DataSource para la conexión a nuestra base de datos.
     * Las propiedades son establecidas desde el fichero de properties, y
     * asignadas usando el objeto env.
     *
     */
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(env.getProperty("db.driver"));
        dataSource.setUrl(env.getProperty("db.url"));
        dataSource.setUsername(env.getProperty("db.username"));
        dataSource.setPassword(env.getProperty("db.password"));
        return dataSource;
    }

    /**
     *
     * Declaración del EntityManagerFactory de JPA
     */
    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();

        //Le asignamos el dataSource que acabamos de definir.
        entityManagerFactory.setDataSource(dataSource);

        // Le indicamos la ruta donde tiene que buscar las clases anotadas
        entityManagerFactory.setPackagesToScan(env.getProperty("entitymanager.packagesToScan"));

        // Implementación de JPA a usar: Hibernate
        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        entityManagerFactory.setJpaVendorAdapter(vendorAdapter);

        // Propiedades de Hiberante
        Properties additionalProperties = new Properties();
        additionalProperties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
        additionalProperties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
        additionalProperties.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
        entityManagerFactory.setJpaProperties(additionalProperties);

        return entityManagerFactory;
    }

    /**
     * Inicializa y declara el gestor de transacciones
     */
    @Bean
    public JpaTransactionManager transactionManager() {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory.getObject());
        return transactionManager;
    }

    /**
     *  
     * Este bean es un postprocessor que ayuda a relanzar las excepciones específicas
     * de cada plataforma en aquellas clases anotadas con @Repository
     *
     */
    @Bean
    public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
        return new PersistenceExceptionTranslationPostProcessor();
    }

    @Autowired
    private Environment env;

    @Autowired
    private DataSource dataSource;

    @Autowired
    private LocalContainerEntityManagerFactoryBean entityManagerFactory;

}
```

## Transcripción

Vamos a ver cómo podemos usar la notación arroba bien y algunas cositas asociada ella nivel de metro aunque también se puede utilizar en la clase estereotipadas y sus derivadosla anotación arroba bean tiene como atributos los mismos atributos que tenía elementos en XML como es name y me mezo mezo autowiring aunque con este enfoque posible que nos interesa en una combinación de acciones para poder configurar para declarar un bien lo que tenemos que hacer es crear un método anotado con la ropa bien donde el tipo de retorno será el tipo del Bing y el nombre del Bing será el nombre del método aquí tenemos una comparativa de lo que sería hacerlo con XML que lo tenemos abajo y con arrobamiento lo tendríamos arriba con nombre transfer service dónde vamos una clase de tipo transfer service in vale el día de ese tipo y se llamaría transfer service el tipo de retorno no tiene porqué ser la clase concreta sino que puede ser alguna interfaz algún superpippo vale de manera que bueno aquí estamos devolviendo un bien de tipo transfer service si bien la clase una clase más concreta vale a estilo de cómo lo hemos utilizado antes que requerimos un bin de de una interfaz y se nos devolvía la instancia de una clase un método anotado con a Robin puede recibir 0 o más parámetros vale aunque también podremos ver que puede tener médico lo usual es que pueda tener más de uno y esos parámetros que se reciben son dependencias del Bing de manera que el contenedor se encargará de inyectar veámoslo con un ejemplo el método transfer service necesita hacer uso de la clase a con repositorio de una referencia vale pues al indicar aquí un argumento en este método un parámetro lo que estamos declarando realmente es una dependencia de manera que es el contenedor el que se encarga de anotar dentro de este parámetro inyectar inyectar la dependencia correspondiente para que podamos utilizar podemos utilizar también los ámbitos a través de la anotaciones con escoba singleton prototype y las derivadas en application también podemos usar la notación primary vamos a ir viendo algunos de los ejemplos que hemos creado para ilustrarlo este primer ejemplo hemos cambiado radicalmente y bueno hemos pasado de alguna manera de usar el escaneo de componentes para crear crear todos nuestros pins de manera que se creen dentro de esta clase de configuración y no tengamos ninguna anotación de tipo de estereotipo sobre ningún vale ninguno de ellos tienen otro tipo de anotaciones lo bueno intentando sin tampoco acomplejar demasiado vale hacer una una configuración con jabón a estamos usando la notación aquí que bueno igual que la María bueno pues si juntamos esta aplicación podremos ver que funciona exactamente igual que la que la anterior es aunque la configuración has ido con Javi si quisiéramos hacer una configuración en Java que fuese totalmente ortogonal es decir que no tuviese nada que ver con nuestro código no interfiera nada en el pues métodos como este lo tendríamos que declarar en el catálogo de películas actuales cuando tendríamos que declarar aquí como mínimo eso vale de manera que bueno pues fuese un una configuración total vale ya veremos qué bueno salvo algunos el esquema cuando se utilizaba de suele ser de los más usuales ejemplo de nivel de un bin dea partir de entorno valor por defecto un fichero de properties etcétera etcétera de hecho en una notación potente ya que nos permite inyectar no solamente sino clases vaper lista etcétera nosotros la inyección de una propiedad que va en un fichero de properties externo para utilizarlo dentro de un componente cómo podemos comprobarlo hacemos mediante las anotaciones roba valium y bueno la sintaxis qué se utiliza en bastante útil vale similar a expression language mediante la cual bueno pues decimos que busque dentro del entorno una propiedad llamada mensaje vale y aquí lo que indicaría sería el valor de mensaje mediante celular y la propia vamos a ver un ejemplo podemos ver como hemos creado dentro de la carpeta rizos un fichero de properties dónde tenemos una propiedad los ficheros de properties ono ficheros muy sencillos que nos permiten crear un listado de pares clave valor vale dentro de un fichero textual dónde se pone primero la clave igual y el valor o podemos probar incluso no es necesario que pongamos con ellas a las a las cadenas de caracteres bueno si nos venimos a nuestro APP confi utilizar el mensaje en primera instancia o hemos visto no le podemos indicar un valor que sería literal sin lo que nos interesa nosotros usar esa property cómo podemos configurar el uso de las property en este caso tan sencillo lo podríamos hacer me voy a enterar anotación property shows en la cual le podemos indicar dentro que busque el fichero de properties y dónde podemos utilizar algunas palabras reservadas cómo classpath para que haga esa búsqueda dentro del plasma como sabemos esta carpeta está dentro del classpad no lo tenemos dentro de ningún paquete por lo cual están en el Clash para cargar el fichero de properties y nos permitiría utilizar retrovisor de Aitor es un componente properties podemos comprobar como se está cargando desde el fichero de propiedades vale y de esta manera este es el mensaje que estamos el mensaje que estamos lanza con esto terminamos la configuración a través de Java con si ya en el siguiente bloque vamos a ver un ejemplo un poco más extenso de cómo utilizar la mayoría de los conceptos con los que hemos venido trabajando a lo largo

<img src="images/19-01.png">

<img src="images/19-02.png">

<img src="images/19-03.png">

<img src="images/19-04.png">

<img src="images/19-05.png">

<img src="images/19-06.png">

<img src="images/19-07.png">

<img src="images/19-08.png">

<img src="images/19-09.png">

<img src="images/19-10.png">

<img src="images/19-11.png">

<img src="images/19-12.png">

# Contenido adicional 2

* [PDF 5-1_Configuracion_a_traves_de_Java.pdf](pdfs/5-1_Configuracion_a_traves_de_Java.pdf)
* [PDF 5-2_Uso_de_Bean.pdf](pdfs/5-2_Uso_de_Bean.pdf)
