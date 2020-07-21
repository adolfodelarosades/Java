# 08 Fechas en Java

## Fechas en Java
En Java existen varias clases para trabajar con fechas y horas. Por un lado, tenemos las clases de fechas tradicionales Date y Calendar, por otro la clase DateFormat que se encarga de aplicar formato a los objetos de fecha anteriores, además, están las clases específicas para trabajar con fechas en aplicaciones de bases de datos y, finalmente, las nuevas clases para tratamiento de fechas y horas incorporadas en la versión Java 8.
A lo largo de esta lección te explicaré como manejar fechas con las clases tradicionales del paquete java.util y como dar formato a estas de cara a su presentación en una aplicación. También estudiaremos las clases de fecha para bases de datos y como convertir entre estas y las tradicionales.
En un documento aparte que podrás descargarte en la zona de material adicional de esta lección, te explicaré como utilizar las nuevas clases de fecha introducidas en Java 8.
La clase java.util.Date
Esta clase representa el tipo fecha/hora clásico en Java. La mayoría de sus constructores están deprecated u obsoletos, lo que significa que no deberíamos utilizarlos. 
Los dos únicos constructores que aún se pueden utilizar para crear un objeto fecha/hora con esta clase son:
Date(). Crea un objeto Date que representa la fecha y hora actuales.
Date(long milis). Crea un objeto Date que representa la fecha y hora asociada al tiempo absoluto que se le proporciona como parámetro. El tiempo absoluto se mide como la cantidad de milisegundos transcurridos desde las 0 horas del 1 de enero de 1970. Esta medida de tiempo absoluto es muy útil de cara a comparar unas fechas con otras.
No solo casi todos sus constructores están obsoletos, también la mayoría de sus métodos. Entre los pocos métodos no obsoletos destacamos:
int getTime(). Devuelve el tiempo absoluto asociado al objeto Date.
void setTime(long milis). Establece un nuevo valor de fecha/hora para el objeto, a partir del tiempo absoluto proporcionado como parámetro.
Si la mayoría de sus métodos y constructores están obsoletos, ¿porqué se sigue utilizando esta clase?. La respuesta es que Date es el tipo de dato fecha/hora de Java y la gran mayoría de los métodos de clases que trabajan con datos de tipo fecha/hora utilizan Date. Además, como veremos más adelante en esta lección, la clase DateFormat, que se encarga de formatear datos de tipo fecha, lo hace sobre objetos de tipo Date
La clase java.util.Calendar
Esta clase es posterior a Date, fue incorporada a Java estándar a partir de la versión JDK 1.1. Proporciona métodos para trabajar con los componentes de una fecha/hora (días, meses, años, horas,..).
En primer lugar, dado que Calendar es una clase abstracta, no podemos utilizar su constructor para crear un objeto de este tipo, debemos recurrir al método estático getInstance(), que devuelve un objeto Calendar asociado a la fecha y hora actuales:
Calendar c= Calendar.getInstance();
Una vez que disponemos de un objeto Calendar, podemos obtener los diferentes componentes que lo forman a partir de su método get(). Este método recibe como parámetro un entero que representa el componente fecha/hora que queremos obtener, pero en lugar de tener que recordar que número corresponde a cada componente, podemos utilizar las constantes de la propia clase Calendar, entre las que destacamos:
YEAR. Constante que representa el año
MONTH. Constante que representa el mes. Los meses se obtienen como un entero entre 0 y 11
DAY_OF_MONTH. Constante que representa el día del mes
HOUR. Constante que representa la hora en formato 0 a 23
MINUTE. Constante que representa los minutos
SECOND. Constante que representa los segundos.
Por ejemplo, si quisiéramos mostrar por pantalla la fecha y hora actuales en formato: dia/mes/año  hora:minutos:segundos, el código sería:
Calendar c= Calendar.getInstance();
String fecha="";
//construye una cadena con los datos de la fecha
fecha+=c.get(Calendar.DAY_OF_MONTH)+"/";
fecha+=(c.get(Calendar.MONTH)+1)+"/";
fecha+=c.get(Calendar.YEAR)+"  ";
fecha+=c.get(Calendar.HOUR)+":";
fecha+=c.get(Calendar.MINUTE)+":";
fecha+=c.get(Calendar.SECOND);
//imprime la fecha
System.out.println("La fecha y hora es: "+fecha);
Un objeto Calendar también permite modificar la fecha y hora almacenada a través de sus métodos set:
set(int year, int month, int date)
set(int year, int month, int date, int hourOfDay, int minute, int second)
Si quisiéramos modificar la fecha y hora del objeto Calendar creado anteriormente, fijándolo en el 3 de marzo de 2016 a las 15:30 horas sería:
c.set(2016,2,3,15,30,0);
Por otro lado, si dado un objeto Calendar queremos convertirlo a Date, debemos recurrir al método getTime():
Date dt=c.getTime();
Formateado de fechas con java.text.DateFormat
Si queremos presentar un fecha en un determinado formato, incluso basado en una determinada localización, la forma más sencilla y flexible de hacerlo es a través de la clase DateFormat que se encuentra en el paquete java.text.
Dado que se trata de una clase abstracta, tendremos que crear una implementación de esta clase a partir de alguno de los siguientes métodos estáticos de DateFormat:


DateFormat getDateInstance(int style, Locale aLocale). Devuelve una implementación de DateFormat utilizando el estilo indicado en el primer parámetro y según la localización proporcionada como segundo parámetro. El estilo se indicará a través de alguna de las constantes de DateFormat:
SHORT. Estilo en formato corto
MEDIUM. Estilo en formato medio
LONG. Estilo en formato largo
FULL. Estilo en formato completo
En cuanto a  la localización, define la forma de presentación de la fecha/hora de una determinada región geográfica. Quedará definida a través de un objeto Locale, esta clase Locale dispone de algunas constantes con localizaciones predefinidas, como por ejemplo la constante Locale.US que se utilizaría para un estilo de presentación utilizado en Estados Unidos. Podemos crear una localización asociada a una determinada región utilizando el constructor Locale(String language), o Locale(String language, String country). Los códigos de idioma y país están definidos por la norma ISO 639
Por ejemplo, si queremos crear un DateFormat para aplicar un formato de fecha largo, según el estilo utilizado en España, sería:
DateFormat df;
df=DateFormat.getDateInstance(DateFormat.LONG, new Locale("es","ES"));
getDateTimeInstance(int dateStyle, int timeStyle, Locale aLocale). Es igual que el anterior, aunque como segundo parámetro podemos indicar el estilo utilizado para la hora. Los posibles valores son las mismas constantes indicadas anteriormente
Una vez creado el objeto DateFormat, para aplicar el formato definido por el mismo sobre una determinada fecha utilizaríamos el método format(Date f). Como vemos, este método recibe como parámetro el objeto fecha a formatear en forma de objeto Date, devolviendo una cadena de caracteres con la fecha formateada según las reglas de creación del objeto DateFormat.
Por ejemplo, si queremos formatear la fecha actual según los estilos definidos en el objeto DateFormat creado anteriormente sería:
Date fecha=new Date();
System.out.println(df.format(fecha));
En pantalla se mostraría lo siguiente:
13 de agosto de 2017
Fechas en SQL
Cuando vamos a trabajar con bases de datos a través de JDBC, los campos de fecha se manejan a través de los tipos Date y Timestamp del paquete java.sql. Ambas son subclases de java.util.Date


Mientras que java.sql.Date es utilizada solo para fechas, Timestamp se emplea para columnas de tipo fecha y hora.
En aplicaciones donde tenemos una clara separación entre capa de lógica de negocio y capa de presentación, es habitual tener que convertir fechas/horas de tipo util.Date a los tipos SQL y viceversa. Vamos a ver como realizar esta tarea.
Conversión sql.Date y sql.Timestamp a util.Date
Dado que ambas son subclases de util.Date, convertir uno de estos objetos sql a un objeto util.Date es tan simple como realizar una operación de asignación. Por ejemplo, si sqFecha es una variable que contiene un objeto java.sql.Date con el valor de una columna de fecha, su conversión a un objeto util.Date será:
java.util.Date utFecha=sqFecha;
Conversión de un objeto utilDate a sql.Date y sql.Timestamp
Para realizar la conversión en sentido contrario, tendremos que recurrir a los constructores sql.Date(long time) y sql.Timestamp(long time), que permiten crear objetos sql de fecha a partir del tiempo absoluto. 
Como podemos obtener fácilmente el tiempo absoluto asociado a un objeto java.util.Date a partir de su método getTime(), la solución al problema resulta inmediata. Por ejemplo, fechaDato es una variable java.util.Date que contiene la fecha de un dato en esta formato, para convertirla a un tipo sql.Timestamp procederíamos:
java.sql.Timestamp fechaFin=new java.sql.Timestamp(fechaDato.getTime());
