# Chapter 2: Setting Up Maven

* Installing on Windows
* Installing on Mac
* Testing Installation
* Getting Help
* Additional Settings
* Setting Up a Proxy
   * Securing Passwords
* IDE Support
* Summary

La instalación de Maven es un proceso sencillo y directo. Este capítulo explica cómo instalar y configurar Maven usando los sistemas operativos Windows 10 y Mac. Puede seguir un procedimiento similar con otros sistemas operativos.

> **NOTA**
> 
> Maven es una aplicación basada en Java y requiere Java Development Kit (JDK) para funcionar correctamente. La versión 3.6 de Maven requiere JDK 1.7 o superior. Antes de continuar con la instalación de Maven, asegúrese de tener Java instalado. De lo contrario, instale JDK (no solo Java Runtime Environment [JRE]) desde www.oracle.com/technetwork/java/javase/downloads/index.html. Asegúrese de tener la variable de entorno JAVA_HOME configurada y apuntando a la instalación de JDK. En este libro, usaremos JDK 8.
 
Comenzará el proceso de instalación descargando la última versión de Maven del sitio web de Apache Maven (http://maven.apache.org/download.html). En el momento de escribir este artículo, la última versión es 3.6.1. Descargue el archivo `.zip` binario de Maven 3.6.1 como se muestra en la Figura 2-1.

![02-01](images/02-01.png)

***Figura 2-1*** Descarga del archivo Maven

Una vez que se complete la descarga, descomprima la distribución en un directorio local en su computadora. Creará una carpeta llamada `apache-maven-3.6.1-bin` y el contenido de la carpeta se muestra en la Figura 2-2.

![02-02](images/02-02.png)

***Figura 2-2*** Contenido del directorio de instalación de Maven

La carpeta `bin` contiene ejecutables Maven específicos de la plataforma: archivo `mvn.cmd` para Windows y `mvn.sh` para plataformas Mac y Unix/Linux que puede usar para iniciar Maven. Las versiones de depuración de estos ejecutables, `mvnDebug.cmd` y `mvnDebug.sh`, incluyen argumentos de depuración que le permiten adjuntar un IDE a un proceso Maven en ejecución para la depuración remota.

Esa carpeta de arranque contiene el archivo “plexus-classworlds-2.5.2.jar”. Maven usa el marco Plexus Classworlds (https://codehaus-plexus.github.io/plexus-classworlds/) para construir su gráfico de cargador de clases.

La carpeta `conf` contiene archivos de configuración que puede utilizar para modificar los comportamientos predeterminados de Maven. Un archivo importante en esta carpeta es el archivo `settings.xml` que cubriremos más adelante en este capítulo. Otro archivo clave es el archivo `simplelogger.properties` que le permite controlar el registro de Maven. Por ejemplo, el nivel de registro se puede cambiar para depurar estableciendo la propiedad `defaultLogLevel` en depuración. De manera similar, puede cambiar la propiedad `logFile` para escribir la salida del registro de `"System.out"` en un archivo.

Finalmente, la carpeta `lib` contiene las bibliotecas que son esenciales para que Maven y sus complementos se ejecuten correctamente.

## Instalación en Windows

Mueva el contenido de apache-maven-3.6.0-bin a un nuevo directorio `c:\tools\maven`. El siguiente paso es agregar el ejecutable de Maven a la variable de entorno PATH para que pueda ejecutar los comandos de Maven desde la línea de comandos. En el cuadro de búsqueda de Windows, busque "Variable de entorno" y seleccione "Editar las variables de entorno del sistema". En la ventana resultante, haga clic en el botón Variables de entorno, seleccione la variable PATH y haga clic en Editar. Haga clic en Nuevo e introduzca el valor `“C:/tools/maven/bin”` y haga clic en Aceptar.

## Instalación en Mac

Mueva el contenido de la carpeta `apache-maven-3.6.0-bin` a `$HOME/tools/maven` donde `$HOME` es su directorio de inicio en Mac. Edite el archivo `.bash_profile` ejecutando el comando `nano ~/.bash_profile`. Agregue el ejecutable de Maven a la variable PATH agregando la siguiente línea a `.bash_profile`:

```sh
export PATH=$HOME/tools/maven/bin:$PATH
```

Esto completa la instalación de Maven. Si tiene alguna ventana/terminal de línea de comandos abierta, ciérrela y vuelva a abrir una nueva ventana de línea de comando. Cuando se agregan o modifican variables de entorno, los nuevos valores no se propagan para abrir ventanas de línea de comandos automáticamente.


> Variable de entorno Maven_Opts
> 
> Al usar Maven, especialmente en un proyecto complejo, es probable que se encuentre con errores de OutOfMemory. Esto puede suceder, por ejemplo, cuando está ejecutando una gran cantidad de pruebas JUnit o cuando está generando una gran cantidad de informes. Para solucionar este error, aumente el tamaño del montón de la máquina virtual Java (JVM) utilizada por Maven. Esto se hace globalmente creando una nueva variable de entorno llamada `MAVEN_OPTS`. Para empezar, recomendamos utilizar el valor `-Xmx512m`.

## Probando la Instalación

Ahora que Maven está instalado, es hora de probar y verificar la instalación. Abra un símbolo del sistema y ejecute el siguiente comando:

```sh
mvn –v
```

En una máquina con Windows, este comando debería generar información similar a la siguiente:

```sh
C:\> mvn –v
Apache Maven 3.6.1 (d66c9c0b3152b2e69ee9bac180bb8fcc8e6af555; 2019-04-04T13:00:29-06:00)
Maven home: C:\tools\maven\bin\..
Java version: 1.8.0_144, vendor: Oracle Corporation, runtime: C:\Java\jdk1.8.0_144\jre
Default locale: en_US, platform encoding: Cp1252
OS name: "windows 10", version: "10.0", arch: "amd64", family: "windows"
```

La opción de línea de comandos `–v` indica la ruta donde está instalado Maven y qué versión de Java está usando. También obtendría los mismos resultados ejecutando el comando expandido `mvn --version`.

## Obteniendo ayuda

Puede obtener una lista de las opciones de la línea de comandos de Maven utilizando las opciones `-h` o `--help`. La ejecución del siguiente comando producirá un resultado similar al que se muestra en la Figura 2-3.

```sh
mvn -h
```

![02-03](images/02-03.png)

## Ajustes adicionales

Los pasos de instalación que hemos proporcionado hasta ahora son suficientes para comenzar con Maven. Sin embargo, para la mayoría de los usos empresariales, debe proporcionar información de configuración adicional. Esta configuración específica del usuario se proporciona en un archivo `settings.xml`. Maven busca el archivo `settings.xml` en dos ubicaciones: en la carpeta `conf` de la instalación de Maven y la carpeta `.m2` en el directorio de inicio del usuario. El archivo `settings.xml` de la carpeta `conf` se denomina configuración global y el archivo de la carpeta `.m2` se denomina configuración de usuario. Si ambos archivos existen, Maven fusionará el contenido de dos archivos y la configuración del usuario tendrá prioridad.

> **Nota**
> 
>  La carpeta `.m2` es importante para el buen funcionamiento de Maven. Entre muchas cosas, esta carpeta contiene un archivo `settings.xml` y una carpeta `repository`. La carpeta `repository` contiene archivos JAR de plug-in y metadatos que requiere Maven. También contiene los archivos JAR dependientes del proyecto que Maven descargó de Internet. Examinaremos más de cerca esta carpeta en el Capítulo 3.
>
> De forma predeterminada, la carpeta `.m2` se encuentra en su directorio personal. En Windows, este directorio suele ser `c:\Users\<<your_user_name>>`. En Mac, este directorio suele ser `/Users/<<your_user_name>>/.m2/repository`. Puede ejecutar el comando `mvn help:evaluate -Dexpression=settings.localRepository` para identificar la ubicación del repositorio local.
> 
> Cuando ejecuta un comando de Maven, Maven crea automáticamente la carpeta `.m2`. Sin embargo, si no ve esta carpeta en su computadora, continúe y cree una.

Fuera de la caja, la carpeta `.m2` no contiene un archivo `settings.xml`. En la carpeta `.m2` de su computadora local, cree un archivo `settings.xml` y copie el contenido del archivo esqueleto `settings.xml` como se muestra en el Listado 2-1. Cubriremos algunos de estos elementos en los próximos capítulos. En la Tabla 2-1 se proporciona una breve descripción de algunos de los elementos.

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          http://maven.apache.org/xsd/settings-1.0.0.xsd">
      <localRepository/>
      <interactiveMode/>
      <offline/>
      <pluginGroups/>
      <servers/>
      <mirrors/>
      <proxies/>
      <profiles/>
      <activeProfiles/>
</settings>
```

***Listado 2-1*** Contenido Skeleton `Settings.xml` 

***Tabla 2-1** Detalles de los elementos `settings.xml`

Nombre del elemento | Descripción
--------------------|------------
`localRepository`   | Maven almacena copias de complementos y dependencias localmente en la carpeta `c:\Users\<<your_user_name>>\.m2\repository`. El elemento `localRepository` se puede utilizar para cambiar la ruta del repositorio local. Por ejemplo, `<localRepository>c:\mavenrepo</localRepository>` cambiará la ubicación del repositorio a la carpeta `mavenrepo`. 
`interactiveMode`   | Como sugiere el nombre, cuando este valor se establece a `true`, Maven interactúa con el usuario para la entrada. Si el valor es `false`, Maven intentará utilizar valores predeterminados razonables. El default es `true`.
`offline`           | Cuando se establece a `true`, esta configuración le indica a Maven que no se conecte a la red y opere en modo fuera de línea. Con el modo fuera de línea establecido a `true`, Maven no intentará descargar nuevas dependencias o actualizaciones a las dependencias. El valor predeterminado es `false`.
`servers`           | Maven puede interactuar con una variedad de servidores, como servidores Git, build servers y servidores de repositorio remoto. Este elemento le permite especificar las credenciales de seguridad, como el nombre de usuario y la contraseña, que necesita para conectarse a esos servidores.
`mirrors`           | Como sugiere el nombre, los espejos le permiten especificar ubicaciones alternativas para descargar dependencias de repositorios remotos. Por ejemplo, su organización podría haber duplicado un repositorio público en su red interna. El elemento mirror le permite forzar a Maven a usar el repositorio reflejado interno en lugar del repositorio público.
`proxies`           | Los proxies contienen la información del proxy HTTP necesaria para conectarse a Internet.

## Configurar un Proxy

Como discutiremos en detalle en el Capítulo 3, Maven requiere una conexión a Internet para descargar complementos y dependencias. Algunas empresas emplean proxies HTTP para restringir el acceso a Internet. En esos escenarios, ejecutar Maven provocará que no se puedan descargar errores de artefactos. Para solucionar este problema, edite el archivo `settings.xml` y agregue la información de proxy específica de su empresa. En el Listado 2-2 se muestra una configuración de muestra.

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <proxies>
    <proxy>
      <id>companyProxy</id>
      <active>true</active>
      <protocol>http</protocol>
      <host>proxy.company.com</host>
      <port>8080</port>
      <username>proxyusername</username>
      <password>proxypassword</password>
      <nonProxyHosts />
    </proxy>
  </proxies>
 </settings>
```

***Listado 2-2*** `Settings.xml` con contenido de proxy

### SECURING PASSWORDS

La contraseña para conectarse al servidor proxy en la sección 2-2 se almacena en texto sin cifrar en el archivo `settings.xml`. Si compartiera accidentalmente su archivo `settings.xml`, su contraseña se verá comprometida. Para abordar esto, Maven proporciona un mecanismo para cifrar las contraseñas que se almacenan en el archivo `settings.xml`.

Comenzamos el proceso de encriptación creando una contraseña maestra usando el siguiente código:

```sh
mvn -emp mymasterpassword
{LCWw0+NAqw0HuYH9HNz+1D7aElXM242PtuyoDXDAuelxjwZC8MyXaACkHSy7tZwU}
```

Maven requiere que la contraseña maestra recién generada se guarde en un archivo `settings-security.xml` en la carpeta `.m2`. Cree un nuevo archivo `settings-security.xml` en la carpeta `.m2` y copie el siguiente contenido en ese archivo.

```sh
<settingsSecurity>
<master>{LCWw0+NAqw0HuYH9HNz+1D7aElXM242PtuyoDXDAuelxjwZC8MyXaACkHSy7tZwU}</master>
</settingsSecurity>
```

Ejecute el siguiente comando para cifrar la contraseña `"proxypassword"`. Una vez que se complete el comando, copie la salida y reemplace la contraseña de texto sin cifrar en el archivo `settings.xml` por ella:

```sh
mvn -ep proxypassword
{i4RnaIHgxqgHyKYySxor+cvshmHweTAvNjuORNYyu5w=}
```

Aunque el proceso anterior cifra las contraseñas y evita la necesidad de guardar las contraseñas en texto sin cifrar, es importante recordar que cualquier persona que tenga acceso al archivo `settings-security.xml` puede decodificar fácilmente la contraseña maestra y posteriormente descifrar las contraseñas en la configuración `settings.xml`. Un mecanismo para solucionar este problema es almacenar el archivo `settings-security.xml` en un dispositivo externo como una unidad USB.

## Soporte IDE

A lo largo de este libro, usaremos la línea de comandos para crear y construir aplicaciones de muestra. Si está interesado en utilizar un IDE, la buena noticia es que todos los IDE modernos vienen con una integración completa de Maven sin necesidad de configuración adicional.

## Resumen

Este capítulo lo guió a través de la configuración de Maven en su computadora local. Aprendió que Maven descarga los complementos y los artefactos necesarios para su funcionamiento. Estos artefactos se almacenan en la carpeta `.m2\repository`. La carpeta `.m2` también contiene el archivo `settings.xml`, que se puede utilizar para configurar el comportamiento de Maven.
En el próximo capítulo, analizaremos en profundidad la gestión de dependencias de Maven.
