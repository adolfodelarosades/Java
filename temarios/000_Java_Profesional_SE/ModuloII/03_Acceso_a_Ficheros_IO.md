# 03 Acceso a Ficheros IO


Es habitual que en algunas ocasiones, una aplicación Java tenga que acceder a un fichero para leer información almacenada por algún tipo de dispositivo o programa, o incluso para guardar datos de la aplicación que posteriormente tengan que ser utilizadas por la misma.
El acceso a ficheros en Java se reduce a una operación de entrada y salida de datos, de hecho, se utilizan las mismas clases del java.io que se emplean para trasferir datos entre la aplicación y el exterior. Seguidamente, veremos cómo emplear estas clases de entrada y salida Java para poder intercambiar información con ficheros de texto
Escritura en un fichero
En la lección anterior vimos como la clase PrintStream es la clase principal del java.io para operaciones de salida en un programa Java, esta clase también nos servirá para poder escribir en un fichero
Utilización de PrintStream
Si lo que queremos es escribir información en un fichero, podemos utilizar también esta clase a partir de su constructor:
 PrintStream(String fileName)
Como vemos, solamente tendremos que proporcionar la dirección del fichero  sobre el que queremos escribir. Si el fichero está en el mismo directorio de la aplicación, solamente tendremos que proporcionar el nombre del mismo, sino, habrá que indicar la ruta completa.
Si el fichero no existe al crear el objeto PrintStream, se creará automáticamente, pero si la ruta de directorios indicada no existiera, entonces se producirá una excepción de tipo FileNotFoundException. Esta excepción es obligatorio capturarla cuando se crea el objeto, por lo tanto, tendremos que hacer uso de los bloque try catch:
try{
    PrintStream ps=new PrintStream("c:\\temporal\\datos.txt");

}
catch(FileNotFoundException ex){
:
}
Observa la utilización de la doble barra (\\) para el separador de carpetas, y es que la barra simple (\) se utiliza en Java para representar secuencias de escape, como \n para el salto de línea \t para el tabulador, \" para las comillas o \\ para la propia barra.
Una vez creado el objeto PrintStream, se pueden recurrir a los clásicos métodos print() y println() para la escritura de los datos.
Importante destacar también que el PrintStream debe ser cerrado después de haber sido utilizado a fin de optimizar los recursos del equipo. Dado que el cierre del fichero es algo de obligada realización, lo incluiremos dentro de un bloque finally. 
El siguiente bloque de instrucciones almacena dos cadenas en el fichero, una en cada línea, y asegura el cierre del fichero:
PrintStream ps=null;
try{
    ps=new PrintStream("c:\\temporal\\datos.txt");
    ps.println("cadena 1");
    ps.println("cadena 2);
}
catch(FileNotFoundException ex){
:
}
finally{
    //antes de cerrar, comprobamos que ha sido abierto
    if(ps!=null){
        ps.close();
    }
}
Desde la versión Java 7 es posible utilizar el try con recursos para el cierre automático de objetos. Al indicar la instrucción de creación del objeto en la apertura del bloque try, Java procederá al cierre de dicho objeto al finalizar o bloque o tras capturarse la excepción, por lo que no necesitaremos utilizar el bloque finally para llamar explícitamente a close(). Así quedaría el programa anterior con un try catch con recursos:

try(PrintStream ps = ps=new PrintStream("c:\\temporal\\datos.txt");)
{
    ps.println("cadena 1");
    ps.println("cadena 2);
}
catch(FileNotFoundException ex){
:
}

Date cuenta la declaración de la variable y la creación del objeto están en una misma instrucción, y esta debe indicarse entre los paréntesis del try.
El try con recursos puede emplearse con cualquier objeto que implemente la interfaz AutoCloseable
Escritura en modo append
La utilización de PrintStream para escribir en un fichero, tal y como la hemos presentado, opera en modo sobrescritura, lo que significa que cada vez que creamos el objeto PrintStream para escribir algo, el contenido anterior se borra. Si ejecutamos el código anterior varias veces, siempre veremos lo mismo en el fichero.
Si lo que queremos es añadir datos al fichero, manteniendo el contenido existente, entonces habrá que crear el objeto PrintStream en modo append, lo que podemos hacer utilizando el constructor más genérico:
PrintStream(OutputStream salida).
Con este constructor, en lugar de pasar la ruta del fichero tendremos que crear antes un objeto OutputStream que pueda ser configurado para añadir contenido al fichero. Una clase que cumple estas características es FileOutputStream, que dispone del siguiente constructor:
FileOutputStream(String name, boolean append)
En este podemos ver que, además de la ruta del fichero que se le proporciona como primer parámetro, podemos indicarle en el segundo parámetro el modo de escritura: true(modo append) o false(modo sobrescritura).
Así pues, si queremos volver a escribir el programa anterior para que almacene la información en el fichero, manteniendo su contenido anterior, sería:
try(FileOutputStream fos=new FileOutputStream("c:\\temporal\\datos.txt", true);
PrintStream ps=new PrintStream(fos);)
{
    ps.println("cadena 1");
    ps.println("cadena 2);
}
catch(FileNotFoundException ex){
:
}
En este caso, como los dos objetos (FileOutputStream y PrintStream) son autocerrables, ambos se crean entre los paréntesis del try con recursos. El cierre de estos objetos se realizará en orden inverso a su creación (primero PrintStream y después FileOutputStream)
Lectura de un fichero
Al igual que sucede con las operaciones de escritura, la lectura de un fichero es una operación de entrada y salida que puede realizarse con las clases presentadas en la lección anterior. En el caso concreto de la lectura de un fichero, estamos hablando de una operación de entrada que podemos llevar a cabo con el objeto BufferedReader
Utilización de BufferedReader para leer de un fichero
Para leer de un fichero a través de BufferedReader, tendremos que proporcionar al constructor BufferedReader(Reader rd) un objeto Reader que apunte al fichero del que queremos leer. La clase FileReader nos proporciona la clave, pues dispone del siguiente constructor para crear un objeto que apunte a un fichero a partir de la ruta del mismo:
FileReader(String fichero)
El siguiente bloque de instrucciones recupera el contenido completo del fichero datos.txt y lo muestra por pantalla:
try(FileReader fr=new FileReader("c:\\temporal\\datos.txt");
BufferedReader bf=new BufferedReader(fr);
){
    String s;
    //lee mientras haya líneas que leer
    while( (s=bf.readLine())!=null){
        System.out.println(s);
    }
}
catch(FileNotFoundException ex){
:
}
catch(IOException ex){
:
}
Podemos ver cómo tanto FileReader como BufferedReader son autocerrables, ya que los creamos entre los paréntesis del try, lo que significa que serán cerrados implícitamente por la JVM cuando no se necesiten.
También debemos detenernos en la instrucción while( (s=bf.readLine())!=null). La primera vez que llamamos a readLine() devuelve la primera fila del fichero y el BufferedReader se queda apuntando a la segunda fila, por lo que la siguiente llamada devolverá esta segunda fila, y así sucesivamente. Después de leer la última línea, BufferedReader se situará fuera del fichero y la siguiente llamada a readLine() devolverá null, de ahí que la condición para entrar en el bucle sea s!=null.








