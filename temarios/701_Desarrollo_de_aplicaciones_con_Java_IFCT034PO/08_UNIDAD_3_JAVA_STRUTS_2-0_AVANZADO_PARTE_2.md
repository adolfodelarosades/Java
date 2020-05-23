# UNIDAD 3 JAVA STRUTS 2.0 AVANZADO PARTE 2

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido

34. Añadir lógica de validación
35. Interceptores y conversión de tipos
36. Crear el formulario
37. Crear conversor personalizado
38. Interceptores ModelDriven y Prepare
   * 38.1 Interceptor ModelDriven
   * 38.2 Interceptor Prepare
39. Implementación de ModelDriven
40. Implementación de Prepare – Acción
41. Implementación de Prepare – Struts.xml
42. Autorización y autenticación
43. Roles y usuarios
44. Restringir acceso
45. Definir autenticación
46. Autenticación por formularios
47. Mensajes e internacionalización
48. Crear el formulario
49. Añadir mensajes e internacionalización
50. Capa de persistencia
51. Preparar enlace a datos
52. Implementación de la capa de persistencia
   * 52.1 Introducción a Hibernate
53. Implementación del patrón DAO
54. Subida/descarga de ficheros
55. Subida de ficheros
56. Subida múltiple de ficheros
57. Descarga de ficheros
58. Medidores de progreso
59. Añadir medidor a un proceso
60. AJAX
61. Formulario con AJAX
62. Formulario con AJAX 2
63. Freemarker, Velocity y Profiling
   * 63.1 Velocity
   * 63.2 FreeMarker
   * 63.3 Profiling

### Mapa Conceptual

<img src="images/c3/3-2-mapa-1.png">

### 34. Añadir lógica de validación

Aparte de la anotación @RequiredStringValidator empleada como ejemplo en el apartado anterior, el paquete opensymphony.xwork2.validator.annotations tiene incluido otro tipo de  anotaciones con las que se pueden ejecutar las validaciones en el momento de la captura de datos mediante un formulario. Entre las que destacamos las siguientes: 

**@IntRangeFieldValidator**

Verifica que el valor incluido en un campo está inserto de un rango numérico entero determinado. Por medio de los atributos min y max, se especifican dichos rangos.

**@DoubleRangeFieldValidator**

Verifica que el valor incluido en un campo está inserto en un rango numérico decimal determinado. Por medio de los atributos min y max, también se especifican dichos rangos.

**@StringLengthFieldValidator**

Verifica que la longitud del texto, incluido en el campo, está inserto en un rango determinado. Son los atributos minLength y maxLength quienes especifican la longitud mínima y máxima de la cadena.

**@EmailValidator**

Verifica que el valor del campo concuerda con un formato de dirección de correo electrónico válido.

### 35. Interceptores y conversión de tipos

Los interceptores forman una cadena de objetos que ejecutan una lista de actividades de procesamiento antes que la acción sea ejecutada. Un ejemplo puede ser la validación de algunos datos de clientes, completado con objetos de los campos de un formulario, etc., además, tienen un procesamiento posterior de los resultados en el momento que éstos son producidos por las clases de acción.   

La manera como funcionan los interceptores es muy parecida a los filtros Servlets.  

Para poder implementar la interfaz de un interceptor, se emplean los mismos procedimientos que se utilizarían para un filtro, cabe destacar que se pueden implementar los métodos destroy(),  init(), así como también se incluye uno nuevo, intercept (). 

**Parte del proceso 1**

El proceso comenzaría invocando al método init() previo a la creación del interceptor que inicializará los recursos.

**Parte del proceso 2**

A continuación se hace la llamada al método intercept(), en cualquier momento que alguna acción es enviada al interceptor y se efectúa la ejecución de todas las acciones.

**Parte del proceso 3**

Una vez hecho esto, se invoca al método destroy() con posterioridad a la ejecución del mencionado interceptor y, de esta manera, dejar libres los recursos solamente cuando la aplicación esté descargada.

**ActionInvocation**  

ActionInvocation encapsula todos los detalles de procesamiento asociados con la ejecución de una acción particular. Cuando el marco recibe una solicitud, primero debe decidir a qué acción se asigna la URL. Se agrega una instancia de esta acción a una nueva instancia creada de ActionInvocation. Luego, el marco consulta el declarativo de la arquitectura, creada por las anotaciones XML o el Java de la aplicación, para descubrir qué interceptores deberían dispararse y en qué secuencia. Referencias a estos interceptores, se agregan a la ActionInvocation. Además de estos elementos centrales, el también contiene referencias a otra información importante, como el Servlet, solicitar objetos y un mapa de los resultados disponibles para la acción. 

**Cómo disparan los interceptores**

Ahora que ActionInvocation ha sido creado y unido con todos los objetos e información que necesita, podemos comenzar la invocación. 

**Parte 1**

La acción ActionInvocation expone el método invoke (), que es llamado por el framework para comenzar la ejecución de la acción. Cuando el marco llama a este método, ActionInvocation inicia la invocación del proceso ejecutando el primer interceptor en la pila. Hay que tener en cuenta que el método invoke () no siempre se asigna al primer interceptor; es responsabilidad de ActionInvocation realizar un seguimiento de qué etapa ha alcanzado el proceso de invocación y pasar el control al interceptor apropiado en la pila. Hace esto llamando al método intercept () de ese interceptor.

**Parte 2**

Ahora viene la parte difícil. La ejecución continúa con los interceptores posteriores y, finalmente, la acción ocurre a través de llamadas recursivas a la invocación de ActionInvocation del método invoke (). Cada vez que se invoca al método invoke (), ActionInvocation consulta su estado y ejecuta el interceptor que viene después. Cuando todos los interceptores han sido invocados, el método invoke () hará que la acción se ejecute.

Ahora veremos qué puede hacer un interceptor cuando se dispara. Un interceptor tiene un ciclo de ejecución condicional de tres etapas. Estudiar algún código hará que estas sean más comprensibles:  

* Realiza algunos procesamientos previos. 
* Pasa el control a sucesivos interceptores y, en última instancia, la acción, llamando invoke(), o desvía la ejecución por sí mismo, devolviendo una cadena de control. 
* Realiza un procesamiento posterior.  

El TimerInterceptor cronometra la ejecución de una acción. El código es simple. El método intercept (), definido por la interfaz Interceptor, es el punto de entrada a una ejecución del interceptor.  

**Punto 1**

Cuando se llama al método de intercepción, la fase de pre procesamiento del interceptor consiste en registrar la hora de inicio (1).

**Punto 2**

Luego, el interceptor debe decidir si pasa el control al resto de los interceptores y la acción. En este caso, no hay razón para detener el proceso de ejecución y siempre llama a invoke (), pasando el control a lo que viene después en la cadena (2).

**Punto 3**

Calcula el tiempo que ha pasado durante la ejecución de la acción (3). Hace esto simplemente tomando la hora actual y restando la hora de inicio previamente registrada. Cuando finaliza, finalmente debe devolver la cadena de control que recibió de invoke (). Hace esto causando la recursividad de volver de regreso a la cadena de interceptores. Estos interceptores externos luego tienen la oportunidad de realizar cualquier procesamiento posterior que pueda interesar.

<img src="images/c3/3-2-metodo-intercept.png">

La gama de tareas que se pueden implementar, mediante interceptores modulares y reutilizables, es muy amplia. Podemos destacar: 

**Fase de procesamiento previo**

Durante la fase de procesamiento previo, el interceptor puede usarse para preparar, filtrar, alterar o manipular cualquiera de los datos importantes disponibles. Los datos incluyen todos los objetos y datos clave, incluida la acción misma, que pertenecen a la solicitud actual.

**Llamar a invoke()**

Llamar a invoke () o desviar el flujo de trabajo. Si un interceptor determina que la solicitud del procesamiento no debe continuar, puede devolver una cadena de control en lugar de llamar el método invoke () en ActionInvocation. De esta manera, puede parar la ejecución y determinar por sí mismo qué resultado entregará.

**Despues de invoke()**

Incluso después de que el método invoke () devuelva una cadena de control, cualquiera de los retornos de los interceptores puede decidir arbitrariamente alterar cualquiera de los objetos o datos disponibles para ellos como parte de su post procesamiento. Hay que tener en cuenta, sin embargo, que en este punto el resultado ya se ha entregado.

Como ya hemos comentado, es cierto que los conceptos de los interceptores pueden ser confusos al principio, por lo que es normal que cueste un poco afianzarlos.  

### 36. Crear el formulario

El formulario que se creará a continuación utilizará el interceptor fileUpload, el cual sirve para enviar archivos por medio de un formulario. Los pasos a seguir los presentamos a continuación: 

**Paso 1**

En nuestro proyecto y en el directorio, donde tenemos las páginas web, crearemos una nueva carpeta que llamaremos “parametros”.

**Paso 2**

En el directorio que creamos, añadiremos dos archivos nuevos con extensión .jsp, el primero lo llamaremos “index.jsp” y el segundo lo llamaremos “respuesta.jsp”.

**Paso 3**

En el primer archivo “index.jsp” crearemos un formulario con un campo tipo file, para poder cargar los archivos que deseemos. Este formulario lo ejecutará una Action que llamaremos “cargar-archivos”.

**Paso 4**

El código del formulario queda de la siguiente manera:

<img src="images/c3/3-2-codigo-1.png">

**Paso 5**

El código anterior representa al “index.jsp”. Ahora crearemos el “respuesta.jsp” con la siguiente codificación:

<img src="images/c3/3-2-codigo-2.png">

**Paso 6**

A continuación, tenemos que generar el Action del formulario, que quedará de la siguiente manera:

<img src="images/c3/3-2-codigo-3.png">

**Paso 7**

Como se puede observar, la clase creada es bastante sencilla de entender. La función principal es subir el archivo que se ha enviado por parte del formulario y luego retornar el content-type que devuelve el archivo.

**Paso 8**

Posterior a esto, debemos declarar en el archivo “struts.xml”, que se encuentra en el paquete “struts-interceptores” la Action que acabamos de generar “cargar-archivos”, que será implementada por la clase “com.javatutoriales.interceptores.actions.CargarArchivos”.

<img src="images/c3/3-2-codigo-4.png">

**Paso 9**

Al código anterior, le podemos añadir los parámetros de interceptores para ver su funcionalidad y, por ello, utilizaremos el , que podremos colocar dentro del Action. Este elemento posee solamente un argumento “name” que es el que emplearemos para configurar el interceptor.

<img src="images/c3/3-2-codigo-5.png">

**Paso 10**

Este parámetro que acabamos de configurar, indica al interceptor que solo se podrán subir archivos de tipo image/png o image/jpg, de esta forma, si se sube otro tipo de archivo, el interceptor procederá a actuar.

##### Enlace de interés

En este enlace podrás ver un ejemplo adaptado de lo que hemos visto previamente sobre la creación de formularios. 

[Creación de formularios](https://www.javatutoriales.com/2012/06/struts-2-parte-6-interceptores.html)

<img src="images/c3/3-2-arrastrar-1.png">

<img src="images/c3/3-2-arrastrar-2.png">

### 37. Crear conversor personalizado

Para poder crear un interceptor personalizado, debemos implementar la interface “com.opensymphony.xwork2.interceptor.Interceptor”, que posee 3 métodos y son: init(), destroy() y el método intercept().  

El método que trabajaremos será el “intercept”, porque este es el método que ejecuta la lógica como tal del interceptor. El parámetro que acepta el “intercept” es un objeto “ActionInvocation”, que es el que permite ejecutar el Action.   

El ejemplo, que se presenta a continuación, señalará el Action que se está llamando, al igual que la fecha y hora de la llamada, y además de esto, saludará. 

**Paso 1**

Se creará un paquete, que llamaremos “interceptores”, y dentro de este, añadiremos una clase, que llamaremos “SaludoInterceptor”, el cual implementará a “com.opensymphony.xwork2.interceptor.Interceptor”.

**Paso 2**

Posteriormente, se deben implementar los métodos de los interceptores, como se muestra en el siguiente código:

<img src="images/c3/3-2-codigo-6.png">

**Paso 3**

Para explicar un poco más el código anterior, comentaremos lo siguiente:

Se emplea el objeto “ActionContext” para acceder al nombre del Action. El objeto mencionado posee un método llamado “get” que facilita diferentes datos que se indican a la ejecución del Action. Se debe señalar qué valor necesitamos capturar empleando, para ello, varias de las constantes que él posee; en este caso, nosotros implementaremos “ACTION_NAME”. Podremos acceder a este método instanciando “getContext” de “Singleton”.

También debemos adquirir la fecha y hora del momento actual, empleando el objeto “Date”, y para mejorar su presentación, se tomará el objeto “DateFormat”.

Finalmente se imprime el resultado.

Ahora bien, para poder llegar al resultado que queremos, el Action debe indicar al interceptor, por medio del método “execute”, que la ejecución ha sido satisfactoria. Hay que llamar al método denominado “invoke” del objeto “ActionInvocation”, que es recibido como argumento.

### 38. Interceptores ModelDriven y Prepare

Los interceptores pueden ejecutar código antes y después de que se invoque una acción. La mayor parte de la funcionalidad central del framework se implementa como interceptores. Todos los interceptores son conectables, por lo que podemos decidir exactamente qué funciones debe admitir una acción. 

##### Enlace de interés

En este enlace sabrás cómo escribir un interceptor.

[Escribir un interceptor](https://www.ediciones-eni.com/open/mediabook.aspx?idR=a49aeeaf040d3c3ac664b3e0f032da70)

#### 38.1 Interceptor ModelDriven

El interceptor ModelDriven se considera un interceptor de flujo de trabajo, porque altera dicho flujo de ejecución, invocando getModel (), si está presente, y configurando el objeto modelo en la parte superior de ValueStack, donde recibirá los parámetros de la solicitud.   

Al colocar el modelo sobre el action en ValueStack, el interceptor ModelDriven altera el flujo de trabajo. Este concepto de crear un interceptor, que puede alterar condicionalmente la funcionalidad efectiva de otro interceptor sin intervención programática directa, demuestra el poder de la arquitectura de interceptores en capas. Al pensar en formas de añadir potencia a tus propias aplicaciones escribiendo interceptores personalizados, este es un buen modelo a seguir. 

<img src="images/c3/3-2-modeldriven.png">

#### 38.2 Interceptor Prepare

El interceptor prepare proporciona un punto de entrada genérico para el procesamiento arbitrario del flujo de trabajo que tal vez quieras añadir a tus acciones. El concepto es simple. Cuando el interceptor Prepare se ejecuta, busca un método prepare () en su acción. Comprueba si su acción implementa la interfaz Preparable, que define el método prepare (). Si su acción es Preparable, el método prepare () es invocado. Esto permite que ocurra cualquier tipo de preprocesamiento. Hay que tener en cuenta que mientras el interceptor prepare tiene un lugar específico en la pila predeterminada, puede definir su propia pila si necesita mover el código de preparación a una ubicación diferente en la secuencia. 

**Paso 1**

Se creará un paquete, que llamaremos “interceptores”, y dentro de este, añadiremos una clase, que llamaremos “SaludoInterceptor”, el cual implementará a “com.opensymphony.xwork2.interceptor.Interceptor”.

**Paso 2**

Posteriormente, se deben implementar los métodos de los interceptores, como se muestra en el siguiente código:

<img src="images/c3/3-2-interceptor.png">

**Paso 3**

Para explicar un poco más el código anterior, comentaremos lo siguiente:

Se emplea el objeto “ActionContext” para acceder al nombre del Action. El objeto mencionado posee un método llamado “get” que facilita diferentes datos que se indican a la ejecución del Action. Se debe señalar qué valor necesitamos capturar empleando, para ello, varias de las constantes que él posee; en este caso, nosotros implementaremos “ACTION_NAME”. Podremos acceder a este método instanciando “getContext” de “Singleton”.

También debemos adquirir la fecha y hora del momento actual, empleando el objeto “Date”, y para mejorar su presentación, se tomará el objeto “DateFormat”.

Finalmente se imprime el resultado.

Ahora bien, para poder llegar al resultado que queremos, el Action debe indicar al interceptor, por medio del método “execute”, que la ejecución ha sido satisfactoria. Hay que llamar al método denominado “invoke” del objeto “ActionInvocation”, que es recibido como argumento.

### 39. Implementación de ModelDriven

Las acciones ModelDriven difieren del uso de las propiedades JavaBeans para presentar el dominio de datos, porque presentan un objeto de dominio de aplicación a través del método getModel (), que es declarado por la interfaz com.opensymphony.xwork2.ModelDriven.   

Mientras esto ocurre, el método introduce una nueva interfaz, así como otro interceptor. El interceptor ya está en la pila predeterminada; la transferencia de datos sigue siendo automática e incluso más fácil de realizar que con otras técnicas. Vamos a ver los pasos de cómo funciona.  

Implementar la interfaz no requiere casi nada, sólo tenemos que declarar nuestro action e implementar la interfaz, pero solo hay un método presentado por ModelDriven, el método getModel (). Por modelo, nos referimos al modelo en el sentido MVC. En este caso, son los datos que provienen de la solicitud y son modificados por la ejecución de la lógica de negocios. Esos datos se ponen a disposición de la vista (páginas JSP en nuestro caso). 

**Paso 1**

Primero, vemos que nuestra nueva acción implementa la interfaz ModelDriven. El único método requerido por esta interfaz es getModel (), que devuelve nuestro objeto modelo, el cual es el objeto de usuario. Es importante saber que con el método ModelDriven lo tiene que inicializar el usuario, además de que hay que evitar un error para que, cuando el método execute () haya invocado la acción ModelDriven, el marco ha obtenido una referencia a su objeto modelo, que utilizará durante toda la solicitud.

**Paso 2**

Dado que el marco adquiere la referencia de su captador, no se dará cuenta si se cambia el campo del modelo de la acción. Esto puede causar algunos problemas de inconsistencia de datos. Si durante la ejecución del código, cambiamos el objeto al que hace referencia nuestro campo de modelo, el modelo de la acción no estará sincronizado con el que aún tiene el marco. El siguiente fragmento de código muestra el problema:

<img src="images/c3/3-2-codigo-7.png">

**Paso 3**

En el método execute () de esta acción, el desarrollador ha configurado la referencia de usuario como un nuevo objeto, pero el marco todavía tiene una referencia al objeto original. Cuando el marco invoca el resultado, el acceso a los datos de la página JSP se resolverá con el objeto antiguo. Podemos, por supuesto, manipular ese objeto modelo original al contenido de la raíz. Simplemente no hagamos uno nuevo.

<img src="images/c3/3-2-video-1.png">

[Video](https://www.youtube.com/watch?v=jL_NQo6bmeI&feature=emb_logo)


<img src="images/c3/3-2-crusi-1.png">

<img src="images/c3/3-2-crusi-2.png">

### 40. Implementación de Prepare – Acción

Para implementar la acción de éste interceptor, que se encarga de invocar al método “validate()” del Action, cada vez se implementa la interface Validateable. En el momento de la implementación, se genera un problema en la ejecución de los procedimientos de validación, que especifican estas interfaces en el Action y, automáticamente, este interceptor envía el string “INPUT” al marco de trabajo. 

<img src="images/c3/3-2-codigo-8.png">

**alwaysInvokeValidate (Boolean)**

Señala que se debe llamar siempre el método “validate()”, que de forma predeterminada es “true”.

**inputResultName (String)**

Es el resultado de enviar al marco de trabajo, si es que se llegara a producir un conflicto en la validación. Por defecto, es “INPUT”.

**excludeMethods (String)**

Procedimientos para los que no se pueden ejecutar su validación.

### 41. Implementación de Prepare – Struts.xml

Básicamente, las declaraciones de interceptores consisten en declarar que estos se encuentran disponibles y asociarlos con las acciones por, las cuales, se deberían disparar. La única complicación es la creación de pilas, que permiten hacer referencia a grupos de interceptores. Las declaraciones de interceptor, como las declaraciones de todos los componentes del marco, deben estar contenidas en un elemento de paquete. Veamos el siguiente código para explicar mejor este apartado: 

<img src="images/c3/3-2-codigo-9.png">

**Letras rojas**

El elemento de interceptores contiene todos los interceptores y la pila de interceptores. Las pilas de interceptores, como hemos dicho, son solo una forma adecuada de referenciar un trozo secuenciado de interceptores.

**Letras verdes**

Cada elemento interceptor declara un interceptor que se puede usar en el paquete. Esto solo mapea una clase interceptor a un nombre lógico, como el mapeo de com.opensymphony. xwork2.interceptor.DefaultWorkflowInterceptor al nombre de flujo de trabajo.

**Letras azules**

Las declaraciones no crean un interceptor, ni asocian ese interceptor con cualquier acción, solo asignan un nombre a una clase. Ahora podemos definir algunas pilas de interceptores. Dado que la mayoría de las acciones utilizarán los mismos grupos de interceptores, podemos definirlos en pequeñas pilas de bloques de construcción. El paquete struts-default declara varias pilas, la más importante el defaultStack. El contenido del elemento interceptor-stack es una secuencia de elementos interceptor-ref. En todas estas referencias debemos apuntar a uno de los nombres lógicos creados por los elementos interceptores.

**Letras naranjas**

Los elementos interceptor-ref también puede pasar parámetros para configurar la instancia del interceptor que se crea por la referencia.

**Letras grises**

Finalmente, un paquete puede declarar un conjunto predeterminado de interceptores. Este conjunto estará asociado con todas las acciones en el paquete que no declaran explícitamente sus propios interceptores. El elemento default-interceptor-ref simplemente apunta a un nombre lógico, en este caso el defaultStack. Es importante, porque permite que nuestras acciones hereden un conjunto predeterminado de interceptores cuando ampliamos el paquete struts-default.

Si bien este ejemplo es del paquete struts-default, podemos hacer lo mismo en nuestros propios paquetes cuando necesitemos cambiar los interceptores que se disparan para nuestras acciones. Esto puede ser peligroso cuando al principio tengamos poca experiencia. 

### 42. Autorización y autenticación

El interceptor de autenticación será simple. Si recuerdas las tres fases del procesamiento de un interceptor (preprocesamiento, llamando a ActionInvocation.invoke () y posprocesamiento), podemos anticipar cómo funcionará nuestro AuthenticationInterceptor.   

Cuando una solicitud llega a una de nuestras acciones seguras, debemos verificar si la solicitud proviene de un usuario autenticado. Esta verificación se realiza durante el preprocesamiento.   

Si el usuario ha sido autenticado, el interceptor llamará a invoke (), permitiendo, así, la invocación de acción para continuar. Si el usuario no ha sido autenticado, el interceptor devolverá una cadena de control, lo que impide seguir la ejecución.   

La cadena de control enrutará al usuario a la página de inicio de sesión. Primero, debemos aclarar algunos roles. 

**Rol 1**

El interceptor de autenticación no hace la autenticación, solo impide el acceso a acciones seguras por parte de usuarios no autenticados.

**Rol 2**

La autenticación en sí se realiza mediante la acción de inicio de sesión. La acción de inicio de sesión comprueba si el nombre de usuario y la contraseña son válidos. Si lo son, el objeto de usuario se almacena en un mapa de alcance de sesión.

Cuando se dispara el interceptor de autenticación, comprueba si el objeto de usuario está presente en la sesión. Si es así, permite que la acción se active como de costumbre. Si no es así, desvía el flujo de trabajo al reenviar a la página de inicio de sesión.

Veamos el siguiente código para explicar mejor este apartado:

<img src="images/c3/3-2-codigo-10.png">

**Letras rojas y moradas**

Comprobamos que nuestra acción de inicio de sesión utiliza la interfaz SessionAware (letras rojas) para tener el mapa con alcance de sesión convenientemente inyectado en un setter (letras moradas). Este es uno de los servicios proporcionados por ServletConfigInterceptor ofrecidos en defaultStack.

**Letras verdes**

En cuanto a la lógica de inicio de sesión, primero usamos nuestro objeto de servicio para autenticar la combinación del nombre de usuario y la contraseña.

**Letras naranjas**

Si el usuario es nulo, lo enviamos de vuelta al result INPUT, que es el formulario de inicio de sesión del que viene.

**Letras azules**

Si el usuario no es nulo, almacenaremos el objeto de usuario en el mapa de sesión, marcándolo como usuario autenticado.

### 43. Roles y usuarios

Los interceptores de seguridad proporcionan aspectos que tienen que ver con la seguridad de las aplicaciones en el ámbito del contenedor de Servlets.  

El anteriormente mencionado interceptor de seguridad solo admite la ejecución del Action si el usuario supera la seguridad JAAS Role, que es un mecanismo de seguridad de Struts 2. El argumento de configuración del mencionado interceptor para señalar cuales roles son aceptados, como es:  

* allowedRoles (String), lista de roles admitidos que están divididos por comas. 

<img src="images/c3/3-2-codigo-11.png">


<img src="images/c3/3-2-crusi-3.png">

<img src="images/c3/3-2-crusi-4.png">

### 44. Restringir acceso

Con la acción de inicio de sesión dispuesta, podemos ver cómo AuthenticationInterceptor protege las acciones seguras del acceso no autenticado. Básicamente, el interceptor verifica si el objeto de usuario se ha colocado en el mapa de sesión. Veamos el siguiente código para explicar mejor este apartado: 

<img src="images/c3/3-2-codigo-12.png">

**Letras rojas**

La parte principal del interceptor comienza dentro del método intercept ().

**Letras verdes**

Puede verse que el interceptor usa el objeto ActionInvocation para obtener información perteneciente a la solicitud. En este caso, estamos obteniendo el mapa de sesión.

**Letras naranjas**

Con el mapa de sesión disponible, recuperamos el objeto de usuario almacenado bajo la clave conocida. Si el objeto de usuario es nulo, entonces el usuario no ha sido autenticado a través de acción de inicio de sesión. En este punto, devolvemos una cadena de resultados, sin permitir que la acción continúe. Esta cadena de resultados, Action.LOGIN, apunta a nuestra página de inicio de sesión.

**Letras azules**

Si el objeto de usuario existe, entonces el usuario ya ha iniciado sesión. En este punto, obtenemos una referencia a la acción actual desde ActionInvocation y verificamos si se implementa la interfaz UserAware. Esta interfaz permite acciones para que el objeto usuario sea inyectado automáticamente en un método setter. Esta técnica, que copiamos de la inyección basada en interfaz propia del marco, es una forma potente de hacer la Action más limpia y más eficiente. La mayoría de las acciones seguras querrán trabajar con el usuario objeto. Con este interceptor en la pila, solo necesitamos implementar la interfaz UserAware para que el usuario sea inyectado correctamente.

**Letras moradas**

Con el proceso de autenticación resuelto, el interceptor llama a invoke () en el objeto ActionInvocation y pasa el control al resto de los interceptores y al action.

### 45. Definir autenticación

La autenticación es el proceso que nos permite asegurar que un usuario es quien dice ser. Veamos el siguiente código para explicar mejor este apartado: 

<img src="images/c3/3-2-codigo-13.png">

**Letras rojas**

Con todas nuestras acciones seguras, e incluidas en este paquete, solo necesitamos hacer una pila que incluye nuestro AuthenticationInterceptor y luego declararlo como predeterminado. Podemos ver lo fácil que es esto. Primero, debemos tener un elemento de interceptores para contener nuestro interceptor y declaraciones interceptor-stack.

**Letras verdes**

Tenemos que asignar nuestra clase Java a un nombre lógico con un elemento interceptor. Hemos elegido como nombre authentication-Interceptor.

**Letras naranjas**

Finalmente, declaramos nuestra nueva pila segura como la pila predeterminada para el paquete. Tengamos en cuenta que el elemento default-interceptor-ref no está contenido en los elemento interceptor; no declara ningún interceptor, solo declara el valor predeterminado para el paquete. Cada acción en este paquete dispondrá ahora de autenticación con enrutamiento automático de regreso a la página de inicio de sesión, así como inyección del objeto de usuario para cualquier acción que implemente la interfaz UserAware.

**Letras azules**

A continuación, creamos una nueva pila que toma la pila predeterminada y agrega nuestro nuevo interceptor en la parte superior. Lo colocamos en la parte superior, porque así podríamos detener una solicitud no autenticada lo antes posible.

### 46. Autenticación por formularios

Para hacer la autenticación de usuarios por medio de un formulario, haremos todo lo necesario para crear la página jsp adecuada. A continuación veremos cómo autenticar por formularios. 

##### Ejemplo práctico

A continuación veremos un ejemplo de la autenticación de usuario a través de formularios. 

[Ejemplo práctico](pdfs/46_Ejemplo_practico.pdf)

### 47. Mensajes e internacionalización

Podemos hacer que nuestras aplicaciones Java cambien fácilmente de idioma, es decir, que, en función del idioma del sistema operativo utilizado, nuestra aplicación aparecerá en un idioma u otro. Además podemos configurar nuestra aplicación para que aparezcan mensajes de error o avisos al usuario. 

**Mensajes**

La definición de los mensajes de error se muestra si un validador detecta algún dato que no es correcto. Para este caso, existe la posibilidad de utilizar las tags de Struts `<html:messages>` o `<html:errors>`. Estas etiquetas asumen que el error está en un archivo .properties. El Validator relaciona la clave asociada a cada uno automáticamente en "errors.nombre_del_validador". Por lo cual, para personalizar mensajes, tenemos que incluir en el archivo .properties una sentencia como esta:

```java
errors.required=campo requerido
errors.minLength=se ha excedido de la longitud mínima
```

Por diversas razones, los mensajes de error que están asociados al validador mask no se ubican bajo la clave errors.mask, sino bajo errors.invalid. Observa que, si no especificamos estas claves y tratamos de presentar el error, Struts indicará que no se consigue el mensaje de error (esto quiere decir que Struts no especifica mensajes de error predeterminados). Sin embargo, si no nos aparece el nombre que tiene asignada la clave de forma predeterminada, tenemos la posibilidad de modificarlo por medio de la etiqueta `<msg>`.

**Internacionalización**

En la actualidad, el desarrollo de aplicaciones web, en múltiples lenguajes, es un requerimiento casi obligatorio, no es algo opcional. Dicho esto, el framework Struts también busca facilitar estos aspectos. Normalmente, traducir el idioma es la tarea más costosa a la hora de internacionalizar una aplicación, pero no es el único factor. También es importante recordar que en los países existen diferentes idiomas, pero también diferentes monedas, formatos de fecha, así como también la escritura de números con decimales (bien utilizando un punto o bien una coma). Es la propia plataforma de Java la que proporciona soporte a la internacionalización y que tiene su fundamentación en éstas tres clases: java.util.Locale, java.util.ResourceBundle y java.text.MessageFormat.

##### Ejemplo práctico

A continuación veremos un ejemplo de mensajes. 

[Ejemplo práctico](pdfs/47_Ejemplo_practico.pdf)

### 48. Crear el formulario

El formulario realizado en código muestra la forma de hacer los mensajes personalizados.  

La propiedad name señala que este parámetro solo se utilizará para el mensaje que produce el error del validador required. Si la propiedad no se encuentra presente, el parámetro se emplea para todos. Inicialmente, la propiedad key es el valor del parámetro. 

<img src="images/c3/3-2-codigo-14.png">

**Formulario apropiado**

El formulario apropiado para el proceso de internacionalización sería:

<img src="images/c3/3-2-codigo-15.png">

Como podemos observar, los argumentos locale y country de la etiqueta nos dan la posibilidad de definir el idioma, así como también el país. Ambos no son obligatorios, tenemos la posibilidad de especificar solamente el locale. No obstante, estas propiedades también permiten la etiqueta , de esta manera, podríamos diseñar un grupo de formularios diferentes para cada locale.

##### Para saber más

En este enlace podrás leer más sobre cómo trabajar con formularios.

[Trabajo con Formularios](https://www.javatutoriales.com/2011/10/struts-2-parte-3-trabajo-con.html)

<img src="images/c3/3-2-crusi-5.png">

<img src="images/c3/3-2-crusi-6.png">

### 49. Añadir mensajes e internacionalización

Para añadir mensajes, en el archivo .properties, tenemos que reservar un espacio para poner el parámetro 0.  

**Añadir mensajes**

Cuando queremos añadir mensajes, debemos colocar el número del parámetro entre llaves:

errors.required=campo {0} vacío

...

Haciendo esto, el código quedaría de la siguiente manera:

<img src="images/c3/3-2-codigo-16.png">

Y el archivo .properties se modificaría así:

<img src="images/c3/3-2-codigo-17.png">

**Añadir internacionalización**

En cuanto a la internacionalización, podemos añadirla cambiando el archivo de propiedades de la siguiente manera:

<img src="images/c3/3-2-codigo-18.png">

**Extraer mensajes**

Una vez que hayamos creado estos archivos, solo tenemos que ponerlos en la estructura de directorios del paquete junto a la clase acción. Con estos dos archivos en su lugar, el marco crea instancias automáticamente a nuestra ruta, con el recurso ResourceBundle cada vez que llega una solicitud, para nuestra Ruta action. Además, el marco habrá determinado automáticamente la configuración regional del usuario basándose en la información enviada desde el navegador, y crea el ResourceBundle en consecuencia. Ahora, extraemos mensajes de ambos códigos. El siguiente fragmento .jsp muestra la mejor forma de recuperar algún texto localizado:

<img src="images/c3/3-2-codigo-19.png">

##### Para saber más...

En este enlace podrás leer más sobre cómo trabajar con formularios.

[Trabajo con Formularios](https://www.javatutoriales.com/2011/10/struts-2-parte-3-trabajo-con.html)

### 50. Capa de persistencia

Una de las tareas más críticas de una aplicación es el almacenamiento y recuperación de datos. En este sentido, la persistencia de una aplicación constituye el mecanismo que permite almacenar datos desde la memoria, de modo que puedan ser recuperados cuando la aplicación se ejecute de nuevo.  

La mayor parte de las aplicaciones comerciales, desarrolladas actualmente, utilizan un gestor de base de datos relacional como mecanismo de persistencia. En las bases de datos relacionales, los datos son almacenados mediante un conjunto de tablas con filas, columnas y asociaciones entre ellas. Este conjunto de tablas recoge, de forma estructurada, todos los datos necesarios para satisfacer los requerimientos del sistema informático. 

### 51. Preparar enlace a datos

Cuando se opte por el uso de una base de datos relacional, el primer paso, en la implementación de la persistencia de una aplicación, consistirá en la creación de las tablas y asociaciones entre tablas que deben almacenar los datos de la aplicación. Para ello, se debe usar el lenguaje estándar de acceso y manipulación de bases de datos SQL.  

Las tablas en una base de datos relacional definen una descripción estructurada de los datos que la aplicación debe almacenar. Estos deben ser previamente modelados en un diagrama de clases.  

A continuación, proponemos un conjunto de reglas que nos guiarán en la definición del script SQL de creación de tablas. 

**Creación de tablas y columnas**

Las tablas y las columnas de la base de datos se crean directamente a partir de las clases y atributos definidos en el diagrama de clases. Para ello, se definen dos reglas sencillas:

◦ Regla 1: Creación de tablas. Por cada clase definida en el diagrama, se crea una tabla.

◦ Regla 2: Creación de columnas. Por cada atributo definido en una clase, se crea una columna en la tabla correspondiente. En caso de que ningún atributo de la clase presente las propiedades de unicidad, se deberá definir una columna adicional para tal efecto.

<img src="images/c3/3-2-tablas.png">

**Creación de asociaciones entre tablas**

Las asociaciones entre tablas pueden ser fácilmente creadas analizando las relaciones establecidas entre las diferentes clases del diagrama de clases. En este caso, el tipo de relación (asociación, agregación o composición) no resulta significativo para la creación de las asociaciones entre tablas. No obstante, la cardinalidad definida para cada una de las relaciones juega un papel fundamental, definiendo tres formas diferentes de crear asociaciones entre tablas:

* Regla 3: Relaciones 1 a 1. Esta regla facilita la creación de asociaciones entre tablas que den soporte a relaciones entre clases, cuya cardinalidad máxima, en ambos extremos, sea 1.

* Regla 4: Relaciones 1 a N. Esta regla facilita la creación de asociaciones entre tablas que den soporte a relaciones entre clases, cuya cardinalidad máxima en una de ellas sea 1 y en otra sea múltiple (representada por el carácter `*`).

* Regla 5: Relaciones Muchos a Muchos. Esta regla facilita la creación de asociaciones entre tablas para dar soporte a relaciones entre clases, cuya cardinalidad máxima en ambos extremos sea múltiple (representada por el carácter `*`). En este caso, dichas asociaciones se crean mediante la definición de una nueva tabla con dos columnas.

Finalmente, hay que destacar que los scripts SQL definidos deberán ser ejecutados manualmente sobre la base de datos que se vaya a utilizar, haciendo uso de las herramientas propias del sistema gestor de base de datos. 

### 52. Implementación de la capa de persistencia

Una vez visto cómo crear la estructura de la base de datos donde vamos a almacenar la información requerida por nuestra aplicación, es necesario implementar el código de la aplicación que accederá a ella. Para implementar este código, de forma adecuada, se suele utilizar el patrón DAO (Data Access Object).  

En general, una aplicación cualquiera obtiene datos de fuentes muy diversas (base de datos, documentos XML, etc.), que pueden llegar a cambiar durante la vida útil de la aplicación, siendo frecuente añadir nuevas fuentes de datos por mejoras tecnológicas, nuevas necesidades empresariales, etc.  El principal problema que esto genera es, que si la lógica de la aplicación y el acceso a los datos se mezclan, un cambio en la fuente de datos puede obligar a cambiar la lógica de la aplicación, y viceversa, lo que supondría un cambio en la lógica del negocio que podría tener consecuencias sobre la capa de persistencia. Para evitarlo, se utiliza el patrón DAO, cuyas características principales son las siguientes: 

**Necesidades y motivaciones**

Los componentes de la aplicación deberán poder recuperar información de distintas fuentes de datos. El API de datos que expongan el conjunto de operaciones que se realicen con los datos, desacopla la lógica de la aplicación y el acceso a la información. Y, también, eliminar el código de conectividad a la fuente de datos de los componentes que requieran de acceso a datos, facilitando el mantenimiento y las actualizaciones.

**Solución**

Emplear un DAO que maneje las conexiones y exponga las operaciones de acceso a datos. Los objetos DAO no deben lanzar excepciones específicas de una tecnología concreta, ni deben trabajar con objetos que dependan de la fuente de datos. En cuanto al desacoplamiento entre la lógica y la persistencia, esto permite crear implementaciones del DAO para fuentes de datos concretas, sin necesidad de modificar la aplicación, puesto que se trabajará con los métodos y la interfaz.

**Estructura**

<img src="images/c3/3-2-tablas-2.png">

**Consecuencias**

Si no se realiza correctamente, puede ocasionar lo siguiente:

* Centraliza el acceso a datos, ocultando a los clientes los detalles concretos de las fuentes de datos.
* Facilita la utilización de fuentes de datos de distinto tipo y naturaleza con impacto mínimo en el resto de la aplicación.
* Reduce la complejidad de la implementación de la lógica de negocio.
* Introduce una mayor complejidad en el diseño, ya que obliga a trabajar con objetos que modelan elementos de la fuente de datos.


#### 52.1 Introducción a Hibernate

Hibernate es una solución para gestionar, de forma transparente, la persistencia en entornos orientados a objetos. Este suministra una solución de código abierto para convertir tuplas de tablas en objetos clases, y viceversa. Para ello, utiliza archivos XML para definir la transformación de clases a tablas. También existe un fichero XML de configuración, en el cual indicamos a Hibernate la información necesaria para conectarse a la base de datos. 

<img src="images/c3/3-2-hibernate.png">

Una vez los archivos del mapping han sido creados, Hibernate nos proporciona un conjunto de interfaces y clases para implementar la persistencia de nuestra aplicación. Las más importantes, entre las proporcionadas por Hibernate, se muestran en la figura y son las siguientes: 

**Clase org.hibernate.cfg.Configuration**

Clase encargada de cargar los ficheros de mapping, las propiedades específicas de Hibernate y crear un objeto SessionFactory.

**Interfaz org.hibernate.SessionFactory**

Implementa una factoría de sesiones. Se utiliza para crear objetos Session.

**Interfaz org.hibernate.Session**

Es el principal punto de interacción para implementar la persistencia mediante Hibernate. Proporciona métodos para recuperar y guardar la información de nuestros objetos Java en la base de datos relacional.

**Consecuencias**

Es opcional. Abstrae del modelo transaccional subyacente: JDBC, JTA UserTransaction, CORBA, etc.

**Solución**

Interfaz org.hibernate.Query y org.hibernate.Criteria

**Estructura**

<img src="images/c3/3-2-estructura.png">


<img src="images/c3/3-2-arrastrar-3.png">

<img src="images/c3/3-2-arrastrar-4.png">

### 53. Implementación del patrón DAO

Continuando desde el punto anterior, podemos considerar que nuestro objetivo es implementar el acceso a datos siguiendo el patrón DAO. Por ello, en una aplicación que haga uso de Hibernate, se deberán implementar tres tipos de elementos: 

**Clases de dominio**

Representan los objetos relacionados con el dominio de la aplicación (Libro, Cliente, Empleado, etc.).

**Archivos de correspondencia**

Definen la manera en que las clases de dominio se almacenan en la base de datos relacional.

**Clases DAO**

Estas clases utilizan las clases proporcionadas por Hibernate para gestionar el acceso a la base de datos.

Un ejemplo sería la clase de dominio generada a partir de la tabla libro. Se trata de una clase sencilla que almacena atributos, cada uno de los cuales se recogen en una columna de la tabla libro. Por otro lado, necesitamos generar dos constructores, uno que crea libros sin necesidad de pasarle ningún tipo de parámetro (constructor por defecto) y otro que crea un libro asignándole un valor al conjunto completo de atributos. 

Los ficheros de correspondencia indican a Hibernate cómo deben transformarse las tablas en clases y viceversa. En otras palabras, indican a qué tabla corresponde un determinado objeto, la asociación entre los atributos del objeto y las columnas de la tabla, así como las relaciones entre el objeto en cuestión y otros objetos, es decir, cómo se modelan las relaciones entre tablas.    

Las clases DAO (Data Access Object) se utilizan para pedir objetos de utilidad añadiendo una sencilla capa de abstracción que encapsule código y facilite el desarrollo. El patrón DAO abstrae y encapsula todos los accesos a la fuente de datos. La aplicación tiene una interfaz DAO por cada objeto de negocio (Libro, Categoría, Cesta, etc.). La herramienta de ingeniería inversa de Hibernate permite generar estas clases a partir de una base de datos (a las cuales se les asigna un nombre igual al de la clase objeto de negocio más la cadena “Home”).  

Hibernate genera clases con operaciones básicas, por lo que si queremos operaciones más complejas u operaciones adaptadas al dominio de nuestra aplicación, las debemos implementar nosotros mismos. 

##### Enlace de interés

En el siguiente enlace podrás aprender más sobre el patrón de diseño DAO y sus diferencias con respecto al MVC y DTO. 

[Patrón de Diseño DAO](https://www.ecodeup.com/patrones-de-diseno-en-java-mvc-dao-y-dto/)

Todas las clases DAO deben disponer de una propiedad de tipo SessionFactory, que permite obtener instancias del objeto Session. Dado su carácter “pesado”, suele existir una SessionFactory para toda la aplicación que se crea durante la inicialización de la misma. En definitiva, SessionFactory es el objeto que permitirá crear sesiones de Hibernate hacia la base de datos.  

Sin embargo, existe otra alternativa que consiste en obtenerlo a partir de un objeto Configuration. Una instancia de Configuration representa una configuración concreta de Hibernate, es decir, las correspondencias entre el modelo de objetos y el modelo de datos o la ruta de acceso al fichero hibernate.config.xml relativa al classpath y a los ficheros de mapeo hbm.xml.  

En cualquier caso, el método getSessionFactory(), lo que hace es construir la configuración de Hibernate a partir del archivo hibernate.cfg.xml.  Además, de este método, debemos implementar otros que nos permitan insertar y actualizar objetos en la base de datos, realizar consultas y eliminarlos.  A continuación, veremos cada uno de ellos: 

**Inserción y actualización de datos**

Para dar soporte a la inserción y actualización de datos, se propone la implementación de un método guardar(), el cual recibe como argumento un objeto del tipo que queremos insertar o actualizar.

**Borrado de objetos**

Para dar soporte al borrado de objetos de la base de datos, se propone la implementación en las clases DAO de un método borrar() que reciba como argumento el objeto a eliminar.

**Consulta de datos**

Para finalizar, se propone la implementación de un conjunto de métodos que nos faciliten la recuperación de objetos a partir de la información almacenada en la base de datos. Para dar soporte a la recuperación de un objeto a partir de su identificador, se propone la construcción del método getById(). A modo de ejemplo, se muestra la implementación de dicho método para la clase LibroDaoHibernateImpl. Este método utiliza una sesión de Hibernate para obtener una instancia de tipo Libro, a partir de su identificador por medio del método get(), que devuelve null si no encuentra el objeto asociado al identificador. En este caso, como se trata de una operación de sólo lectura, no se utilizan transacciones.

### 54. Subida/descarga de ficheros

Struts 2 proporciona una ayuda integrada, como ocurre con la mayoría de las tareas que se hacen rutinariamente, para la subida y descarga de ficheros. En este apartado veremos cómo funciona tanto la subida de nuevos ficheros como la descarga. 

**Subida de ficheros**

En este caso, la pila del interceptor, por defecto, tiene incluido el FileUploadInterceptor. El fichero struts-default.xml es el archivo del sistema que especifica todos los componentes incorporados en el framework. El código, que se muestra a continuación, presenta los elementos de ese fichero, los cuales son declarados como fileUploadinterceptor, además de ser convertidos en parte de la pila del interceptor predeterminado.

<img src="images/c3/3-2-codigo-20.png">

**Interfaz org.hibernate.SessionFactory**

Es lo contrario al item anterior. Es entregar un archivo binario al sitio donde navegan los usuarios. Existen dos estrategias de implementación que utiliza Struts 2 para ello. Estas son:

* El archivo se envía escribiendo sobre el Response directamente. Con este método podemos lograr esto en cualquier tipo de aplicación Java, ya que no es exclusivo de Struts 2.
* El segundo método es emplear el response stream, que es proporcionado de manera predeterminada por Struts 2. Lo que se aplica, en este caso, es hacer exactamente lo mismo que en la subida de archivos, pero se cambia el código Java por una configuración de un result.

### 55. Subida de ficheros

El framework Struts 2, como ya se mencionó en el apartado anterior, ofrece un excelente respaldo para la subida de archivos, algo que podremos ejecutar desde un formulario. Lo primero que hay que hacer es definir, en nuestro archivo Action, una propiedad del tipo&nbsp;java.io.File&nbsp;y le ponemos el nombre que deseemos. 

**Añadir dos propiedades**

Si queremos, además de esto, también existe la posibilidad de añadir dos propiedades extras, que podrán ser gestionadas, de manera instantánea, por el propio Struts y que podrán tener el mismo nombre, pero deberán disponer de los sufijos FileName y ContentType que contendrán el nombre del archivo y el MimeType respectivamente. A continuación, un ejemplo:

[Código](pdfs/55_Subida_de_ficheros_0.pdf)

A continuación, crearemos el formulario donde vamos a disponer el campo que servirá para subir el fichero. Para ello se utilizará la etiqueta s:file, señalando el nombre de la propiedad de tipo File que añadimos en el Action. Igualmente, el formulario a crear permitirá la subida de archivos, por lo tanto, tenemos que estar seguros de especificarlo con las propiedades siguientes:

<img src="images/c3/3-2-codigo-21.png">

**Interfaz org.hibernate.SessionFactory**

Configuración de FileUpload

[Código](pdfs/55_Subida_de_ficheros_2.pdf)

##### Enlace de interés

En este enlace podrás encontrar ejemplos adaptados sobre la subida de ficheros. 

[subida de ficheros](https://danielme.com/tip-struts2-01-subida-de-ficheros/)

### 56. Subida múltiple de ficheros

Para la subida de varios archivos en un formulario de Struts 2, sólo sería necesario especificar, por cada archivo a subir, las propiedades requeridas con sus respectivos getters y setters. Esto se lograría haciendo que los archivos a subir se almacenen en una lista tipo File. 

##### Ejemplo práctico

A continuación veremos un ejemplo cambiado del que hemos visto anteriormente, modificando el Action. 

[Ejemplo práctico](pdfs/56_Ejemplo_practico.pdf)

##### Enlace de interés

En este enlace podrás encontrar ejemplos adaptados sobre la subida múltiple de ficheros. 

[subida múltiple de ficheros](https://danielme.com/tip-struts-2-02-subida-multiple-de-ficheros/)

### 57. Descarga de ficheros

El punto inicial para esto es una vista que dará la posibilidad a un usuario de pedir la recuperación de un archivo jpg de prueba que fue escogido por uno de los métodos explicados anteriormente. 

**Crear formulario inicial**

Para el ejemplo se creará un formulario inicial formulario.jsp:

[Código](pdfs/57_Descarga_de_ficheros_0.pdf)

**Devolver el archivo jpg en el response**

Para poder devolver el archivo tipo jpg en el response, utilizaremos el método siguiente, que da la posibilidad de emplearse como plantilla, por lo que en la mayoría de los casos será idéntico y sólo hay que modificar el MIME type y el nombre del archivo.

[Código](pdfs/57_Descarga_de_ficheros_1.pdf)

Para continuar, es necesario hacer algunas consideraciones importantes:  

* Puedes acceder al response por medio de la clase&nbsp;ServletActionContext, aunque otra opción es permitir que el Action ejecute el&nbsp;ServletResponseAware. 
* El fichero action retorna NONE en vista que el response es devuelto al usuario, y si permitimos que Struts 2 siga su flujo, conseguiremos una excepción. Sin embargo, no hay efecto para el usuario:  

java.lang.IllegalStateException: getOutputStream()ya ha sido llamado para esta respuesta  

El resultado de result stream da la posibilidad de mandar un archivo de bytes que van al navegador. Lo que se hará es similar a lo que observamos en los apartados anteriores. 

##### Ejemplo práctico

A continuación veremos la diferencia que existe si se configura el result mediante la presentación de este método. 

[Ejemplo práctico](pdfs/57_Ejemplo_practico.pdf)

##### Enlace de interés

En este enlace podrás ver un ejemplo adaptado de lo que hemos visto previamente sobre la descarga de ficheros. 

[descarga de ficheros](https://danielme.com/tip-struts-2-06-descarga-de-ficheros-2/)


<img src="images/c3/3-2-crusi-7.png">

<img src="images/c3/3-2-crusi-8.png">

### 58. Medidores de progreso

Los medidores de progreso en Struts 2 aplican el inteceptor&nbsp;execAndWait. El objetivo principal es que, mientras culmina la ejecución del Action, se presenta una página de espera y también se evita que, durante la espera, el navegador genere un timeout.   

Esto se consigue porque la página que se mantiene en espera se está recargando automáticamente, realizando nuevas peticiones al servidor. Es sencillo de hacer y muy interesante, cuando no es factible utilizar AJAX o javascript.  

En el momento de utilizar el interceptor execAndWait, tenemos que considerar los siguientes aspectos: 

**Aspecto 1**

La sesión posee un solo Action.

**Aspecto 2**

No se empleará el ActionContext, en vista que el Action se genera en un hilo diferente.

**Aspecto 3**

El mencionado interceptor tiene que ser el último de la pila.

**Enlace de interés**

En el siguiente enlace podrás encontrar ejemplos sobre cómo usar el interceptor execAndWait. 

[Interceptor execAndWait](https://danielme.com/tip-struts-2-10-el-interceptor-execandwait/)

### 59. Añadir medidor a un proceso

Añadir el interceptor execAndWait, que sería nuestro medidor de proceso, es fácil. Primero tenemos la página de espera&nbsp;/jsp/espera.jsp. Lo más importante de esta página jsp es que tenemos que añadir una etiqueta llamada meta refresh. De este modo, la página jsp se recargaría automáticamente. Esta es la única manera de que el navegador tenga la posibilidad de verificar periódicamente si el Action ha culminado su ejecución. De igual forma, en esta página jsp, como es de esperar podemos acceder al ValueStack del Action, lo que facilita presentar la información del progreso. 

##### Ejemplo práctico

A continuación veremos un ejemplo de cómo se presenta la información del progreso al añadir el interceptor execAndWait. 

[Ejemplo práctico](pdfs/59_Ejemplo_practico_0.pdf)

Para finalizar, observemos el fichero&nbsp;struts.xml. Solamente incluiremos el interceptor a la pila de interceptores del Action y especificaremos el result wait para la página jsp, así como los que corresponden a la culminación de la ejecución del Action. Este interceptor acepta tres argumentos. Aquí sólo se utilizará el argumento “delay”, que da la posibilidad de especificar, en milisegundos, el tiempo de espera inicial de culminación del action.   

Si pasado ese tiempo, el Action no ha finalizado su ejecución, se presentará la página de espera. De modo predeterminado, el delay está en cero y, por tanto, siempre presentará la página de espera, por lo cual, tenemos que utilizar este argumento si se da la opción que el Action se ejecute prácticamente al instante y, así, evitar la vista de espera e ir al resultado directamente. 

##### Para saber más...

En este enlace podrás saber más sobre la etiqueta Meta Refresh.

[Meta Refresh](https://neoattack.com/neowiki/meta-refresh/)

##### Ejemplo práctico

A continuación veremos un ejemplo de como hacer que Action se ejecute.

[Ejemplo práctico](pdfs/59_Ejemplo_practico_1.pdf)

### 60. AJAX

AJAX son las siglas de Asynchronous JavaScript and XML. Es un término creado, en 2005, por Jesse James Garret, quien quería darle un nombre propio a este conjunto de tecnologías. El término se hizo muy conocido y logró imponerse en el mercado. 

**Popularidad**

AJAX no es nuevo e incluso, anteriormente, se conocía con otros nombres, pero no fue muy popular hasta que Google, con sus innovadores servicios e interfaces, consiguió que se hiciera popular entre los usuarios y los desarrolladores.

**Qué utiliza AJAX**

AJAX utiliza HTML (o XHTML) y CSS como lenguaje de estructurado y diseño; JavaScript, como lenguaje de programación; el modelo DOM (Document Object Model), para trabajar con la estructura del sitio, y XML como uno de los formatos de transporte de datos desde y hacia el servidor.

Todos los servicios de Google, salvo pequeños usos de Flash, cada vez más en desuso, están desarrollados bajo esta tecnología. Tanto apostó Google por esta plataforma, que ha creado y cedido a la comunidad de programadores su plataforma de desarrollo para Java que crea automáticamente el código AJAX necesario, conocido como Google Web Toolkit (GWT).  

AJAX se hizo tan conocido, que los demás navegadores, encabezados por Mozilla Firefox, implementaron una versión clon del objeto XMLHTTP de Microsoft para que las aplicaciones funcionen en ellos.  

AJAX está tan difundido, que hasta navegadores instalados en teléfonos móviles soportan esta plataforma. La W3C, organización encargada de los estándares, ha trabajado en la estandarización formal de la plataforma. 

En general, en las aplicaciones web, posiblemente la diferencia más notable sea la necesidad de tener que solicitar más páginas. Para lograr que ocurra algo en una aplicación web, debemos realizar una petición al servidor. Y para efectuar esta petición, debemos recargar la página con el objetivo de obtener la información actualizada que proporciona el servidor al cliente.  Esta limitación no está impuesta por los navegadores, sino que se debe a que el protocolo HTTP está basado en un sistema de peticiones y respuestas al que deben atenerse todos los navegadores. 

<img src="images/c3/3-2-mvc.png">


<img src="images/c3/3-2-ajax-1.png">

<img src="images/c3/3-2-ajax-2.png">

<img src="images/c3/3-2-ajax-3.png">

<img src="images/c3/3-2-ajax-4.png">

### 61. Formulario con AJAX

La forma más habitual de solicitar información a un usuario es a través de formularios. Existen muchos tipos distintos de controles para crear formularios, los cuales nos permiten recabar información de formas muy diversas. Para lograr que nuestros formularios sean lo más intuitivos posible, es importante conocer todas las posibilidades que tenernos a nuestra disposición para solicitar datos al usuario. Podemos mencionar algunos de estos controles: button, checkbox, hidden, image, radio, reset, select, submit, text, textarea, file.  

Durante años, los desarrolladores han venido haciendo buen uso de estos controles de formularios para crear aplicaciones web eficientes. Esta evolución ha permitido que los programadores y los diseñadores dispongan de implementaciones muy refinadas de todo tipo de funcionalidades web.  Lo que hace de forma novedosa AJAX es añadir la posibilidad de que funcionen de forma inmediata, sin tener que recargar la página donde se encuentran. 

**GET versus POST**

Al enviar un formulario por medios normales, debemos especificar un atributo del elemento form si queremos enviar los datos en modo GET o POST. Si enviamos los datos utilizando el método GET, éstos se incluirán en la cadena de la petición que enviamos al servidor. Esto significa que el navegador une todos los datos del formulario a continuación de la dirección web. La implementación de este método puede traer dos inconvenientes: el primero de ellos tiene que ver con la longitud de los datos, y el segundo inconveniente de GET se presenta al realizar consultas dinámicas en bases de datos a partir de los recibidos en la cadena que envía GET.

El método POST permite enviar datos de un modo más seguro, pues impide la interferencia del usuario. En otras palabras, los datos que recibe el código de procesamiento contienen exactamente lo que el programador haya estipulado.

**Enviar valores**

Para enviar los datos de un formulario normal, sólo tenemos que crear un elemento submit o image, que dirija los datos al script que hayamos designado en el atributo action del elemento form. Al utilizar este método, se recogen todos los datos del formulario y se envían al script. Sin embargo, enviar un formulario, mediante Ajax a un programa concreto, resulta un poco más complejo.

Lo primero que debemos tener en cuenta es que, aunque efectivamente es más complicado crear la cadena que realiza la petición asíncrona al servidor, también nos ofrece la posibilidad de un mayor control mediante JavaScript antes de procesar los datos.

Básicamente, la utilización de XMLHttpRequest para enviar valores de formulario requiere la construcción de una cadena de consulta, que se integra en la petición utilizando los encabezados apropiados.

### 62. Formulario con AJAX 2

Desarrollar código para hacer validaciones de entradas de formularios, creados bajo tecnología web, puede resultar una tarea más difícil que implementar una lógica de ejecución de formularios propiamente dicha.&nbsp;El mecanismo de validación que utiliza Struts 2 presenta compatibilidad con Java, JavaScript y Ajax, lo que rebaja la complicación de hacer las validaciones de formularios web.  

Los desarrollos web necesitan el ingreso de datos por parte del usuario, que probablemente van, desde valores simples, como nombre de usuario y clave, hasta datos complejos introducidos mediante un formulario con atributos y dependencias.&nbsp;Como hemos mencionado, la actividad de validar el ingreso de datos en un formulario web frecuentemente es más complicada que implementar la lógica para validar los datos tras su envío.&nbsp;Un entorno de validación es posible que facilite y simplifique la codificación, y cuanto más complejas sean las reglas de validación, más ahorro nos proporcionará el marco de trabajo.   

Siguiendo este orden de ideas, la tecnología AJAX ayuda a que Struts funcione correctamente. Por ejemplo, un JavaScript podrá hacer una petición HTTP y refrescar partes de una página instantáneamente, sin que tenga que pasar por un método POST o un método GET tradicional, lo que implicaría actualizar toda la página. 

Cuando un programa hace una "petición Ajax", el servidor no reconoce que proviene de un script, y la conduce como cualquier otra petición. Uno de los motivos por los que Ajax ha tenido tanto éxito es porque funciona muy bien con la mayoría de las tecnologías existentes de servidor, incluido en nuestro caso Struts.  

No es la petición de Ajax lo que es distinto, sino el resultado de Ajax. En vez de devolver una página completa, para que el navegador la presente por primera vez (o la refresque), una respuesta de Ajax solo devolverá una porción de una página. El resultado puede ser en la forma de HTML o XML, o texto sin ningún formato u otro script, o algún otro elemento que el script de llamada quiera.

##### Ejemplo práctico

A continuación veremos un ejemplo de Struts 2 Stream resultado de la Acción.

[Ejemplo práctico](pdfs/62_Ejemplo_practico_0.pdf)

##### Enlace de interés

En este enlace podrás ver un ejemplo adaptado de lo que hemos visto sobre los formularios con Ajax. 

[Formularios con Ajax](https://struts.apache.org/core-developers/ajax.html)

Si nos vamos al lado del cliente, existen dos estrategias básicas que tienen la posibilidad de combinarse.  

Primeramente, se puede utilizar alguna etiqueta JSP. El taglib de JSP realiza todo el trabajo, y solo debemos aprender cómo emplearlo. El taglib estándar de Struts 2 nos proporciona diversas etiquetas Ajax JSP, y muchas bibliotecas de otros complementos, dentro de las cuales se encuentran:  

* Ajax Tags. 
* AjaxParts Taglib. 
* ColdTags Suite. 
* Prize Tags. 
* JSON-taglib.  

Como alternativa, podemos utilizar un widget Ajax en una página HTML, utilizando bibliotecas como Dojo, JQuery o YUI, y StreamResult o el complemento JSON. 

Struts funciona muy bien con Ajax, y se puede utilizar de manera sencilla para captar un valor. También hay diversos complementos, como son: 

**jQuery**

El complemento jQuery ofrece la funcionalidad de Ajax y widgets para la interfaz de usuario, basado en una cuadrícula de jQuery javascript.

**Ajax Parts**

AjaxParts Taglib (APT) es un componente del proyecto Java Web Parts (JWP).

**Dojo**

Fue presentado como un tema para Struts 2.0. Para Struts 2.1, las etiquetas Dojo se incluyeron como un complemento hasta la versión 2.3.x. Desde la versión 2.5, este complemento ya no forma parte de la distribución de Struts2.

**YUI**

Es el complemento de interfaz de usuario de Yahoo (YUI), y tiene unas pocas etiquetas disponibles, pero suelen ser más fáciles de utilizar que las de Dojo.

**Carga de archivos Ajax**

Con el complemento de carga de archivos Ajax podemos cargar un fichero en el servidor y monitorizar su progreso de forma asíncrona.

**GWT**

Como complemento de Google Web Toolkit, expone las acciones de Struts 2 al mecanismo RPC de GWT.

**JSON**

El complemento JSON serializa las propiedades de las acciones en JSON, lo que facilita la respuesta a las solicitudes de JavaScript.

##### Ejemplo práctico

Las páginas del servidor se utilizan más a menudo para ejecutar HTML. Es posible emplear páginas del servidor para incluir otros tipos de flujos de datos. A continuación veremos un ejemplo de ello. 

[Ejemplo práctico](pdfs/62_Ejemplo_practico_1.pdf)


<img src="images/c3/3-2-arrastrar-5.png">

<img src="images/c3/3-2-arrastrar-6.png">

### 63. Freemarker, Velocity y Profiling

En este apartado, estudiaremos tres tipos de resultados que admiten tecnologías alternativas para las capas de vista: FreeMarker, Velocity y profiling. Si bien el uso de estos es tan sencillo como usar el resultado de una página JSP.    

Se ha debatido en el pasado si los motores de plantillas aportan un mejor rendimiento que las páginas JSP. En este sentido, cualquier diferencia de rendimiento no parece lo suficientemente clara como para justificar la decisión de utilizar una tecnología u otra.   

Tanto Velocity como los resultados que genera FreeMarker, se escriben directamente en la secuencia de respuesta a la petición de origen. Dicho de otra manera, el RequestDispatcher y todos los elementos generales de los Servlets implicados en el proceso no están implicados. 

#### 63.1 Velocity

Las plantillas Velocity son una tecnología ligera para mezclar datos dinámicos en la presentación de páginas de la capa de vista. Usando la API de etiquetas Struts 2 en las plantillas Velocity, es fácil acostumbrarse a esta tecnología. Además de lo rápido que se pueden aprender las diferencias sintácticas de cómo se escriben las etiquetas, la parte más sofisticada sigue siendo el OGNL empleado por las etiquetas para hacer referencia a los datos en el ActionContext y ValueStack.   

En principio, la API de etiquetas de Struts 2 es la mejor manera de generar las páginas de resultados.  

En cuanto a los resultados que ofrece velocity, estos son los siguientes: 

**Velocity JAR**

Primeramente, lo que debemos hacer es asegurarnos de tener los ficheros Velocity JAR en nuestra aplicación. Struts viene con un tipo de resultado de velocity incorporado, que podemos definirlo como sigue:

Fragmento de struts-default.xml:

<img src="images/c3/3-2-codigo-22.png">


Tras los que hemos visto, ahora podemos usar la lógica del atributo name para especificar Velocity como el tipo de nuestros resultados.

**Si quisiéramos que Velocity fuesen plantillas**

Si quisiésemos que Velocity fuesen las plantillas, por defecto, para nuestros resultados, debemos añadir una redeclaración del tipo de resultado de velocity a nuestro paquete:

<img src="images/c3/3-2-codigo-23.png">

**Action con plantilla Velocity**

Ahora veremos un Action con una plantilla Velocity. Así es como declaramos el resultado como velocity en una acción:

En la acción Ejemplo:

<img src="images/c3/3-2-codigo-24.png">

La única diferencia es que el tipo de resultado es especificado como velocity, en el paquete struts-default. El ejemplo siguiente muestra la plantilla Velocity que genera un resultado.

<img src="images/c3/3-2-codigo-25.png">

Una vez entendidas las diferencias de sintaxis de las etiquetas Struts 2 aplicadas a las distintas tecnologías de capa de vista comprendemos que aunque la sintaxis es un poco diferente, el OGNL es el mismo: Se extraen datos desde ValueStack como cuando se emplea la etiqueta de propiedad de una JSP.   

También debemos tener en cuenta algunas diferencias fundamentales entre JSP y Velocity, como la no existencia de directivas en la cabecera de la página. En principio, Velocity es más simple que JSP en algunos aspectos.  

El resultado de velocity también expone todos los datos de Struts 2 al lenguaje nativo de expresión de Velocity.  En algunos casos, como en la reutilización de las plantillas existentes de Velocity, puede resultar útil y hace inncesario a OGNL. 

##### Para saber más

Si deseas obtener más información sobre Velocity, consulta su documentación en esta página web. 

[Velocity](http://velocity.apache.org/)

#### 63.2 FreeMarker

Las plantillas de FreeMarker tienen ventajas similares a las de Velocity, y utilizar las etiquetas Struts 2 de FreeMarker es sencillo.  

**No hay que añadir ningún fichero JAR**

No hay que añadir ningún fichero JAR para usar FreeMarker, porque el marco utiliza FreeMarker y dichos recursos ya están incluidos en la distribución. El resultado ya está declarado en struts-default.xml con la siguiente línea:

<img src="images/c3/3-2-codigo-26.png">

**Especificar el nombre lógico FreeMarker en el atributo**

Lo que tenemos que hacer después es especificar el nombre lógico FreeMarker en el atributo tipo de resultado. Si queremos que FreeMarker sea la tecnología de la capa de vista, por defecto, podemos configurar el tipo como predeterminado añadiendo este código:

<img src="images/c3/3-2-codigo-27.png">

**Usar OGNL para pasar valores dinámicos**

Al igual que con el resultado de Velocity, podemos usar OGNL para pasar valores dinámicos en los parámetros de las páginas.

<img src="images/c3/3-2-codigo-28.png">

Como vemos, la sintaxis para la librería de etiquetas de Struts 2 es un poco diferente, pero usa el mismo OGNL para acceder a los datos en el mismo ValueStack. La librería de etiquetas de Struts 2 hace que el cambio entre las capas de vista sea sencillo. 

#### 63.3 Profiling

El software de profiling busca cuellos de botella en la ejecución del programa. Además de los servicios de creación de perfiles proporcionados por IDEs, el marco proporciona su propio soporte interno para la creación de perfiles. 

##### Enlace de interés

En esta página podrás aprender cómo realizar la administración de la creación de perfiles. 

[Creación de perfiles](https://www.ediciones-eni.com/open/mediabook.aspx?idR=d7a2d8fe5a71ce4a0dc453db75e3363e)


<img src="images/c3/3-2-crusi-9.png">

<img src="images/c3/3-2-crusi-10.png">

### Resumen Final

Como hemos estudiado a lo largo de los múltiples apartados de esta unidad, Struts 2 es la mejor respuesta posible en Java para ser coherentes con el enfoque MVC (Modelo-Vista-Controlador).  

Hemos analizado que Struts 2 es mucho más que una librería; sin duda, es un framework completo, porque no solo ofrece una API, sino que se trata de un enfoque completo de desarrollo, es decir, incorpora buenas prácticas y patrones de diseño que redundan en el desarrollo de software de mayor calidad.  

Gracias a las múltiples capacidades que nos ofrece Struts2, esta ha ido situándose como en framework MVC de referencia en Java, siendo el estándar adoptado por miles de ingenieros de software en todo el mundo. 

Dada la relación directa entre Struts y el enfoque MVC, el mejor epílogo para esta unidad es recordar las principales ventajas de MVC:  

* El controlador actúa como el cerebro de la aplicación desarrollada. Cada petición, que es realizada por un cliente, se dirige al controlador el cual, determinará qué hacer con cada petición lo que puede implicar la interacción con la parte de modelo y la de vista. 
* La vista se encarga de presentar las respuestas que van a llegar al cliente, que puede contener entre otros elementos, datos generados por el controlador. 
* El modelo que integra tanto la lógica de negocio de la aplicación desarrollada, como el mecanismo de acceso a datos y la gestión de los mismos. Esto facilita enormemente la reutilización de componentes de software. 

### BIBLIOGRAFÍA
* Brown, D., Michael Davis, C. y Stanlick, S. (2008). Struts 2 in action. Manning Publications.
* Deitel, H. M. y Deitel, P. J. (2004). Cómo Programar en C/C++ y Java. (4a edición). Ed. Pearson Educación.
* Deitel, H. M. y Deitel, P. J. (2004). Cómo programar en Java (5a edición). Pearson Prentice-Hall.
* Eckel. B. (2002). Piensa en Java (2a edición). Prentice Hall.
* Egido García, R. y Martín Sierra, A. (2017). Curso avanzado de programación en Java EE: Struts, JSF, Ajax, EJB. Syncron.
* Arquitectura java. Recuperado de: https://www.arquitecturajava.com
* Desarrollo web. Recuperado de: https://desarrolloweb.com/directorio/ programacion/java/
* La Web del programador: Comunidad de Programadores. Recuperado de: https://www.lawebdelprogramador.com/
* PROGRAMACIÓN ORIENTADA A OBJETOS (POO). Recuperado de: https ://compu2poo.wordpress.com/
