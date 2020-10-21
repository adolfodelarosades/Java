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

De esta manera, la cadena de filtros es muy parecida a una pila (y, de hecho, la serie de ejecuciones de métodos van en la pila de Java). Cuando entra una solicitud, va al primer filtro, que se agrega a la pila. Cuando ese filtro continúa la cadena, el siguiente filtro se agrega a la pila. Esto continúa hasta que la solicitud va al Servlet, que es el último elemento agregado a la pila. A medida que se completa la solicitud y regresa el método `service` del Servlet, el Servlet se elimina de la pila y el control vuelve al último filtro. Cuando su método `doFilter` regresa, ese filtro se elimina de la pila y el control regresa al filtro anterior. Esto continúa hasta que el control vuelve al primer filtro. Cuando su método `doFilter` regresa, la pila está vacía y el procesamiento de la solicitud se completa. Debido a esto, un filtro puede tomar acción en una solicitud antes y después de que el servlet de destino la atienda.

### MAPEO A URL PATTERNS Y SERVLET NAMES

Al igual que los servlets, los filtros se pueden asignar a patrones de URL. Esto determina qué filtro o filtros interceptarán una solicitud. Cualquier solicitud que coincida con un patrón de URL al que se asigna un filtro primero va a ese filtro antes de ir a cualquier Servlet coincidente. Usando patrones de URL, puede interceptar no solo solicitudes a sus Servlets, sino también a otros recursos, como imágenes, archivos CSS, archivos JavaScript y más.

A veces, la asignación a una URL en particular es inconveniente. Posiblemente tenga varias URL, incluso docenas, que ya están asignadas a un Servlet y también desea asignar un filtro a esas URL. En lugar de asignar su filtro a una URL o URL, puede asignarlo a uno o más nombres de Servlet. Si una solicitud coincide con un Servlet, el contenedor busca los filtros asignados al nombre de ese Servlet y los aplica a la solicitud. Más adelante en esta sección, aprenderá a asignar filtros a URL y nombres de servlet. Ya sea que asigne sus filtros usando patrones de URL, nombres de servlets o ambos, un filtro puede interceptar múltiples patrones de URL y nombres de servlet, y varios filtros pueden interceptar el mismo patrón de URL o nombre de servlet.

#### MAPEO PARA DIFERENTES REQUEST DISPATCHER TYPES

En un contenedor de Servlet, puede enviar solicitudes de varias formas. Existen:

* **Normal requests**: Se originan en el cliente e incluyen una URL dirigida a una aplicación web en particular en el contenedor.
* **Forwarded requests**: Se activan cuando su código llama al método `forward` en un `RequestDispatcher` o usa la etiqueta `<jsp:forward>`. Aunque están relacionados con la solicitud original, se manejan internamente como una solicitud separada.
* **Included requests**: De manera similar, usar `<jsp:include>` y llamar a `include` en un `RequestDispatcher` dan como resultado solicitudes de inclusión internas separadas relacionadas con las solicitudes originales. (Recuerde que esto es contrario a `<%@ include %>`.)
* **Error resource requests**: Son solicitudes a páginas de error para manejar errores HTTP como `404 Not Found, 500 Internal Server Error`, etc.
* **Asynchronous requests**: Estas son solicitudes que se envían desde `AsyncContext` durante el manejo de cualquier otra solicitud.
Antes de Servlet 2.4, los filtros se aplicaban solo a los recursos para solicitudes típicas. Servlet 2.4 agregó la capacidad de asignar filtros a solicitudes reenviadas, incluir solicitudes y recursos de error, ampliando enormemente sus capacidades. En Servlet 3.0 (Java EE 6), el nuevo manejo asincrónico de solicitudes presentó un desafío para los escritores de filtros: debido a que el método de servicio del Servlet regresa antes de que se envíe la respuesta de la solicitud, la capacidad de la cadena de filtros se ve comprometida. Para compensar esto, Servlet 3.0 agregó el nuevo tipo de despachador asincrónico para filtros que interceptan solicitudes enviadas desde AsyncContext. Los filtros asincrónicos deben implementarse con precaución porque pueden invocarse varias veces (potencialmente en diferentes subprocesos) para una sola solicitud asincrónica. Esto se cubre con más detalle en la siguiente sección.

Usted indica a qué tipo o tipos de despachador se debe aplicar un filtro cuando declara y asigna un filtro, sobre lo cual aprenderá en el resto de esta sección.

### USO DEL DEPLOYMENT DESCRIPTOR

Antes de que cualquier filtro que escriba pueda interceptar solicitudes, debe declararlas y mapearlas como lo hace con sus Servlets. Al igual que con los servlets, puede lograr esto de varias formas. La forma tradicional es en el descriptor de implementación usando los elementos `<filter>` y `<filter-mapping>` (análogos a los elementos `<servlet>` y `<servlet-mapping>`). Los elementos `<filter>` deben contener al menos un nombre y una clase, pero también pueden incluir una descripción, un nombre para mostrar, un icono y uno o más parámetros de inicio.

```html
    <filter>
        <filter-name>myFilter</filter-name>
        <filter-class>com.wrox.MyFilter</filter-class>
    </filter>
```
    
El fragmento de código anterior muestra una declaración de filtro simple dentro del descriptor de implementación. A diferencia de los servlets, los filtros no se pueden cargar en la primera solicitud. El método `init` de un filtro siempre se llama al inicio de la aplicación: después de que `ServletContextListener`s se inicialice, antes de Servlets initialize y en el orden en que aparece el filtro en el descriptor de implementación.

Una vez que se ha declarado un filtro, puede asignarlo a cualquier número de URL o Servlet names. Las asignaciones de URL de filtro también pueden incluir comodines, al igual que las asignaciones de URL de Servlet.

```html
    <filter-mapping>
        <filter-name>myFilter</filter-name>
        <url-pattern>/foo</url-pattern>
        <url-pattern>/bar/*</url-pattern>
        <servlet-name>myServlet</servlet-name>
        <dispatcher>REQUEST</dispatcher>
        <dispatcher>ASYNC</dispatcher>
    </filter-mapping>
```

En este caso, el filtro responde a cualquier solicitud a las URL relativas a la aplicación `/foo` y `/bar/*`, así como a cualquier solicitud que termine siendo atendida por el Servlet llamado `myServlet`. Los dos elementos `<dispatcher>` significan que puede responder a solicitudes normales y solicitudes enviadas desde `AsyncContext`. Los tipos de `<dispatcher>` válidos son `REQUEST`, `FORWARD`, `INCLUDE`, `ERROR` y `ASYNC`. Un mapeo de filtro puede tener cero o más elementos `<dispatcher>`. Si no se especifica ninguno, se asume un único despachador `REQUEST` predeterminado.

#### UTILIZAR ANOTACIONES

Al igual que con los Servlets, puede declarar y asignar filtros mediante anotaciones. La anotación `@javax.servlet.annotation.WebFilter` contiene atributos que sustituyen a todas las opciones en el descriptor de implementación. El siguiente código tiene el efecto equivalente de la declaración de filtro anterior y la asignación en el descriptor de implementación:

```java
@WebFilter(
        filterName = "myFilter",
        urlPatterns = { "/foo", "/bar/*" },
        servletNames = { "myServlet" },
        dispatcherTypes = { DispatcherType.REQUEST, DispatcherType.ASYNC }
)
public class MyFilter implements Filter
```

La principal desventaja de usar anotaciones para declarar y mapear filtros es la imposibilidad de ordenar esos filtros en la cadena de filtros. Los filtros tienen un orden particular (que aprenderá en la siguiente sección) que es muy importante para su interacción adecuada. Si desea controlar el orden en el que se ejecutan sus filtros sin usar el deployment descriptor, debe usar la configuración programática. Con suerte, el futuro Java EE 8 incluirá la capacidad de solicitar filtros anotados.

#### UTILIZAR LA CONFIGURACIÓN PROGRAMÁTICA

Puede configurar filtros mediante programación con `ServletContext`, al igual que Servlets, oyentes y otros componentes. En lugar de usar el descriptor de implementación o las anotaciones, puede llamar a métodos en `ServletContext` para registrar y asignar filtros. Debido a que esto debe hacerse antes de que el ServletContext termine de iniciarse, generalmente se logra dentro del método `contextInitialized` de un `ServletContextListener`. (También puede agregar filtros dentro del método `onStartup` de un `ServletContainerInitializer`, sobre el cual aprenderá más en la Parte II).

```java
@WebListener
public class Configurator implements ServletContextListener
{
    @Override
    public void contextInitialized(ServletContextEvent event)
    {
        ServletContext context = event.getServletContext();
 
        FilterRegistration.Dynamic registration =
                context.addFilter("myFilter", new MyFilter());
        registration.addMappingForUrlPatterns(
                EnumSet.of(DispatcherType.REQUEST, DispatcherType.ASYNC),
                false, "/foo", "/bar/*"
        );
        registration.addMappingForServletNames(
                EnumSet.of(DispatcherType.REQUEST, DispatcherType.ASYNC),
                false, "myServlet"
        );
    }
}
```

En este ejemplo, el filtro se agrega al `ServletContext` usando el método `addFilter`. Esto devuelve un `javax.servlet.FilterRegistration.Dynamic`, que puede usar para agregar asignaciones de filtros para patrones de URL y nombres de servlet. Los métodos `addMappingForUrlPatterns` y `addMappingForServletNames` aceptan un conjunto de `javax.servlet.DispatcherTypes` como primer argumento. Al igual que con el descriptor de implementación, si el argumento de tipos de despachador es nulo, se asume el despachador de `REQUEST` predeterminado:

```java
   registration.addMappingForUrlPatterns(null, false, "/foo", "bar/*");
```

El segundo parámetro del método indica el orden del filtro en relación con los filtros en el deployment descriptor. Si es falso (como en este caso), la asignación de filtro programática se ordena antes de cualquier asignación de filtro en el descriptor de implementación. Si es verdadero, las asignaciones en el descriptor de implementación son lo primero. Aprenderá más sobre el orden de los filtros en la siguiente sección. El parámetro final es un parámetro vararg para especificar los patrones de URL (para `addMappingForUrlPatterns`) o los nombres de servlet (para `addMappingForServletNames`) para asignar el filtro.

### ORDENAR SUS FILTERS ADECUADAMENTE

Hasta ahora, a lo largo de este capítulo, ha visto varias referencias al orden de los filtros, pero sin duda se está preguntando qué es exactamente. El orden de los filtros determina en qué parte de la cadena de filtros aparece un filtro, que a su vez determina cuándo un filtro procesa una solicitud en relación con otros filtros. En algunos casos, no importa en qué orden procesen las solicitudes sus filtros; en otros casos, sin embargo, puede ser crítico, depende completamente de cómo esté usando los filtros. Por ejemplo, un filtro que configura la información de registro para una solicitud (o ingresa la solicitud en un registro) probablemente debería ir antes que cualquier otro filtro porque otros filtros podrían alterar el destino de la solicitud. Como se mencionó anteriormente, no puede ordenar filtros declarados usando anotaciones, lo que los hace virtualmente inútiles para la mayoría de las aplicaciones empresariales. Utilizará ampliamente el descriptor de implementación o la configuración programática, pero probablemente nunca utilice anotaciones para configurar filtros.

#### URL PATTERN MAPPING VERSUS SERVLET NAME MAPPING

Definir el orden de los filtros es simple: los filtros que coinciden con una solicitud se agregan a la cadena de filtros en el orden en que aparecen sus asignaciones en el descriptor de implementación o en la configuración programática. (Y recuerde, si configura algunos filtros en el descriptor de implementación y otros mediante programación, puede determinar si una asignación programática viene antes que las asignaciones XML utilizando el segundo argumento de los métodos `addMapping*`). El orden de los filtros se muestra en la Figura 9-2, donde diferentes solicitudes coinciden con diferentes filtros pero siempre en el mismo orden. Sin embargo, el orden no es tan simple: las asignaciones de URL tienen preferencia sobre las asignaciones de nombres de Servlet. Si dos filtros coinciden con una solicitud, uno por un patrón de URL y el otro por un nombre de Servlet, el filtro que coincide con el patrón de URL siempre está presente en la cadena antes del filtro que coincide con el nombre de Servlet, como se muestra en la Figura 9-3. incluso si su mapeo aparece después. Para demostrar esto, considere las siguientes asignaciones:

![09-02](images/09-02.png)

![09-03](images/09-03.png)

## Ordenar correctamente sus filtros

## Investigación de usos prácticos de filtros

## Simplificar la autenticación con un filtro

## Resumen
