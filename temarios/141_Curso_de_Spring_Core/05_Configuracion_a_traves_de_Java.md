# 5. Configuración a través de Java 14m

* Uso de @Configuration 4:48 
* Uso de @Bean 9:49 
* Contenido adicional 2

# 18 Uso de @Configuration 4:48 

[PDF 5-1_Configuracion_a_traves_de_Java.pdf](pdfs/5-1_Configuracion_a_traves_de_Java.pdf)

## Resumen Profesor

No existe.

## Transcripción

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


## Transcripción

# Contenido adicional 2

* [PDF 5-1_Configuracion_a_traves_de_Java.pdf](pdfs/5-1_Configuracion_a_traves_de_Java.pdf)
* [PDF 5-2_Uso_de_Bean.pdf](pdfs/5-2_Uso_de_Bean.pdf)
