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

7. En **System variables**, haga clic en **New**, ingrese los siguientes valores en el cuadro de diálogo **Edit System variable** y haga clic en **OK**:

   * Variable name: **`Path`**

   * Variable value: **`%M2%`** (Ingrese el valor después de **`bin`** en la ruta del sistema)

   <img width="616" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/fe96868d-2dca-410d-80e1-3e14b34fa0de">

8. Verifique la instalación de Maven:

   ```sh
   mvn -version
   ```

   <img width="843" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/7c32741e-2ddd-48fa-9313-fec80f5020a7">

   El resultado muestra la versión de Maven instalada, la versión de Java, el inicio de Java, la configuración regional predeterminada y el nombre del sistema operativo.

 
## Crear un Java SE Project desde un Maven Template

1. Abra el command prompt, navegue hasta el directorio donde instaló Maven y cree **`Maven_app`**, una carpeta de aplicación Java basada en Maven:

   ```sh
   mvn archetype:generate -DgroupId=com.example.bank
   -DartifactId=OracleBanking
   -DarchetypeArtifactId=maven-archetype-quickstart
   -DinteractiveMode=false
   ```
   
   Un arquetipo es un pattern/model original para crear proyectos similares. En Maven, un arquetipo es una plantilla de un proyecto que se combina con la entrada del usuario para producir un proyecto Maven funcional. La siguiente tabla describe lo que hace la plantilla:

   <img width="980" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/0c465e4d-d254-41ed-8e6a-1d2440d8df56">

   Se crea el Java project llamado **`OracleBanking`**. La siguiente tabla presenta los detalles del proyecto:

   <img width="1264" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/cf51c03b-1d52-41ac-b491-709245e9c6d3">

2. Abra el proyecto **`OracleBanking`** y verifique el archivo fuente de Java:

   **`App.java`**

   <img width="725" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/d3fce2d8-4e68-4ef8-863e-ebae5490097d">

3. Verifique el Java test file:

   **`AppTest.java`**

   <img width="604" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/614c5722-819a-41a7-9525-538ea33bacf3">

   De forma predeterminada, Maven agrega el archivo fuente **`App.java`** y el archivo de prueba **`AppTest.java`** a la estructura de directorio predeterminada.

4. Abra el archivo **`pom.xml`** y revise el código.

   <img width="673" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/2c5af054-cb39-4428-a6c0-a9837911a448">

   Cada proyecto tiene un único archivo **`pom.xml`**, y cada archivo **`pom.xml`** tiene un project element y tres mandatory fields(campos obligatorios): **`groupId`**, **`artifactId`** y **`version`**. Observe que Maven ya ha agregado **JUnit** como test framework. La siguiente tabla describe lo que hace cada nodo:

   <img width="972" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a517e554-38fd-4d26-90d9-1ac53e15021f">

 
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
