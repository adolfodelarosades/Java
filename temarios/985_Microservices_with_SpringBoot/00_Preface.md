# Prefacio


* Who this book is for
* What this book covers
* To get the most out of this book
* Get in touch


Este libro trata sobre la creación de microservicios listos para la producción con Spring Boot y Spring Cloud. Hace ocho años, cuando comencé a explorar los microservicios, estaba buscando un libro como este.

Este libro se desarrolló después de que aprendí y dominé el software de código abierto utilizado para desarrollar, probar, implementar y administrar entornos de microservicios cooperativos.

Este libro cubre principalmente Spring Boot, Spring Cloud, Docker, Kubernetes, Istio, la pila EFK, Prometheus y Grafana. Cada una de estas herramientas de código abierto funciona muy bien por sí sola, pero puede ser un desafío entender cómo usarlas juntas de manera ventajosa. En algunas áreas, se complementan entre sí, pero en otras áreas se superponen y no es obvio cuál elegir para una situación particular.

Este es un libro práctico que describe paso a paso cómo utilizar juntas estas herramientas de código abierto. Este es el libro que estaba buscando hace ocho años cuando comencé a aprender sobre microservicios, pero con versiones actualizadas de las herramientas de código abierto que cubre.

## Para quien es este libro

Este libro es para desarrolladores y arquitectos de Java y Spring que desean aprender a crear entornos de microservicios desde cero e implementarlos en las instalaciones o en la nube, utilizando Kubernetes como orquestador de contenedores e Istio como malla de servicios. No se requiere estar familiarizado con la arquitectura de microservicios para comenzar con este libro.

## Lo que cubre este libro

El Capítulo 1 , Introducción a los microservicios , lo ayudará a comprender la premisa básica del libro, los microservicios, junto con los conceptos esenciales y los patrones de diseño que los acompañan.

El Capítulo 2 , Introducción a Spring Boot , le presentará Spring Boot y los otros proyectos de código abierto que se utilizarán en la primera parte del libro: Spring WebFlux para desarrollar API RESTful, springdoc-openapi para producir documentación basada en OpenAPI para las API, Spring Data para almacenar datos en bases de datos SQL y NoSQL, Spring Cloud Stream para microservicios basados ​​en mensajes y Docker para ejecutar los microservicios como contenedores.

El Capítulo 3 , Creación de un conjunto de microservicios cooperativos , le enseñará cómo crear un conjunto de microservicios cooperativos desde cero. Utilizará Spring Initializr para crear proyectos de esqueleto basados ​​en Spring Framework 5.3 y Spring Boot 2.5. La idea es crear tres servicios principales (que manejarán sus propios recursos) y un servicio compuesto que use los tres servicios principales para agregar un resultado compuesto. Hacia el final del capítulo, aprenderá cómo agregar API RESTful muy básicas basadas en Spring WebFlux. En los próximos capítulos, se agregarán más y más funcionalidades a estos microservicios.

El Capítulo 4 , Implementación de nuestros microservicios mediante Docker , le enseñará cómo implementar microservicios mediante Docker. Aprenderá a agregar Dockerfiles y archivos docker-compose para iniciar todo el panorama de microservicios con un solo comando. Luego, aprenderá a usar múltiples perfiles de Spring para manejar configuraciones con y sin Docker.

El Capítulo 5 , Agregar una descripción de API mediante OpenAPI , lo pondrá al día con la documentación de las API expuestas por un microservicio mediante OpenAPI. Utilizará la springdoc-openapiherramienta para anotar los servicios para crear documentación API basada en OpenAPI sobre la marcha. Lo más destacado será cómo se pueden probar las API en un navegador web utilizando la interfaz de usuario de Swagger.

El Capítulo 6 , Adición de persistencia , le mostrará cómo agregar persistencia a los datos de los microservicios. Utilizará Spring Data para configurar y acceder a datos en una base de datos de documentos MongoDB para dos de los microservicios principales y accederá a datos en una base de datos relacional MySQL para el microservicio restante. Los contenedores de prueba se utilizarán para iniciar bases de datos cuando se ejecuten pruebas de integración.

El Capítulo 7 , Desarrollo de microservicios reactivos , le enseñará por qué y cuándo es importante un enfoque reactivo y cómo desarrollar servicios reactivos de extremo a extremo. Aprenderá a desarrollar y probar API RESTful sincrónicas sin bloqueo y servicios controlados por eventos asincrónicos.

También aprenderá cómo usar el controlador reactivo sin bloqueo para MongoDB y cómo usar el código de bloqueo convencional para MySQL.

El Capítulo 8 , Introducción a Spring Cloud , le presentará Spring Cloud y los componentes de Spring Cloud que se utilizarán en este libro.

El Capítulo 9 , Agregar detección de servicios mediante Netflix Eureka , le mostrará cómo usar Netflix Eureka en Spring Cloud para agregar capacidades de detección de servicios. Esto se logrará agregando un servidor de detección de servicios basado en Eureka de Netflix al entorno del sistema. Luego configurará los microservicios para usar Spring Cloud LoadBalancer para encontrar otros microservicios. Comprenderá cómo los microservicios se registran automáticamente y cómo el tráfico a través de Spring Cloud LoadBalancer se equilibra automáticamente en nuevas instancias cuando están disponibles.

El Capítulo 10 , Usar Spring Cloud Gateway para ocultar microservicios detrás de un servidor perimetral, lo guiará a través de cómo ocultar los microservicios detrás de un servidor perimetral usando Spring Cloud Gateway y solo exponer API seleccionadas a consumidores externos. También aprenderá a ocultar la complejidad interna de los microservicios a los consumidores externos. Esto se logrará agregando un servidor perimetral basado en Spring Cloud Gateway al entorno del sistema y configurándolo para exponer solo las API públicas.

El Capítulo 11 , Protección del acceso a las API , explicará cómo proteger las API expuestas mediante OAuth 2.0 y OpenID Connect. Aprenderá cómo agregar un servidor de autorización OAuth 2.0 basado en Spring Authorization Server al entorno del sistema y cómo configurar el servidor perimetral y el servicio compuesto para requerir tokens de acceso válidos emitidos por ese servidor de autorización. Aprenderá cómo exponer el servidor de autorización a través del servidor perimetral y proteger su comunicación con consumidores externos mediante HTTPS. Finalmente, aprenderá cómo reemplazar el servidor de autorización interno de OAuth 2.0 con un proveedor externo de OpenID Connect de Auth0.

El Capítulo 12 , Configuración centralizada , tratará sobre cómo recopilar los archivos de configuración de todos los microservicios en un repositorio central y usar el servidor de configuración para distribuir la configuración a los microservicios en tiempo de ejecución. También aprenderá cómo agregar un Spring Cloud Config Server al entorno del sistema y configurar todos los microservicios para usar Spring Config Server para obtener su configuración.

El Capítulo 13 , Mejora de la resiliencia mediante Resilience4j , explicará cómo utilizar las capacidades de Resilience4j para evitar, por ejemplo, el antipatrón de "cadena de fallas". Aprenderá cómo agregar un mecanismo de reintento y un disyuntor al servicio compuesto, cómo configurar el disyuntor para que falle rápidamente cuando el circuito está abierto y cómo utilizar un método alternativo para crear una respuesta de mejor esfuerzo.

El Capítulo 14 , Comprender el seguimiento distribuido , le mostrará cómo usar Zipkin para recopilar y visualizar información de seguimiento. También utilizará Spring Cloud Sleuth para agregar ID de seguimiento a las solicitudes para que se puedan visualizar las cadenas de solicitudes entre los microservicios que cooperan.

El Capítulo 15 , Introducción a Kubernetes , explicará los conceptos básicos de Kubernetes y cómo realizar una implementación de muestra. También aprenderá cómo configurar Kubernetes localmente para fines de desarrollo y prueba utilizando Minikube.

El Capítulo 16 , Implementación de nuestros microservicios en Kubernetes , mostrará cómo implementar microservicios en Kubernetes. También aprenderá a usar Helm para empaquetar y configurar microservicios para su implementación en Kubernetes. Helm se utilizará para implementar los microservicios para diferentes entornos de tiempo de ejecución, como entornos de prueba y producción. Finalmente, aprenderá cómo reemplazar Netflix Eureka con el soporte integrado en Kubernetes para el descubrimiento de servicios, basado en los objetos del servicio Kubernetes y el componente de tiempo de ejecución kube-proxy.

El Capítulo 17 , Implementación de funciones de Kubernetes para simplificar el panorama del sistema , explicará cómo usar las funciones de Kubernetes como una alternativa a los servicios de Spring Cloud presentados en los capítulos anteriores. Aprenderá por qué y cómo reemplazar Spring Cloud Config Server con Kubernetes Secrets y ConfigMaps. También aprenderá por qué y cómo reemplazar Spring Cloud Gateway con objetos Ingress de Kubernetes y cómo agregar cert-manager para aprovisionar y rotar automáticamente certificados para puntos finales HTTPS externos.

El Capítulo 18 , Uso de una malla de servicios para mejorar la observación y la administración , presentará el concepto de una malla de servicios y explicará cómo usar Istio para implementar una malla de servicios en tiempo de ejecución usando Kubernetes. Aprenderá a utilizar una red de servicios para mejorar aún más la resiliencia, la seguridad, la gestión del tráfico y la observabilidad del panorama de microservicios.

El Capítulo 19 , Registro centralizado con la pila EFK , explicará cómo usar Elasticsearch, Fluentd y Kibana (la pila EFK) para recopilar, almacenar y visualizar flujos de registro de microservicios. Aprenderá cómo implementar la pila EFK en Minikube y cómo usarla para analizar los registros recopilados y encontrar resultados de registro de todos los microservicios involucrados en el procesamiento de una solicitud que abarca varios microservicios. También aprenderá cómo realizar un análisis de causa raíz utilizando la pila EFK.

El Capítulo 20 , Monitoreo de microservicios , le mostrará cómo monitorear los microservicios implementados en Kubernetes usando Prometheus y Grafana. Aprenderá a usar los tableros existentes en Grafana para monitorear diferentes tipos de métricas y también aprenderá a crear sus propios tableros. Finalmente, aprenderá a crear alertas en Grafana que se utilizarán para enviar correos electrónicos con alertas cuando se superen los umbrales configurados para las métricas seleccionadas.

El Capítulo 21 , Instrucciones de instalación para macOS , le mostrará cómo instalar las herramientas utilizadas en este libro en una Mac.

El Capítulo 22 , Instrucciones de instalación para Microsoft Windows con WSL 2 y Ubuntu , le mostrará cómo instalar las herramientas utilizadas en este libro en una PC con Windows usando el Subsistema de Windows para Linux 2.

El Capítulo 23 , Microservicios de Java compilados nativos , le mostrará cómo usar la versión beta recientemente anunciada de Spring Native y el generador GraalVM Native Image subyacente para crear microservicios basados ​​en Spring que se compilan en código nativo. En comparación con el uso de la máquina virtual Java normal, esto dará como resultado microservicios que pueden iniciarse casi al instante.

Al final de cada capítulo, encontrará algunas preguntas sencillas que lo ayudarán a resumir parte del contenido cubierto en el capítulo. Evaluaciones es un archivo que se puede encontrar en el repositorio de GitHub que contiene las respuestas a estas preguntas.

### Para aprovechar al máximo este libro

Se recomienda una comprensión básica de Java y Spring.

Para poder ejecutar todo el contenido del libro, debe tener una Mac o PC con al menos 16 GB de memoria, aunque se recomienda tener al menos 24 GB, ya que el panorama de los microservicios se vuelve más complejo y demanda recursos. hacia el final del libro.

Para obtener una lista completa de los requisitos de software e instrucciones detalladas para configurar su entorno y poder seguir este libro, diríjase al Capítulo 21 (para macOS) y al Capítulo 22 (para Windows).

### Descargue los archivos de código de ejemplo

El paquete de código para el libro está alojado en GitHub en https://github.com/PacktPublishing/Microservices-with-Spring-Boot-and-Spring-Cloud-2E . También tenemos otros paquetes de códigos de nuestro rico catálogo de libros y videos disponibles en https://github.com/PacktPublishing/ . ¡Échales un vistazo!

#### Descarga las imágenes a color

También proporcionamos un archivo PDF que tiene imágenes en color de las capturas de pantalla/diagramas utilizados en este libro. Puede descargarlo aquí: https://static.packt-cdn.com/downloads/9781801072977_ColorImages.pdf .

#### Convenciones utilizadas

Hay una serie de convenciones de texto utilizadas a lo largo de este libro.

CodeInText: Indica palabras de código en texto, nombres de tablas de bases de datos, nombres de carpetas, nombres de archivos, extensiones de archivos, nombres de rutas, direcciones URL ficticias, entrada de usuario y identificadores de Twitter. Por ejemplo; "La clase de prueba PersistenceTests, declara un método, setupDb()anotado con @BeforeEach, que se ejecuta antes de cada método de prueba".

Un bloque de código se establece de la siguiente manera:

```java
public interface ReviewRepository extends CrudRepository<ReviewEntity, Integer> {
    @Transactional(readOnly = true)
    List<ReviewEntity> findByProductId(int productId);
}
```

Cuando deseamos llamar su atención sobre una parte particular de un bloque de código, las líneas o elementos relevantes se resaltan:

```java
public interface ReviewRepository extends CrudRepository<ReviewEntity, Integer> {
    @Transactional(readOnly = true)
    List<ReviewEntity> findByProductId(int productId);
}
```

Cualquier entrada o salida de la línea de comandos se escribe de la siguiente manera:

kubectl config get-contexts
Negrita : Indica un término nuevo, una palabra importante, o palabras que ves en pantalla, por ejemplo, en menús o cuadros de diálogo, también aparecen en el texto así. Por ejemplo: "Los dos conceptos centrales del modelo de programación en Spring Data son entidades y repositorios ".

Las advertencias o notas importantes aparecen así.

Los consejos y trucos aparecen así.

### Ponerse en contacto
    
Los comentarios de nuestros lectores es siempre bienvenido.

Comentarios generales : envíe un correo electrónico feedback@packtpub.comy mencione el título del libro en el asunto de su mensaje. Si tiene preguntas sobre cualquier aspecto de este libro, envíenos un correo electrónico a questions@packtpub.com.

**Errata**: Aunque hemos tomado todas las precauciones para garantizar la precisión de nuestro contenido, los errores ocurren. Si ha encontrado un error en este libro, le agradeceríamos que nos lo informara. Visite http://www.packtpub.com/submit-errata , seleccione su libro, haga clic en el enlace Formulario de envío de errata e ingrese los detalles.

**Piratería**: si encuentra copias ilegales de nuestros trabajos en cualquier forma en Internet, le agradeceríamos que nos proporcionara la dirección de la ubicación o el nombre del sitio web. Póngase en contacto con nosotros en copyright@packtpub.comcon un enlace al material.

Si está interesado en convertirse en autor : si hay un tema en el que tiene experiencia y está interesado en escribir o contribuir a un libro, visite http://authors.packtpub.com .

### Comparte tus pensamientos

Una vez que haya leído Microservicios con Spring Boot y Spring Cloud, segunda edición , ¡nos encantaría escuchar sus opiniones! Haga clic aquí para ir directamente a la página de reseñas de Amazon de este libro y compartir sus comentarios.

Su revisión es importante para nosotros y la comunidad tecnológica y nos ayudará a asegurarnos de que ofrecemos contenido de excelente calidad.
