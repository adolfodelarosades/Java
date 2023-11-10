# Building and Running a Java SE Application by Using Maven

https://www.oracle.com/webfolder/technetwork/tutorials/obe/java/Maven_SE/Maven.html

## Antes de que empieces

### Objetivo

En este tutorial, creará y compilará una aplicación **Java Platform, Standard Edition (Java SE)** utilizando **Maven**. Usted instala, configura, construye y crea un archivo **Java Archive (JAR)** ejecutable con Maven.

### Tiempo para completar

Aproximadamente 90 minutos

### Fondo

Maven es una herramienta de gestión de compilación fundamental para tareas de compilación de proyectos, como compilación, empaquetado y gestión de artefactos. Maven utiliza un estricto conjunto de reglas basadas en XML para promover la coherencia y al mismo tiempo mantener la flexibilidad. Debido a que la mayoría de los sistemas de integración continua centrados en Java se integran bien con Maven, es una buena opción para un sistema de compilación subyacente.

El objetivo principal de Maven es proporcionar:

* Un modelo de proyecto que es reutilizable, mantenible y más fácil de comprender.

* Complementos o herramientas que interactúan con el modelo declarativo.

La estructura y el contenido del proyecto Maven se declaran en el archivo **`pom.xml`**. El **Project Object Model (POM)** 
 - Modelo de Objetos del Proyecto es la unidad fundamental de todo el sistema Maven.

Maven contiene tres tipos de repositorios para almacenar JARs, complementos y otros artefactos relacionados con el proyecto:

* **Local Repository**: la ubicación creada en su máquina cuando ejecuta su primera instancia de un comando Maven en su máquina.

* **Central Repository**: el repositorio propiedad de la comunidad Maven que contiene bibliotecas de uso común.

* **Remote Repository**: un repositorio personalizado propiedad del desarrollador que contiene bibliotecas y archivos JAR relacionados con el proyecto.

### ¿Qué necesitas?

* Descargue e instale el último [Java SE Development Kit](https://www.oracle.com/java/technologies/downloads/#java8). Para este tutorial, la versión disponible es **Java SE 8**.
* Descargue [Apache Maven](https://maven.apache.org/download.cgi). Para este tutorial, la versión disponible es **3.2.2**.
 
## Configurando el entorno Maven

En esta sección, extrae el archivo descargado e instala la última versión de Maven en el directorio que elija. Usted verifica la instalación de Java, configura el entorno de Maven y verifica la instalación de Maven.

1. Verifique la instalación de Java:

   ```sh
   java -version
   ```

   <img width="830" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/f4fca1f2-b9ee-462c-bf2a-19cd389d8b53">

   El resultado muestra la versión de Java que instaló.

2. Extraiga el archivo Maven x.x.x descargado a un directorio local.

   Los nombres de los archivos son:

   * **Windows OS**: apache-maven-3.2.2-bin.zip

   * **Linux OS**: apache-maven-3.2.2-bin.tar.gz

   * **Mac OS**: apache-maven-3.2.2-bin.tar.gz

   **Nota**: Este OBE le muestra cómo instalar y crear una aplicación Java SE usando Maven en un sistema operativo Windows.

3. Haga clic en **Start**, haga clic con el botón derecho en **Computer** y seleccione **Properties**.

   <img width="869" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ce3293f2-4c91-484a-ad04-b5e7cf4cd255">

4. En la página de inicio del **Control Panel**, haga clic en **Advanced system settings**.

   <img width="624" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/de96e593-8b91-4dc7-bda1-a862ee3d08bc">

5. En el cuadro de diálogo **System Properties**, haga clic en la pestaña **Advanced** y luego haga clic en **Environment Variables**.

   <img width="669" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/36e5dd62-03ab-4ee3-8470-99fd5febedff">

   Se muestra el cuadro de diálogo **Environment Variables**.

6. Haga clic en **New**, agregue M2, M2_HOME,y MAVEN_OPTS a las variables de entorno y haga clic en **OK**.

   <img width="623" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/26d16b8a-c676-4858-84d6-dfe6901b0922">

7. En **System variables**, haga clic en Nuevo, ingrese los siguientes valores en el cuadro de diálogo Editar variable del sistema y haga clic en Aceptar:

Nombre de la variable:Path

Valor de la variable: %M2%(Ingrese el valor después binen la ruta del sistema)

descripción alternativa aquí
Verifique la instalación de Maven:

mvn -version

El resultado muestra la versión de Maven instalada, la versión de Java, el inicio de Java, la configuración regional predeterminada y el nombre del sistema operativo.

 
Crear un proyecto Java SE a partir de una plantilla Maven
Abra el símbolo del sistema, navegue hasta el directorio donde instaló Maven y cree Maven_app,una carpeta de aplicación Java basada en Maven:

mvn archetype:generate -DgroupId=com.example.bank
   -DartifactId=OracleBanking
   -DarchetypeArtifactId=maven-archetype-quickstart
   -DinteractiveMode=false
Un arquetipo es un patrón/modelo original para crear proyectos similares. En Maven, un arquetipo es una plantilla de un proyecto que se combina con la entrada del usuario para producir un proyecto Maven funcional. La siguiente tabla describe lo que hace la plantilla:

ID de artefactos de arquetipo	Descripción
mvn archetype:generate	Crea un proyecto
-DgroupId=com.example.bank	Crea la com.example.bank estructura del paquete de dependencia.
maven-archetype-quickstart	Crea un proyecto Java
-DinteractiveMode=false	Establece el modo interactivo enfalse
OracleBanking Se crea el proyecto Java nombrado . La siguiente tabla presenta los detalles del proyecto:

Estructura del proyecto	Descripción
OracleBanking	Contiene srccarpeta ypom.xml
src/main/java	Contiene archivos de código Java bajo la estructura del paquete
( com.example/bank)
src/test	Contiene archivos de código de prueba bajo la estructura del paquete
( com.example/bank)
pom.xml	Contiene información sobre el proyecto y detalles de varias configuraciones utilizadas por Maven para construir el proyecto.
Abra el OracleBankingproyecto y verifique el archivo fuente de Java:

App.java

Verifique el archivo de prueba de Java:
AppTest.java


De forma predeterminada, Maven agrega el App.java archivo fuente y el AppTest.java archivo de prueba a la estructura de directorio predeterminada.

Abra el pom.xmlarchivo y revise el código.


Cada proyecto tiene un único pom.xml archivo, y cada pom.xmlarchivo tiene un elemento de proyecto y tres campos obligatorios: groupId, artifactId,y version. Observe que Maven ya ha agregado JUnit como marco de prueba. La siguiente tabla describe lo que hace cada nodo:

Nodo	Descripción
project	Elemento de nivel superior en todos pom.xml los archivos Maven
modelVersion	Versión del modelo de objetos que utiliza este POM
groupId	ID del grupo del proyecto (por ejemplo, com.example.bank)
artifactId	ID del proyecto (por ejemplo, OracleBanking)
packaging	Archivos de proyecto convertidos en un archivo JAR
version	Versión del proyecto utilizada en el repositorio del artefacto para separar cada versión (por ejemplo, 1.0-SNAPSHOT)
name	Nombre para mostrar del proyecto
url	Ubicación del sitio del proyecto. 
 
Crear y modificar archivos fuente de Java
En esta sección, calculará el interés simple creando el SimpleInterest.java archivo fuente y modificándolo App.java .
Navegue hasta el directorio donde creó su proyecto Maven y luego abra la ubicación especificada:

\**\Maven_app\OracleBanking\src\main\java\com\example\bank

Cree un archivo fuente Java llamadoSimpleInterest.java.


Edite el SimpleInterest.javaarchivo con el siguiente código:

package com.example.bank;                                                                                                   public class SimpleInterest{                                                                                                     public static double calculateSimpleInterest(double amount,
             double years,
             double rate_of_interest) {
    double simple_interest;
    simple_interest = amount * years * rate_of_interest;
    return simple_interest;
     }                                                                                                                       }                                                         
El calculateSimpleInterest método calcula la tasa de interés sobre el monto del préstamo, la duración del préstamo y la tasa de interés anual.

Presione Ctrl+S y cierre el archivo.

Modificar App.javacon el siguiente código:

double result = SimpleInterest.calculateSimpleInterest(10000, 5, 7);
System.out.println("The simple interest is:" + result);                                                                                                                                                                                                 public static double calculateSimpleInterest(double amount,
        double years,
        double rate_of_interest) {
    double simple_interest;
    simple_interest = amount * years * rate_of_interest;
    return simple_interest;
} 
Revisa el código. Debería verse como el siguiente:


Presione Ctrl+S y cierre el archivo.

 
Creando un manifiesto con Maven
En esta sección, aprenderá a utilizar maven-jar-plugin para crear un archivo de manifiesto y empaquetarlo agregándolo al archivo JAR.

El archivo de manifiesto realiza las siguientes tareas:
Define el punto de entrada del proyecto y crea un archivo JAR ejecutable.
Agrega la ruta de clase de las dependencias del proyecto.
Edite el pom.xmlarchivo:
<build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
                <version>2.4</version>
                <configuration>
                    <archive>
                        <manifest>
                            <mainClass>com.example.bank.App</mainClass>
                        </manifest>
                    </archive>
                </configuration>
            </plugin>
        </plugins>
    </build>                     
Lo definiste maven-jar-pluginy pom.xml, configuraste dentro de la etiqueta de configuración.

Revisa el código. Debería verse como el siguiente:


En el proyecto Maven, usted especifica los detalles de la clase principal actualizando el pom.xml archivo. La com.example.bank.App clase en el proyecto es la clase principal que se ejecutará cuando ejecute el archivo JAR.

Presione Ctrl+S y cierre el archivo.

Actualizaste exitosamente tu pom.xml archivo.

 
Probar, crear y ejecutar la aplicación con Maven
 
Probar la aplicación
En esta sección, aprenderá cómo probar su aplicación utilizando AppTest.java la interfaz de línea de comandos (CLI) de Maven.

Importar el paquete aAppTest.java:

import junit.framework.Assert;
Edite el AppTestmétodo:

 double result=App.calculateSimpleInterest(10000,5,7);
 Assert.assertEquals("Test failed. ",35000.0,result);   
Revisa el código. Debería verse como el siguiente:

descripción alternativa aquí
Modificó el valor de interés simple y luego verificó el valor mediante declaraciones de afirmación en el caso de prueba JUnit.

Presione Ctrl+S y luego ejecute los casos de prueba dentro AppTest.javadel OracleBanking proyecto.

mvn test
Revise el resultado.

descripción alternativa aquí
El caso de prueba falló y se muestra el mensaje de error de afirmación.

ModificarAppTest.java:

 Assert.assertEquals("Test failed. ", 350000.0, result);  
descripción alternativa aquí
Modificó el valor de interés simple y luego verificó el valor mediante declaraciones de afirmación en el caso de prueba JUnit.

Presione Ctrl+S y luego ejecute los casos de prueba en AppTest.java:

mvn test
descripción alternativa aquí
El caso de prueba se ejecutó correctamente y se muestra un mensaje de compilación exitosa.

 
Construyendo la aplicación
 
Empaquetar y ejecutar la aplicación
 
¿Querer aprender más?
Guía rápida de Maven
Guía de introducción a Maven
Instalación y configuración de Maven para la automatización de compilaciones y la gestión de dependencias en Oracle Fusion Middleware Desarrollo de aplicaciones mediante integración continua
 
Créditos
