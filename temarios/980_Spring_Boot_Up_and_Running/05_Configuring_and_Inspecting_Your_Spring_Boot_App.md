# 5. Configuración e Inspección de su Aplicación Spring Boot

* Configuración de la Aplicación
   * `@Value`
   * `@ConfigurationProperties`
   * Posible opción de "terceros"
* Informe de Configuración Automática(Autoconfiguration report)
* Actuador
   * Hacer que Actuador se abra
   * Ser más consciente del Environmentally Aware(medio ambiente) usando por Actuator
   * Turning Up the Volume on Logging with Actuator (Subir el volumen al iniciar sesión con el Actuador)
* Resumen

Hay muchas cosas que pueden salir mal con cualquier aplicación, y algunas de estas muchas cosas incluso pueden tener soluciones simples. Sin embargo, con la rara excepción de una buena suposición ocasional, uno debe determinar la causa raíz de un problema antes de que sea posible resolverlo realmente.

La depuración de aplicaciones Java o Kotlin, o cualquier otra aplicación, es una habilidad fundamental que todo desarrollador debe aprender muy temprano en su carrera y perfeccionar y expandir. No creo que ese sea el caso universalmente, así que si aún no se ha familiarizado con las capacidades de depuración de su lenguaje y las herramientas de su elección, explore las opciones a su disposición lo antes posible. Realmente es importante en todo lo que desarrolle y puede ahorrarle cantidades excesivas de tiempo.

Dicho esto, depurar el código es solo un nivel para establecer, identificar y aislar los comportamientos manifestados dentro de su aplicación. A medida que las aplicaciones se vuelven más dinámicas y distribuidas, los desarrolladores a menudo necesitan:

* Configurar y reconfigurar aplicaciones de forma dinámica
* Determinar/confirmar la configuración actual y sus orígenes
* Inspeccionar y monitorear el entorno de la aplicación y los indicadores de salud
* Ajuste temporalmente los niveles de registro de aplicaciones en vivo para identificar las causas raíz

En este capítulo, demostraré cómo usar las capacidades de configuración integradas de Spring Boot, su Informe de configuración automática y Spring Boot Actuator para crear, identificar y modificar la configuración del entorno de la aplicación de manera flexible y dinámica.

## Configuración de la Aplicación

Ninguna aplicación es una isla.

La mayoría de las veces, cuando digo eso, es para señalar la obviedad de que, en casi todos los casos, una aplicación no proporciona toda su utilidad sin interacción con otras aplicaciones/servicios. Pero hay otro significado que es igualmente cierto: ninguna aplicación puede ser tan útil sin acceso a su entorno, de una forma u otra. Una aplicación estática e inconfigurable es rígida, inflexible y cojea.

Las aplicaciones Spring Boot proporcionan una variedad de mecanismos poderosos para que los desarrolladores configuren y reconfiguren dinámicamente sus aplicaciones, incluso mientras la aplicación se está ejecutando. Estos mecanismos aprovechan el entorno Spring para administrar las propiedades de configuración de todas las fuentes, incluidas las siguientes:

* Propiedades de configuración global de Spring Boot Developer Tools (devtools) en el directorio `$HOME/.config/spring-boot` cuando devtools está activo

* `@TestPropertySource` anotaciones en pruebas

* Atributo `properties` en las pruebas; disponible en `@SpringBootTest` y las diversas anotaciones de prueba para probar un segmento de aplicación

* Argumentos de la línea de comandos

* Propiedades de `SPRING_APPLICATION_JSON` (JSON en línea incrustado en una variable de entorno o propiedad del sistema)

* Parámetros de inicio de `ServletConfig`

* Parámetros de inicio de `ServletContext`

* Atributos JNDI de ` java:comp/env`

* Propiedades del sistema Java (`System.getProperties()`)

* Variables de entorno del sistema operativo

* Un `RandomValuePropertySource` que tiene propiedades solo al azar. `*`

* Propiedades de la aplicación específicas del perfil fuera del jar empaquetado (`application-{profile}.properties` y variantes de YAML)

* Propiedades de la aplicación específicas del perfil empaquetadas dentro del jar (`application-{profile}.properties` y variantes de YAML)

* Propiedades de la aplicación fuera del jar empaquetado (`application.properties` y variantes de YAML)

* Propiedades de la aplicación empaquetadas dentro del jar (`application.properties` y variantes de YAML)

* Anotaciones `@PropertySource` en clases `@Configuration`; tenga en cuenta que dichas fuentes de propiedades no se agregan al entorno hasta que se actualice el contexto de la aplicación, lo cual es demasiado tarde para configurar ciertas propiedades leídas antes de que comience la actualización, como `logging.*` y `spring.main.*`

* Propiedades predeterminadas especificadas al establecer `SpringApplication.setDefaultProperties`

**NOTA**

Las fuentes de propiedades anteriores se enumeran en orden decreciente de precedencia: las propiedades de fuentes superiores en la lista reemplazan propiedades idénticas de fuentes inferiores. nota al pie: [Orden de precedencia para Spring Boot PropertySources](https://docs.spring.io/spring-boot/docs/current/reference/html/spring-boot-features.html#boot-features-external-config).

Todos estos pueden ser extremadamente útiles, pero elegiré algunos en particular para los escenarios de código de este capítulo:

* Argumentos de la línea de comandos
* Variables de entorno del sistema operativo
* Propiedades de la aplicación empaquetadas dentro del jar (`application.properties` y variantes YAML)

Comencemos con las propiedades definidas en el archivo `application.properties` de la aplicación y avancemos en la cadena alimentaria.

### `@Value`

La anotación `@Value` es quizás el enfoque más sencillo para incorporar los ajustes de configuración en su código. Construido alrededor de la coincidencia de patrones y el Spring Expression Language (SpEL), es simple y poderoso.

Comenzaré definiendo una propiedad única en el archivo application.properties de nuestra aplicación, como se muestra en la Figura 5-1.

![05-01](images/05-01.png)

Para mostrar cómo utilizar esta propiedad, creo un `@RestController` adicional dentro de la aplicación para manejar tareas relacionadas con los usuarios de la aplicación de saludo, como se muestra en la Figura 5-2.

![05-02](images/05-02.png)

Tenga en cuenta que la anotación `@Value` se aplica a la variable miembro de nombre y acepta un único parámetro de tipo `String` llamado `value`. Defino el valor usando SpEL, colocando el nombre de la variable (como la expresión a evaluar) entre los delimitadores `${` y `}`. Otra cosa a tener en cuenta: SpEL permite un valor predeterminado después de los dos puntos, en este ejemplo, "Mirage", para los casos en los que la variable no está definida en el entorno de la aplicación.

Al ejecutar la aplicación y consultar el endpoint `/greeting`, la aplicación responde con "Dakota" como se esperaba, como se muestra en la Figura 5-3.

![05-03](images/05-03.png)

### `@ConfigurationProperties`

### Posible opción de "terceros"

## Informe de Configuración Automática(Autoconfiguration report)

## Actuador

### Hacer que Actuador se abra

### Ser más consciente del Environmentally Aware(medio ambiente) usando por Actuator

### Turning Up the Volume on Logging with Actuator (Subir el volumen al iniciar sesión con el Actuador)

## Resumen
