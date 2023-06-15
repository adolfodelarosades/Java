# Capítulo 1. Uso e implementación de aplicaciones web

Temas de este capítulo

* El propósito de las aplicaciones web.
* La estructura de las aplicaciones web.
* Registro de aplicaciones web
* Estrategias de desarrollo y despliegue
* Archivos WAR
* Uso compartido de datos de aplicaciones web

Las aplicaciones web (o "Web apps") le permiten agrupar un conjunto de servlets, **JavaServer Pages (JSP) pages**, **tag libraries**, **Hypertext Markup Language (HTML) documents**, **images**, **style sheets**, y otro Web content en una sola collection que puede utilizarse en cualquier servidor compatible con la especificación de servlet. Cuando se diseñan cuidadosamente, las Web apps se pueden mover de un servidor a otro o colocarse en diferentes ubicaciones en el mismo servidor, todo sin realizar ningún cambio en ninguno de los servlets, páginas JSP o archivos HTML en la aplicación.

Esta capacidad le permite mover aplicaciones complejas con un mínimo esfuerzo, agilizando la reutilización de aplicaciones. Además, debido a que cada aplicación web tiene su propia estructura de directorios, sesiones **`ServletContext`** y class loader, el uso de una aplicación web simplifica incluso el desarrollo inicial porque reduce la cantidad de coordinación necesaria entre varias partes de su sistema general.

## 1.1. Finalidad de las Aplicaciones Web

Las aplicaciones web lo ayudan de tres maneras principales: organizando sus recursos, implementando sus aplicaciones de forma portátil y evitando que diferentes aplicaciones interfieran entre sí. Veamos cada beneficio con un poco más de detalle.

### Organización

La primera ventaja de las aplicaciones web es que sabe dónde va todo: las Web apps tienen una ubicación estándar para cada tipo de recurso. Los archivos de clase Java individuales siempre van en el directorio denominado **`WEB-INF/classes`**, los archivos JAR (paquetes de archivos de clase Java) siempre van en **`WEB-INF/lib`**, el archivo de configuración **`web.xml`** siempre va en el directorio **`WEB-INF`**. Los archivos directamente accesibles para los clientes (por ejemplo, navegadores web) van al directorio de nivel superior de su aplicación web o cualquier subdirectorio debajo del directorio de nivel superior excepto **`WEB-INF`**.

Además, es muy común que los desarrolladores pasen de un proyecto a otro. Tener una forma estándar de organizar los recursos de su aplicación le evita tener que crear una estructura de aplicación cada vez que inicia un nuevo proyecto y también evita que un nuevo desarrollador que se una a su proyecto tenga que aprender su organización de archivos particular.

### Portabilidad

Debido a que la especificación del servlet proporciona una organización de archivos específica, cualquier servidor compatible debería poder implementar y ejecutar su aplicación de inmediato. Esto le brinda mucha libertad para elegir el proveedor de su Web server. Siempre que un servidor sea compatible, puede seleccionar su aplicación y, casi sin cambios, implementarla y ejecutarla en un servidor de un proveedor diferente, evitando así el temido "vendor lock-in - bloqueo del proveedor". Por ejemplo, podría comenzar a desarrollar sus aplicaciones utilizando un servidor web gratuito y pasar a un servidor más establecido y respaldado por un proveedor más cerca del momento de la implementación.

### Separación

Las diferentes aplicaciones web implementadas en el mismo servidor no interfieren entre sí. Cada aplicación tiene su propio **uniform resource locator (URL)** con el que se puede acceder, su propio **`ServletContextobjeto`**, etc. Dos aplicaciones web implementadas en el mismo servidor actúan como si estuvieran implementadas en servidores separados. Ninguno necesita saber del otro.

Esto simplifica aún más el desarrollo y la implementación de aplicaciones web. El desarrollador no tiene que preocuparse por cómo se integrará la aplicación con las aplicaciones existentes ya implementadas en el servidor. Ahora, como veremos más adelante en este capítulo, hay algunas formas en las que las aplicaciones web pueden interactuar deliberadamente entre sí. Sin embargo, en su mayor parte, se pueden desarrollar de forma independiente.

## 1.2. Estructura de Aplicaciones Web

Como se mencionó anteriormente, una aplicación web tiene un formato estandarizado y es portátil en todos los servidores web o de aplicaciones compatibles. El directorio de nivel superior de una aplicación web es simplemente un directorio con un nombre de su elección. Dentro de ese directorio, ciertos tipos de contenido van en ubicaciones designadas. Esta sección proporciona detalles sobre el tipo de contenido y las ubicaciones en las que debe colocarse.

### Ubicaciones para varios tipos de archivos

La figura 1-1 muestra un ejemplo representativo de una jerarquía de aplicaciones web. Para ver un ejemplo paso a paso de cómo crear su propia aplicación web, descargue la aplicación web en blanco de la aplicación desde http://volume2.coreservlets.com/ y siga las instrucciones de la Sección 1.6 (Creación de una aplicación web simple).

**Figura 1-1. Una aplicación web representativa.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/02d52f9d-77d6-4360-901b-ef4aab526998)

### JSP Pages

Las páginas JSP deben colocarse en el directorio de aplicaciones web de nivel superior o en un subdirectorio con cualquier nombre que no sea WEB-INF o META-INF . Los servidores tienen prohibido servir archivos de WEB-INF o META-INF al usuario. Cuando registra una aplicación web (consulte la Sección 1.3 ), le dice al servidor el prefijo de URL que designa la aplicación web y define dónde se encuentra el directorio de la aplicación web. Es común, pero de ninguna manera obligatorio, usar el nombre del directorio principal de la aplicación web como prefijo de URL. Una vez que registra un prefijo, se accede a las páginas JSP con URL de la forma http : //host/webAppPrefix/filename.jsp (si las páginas están en el directorio de nivel superior de la aplicación web) o http://host/webAppPrefix/subdirectory/filename.jsp ( si las páginas están en un subdirectorio) .

Depende del servidor si se puede acceder a un archivo predeterminado como index.jsp con una URL que especifica solo un directorio (p. ej., http:// host/webAppPrefix /) sin que el desarrollador realice primero una entrada en el sitio web de la aplicación web. Archivo INF/web.xml . Si desea que index.jsp sea el nombre de archivo predeterminado, le recomendamos que realice una entrada explícita en el archivo web.xmlwelcome-file-list de su aplicación web . Por ejemplo, la siguiente entrada web.xml especifica que si una URL especifica un nombre de directorio pero no un nombre de archivo, el servidor debe probar index.jsp primero e index.htmlsegundo. Si no se encuentra ninguno, el resultado es específico del servidor (por ejemplo, una lista de directorio).



Sobre el uso de web.xml , consulte el Capítulo 2 (Control del comportamiento de la aplicación web con web.xml).

Documentos HTML, imágenes y otro contenido web habitual
En lo que respecta al servlet y al motor JSP, los archivos HTML, las imágenes GIF y JPEG, las hojas de estilo y otros documentos web siguen exactamente las mismas reglas que las páginas JSP. Se colocan exactamente en las mismas ubicaciones y se accede a ellas con direcciones URL exactamente de la misma forma.

Clases individuales de Servlets, Beans y Helper
Los servlets y otros archivos .class se colocan en WEB-INF/classes o en un subdirectorio de WEB-INF/classes que coincida con el nombre de su paquete.

Para acceder a uno de estos servlets, debe designar la URL específica especificando el servlet-mappingelemento en el archivo descriptor de implementación web.xml que se encuentra dentro del directorio WEB-INF de la aplicación web. Consulte la Sección 1.3 (Registro de aplicaciones web con el servidor) para obtener más información.

Existe una segunda forma de acceder a los servlets sin tener que especificar una URL personalizada. Es con direcciones URL de la forma http: //host/webAppPrefix/servlet/packageName.ServletName . Usar esta forma de acceder a los servlets está bien si desea probar las capacidades o hacer un caso de prueba rápido. Sin embargo, le recomendamos que no utilice este enfoque para aplicaciones del mundo real. Hay varias razones para este consejo. Primero, si también especifica a servlet-mappingpara este servlet, tendrá dos formas diferentes de acceder al mismo servlet. Este efecto secundario podría convertirse rápidamente en un dolor de cabeza de mantenimiento. Segundo, porque la seguridad declarativa depende de la URL con la quese accede al recurso, también podría ser un posible agujero de seguridad en su aplicación. En tercer lugar, el usuario se ve obligado a escribir una URL que contenga el nombre completo de su servlet. Este nombre incluye toda la estructura del paquete con el nombre de la clase. Tales URL se ven feas y los usuarios las encuentran difíciles de recordar. Por lo tanto, este enfoque obtendría una puntuación muy baja en el medidor de usabilidad de la aplicación web. En cuarto lugar, si alguna vez decide cambiar el nombre de su clase o volver a empaquetar sus clases, la URL debe cambiar, obligándolo a actualizar todos los lugares de su aplicación donde se usó esta URL. Además del problema de mantenimiento, esto también confundirá a los usuarios que ya han marcado la URL original, lo que nuevamente perjudicará la usabilidad de su aplicación.

De hecho, le recomendamos que bloquee explícitamente el acceso del usuario a los servlets en su aplicación web sin mapear una URL personalizada. El mapeo podría especificarse con la ayuda del servlet-mappingelemento de web.xml . Consulte web.xml de la aplicación de muestra en blanco de la aplicación para ver un ejemplo de esto. Puede descargar la aplicación en blanco desde http://volume2.coreservlets.com/ .

Servlets, Beans y clases auxiliares (incluidos en archivos JAR)
Si los servlets u otros archivos .class están agrupados dentro de archivos JAR, entonces los archivos JAR deben colocarse en WEB-INF/lib . Si las clases están en paquetes, dentro del archivo JAR deberían estar en un directorio que coincida con el nombre de su paquete. En la mayoría de los servidores, los archivos JAR también se pueden compartir entre varias aplicaciones web. Sin embargo, esta función no está estandarizada y los detalles varían de un servidor a otro. En Tomcat, coloca archivos JAR compartidos en tomcat_dir/shared/lib .

Descriptor de implementación
El archivo descriptor de implementación, web.xml , debe colocarse en el subdirectorio WEB-INF del directorio principal de la aplicación web. Para obtener detalles sobre el uso de web.xml , consulte el Capítulo 2 (Control del comportamiento de la aplicación web con web.xml). Tenga en cuenta que algunos servidores tienen un archivo web.xml global que se aplica a todas las aplicaciones web. Por ejemplo, Tomcat usa tomcat_dir/conf/web.xml para los ajustes de configuración global. Ese archivo es completamente específico del servidor; el único archivo web.xml estándar es el archivo por aplicación que se coloca dentro del directorio WEB-INF de la aplicación web.

Archivos descriptores de la biblioteca de etiquetas
Los archivos Tag Library Descriptor (TLD) deben colocarse dentro del directorio WEB-INF o cualquier subdirectorio de WEB-INF . Sin embargo, le recomendamos que los coloque en un directorio tlds dentro de WEB-INF . Agruparlos en un directorio común (p. ej., tlds ) simplifica su gestión. Las páginas JSP pueden acceder a archivos TLD que están en WEB-INF usando una taglibdirectiva de la siguiente manera:

<%@ taglib  uri="/WEB-INF/tlds/miTaglibFile.tld"  ...%>

Debido a que es el servidor, no el cliente (por ejemplo, el navegador web), el que accede al archivo TLD, no se aplica la prohibición de que el contenido dentro de WEB-INF no sea accesible a través de la Web.

Cuando se implementa dentro de un archivo JAR, el archivo .tld debe colocarse dentro del directorio META-INF o cualquier subdirectorio de META-INF . El cambio de ubicación de WEB-INF a META-INF se debe a que los archivos JAR no son archivos de aplicaciones web y, por lo tanto, no contienen un directorio WEB-INF . Consulte el Capítulo 7 (Bibliotecas de etiquetas: conceptos básicos) para obtener una descripción más detallada de los archivos TLD.

Archivos de etiquetas
Los archivos de etiquetas deben colocarse en el directorio WEB-INF/tags o en un subdirectorio de WEB-INF/tags . Al igual que con los archivos TLD, las páginas JSP aún pueden acceder a los archivos de etiquetas aunque estén ubicados dentro del directorio WEB-INF protegido . Los archivos de etiquetas también se declaran dentro de una página JSP a través de la taglibdirectiva. Sin embargo, en lugar de uri, utilizan el tagdiratributo. Por ejemplo, si colocamos el archivo myTagFile.tag dentro del directorio WEB-INF/tags de nuestra aplicación web, la taglibdirectiva de una página JSP se vería así:

<%@ taglib  tagdir="/WEB-INF/etiquetas”  ...%>

En este escenario, el servidor genera automáticamente el TLD para los archivos de etiquetas, por lo que no es necesaria una asignación personalizada.

También puede incluir archivos de etiquetas agrupados en un archivo JAR. El archivo JAR en sí tendría que colocarse dentro del directorio WEB-INF/lib como mencionamos anteriormente. Sin embargo, dentro del archivo JAR, los archivos de etiquetas deben colocarse dentro del directorio META-INF/tags . En este caso, el servidor no genera automáticamente el TLD. Debe declarar el archivo de etiqueta y su ruta dentro de un archivo .tld . Tenga en cuenta que el archivo .tld también puede contener declaraciones de otros tipos de etiquetas personalizadas. Consulte el Capítulo 7 (Bibliotecas de etiquetas: conceptos básicos) para obtener una cobertura más detallada de los archivos de etiquetas.

Archivo de manifiesto WAR
Cuando crea un archivo WAR (consulte la Sección 1.5 ), se coloca un archivo MANIFEST.MF en el subdirectorio META-INF . Normalmente, la jarutilidad crea automáticamente MANIFEST.MF y lo coloca en el directorio META-INF , y lo ignora si desempaqueta el archivo WAR. De vez en cuando, sin embargo, modifica MANIFEST.MF explícitamente, por lo que es útil saber dónde está almacenado.

1.3. Registro de aplicaciones web con el servidor
Como explicamos anteriormente, las aplicaciones web son portátiles. Independientemente del servidor, almacena archivos en la misma estructura de directorios y accede a ellos con direcciones URL de la misma forma. Por ejemplo, la Figura 1-2 resume la estructura de directorios y las URL que se usarían para una aplicación web simple llamada myWebApp. Esta sección ilustra cómo instalar y ejecutar esta sencilla aplicación web en diferentes plataformas.

Figura 1-2. Estructura de la myWebAppaplicación Web.



Aunque las aplicaciones web en sí mismas son completamente portátiles, el proceso de registro es específico del servidor. Por ejemplo, para mover la aplicación myWebApp de un servidor a otro, no tiene que modificar nada dentro de ninguno de los directorios que se muestran en la Figura 1-2 . Sin embargo, la ubicación en la que se coloca el directorio de nivel superior ( myWebApp en este caso) variará de un servidor a otro. De manera similar, utiliza un proceso específico del servidor para decirle al sistema que las URL que comienzan con http:// host /myWebApp/ deben aplicarse a la aplicación web.

Esta sección asume que ya realizó los pasos de instalación y configuración de su servidor. Para obtener información sobre cómo configurar su servidor, lea la documentación de su servidor, consulte el capítulo introductorio del primer volumen de este libro o (para los usuarios de Tomcat) consulte la guía de instalación y configuración de Tomcat que se actualiza constantemente en http://www.coreservlets . com/ . Aquí, presentamos un breve ejemplo, luego brindamos detalles explícitos para Tomcat en una de las siguientes subsecciones. Para ver un ejemplo completo paso a paso de cómo desarrollar e implementar una aplicación web simple en Tomcat, consulte la Sección 1.6 (Creación de una aplicación web simple).

Como mostramos en la Sección 1.4 (Estrategias de desarrollo e implementación), la estrategia habitual es crear aplicaciones web en un entorno de desarrollo personal y copiarlas periódicamente en varios directorios de implementación para probarlas en diferentes servidores. Le recomendamos que evite colocar su directorio de desarrollo directamente dentro del directorio de un servidor.directorio de implementación: hacerlo dificulta la implementación en varios servidores, dificulta el desarrollo mientras se ejecuta una aplicación web y dificulta la organización de los archivos. En su lugar, use un directorio de desarrollo separado e implemente mediante una de las estrategias descritas en la Sección 1.4 (Estrategias de desarrollo e implementación). El enfoque más simple es mantener un acceso directo (Windows) o un enlace simbólico (UNIX/Linux) a los directorios de implementación de varios servidores, y simplemente copiar todo el directorio de desarrollo cada vez que desee realizar la implementación. Por ejemplo, en Windows puede usar el botón derecho del mouse para arrastrar la carpeta de desarrollo al acceso directo, soltar el botón y seleccionar Copiar.

Registro de una aplicación web con Tomcat
Con Tomcat, la creación de una aplicación web consiste en crear la estructura de directorios adecuada y copiar esa estructura de directorios en el directorio tomcat_dir /webapps . Tomcat se encargará del resto. La capacidad de implementar una aplicación web simplemente copiando su estructura de directorios en algún directorio del servidor generalmente se conoce como implementación en caliente o implementación automática . El directorio dentro del servidor que permite esta funcionalidad se conoce como directorio de implementación en caliente o directorio de implementación automática . La mayoría, si no todos los servidores web modernos, ofrecen esta función. Para un control adicional sobre el proceso, puede modificar tomcat_dir /conf/server.xml(un archivo específico de Tomcat) para hacer referencia a la aplicación web.

Los siguientes pasos lo guían a través de lo que se requiere para crear una aplicación web a la que se accede por medio de direcciones URL que comienzan con http:// host /myWebApp/ .

Cree una estructura de directorio de aplicaciones web con el directorio de nivel superior llamado myWebApp. Debido a que esta es su estructura de directorio de desarrollo personal, puede ubicarse en cualquier lugar que considere conveniente. Esta estructura de directorios debe estar organizada como mostramos en la Sección 1.2 (Estructura de Aplicaciones Web). Puede reducir la cantidad de trabajo manual que tiene que hacer en este paso simplemente descargando la aplicación web en blanco desde http://volume2.coreservlets.com/ . Ya contiene todos los directorios necesarios y un descriptor de implementación web.xml de muestra . Todo lo que le queda por hacer es cambiar el nombre del directorio de nivel superior de app-blank a myWebApp .
Sin embargo, si decide crear estos directorios a mano, esto es lo que deberá hacer. Cree un directorio llamado myWebApp en cualquier parte de su sistema fuera del directorio de instalación de su servidor. Justo debajo, crea un directorio llamado WEB-INF . En WEB-INF , cree un directorio llamado clases . Cree el archivo descriptor de implementación, web.xml , y colóquelo en el directorio WEB-INF . Analizamos el descriptor de implementación en detalle en el Capítulo 2 (Control del comportamiento de la aplicación web con web.xml). Por ahora, sin embargo, simplemente copie el archivo web.xml existente de tomcat_dir /webapps/ROOT/WEB-INFo use la versión que se incluye con app-blank .

Una vez que haya creado la estructura de directorios adecuada, coloque una página JSP simple llamada myPage.jsp en el directorio myWebApp . Coloque un servlet simple llamado MyServlet.class en el directorio WEB-INF/classes .

Declare el servlet y asígnelo a una URL editando el web.xmlarchivo del descriptor de implementación. A diferencia de los archivos JSP, los servlets deben declararse explícitamente. Necesitamos decirle al servidor que existe proporcionando el nombre de clase completo del servlet. Además, debemos informar al servidor qué URL solicitadas por el cliente deben invocar MyServlet.class . Ambos pasos se pueden lograr agregando las siguientes entradas en web.xml :


El servletelemento y sus subelementos informan al servidor del nombre que queremos usar para declarar nuestro servlet, así como el nombre completo de la clase de servlet. El servlet-mappingelemento y sus subelementos le dicen al servidor qué servlet debe invocarse cuando el cliente solicita una URL que coincida con el patrón proporcionado por el valor del url-patternelemento. Por lo tanto, el servlet declarado como MyNamese puede invocar con http:// host /myWebApp/MyAddress .

Copie el myWebAppdirectorio atomcat_dir/webapps . Por ejemplo, suponga que instaló Tomcat en C:\ tomcat_dir . A continuación, copiaría el directorio myWebApp en el directorio webapps , lo que daría como resultado C:\ tomcat_dir \webapps\myWebApp\HelloWebApp.jsp , C:\ tomcat_dir \webapps\myWebApp\WEB-INF\classes\HelloWebApp.class y C:\ tomcat_dir \webapps\myWebApp\WEB-INF\web.xml . También puede envolver el directorio dentro de un archivo WAR ( Sección 1.5 ) y simplemente colocar el archivo WAR en C:\ tomcat_dir \webapps .
Opcional: agregue una Contextentrada a . tomcat_dir/conf/server.xmlDe forma predeterminada, Tomcat configura su aplicación web para que tenga un prefijo de URL que coincida exactamente con el nombre del directorio de nivel superior de su aplicación web. Si está satisfecho con esta configuración predeterminada, puede omitir este paso. Sin embargo, si desea un poco más de control sobre el proceso de registro de la aplicación web, puede proporcionar un Contextelemento en tomcat_dir /conf/server.xml . Si edita server.xml , asegúrese de hacer una copia de seguridad primero; un pequeño error de sintaxis en server.xml puedeevitar completamente que Tomcat se ejecute. Sin embargo, para las versiones posteriores de Tomcat, el enfoque recomendado es colocar el Contextelemento (y sus subelementos) solo en el archivo context.xml . Luego, coloque context.xml junto con el descriptor de implementación web.xml en el directorio WEB-INF de su aplicación web.
El Contextelemento tiene varios atributos posibles que están documentados en http://jakarta.apache.org/tomcat/tomcat-5.0-doc/config/context.html . Por ejemplo, puede decidir si usar cookies o reescritura de URL para el seguimiento de la sesión, puede habilitar o deshabilitar la recarga de servlet (es decir, monitorear clases en busca de cambios y recargar servlets cuyo archivo de clase cambia en el disco) y puede establecer niveles de depuración. Sin embargo, para las aplicaciones web básicas, solo necesita tratar con los dos atributos requeridos: path(el prefijo de URL) y docBase(el directorio de instalación base de la aplicación web, relativo a tomcat_dir /webapps ). Esta entrada debería verse como el siguiente fragmento.

<Ruta de contexto="/alguna-aplicación-web” docBase=“miAplicaciónWeb” />

Tenga en cuenta que no debe usar /examples como prefijo de URL; Tomcat ya usa ese prefijo para una aplicación web de muestra.

Advertencia de núcleo

 No utilice /examples como prefijo de URL de una aplicación web en Tomcat.

Acceda a la página JSP y al servlet. La URL http:// host /myWebApp/myPage.jsp invoca la página JSP y http:// host /myWebApp/MyAddress invoca el servlet. Durante el desarrollo, probablemente utilice localhost para el nombre de host. Estas URL asumen que ha modificado el archivo de configuración de Tomcat ( tomcat_dir /conf/server.xml ) para usar el puerto 80 como se recomienda en la guía de instalación y configuración de Tomcat en http://www.coreservlets.com/ . Si no ha realizado este cambio, use http:// host /myWebApp/myPage.jsp y http:// host /myWebApp/MyAddress .:8080:8080
Registro de una aplicación web con otros servidores
Los dos primeros pasos descritos anteriormente se ocupan de la creación de la parte portátil de una aplicación web. Estos pasos serían idénticos para cualquier servidor compatible. Los pasos para el registro real son específicos de Tomcat. Sin embargo, registrar una aplicación web conotros servidores es muy similar. En esta subsección, resumimos el proceso de registro específico del servidor para algunos de los servidores más populares en la actualidad.

BEA WebLogic
Al igual que Tomcat, WebLogic proporciona un directorio de implementación automática que se utiliza para registrar e implementar aplicaciones web. Primero, si aún no lo ha hecho, cree un nuevo dominio llamado myDomain . Esto se puede hacer ejecutando el asistente de configuración de WebLogic config.cmd en Windows o config.sh en UNIX/Linux, ambos ubicados en el directorio bea/ weblogic_dir /common/bin , y siguiendo sus instrucciones. Una vez hecho esto, simplemente copie toda la estructura de directorios de su aplicación web (incluido el directorio de nivel superior) o un archivo WAR en el directorio bea/user_projects/domains/myDomain/applications . También puede usar la aplicación de consola web de WebLogic para implementar una aplicación web. Inicie sesión en la consola yendo ahttp://localhost:7001/consola/ . (Tenga en cuenta que esto supone que dejó la configuración predeterminada para el número de puerto sin cambios y que está ejecutando el servidor en su máquina local). En el panel izquierdo, expanda el nodo Implementaciones y haga clic en Módulos de aplicación web . Luego, haga clic en Implementar un nuevo módulo de aplicación web . Esto inicia un asistente de implementación basado en navegador. Simplemente siga las instrucciones paso a paso del asistente. Después de implementar la aplicación web, se puede acceder a la página JSP yendo a http://localhost:7001/myWebApp/myPage.jsp y al servlet yendo a http://localhost:7001/myWebApp/MyAddress .

jboss
En JBoss, registrar una aplicación web es casi tan fácil como en Tomcat. De hecho, de manera predeterminada, JBoss usa Tomcat como su servidor web integrado. Para registrar su aplicación web, primero cambie el nombre de su directorio de nivel superior myWebApp a myWebApp.war . Tenga en cuenta que en realidad no está creando un archivo WAR, sino simplemente cambiando el nombre del directorio de nivel superior para que termine con .war . JBoss insiste en que, para ser implementable, no solo los nombres de los archivos WAR deben terminar en .war , lo cual es requerido por la especificación del servlet, sino que el nombre del directorio de nivel superior de su aplicación web también debe terminar en .war . Una vez hecho esto, copie el directorio myWebApp.war en jboss_dir /server/default/deploydirectorio. Suponiendo que no cambió ninguna configuración predeterminada al instalar JBoss, puede invocar la página JSP yendo a http://localhost:8080/myWebApp/myPage.jsp e invocar el servlet yendo a http://localhost:8080 /miWebApp/MiDirección . Si empaqueta su aplicación web en un archivo WAR, debe colocar myWebApp.war en el mismo directorio de JBoss para implementarlo.

Resina Caucho
Para usar la función de implementación automática del servidor Caucho Resin, copie la estructura completa del directorio de la aplicación web (incluido el directorio de nivel superior) o un archivo WAR en el directorio resin_dir /webapps . Suponiendo que no haya cambiado ningún valor predeterminadoajustes de configuración del servidor, puede acceder a la página JSP yendo a http://localhost:8080/myWebApp/myPage.jsp y al servlet yendo a http://localhost:8080/myWebApp/MyAddress .

1.4. Estrategias de desarrollo y despliegue
Cuando esté listo para comenzar a desarrollar una nueva aplicación web, siga estos tres pasos:

Cree la estructura de directorios de la aplicación web. En su directorio de desarrollo, cree una nueva estructura de directorios que siga la estructura de la aplicación web (incluido el archivo web.xml dentro de WEB-INF ) discutida anteriormente en este capítulo. La forma más fácil de hacer esto es copiar y cambiar el nombre de la aplicación en blanco . (Recuerde, puede descargar app-blank y todos los demás códigos del libro en http://volume2.coreservlets.com/ ).
Crea tu código. Coloque páginas HTML y JSP en el directorio de nivel superior o en subdirectorios que no sean WEB-INF o META-INF . Coloque archivos de clase Java individuales en WEB-INF/classes/ subdirectory-matching-package-name . Coloque los archivos JAR en WEB-INF/lib . Coloque los archivos .tag y .tagx en WEB-INF/tags y así sucesivamente.
Implemente la aplicación. Copie toda la estructura de directorios de la aplicación web (incluido el directorio de nivel superior) en el directorio de implementación automática de su servidor. Hay una serie de estrategias que puede usar para simplificar este tercer paso, pero estas son las más populares:
• Copiar a un acceso directo o enlace simbólico

• Uso de funciones de implementación específicas de un entorno de desarrollo integrado (IDE)

• Usando Ant o una herramienta similar

• Usar un IDE en combinación con Ant

Si recién está comenzando con servlets y JSP, probablemente debería comenzar con la primera opción. Aprender a usar Ant o un IDE específico podría ser un obstáculo para que se sienta cómodo con el servlet y la tecnología JSP en sí. Tenga en cuenta, sin embargo, que no enumeramos la opción de poner su código directamente en el directorio de implementación del servidor. Aunque esta es una de las opciones más comunes entre los principiantes, se adapta tan mal a las tareas avanzadas que le recomendamos que la evite desde el principio.

Los detalles sobre estas cuatro opciones se dan en las siguientes subsecciones.

Copiar a un acceso directo o enlace simbólico
En Windows, vaya al directorio que se encuentra arriba del directorio de implementación automática del servidor. En Tomcat, esto lo ubicaría dentro del directorio de instalación raíz, tomcat_dir . Haga clic con el botón derecho en el directorio de implementación automática (por ejemplo, aplicaciones web en Tomcat) y seleccione Copiar. A continuación, vaya al directorio que se encuentra por encima de su directorio de desarrollo de nivel superior (por ejemplo, uno por encima de myWebApp ), haga clic con el botón derecho y seleccione Pegar acceso directo (no solo Pegar). Ahora, siempre que esté listo para implementar su aplicación web, haga clic y mantenga presionado el botón derecho del mouse en su directorio de desarrollo (por ejemplo, myWebApp ), luego arrástrelo al acceso directo del directorio de implementación y suelte el botón. Aparecerá un menú emergente. Seleccione la opción Copiar aquí. Figura 1-3muestra una configuración de ejemplo que simplifica las pruebas de los ejemplos de este capítulo en Tomcat, WebLogic, JBoss y Resin. En UNIX, puede usar enlaces simbólicos (creados con ln -s) de manera similar a los accesos directos de Windows.

Figura 1-3. Uso de accesos directos para simplificar la implementación.



Una ventaja de este enfoque es que es simple. Por lo tanto, es bueno para principiantes que quieran concentrarse en aprender servlets y tecnología JSP, no herramientas de implementación o IDE.

Una desventaja de este enfoque es que requiere copias repetidas si usa varios servidores. Por ejemplo, mantenemos varios servidores diferentes (Tomcat, Resin, etc.) en nuestro sistema de desarrollo y probamos regularmente el código en todos los servidores. Una segunda desventaja es que este enfoque copia los archivos de código fuente de Java y los archivos de clase en el servidor, aunque solo se necesitan los archivos de clase. Puede que esto no importe mucho en su servidor de escritorio, pero cuando llegue al servidor de implementación "real", no querrá incluir los archivos de código fuente.

Uso de características de implementación específicas de IDE
La mayoría de los entornos de desarrollo con conocimientos de servlet y JSP (p. ej., IBM WebSphere Studio Application Developer, Sun ONE Studio, NetBeans, Oracle JDeveloper, Borland JBuilder, Eclipse con MyEclipseIDE o complementos NitroX) le permiten configurar su entorno para que pueda implementar su Web aplicación a un servidor de prueba, desarrollo o producción con solo hacer clic en un botón.

Con todas las claras ventajas de los IDE, también hay una serie de desventajas. La mayoría de los IDE que valen la pena tienen una curva de aprendizaje pronunciada. Esto le impide concentrarse en el desarrollo real, al menos al principio. Además, es muy común que los desarrolladores cambien de proyecto y que los proyectos tengan un IDE específico que todos deben usar para tener un entorno de desarrollo común en el equipo. Si cambia y el nuevo proyecto usa un IDE diferente para la compilación y la implementación al que está acostumbrado, se verá obligado a aprender y acostumbrarse a otro IDE. Esto desperdicia tiempo adicional.

Uso de Ant, Maven o una herramienta similar
Desarrollada por Apache Foundation, antes una herramienta similar a la makeutilidad UNIX. Sin embargo, antestá escrito en el lenguaje de programación Java (y, por lo tanto, es portátil) y se promociona como más simple de usar y más poderoso que make. Muchos desarrolladores de servlets y JSP lo utilizan antpara compilar y desplegar. El uso de antse analiza en el Apéndice (Desarrollo de aplicaciones con Apache Ant).

Para obtener información general sobre el uso ant, consulte http://jakarta.apache.org/ant/manual/ . Consulte http://jakarta.apache.org/tomcat/tomcat-5.5-doc/appdev/processes.html para obtener orientación específica sobre el uso antcon Tomcat.

La principal ventaja de este enfoque es la flexibilidad: antes lo suficientemente potente como para manejar todo, desde la compilación del código fuente de Java hasta la copia de archivos y la producción de archivos WAR (consulte la Sección 1.5 ).

Otra herramienta que está llamando mucho la atención en el mundo Java es maven. Mavense extiende ant, por lo que es muy similar anten algunos aspectos y drásticamente diferente en otro. Aunque mavenes tan flexible como ant, se centra en la simplicidad de uso. Logra esta simplicidad utilizando convenciones. Por ejemplo, mavenpuede compilar el código sin que el desarrollador especifique dónde se encuentra el código con la carpeta del proyecto. Esto se debe a que maven, por convención, se supone que el código Java se encuentra en la carpeta src/main/java . Por supuesto, esta suposición se puede reconfigurar, pero ¿por qué molestarse? A diferencia de ant, estas convenciones permitenmavenarchivos de configuración para ser muy cortos y fáciles de entender. Puede obtener más información mavenen http://maven.apache.org .

La desventaja de ambos antes mavenla sobrecarga de aprender a usarlos; hay una curva de aprendizaje más pronunciada con anty mavenque con las dos técnicas anteriores de esta sección. Sin embargo, la gran diferencia entre invertir tiempo en aprender un IDE en particular y aprender anto mavenes que cada vez más proyectosestán adaptando el uso de anto mavencomo su herramienta de implementación estándar, no específica de IDE, por lo que hay muchas posibilidades de que aprender anto mavenvalga la pena en el futuro.

Uso de un IDE en combinación con Ant
Los IDE nos ayudan a ser más productivos al ayudarnos a escribir el código, pero nos restringen en términos de portabilidad. antnos permite desarrollar de forma portátil, pero no ayuda en absoluto con la escritura de código real. ¿Qué debemos hacer?

Una forma de cerrar un poco la brecha entre las dos opciones es adaptar el uso de un IDE que se integre con ant. De esta manera, aún puede usar su IDE favorito para ayudarlo a escribir código y, con solo hacer clic en un botón, invocar antscripts para compilar e implementar su aplicación. Incluso si su IDE favorito no está integrado ant(la mayoría de los IDE modernos lo están), aún puede usar este enfoque, pero tendrá que cambiar bastante entre el símbolo del sistema y su IDE.

Este enfoque funciona muy bien en un proyecto del mundo real. Los desarrolladores pueden seguir usando sus IDE favoritos, lo que les ayuda a ser más productivos, y el proyecto no sufre de inconsistencias en la implementación porque la compilación y la implementación se realizan mediante el mismo script portátil ant. Hemos participado en proyectos en los que diferentes desarrolladores del equipo que trabajaban en las mismas aplicaciones web utilizaron varios IDE; algunos incluso utilizaron diferentes sistemas operativos para sus entornos. La implementación de la aplicación se mantuvo constante y los desarrolladores estaban contentos de poder usar lo que hiciera que cada uno fuera personalmente más productivo. ¿No es un desarrollador feliz de lo que se trata todo esto?

1.5. El arte de WAR: agrupar aplicaciones web en archivos WAR
Los archivos de archivo web (WAR) proporcionan una forma conveniente de agrupar aplicaciones web en un solo archivo. Tener un solo archivo grande en lugar de muchos archivos pequeños facilita la transferencia de la aplicación web de un servidor a otro.

Un archivo WAR es realmente solo un archivo JAR con una extensión .war , y usa el jarcomando normal para crearlo. Por ejemplo, para agrupar toda la aplicación some-web-app en un archivo WAR llamado some-web-app.war , navegaría hasta el directorio some-web-app y ejecutaría el siguiente comando:

jar cvf alguna-aplicación-web.war *

No existe una relación especial entre el jarcomando y los archivos WAR. jares solo una herramienta entre otras para agrupar archivos. Si así lo desea, puede usar WinZip (o taren UNIX) para hacer exactamente lo mismo. Simplemente especifique el nombre del archivo para que termine con .war en lugar de .zip .

Por supuesto, puede usar otras jaropciones (por ejemplo, para firmar clases digitalmente) con archivos WAR tal como puede hacerlo con archivos JAR regulares. Para obtener más información, consulte http://java.sun.com/j2se/1.5.0/docs/tooldocs/windows/jar.html (Windows) o http://java.sun.com/j2se/1.5.0/docs /tooldocs/solaris/jar.html (UNIX/Linux).

1.6. Creación de una aplicación web sencilla
Bueno, suficiente charla. Pongámonos manos a la obra y construyamos nuestra primera aplicación web. Usaremos Tomcat como nuestro servidor, pero también se podrían aplicar pasos similares a otros servidores. Consulte la Sección 1.3 (Registro de aplicaciones web con el servidor) para obtener más detalles.

Este es el resumen de los pasos que seguiremos.

Descargue y cambie el nombre de app-blank a testApp ( http://volume2.coreservlets.com/ ).
Descargue test.html , test.jsp y TestServlet.java ( http://volume2.coreservlets.com/ ).
Agregue test.html , test.jsp a la aplicación web testApp .
Coloque TestServlet.java en el directorio testApp/WEB-INF/classes/coreservlets .
Compile TestServlet.java .
Declare TestServlet.class y la URL que lo invocará en web.xml .
Copie testApp en tomcat_dir /webapps .
Inicie Tomcat.
Acceda a testApp con la URL del formulario http://localhost/testApp/someResource .
Las siguientes subsecciones lo guiarán a través de estos pasos con cierto detalle.

Descargar y cambiar el nombre de la aplicación en blanco a testApp
Este paso es bastante fácil. Simplemente descargue app-blank.zip desde http://volume2.coreservlets.com/ . Este archivo contiene la estructura de directorio adecuada que necesita cada aplicación web compatible con J2EE. También contiene un punto de partida para el descriptor de implementación de su aplicación, web.xml , con una asignación de servlet que desactiva el servlet invocador. Veremos el mapeo de servlet con un poco más de detalle cuando lleguemos a mapear nuestro TestServlet a una URL. Por ahora, simplemente descomprima app-blank.zip en un directorio de su elección y cámbiele el nombre testApp . Recuerde colocar testApp en algún lugar de su sistema fuera de los directorios de Tomcat.

Descargue test.html, test.jsp y TestServlet.java
Como en el paso anterior, estos archivos se pueden descargar desde http://volume2.coreservlets.com/ . Puede descargarlos uno por uno o agruparlos en testAppFiles.zip y descomprimirlos en un directorio de su elección.

Agregue test.html, test.jsp a la aplicación web testApp
Coloque test.html , test.jsp en el directorio testApp , cree un directorio dentro del directorio testApp , coloque una copia de test.html , test.jsp en testApp/someDirectory . El archivo test.html contiene un mensaje estático y test.jsp contiene un scriptlet que genera la URL utilizada para acceder a la página. Los listados 1.1 y 1.2 muestran el código completo de estos archivos.

Listado 1.1. prueba.html



Listado 1.2. prueba.jsp



Coloque TestServlet.java en el directorio testApp/WEB-INF/classes/coreservlets
TestServlet.java declara que pertenece al coreservletspaquete. Por lo tanto, debe colocar TestServlet.java antes de compilar. Al igual que con test.jsp , TestServlet.class contiene código que genera la URL utilizada para acceder al servlet. Consulte el Listado 1.3 para ver el código completo de TestServlet.java .

Listado 1.3. TestServlet.java



Compilar TestServlet.java
Recuerde que su CLASSPATH debe incluir la interfaz de programación de aplicaciones (API) del servlet. Tomcat lo empaqueta en el archivo servlet-api.jar , que se encuentra en el directorio tomcat_dir /common/lib . En Windows, puede configurar su CLASSPATH yendo al símbolo del sistema de DOS y escribiendo el siguiente comando:

establecer CLASSPATH=tomcat_dir\common\lib\servlet-api.jar

En sistemas compatibles con UNIX/Linux, puede configurar CLASSPATH abriendo una consola y escribiendo el siguiente comando:

CLASSPATH=dir_tomcat/common/lib/servlet-api.jar

Una vez que se establece CLASSPATH, puede compilar TestServlet.java navegando al directorio testApp/WEB-INF/classes/coreservlets y escribiendo el siguiente comando:

javac TestServlet.java

Después de la compilación, TestServlet.class debe residir en el directorio testApp/WEB-INF/classes/coreservlets .

Declare TestServlet.class y la URL que lo invocará en web.xml
Navegue hasta el directorio testApp/WEB-INF y abra web.xml con su Extensible Markup Language (XML) o editor de texto favorito. Para declarar TestServlet.class , debe agregar las siguientes líneas justo después del <!-- Your entries go here. -->comentario XML:



En estas pocas líneas, declaramos un servlet con el nombre Testpara representar nuestra TestServlet.class . Tenga en cuenta que el <servlet-class>elemento enumera el nombre completo de la clase de servlet, que tiene la forma (sin la terminación .class ).packageName.className

Ahora, debemos decirle a Tomcat qué URL invocarán el Testservlet declarado. Esto se puede lograr agregando las siguientes líneas a web.xml , justo después del </servlet>elemento final:



Estas líneas le dicen a Tomcat que una solicitud de cliente a la aplicación web testApp con la URL de la forma http:// host /testApp/test debería resultar en la invocación del Testservlet declarado anteriormente. Vea el Listado 1.4 para ver el código completo de web.xml .

Listado 1.4. web.xml





Consulte el Capítulo 2 (Control del comportamiento de la aplicación web con web.xml) para obtener una descripción detallada de web.xml .

Copie la aplicación de prueba en tomcat_dir/webapps
En este paso, estamos copiando toda la estructura de directorios comenzando con el directorio de nivel superior ( testApp ) al directorio de implementación automática de Tomcat tomcat_dir /webapps . También podemos optar por comprimir testApp en un archivo WAR (ya sea con el jarcomando, WinZip, taro una herramienta de agrupación similar) y luego copiar solo el archivo WAR en tomcat_dir/webapps . Ya sea que elija copiar testApp en su versión "explotada" o en su archivo WAR, el resultado final será el mismo.

Iniciar Tomcat
Puede iniciar Tomcat ejecutando tomcat_dir /bin/startup.bat en Windows y tomcat_dir /bin/startup.sh en UNIX/Linux. Tomcat detecta un nuevo directorio en su directorio de implementación automática y registra e implementa automáticamente la aplicación web testApp .

Acceda a testApp con la URL del formulario http://localhost/testApp/someResource
Las direcciones URL http://localhost/testApp/test.html y http://localhost/testApp/someDirectory/test.html recuperan test.html , http://localhost/testApp/test.jsp y http://localhost/ testApp/someDirectory/test.jsp invoca test.jsp y http://localhost/testApp/test invoca TestServlet.class .

Estas URL asumen que ha modificado el archivo de configuración de Tomcat ( tomcat_dir /conf/server.xml ) para usar el puerto 80 como se recomienda en el Volumen 1 de este libro. Si no ha realizado este cambio, simplemente reemplace localhost con localhost:8080 en la URL. Consulte las Figuras 1-4 a 1-8 para obtener capturas de pantalla de lo que debería aparecer en su navegador como resultado de acceder a estos recursos.

Figura 1-4. Resultado de http://localhost/testApp/test.html .



Figura 1-5. Resultado de http://localhost/testApp/test.jsp .



Figura 1-6. Resultado de http://localhost/testApp/someDirectory/test.html .



Figura 1-7. Resultado de http://localhost/testApp/someDirectory/test.jsp .



Figura 1-8. Resultado de http://localhost/testApp/test .



1.7. Compartir datos entre aplicaciones web
Uno de los propósitos principales de las aplicaciones web es mantener separados los datos y la funcionalidad. Cada aplicación web mantiene su propia tabla de sesiones y su propio contexto de servlet. Cada aplicación web también usa su propio cargador de clases; este comportamiento elimina los problemas con los conflictos de nombres, pero significa que los métodos y campos estáticos no se pueden usar para compartir datos entre aplicaciones. Sin embargo, aún es posible compartir datos con cookies o mediante el uso ServletContextde objetos que están asociados con URL específicas. Estos enfoques son opciones viables para compartir información mínima entre aplicaciones web, pero si se esfuerza por compartir mucho, debe considerarmantener las aplicaciones como una aplicación web. Los dos enfoques para compartir datos se resumen a continuación.

Galletas. Las cookies son mantenidas por el navegador, no por el servidor. En consecuencia, las cookies se pueden compartir entre múltiples aplicaciones web siempre que estén configuradas para aplicarse a cualquier ruta en el servidor. De forma predeterminada, el navegador envía cookies solo a las URL que tienen el mismo prefijo que la primera de la que recibió las cookies. Por ejemplo, si el servidor envía una cookie desde la página asociada con http:// host /path1/SomeFile.jsp , el navegador envía la cookie de vuelta a http:// host /path1/SomeOtherFile.jsp y http:// host /ruta1/ruta2/Cualquier cosa , pero no a http:// host /ruta3/Cualquier cosa. Debido a que las aplicaciones web siempre tienen prefijos de URL únicos, este comportamiento significa que las cookies de estilo predeterminado nunca se compartirán entre dos aplicaciones web diferentes.
Sin embargo, como se describe en el Capítulo 8 del Volumen 1, puede usar el setPathmétodo de la Cookieclase para cambiar este comportamiento. Proporcionar un valor de "/", como se muestra aquí, indica al navegador que envíe la cookie a todas las URL en el host desde el que se recibió la cookie original:



ServletContextobjetos asociados con una URL específica. En un servlet, obtiene el contexto del servlet de la aplicación web llamando al getServletContextmétodo del propio servlet (heredado de GenericServlet). En una página JSP, utiliza la applicationvariable predefinida. De cualquier manera, obtiene el contexto de servlet asociado con el servlet o la página JSP que realiza la solicitud. Sin embargo, también puede llamar al getContextmétodo de ServletContextpara obtener un contexto de servlet, no necesariamente el suyo propio, asociado con una URL en particular. Este enfoque se ilustra aquí.


Ninguno de estos dos enfoques para compartir datos es perfecto.

El inconveniente de las cookies es que solo se pueden almacenar datos limitados en ellas. Cada valor de cookie es una cadena y la longitud de cada valor está limitada a 4 kilobytes. Por lo tanto, el intercambio sólido de datos requiere una base de datos: utiliza el valor de la cookie como clave en la base de datos y almacena los datos reales en la base de datos.

Un inconveniente de compartir contextos de servlet es que debe conocer el prefijo de URL que utiliza la otra aplicación web. Normalmente desea la libertad de cambiar el prefijo de una aplicación web sin cambiar ningún código asociado. El uso del getContextmétodo restringe esta flexibilidad. Un segundo inconveniente es que, por razones de seguridad, se permite que los servidores prohíban el acceso a ServletContextdeterminadas aplicaciones web. En tales casos, llama a getContextvolver null. Por ejemplo, en algunas versiones de Tomcat, el uso compartido de contexto está habilitado de forma predeterminada, mientras que en otras debe habilitarlo explícitamente. Por ejemplo, en Tomcat 5.5.7 puede agregar el atributo crossContext=“true”como parte del Contextelemento en tomcat_dir /conf/context.xml, habilitando el uso compartido de contexto como comportamiento predeterminado para todas las aplicaciones implementadas. Omitir el crossContextatributo por completo hace que Tomcat use su comportamiento predeterminado, que es prohibir el uso compartido ServletContextentre aplicaciones web.

Estos dos enfoques de intercambio de datos se ilustran con los servlets SetSharedInfoy que se muestran en los Listados 1.5 y 1.6 . Estos servlets se asignan a URL en el descriptor de implementación, como se muestra en el Listado 1.7 . El servlet crea entradas personalizadas en el objeto de sesión y el contexto del servlet. También establece dos cookies: una con la ruta predeterminada, que indica que la cookie debe aplicarse solo a las URL con el mismo prefijo de URL que la solicitud original, y otra con una ruta de , que indica que la cookie debe aplicarse a todas las URL en el host . . Finalmente, el servlet redirige al cliente alShowSharedInfoSetSharedInfo"/"SetSharedInfoShowSharedInfoservlet, que muestra los nombres de todos los atributos de sesión, todos los atributos en el contexto de servlet actual, todos los atributos en el contexto de servlet que se aplica a las URL con el prefijo / shareTest1 y todas las cookies.

Listado 1.5. SetSharedInfo.java



Listado 1.6. ShowSharedInfo.java







Listado 1.7. web.xml





Al ejecutar este ejemplo, asegúrese de invocar solo el SetSharedInfoservlet de la aplicación shareTest1 . Después de eso, invoque el ShowSharedInfoservlet de las aplicaciones shareTest1 y shareTest2 . No invoque el ShowSharedInfoservlet de shareTest2 ya que esto no ilustrará el intercambio de datos entre las dos aplicaciones.

La Figura 1-9 muestra el resultado después de que el usuario visita los servlets SetSharedInfoy ShowSharedInfodesde la aplicación web a la que se le asigna /shareTest1 como prefijo de URL. El ShowSharedInfoservlet ve:

El atributo de sesión personalizado.
Los atributos personalizados (creados explícitamente por el SetSharedInfoservlet) y estándar (creados automáticamente por el servidor) que están contenidos en el contexto del servlet predeterminado.
Los atributos personalizados y estándar que están contenidos en el contexto de servlet que se encuentra por medio de getContext("/shareTest1"), que en este caso es el mismo que el contexto de servlet predeterminado.
Las dos cookies creadas explícitamente y la cookie creada por el sistema utilizada en segundo plano por la API de seguimiento de sesión.
Figura 1-9. Resultado de visitar los servlets SetSharedInfoy ShowSharedInfodesde dentro de la misma aplicación Web.



La Figura 1-10 muestra el resultado cuando el usuario visita más tarde una copia idéntica del ShowSharedInfoservlet que está instalado en una aplicación web que tiene /shareTest2 como prefijo de URL. El servlet ve:

Los atributos estándar que están contenidos en el contexto de servlet predeterminado.
Los atributos personalizados y estándar que están contenidos en el contexto de servlet que se encuentra por medio de getContext("/shareTest1"), que en este caso es diferente del contexto de servlet predeterminado.
Dos cookies: la creada explícitamente que tiene su ruta establecida en "/"y la creada por el sistema que se usa en segundo plano para el seguimiento de la sesión (que también usa una ruta personalizada de "/").
Figura 1-10. Resultado de visitar el SetSharedInfoservlet en una aplicación web y el ShowSharedInfoservlet en una aplicación web diferente.



El servlet no ve:

Cualquier atributo en su objeto de sesión.
Cualquier atributo personalizado contenido en el contexto de servlet predeterminado.
La cookie creada explícitamente que utiliza la ruta predeterminada.
