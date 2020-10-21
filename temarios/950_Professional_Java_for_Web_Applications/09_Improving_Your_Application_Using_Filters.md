# Capítulo 9: Mejora de su Aplicación Mediante Filtros

* Comprensión del propósito de los filtros
* Creación, declaración y asignación de filtros
* Ordenar correctamente sus filtros
* Investigación de usos prácticos de filtros
* Simplificar la autenticación con un filtro
* Resumen

#### EN ESTE CAPÍTULO

* El propósito de los filtros
* Cómo crear, declarar y mapear filtros
* Cómo ordenar correctamente sus filtros
* Usar filtros con manejo de solicitudes asincrónicas
* Explorando usos prácticos para filtros
* Usar filtros para simplificar la autenticación

El código de este capítulo se divide en los siguientes ejemplos principales:

* Proyecto de orden de filtro
* Proyecto Filter-Async
* Proyecto de filtro de compresión
* Proyecto Customer-Support-v7

#### DEPENDENCIAS DE NEW MAVEN PARA ESTE CAPÍTULO

No hay nuevas dependencias de Maven para este capítulo. Continúe usando las dependencias de Maven presentadas en todos los capítulos anteriores.

## ENTENDIENDO EL PROPÓSITO DE LOS FILTROS

Los filtros son componentes de la aplicación que pueden interceptar solicitudes de recursos, respuestas de recursos o ambos, y actuar sobre esas solicitudes o respuestas de alguna manera. Los filtros pueden inspeccionar y modificar solicitudes y respuestas, e incluso pueden rechazar, redirigir o reenviar solicitudes.

Una adición relativamente nueva a la especificación de Servlet, los filtros se agregaron en Servlet 2.3, se mejoraron en Servlet 2.4 y no han cambiado mucho desde entonces. La interfaz javax.servlet.Filter es muy simple e involucra HttpServletRequest y HttpServletResponse con las que ya está familiarizado. Al igual que los servlets, los filtros se pueden declarar en el descriptor de implementación, mediante programación o con anotaciones, y pueden tener parámetros de inicio y acceder al ServletContext. El número de usos de los filtros está realmente limitado solo por su imaginación; en esta sección, explora algunas de las aplicaciones más comunes.

### LOGGING FILTERS - FILTROS DE REGISTRO

Los filtros pueden ser especialmente útiles para registrar la actividad en su aplicación. Aprenderá sobre los conceptos y las herramientas involucradas con el registro en el Capítulo 11, pero un escenario que los desarrolladores de aplicaciones a veces enfrentan es la necesidad de registrar cada solicitud en la aplicación y cuál es el resultado de cada solicitud (código de estado, longitud y posiblemente otra información). Por lo general, el contenedor web proporciona funciones para el registro de solicitudes, pero si necesita información de propiedad que se muestre en su registro de solicitudes, puede utilizar un filtro para registrar las solicitudes. También puede usar filtros para agregar información de seguimiento que se usará para todas las operaciones de registro para la solicitud. Esto se llama fish tagging - etiquetado de peces y aprenderá más sobre él en el Capítulo 11.

### AUTHENTICATION FILTERS - FILTROS DE AUTENTICACIÓN

Cuando necesita asegurarse de que solo las personas autorizadas accedan a su aplicación, esto generalmente implica realizar una verificación en cada solicitud para asegurarse de que el usuario haya "iniciado sesión". El significado de ese término puede variar de una aplicación a otra, pero el tedio de realizar esta verificación en cada Servlet es universal. Los filtros pueden facilitar el trabajo al centralizar las verificaciones de autenticación y autorización en una ubicación que intercepta todas las solicitudes seguras.

Al final de este capítulo, agrega un filtro al proyecto de soporte al cliente en curso que hace precisamente esto y elimina el código duplicado en toda la aplicación. En la Parte IV, explora Spring Security y lo usa para agregar autenticación y autorización a sus aplicaciones. Los filtros son la base de Spring Security y constituyen una gran parte de su funcionalidad.

### COMPRESSION AND ENCRYPTION FILTERS - FILTROS DE COMPRESIÓN Y CIFRADO

Aunque no siempre es así (y es cada vez menos común cada día), todavía hay momentos en los que el ancho de banda de Internet es extremadamente limitado y los recursos de la CPU son más abundantes. En estos casos, a menudo es deseable gastar los ciclos de CPU necesarios comprimiendo datos antes de transmitirlos por cable. Puede usar un filtro para lograr esto: cuando llega la solicitud, permanece inalterada, pero cuando la respuesta vuelve al usuario, el filtro la comprime. Esto, por supuesto, requiere que el usuario pueda descomprimir la respuesta. En la sección "Investigación de usos prácticos de los filtros", verá lo que implica escribir un filtro de compresión de respuesta.

Los filtros también pueden ser útiles para manejar el descifrado de solicitudes y el cifrado de respuestas. Normalmente, confía en HTTPS para esto; algo que el contenedor web o el servidor web pueden manejar de forma nativa. Sin embargo, si los consumidores de sus recursos no son un navegador u otro cliente web, sino alguna otra aplicación, podrían emplear un sistema de cifrado patentado que solo entiendan esas dos aplicaciones. En este caso, un filtro es un candidato principal para descifrar las solicitudes a medida que entran y encriptar las respuestas a medida que salen. Comprenda que este es un escenario inusual y que realmente debe confiar en herramientas estándar de la industria, como HTTPS, para proteger las comunicaciones de su aplicación.

### ERROR HANDLING FILTERS - MANEJO DE ERRORES FILTROS

Seamos realistas: por mucho que los desarrolladores de software intenten manejar los errores que surgen durante la ejecución de su software, a veces los errores se escabullen. Cuando el software es un sistema operativo, el síntoma desagradable suele ser una interrupción del sistema, a la que en el mundo de la tecnología se le llama cariñosamente "la pantalla azul de la muerte". Con las aplicaciones de escritorio, el usuario puede recibir un aviso de que "la aplicación se ha cerrado inesperadamente".

Con las aplicaciones web, el resultado suele ser un código de respuesta HTTP de 500, a menudo acompañado de una página HTML simple con las palabras "Error interno del servidor" y alguna información de diagnóstico. Para las aplicaciones que se ejecutan localmente (como en una intranet), esta información de diagnóstico generalmente no es dañina y, de hecho, podría ser útil para que el desarrollador averigüe qué salió mal. Pero para las aplicaciones web que se ejecutan de forma remota, esta información de diagnóstico puede revelar información confidencial del sistema que los piratas informáticos pueden utilizar para comprometer un sistema.

Por estas razones, debe mostrar una página de error genérica más amigable para los usuarios (a menudo con el estilo del resto de su aplicación web) y registrar el error o notificar a un administrador del sistema según sea necesario. Un filtro es la herramienta perfecta para esta tarea. Puede envolver el manejo de solicitudes en un bloque try-catch, capturando y registrando así cualquier error. Esto da como resultado que la solicitud se reenvíe a una página de error genérico que no contiene ningún diagnóstico o información confidencial.

## CREACIÓN, DECLARACIÓN Y MAPEO DE FILTROS

Crear un filtro es tan simple como implementar la interfaz de `Filter`. Su método `init` se llama cuando se inicializa el filtro y proporciona acceso a la configuración del filtro, sus parámetros de inicio y el `ServletContext`, al igual que el método `init` en un Servlet. De manera similar, se llama al método de destrucción cuando se cierra la aplicación web. El método `doFilter` se llama cuando entra una solicitud que se asigna al filtro. Proporciona acceso a los objetos `ServletRequest`, `ServletResponse` y `FilterChain`. Aunque puede usar filtros para filtrar más que solo solicitudes y respuestas HTTP, en realidad, para sus usos, la solicitud siempre es una `HttpServletRequest` y la respuesta siempre es una `HttpServletResponse`. De hecho, por el momento, la especificación de la API de Servlet no admite ningún protocolo además de HTTP. Dentro de `doFilter` puede rechazar la solicitud o continuarla llamando al método `doFilter` del objeto `FilterChain`; puede modificar la solicitud y la respuesta; y puede envolver los objetos de solicitud y respuesta.

### ENTENDIENDO FILTER CHAIN (CADENA DE FILTRO)

Aunque solo un servlet puede manejar una solicitud, cualquier número de filtros puede interceptar una solicitud. La Figura 9-1 demuestra cómo la cadena de filtros acepta una solicitud entrante y la pasa de un filtro a otro hasta que se procesan todos los filtros coincidentes, y finalmente la pasa al Servlet. Llamar a `FilterChain.doFilter()` desencadena la continuación de la cadena de filtros. Si el filtro actual es el último filtro de la cadena, llamar a `FilterChain.doFilter()` devuelve el control al contenedor Servlet, que pasa la solicitud al Servlet. Si el filtro actual no llama a `FilterChain.doFilter()`, la cadena se interrumpe y el Servlet y los filtros restantes nunca manejan la solicitud.

![09-01](images/09-01.png)

## Ordenar correctamente sus filtros

## Investigación de usos prácticos de filtros

## Simplificar la autenticación con un filtro

## Resumen
