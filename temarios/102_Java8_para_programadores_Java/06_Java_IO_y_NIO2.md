# 6. Java I/O y NIO.2 105m

   * Uso de flujos de salida 19:34 
   * Uso de flujos de entrada 22:13 
   * Trabajar con la clase file 7:09 
   * Trabajar con la interfaz path 13:30 
   * Utilizar métodos de la clase files 13:55 
   * Uso de API Stream con NIO.2 9:07 
   * Práctica de uso de Java NIO.2 19:51 
   * Contenido adicional 21
   
## Uso de flujos de salida 19:34 

[Uso de flujos de salida ](pdfs/23_Uso_de_flujos_de_salida.pdf)

### 23.1 Flujos

Son un canal de comunicación de las operaciones de entrada salida. Este esquema nos da independencia para poder trabajar igual tanto si estamos escribiendo en un fichero, como en consola, o si estamos leyendo de teclado, o de una conexión de red.

### 23.2 Tipos de Flujos

Dependiendo de su destino, tenemos:

* Flujos de entrada: sirven para introducir datos en la aplicación.
* Flujos de salida: sirven para sacar datos de la aplicación.

Dependiendo del contenido del flujo:

* Flujos de bytes: manejan datos en *crudo*.
* Flujos de caracteres: manejan caracteres o cadenas.

### 23.3 Flujos de salida

#### 23.3.1 Patrón básico de los flujos de salida

```
Abrir el flujo
Mientras hay datos que escribir
  Escribir datos en el flujo
Cerrar el flujo
```

#### 23.3.2 Flujos de salida de bytes

Algunas de las clases que podemos usar son:

* `OutputStream`: clase abstracta, padre de la mayoría de los flujos de bytes.
* `FileOutputStream`: flujo que permite escribir en un fichero, byte a byte.
* `BufferedOutputStream`: flujo que permite escribir grupos (buffers) de bytes.
* `ByteArrayOutputStream`: flujo que permite escribir en memoria, obteniendo lo escrito en un array de bytes.

#### 23.3.3 Flujos hacia otros flujos

Solo FileOutputStream tiene un constructor que acepta una ruta (entre otras opciones). El resto reciben en sus constructores un tipo de OutputStream. ¿Por qué? Porque podemos construir flujos que escriben en flujos (encadenados).

```java
BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream("fichero.dat"));
```

#### 23.3.4 Flujos de salida de caracteres

* `Writer`: clase abstracta, padre de la mayoría de los flujos de caracteres.
* `FileWriter`: flujo que permite escribir en un fichero, caracter a caracter.
* `BufferedWriter`: flujo que permite escribir líneas de texto.
* `StringWriter`: flujo que permite escribir en memoria, obteniendo lo escrito en un String
* `OutputStreamWriter`: flujo que permite transformar un OutputStream en un Writer.
* `PrintWriter`: flujo que permite escribir tipos básicos Java.

<img src="images/stream.png">

## Uso de flujos de entrada 22:13 

[Uso de flujos de entrada](pdfs/24_Flujos_de_entrada.pdf)

## 24.1 Patrón básico de los flujos de entrada

```
Abrir el flujo
Mientras hay datos que leer
  Leer datos del flujo
  Procesar los datos
Cerrar el flujo
```

## 24.2 Flujos de entrada de bytes

Algunas de las clases que podemos usar son:

* `InputStream`: clase abstracta, padre de la mayoría de los flujos de bytes.
* `FileInputStream`: flujo que permite leer de un fichero, byte a byte.
* `BufferedInputStream`: flujo que permite leer grupos (buffers) de bytes.
* `ByteArrayInputStream`: flujo que permite leer de memoria (de un array de bytes).

## 24.3 Flujos de entrada de caracteres

Algunas de las clases que podemos usar son:

* `Reader`: clase abstracta, padre de la mayoría de los flujos de caracteres.
* `FileReader`: flujo que permite leer de un fichero, caracter a caracter.
* `BufferedReader`: flujo que permite leer líneas de texto.
* `StringReader`: flujo que permite leer desde la memoria.
* `InputStreamReader`: flujo que permite transformar un InputStream en un Reader.

## Trabajar con la clase file 7:09 

[Trabajar con la clase file](pdfs/25_Trabajar_con_la_clase_File.pdf)

### 25.1 Clase `File`

Esta clase fue fundamental para el manejo de ficheros y directorios hasta Java SE 6. A partir de Java SE 7 tenemos a nuestra disposición las clases y métodos de Java NIO.2, que estudiaremos en próximas lecciones.

### 25.2 Creación de un File

```java
File f = new File("./", "nuevo.txt");
f.createNewFile();
```

## Trabajar con la interfaz path 13:30 

[Trabajar con la interfaz path](pdfs/26_Trabajar_con_la_interfaz_Path.pdf)

### 26.1 Introducción

Un *path* o ruta es una forma de identificar (y acceder) un fichero o un directorio dentro del sistema de ficheros.

Decimos que una ruta es **absoluta** cuando contiene el elemento raíz y la lista de directorios completa para localizar el fichero. Por contrario, decimos que es **relativa** cuando necesita ser combinada para acceder al fichero o directorio.

### 26.2 Clase Path

Se introdujo en Java SE 7, como parate de Java NIO.2. Representa una ruta en el sistema de ficheros, y permite manejar diferentes sistemas de ficheros (Windows, Linux, Mac, …). Contiene el nombre del fichero, así coo la lista de directorios usada para construir la ruta.

## Utilizar métodos de la clase files 13:55 

[Utilizar métodos de la clase files](pdfs/27_Utilizar_los_métodos_de_la_clase_Files.pdf)

En esta sección vemos la clase flies, que tiene decenas de métodos estáticos para hacer múltiples operaciones con ficheros y directorios.

## Uso de API Stream con NIO.2 9:07 

[Uso de API Stream con NIO.2](pdfs/28_Uso_del_API_Stream_con_NIO_2.pdf)

En esta lección pondremos en práctica lo que acabamos de aprender de la API Stream con NIO.2

## Práctica de uso de Java NIO.2 19:51 

Práctica de uso de Java NIO.2

## Contenido adicional 21   

[Uso de flujos de salida ](pdfs/23_Uso_de_flujos_de_salida.pdf)

[Uso de flujos de entrada](pdfs/24_Flujos_de_entrada.pdf)

[Trabajar con la clase file](pdfs/25_Trabajar_con_la_clase_File.pdf)

[Trabajar con la interfaz path](pdfs/26_Trabajar_con_la_interfaz_Path.pdf)

[Utilizar métodos de la clase files](pdfs/27_Utilizar_los_métodos_de_la_clase_Files.pdf)

[Uso de API Stream con NIO.2](pdfs/28_Uso_del_API_Stream_con_NIO_2.pdf)

[Aemet20171029.csv](prfs/Aemet20171029.csv)

[Aemet20171030.csv](prfs/Aemet20171030.csv)

[Aemet20171031.csv](prfs/Aemet20171031.csv)

[Aemet2017-10-28.xls](prfs/Aemet2017-10-28.xls)
 
[Aemet2017-10-29.xls](prfs/Aemet2017-10-29.xls)
 
[Aemet2017-10-30.xls](prfs/Aemet2017-10-30.xls)
 
[Aemet2017-10.rar](prfs/Aemet2017-10.rar)
 
