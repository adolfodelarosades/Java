# Capítulo 2. El proyecto de muestra

En este libro, seguimos un enfoque práctico para aprender a probar web services con soapUI. Le recomendamos enfáticamente que tenga su computadora con usted mientras lee el libro y pruebe los escenarios de prueba que se describirán a lo largo de este libro.

En este capítulo, cubriremos los siguientes temas:

* Preparando el entorno del proyecto
* Diseño de los web services
* Implementando los web services
* Despliegue de los web services
  
Como primer paso del aprendizaje práctico, presentaremos un proyecto de muestra en este capítulo. Nuestro objetivo es construir un proyecto simple pero completo que cubra la considerable cantidad de funciones relacionadas con las pruebas de web services. Diseñaremos y construiremos un proyecto de muestra con algunos web services. Comenzamos desde cero, siguiendo el enfoque code-first web service development donde primero escribimos clases de Java y luego las implementamos en un contenedor de web services.

   <hr>

   **TIP**
   
   Hay dos formas de desarrollo de web services; los enfoques **contract-first** y **code-first**. En un enfoque **contract-first**, la definición del web services o el **WSDL** se crea inicialmente y la implementación del servicio se realiza después de eso. En un enfoque **code-first**, las clases de implementación del servicio se desarrollan al principio y, por lo general, el contenedor de servicios en el que se implementa el web services genera automáticamente el WSDL. En nuestro proyecto de muestra, seguiremos el segundo enfoque, el desarrollo de web services con **code-first**, ya que es relativamente más fácil crear web services desde cero.

   <hr>


No discutiremos ningún aspecto de testing dentro de este capítulo. Nuestro enfoque es construir la base para los últimos capítulos de este libro, donde planeamos usar soapUI para probar el proyecto de muestra. Si cree que puede seguir adelante con soapUI sin perder tiempo en el proyecto de muestra de web services, solo usará el resultado del proyecto, que es un conjunto de web services.

   <hr>

   **TIP**
   
   **Descargando el código de ejemplo**

   Puede descargar los archivos de código de ejemplo para todos los libros de Packt que haya comprado desde su cuenta en http://www.PacktPub.com. Si compró este libro en otro lugar, puede visitar http://www.PacktPub.com/support y registrarse para recibir los archivos directamente por correo electrónico.

   <hr>   

Si decidió omitir el proyecto de muestra y simplemente usar los web services resultantes, los siguientes pasos lo ayudarán a implementar rápidamente y use los web services con soapUI:

1. Descargue la muestra de web servicesde http://www.PacktPub.com/support. Extraiga **`WebServicesSample-Deliverable.zip`** a su sistema de archivos local. Encontrará el archivo **`HotelReservation.aar`** y la carpeta **`dbscripts`** en la raíz de la carpeta extraída.
2. Ejecútelo **`dbscripts/HotelReservationDBSchema.sql`** en su servidor de base de datos MySQL para crear la base de datos y las tablas de muestra.
3. Modifique los valores de las propiedades **`mysql.host`**, **`mysql.port`**, **`mysql.username`** y **`mysql.password`**  en el archivo **`mysql.properties`** que se puede encontrar dentro de la carpeta **`conf`** de **`HotelReservation.aar`**.
4. Implemente **`HotelReservation.aar`** en **Apache Axis2** (consulte la sección ***Deploying web services*** al final de este capítulo para saber cómo implementar web services en **Apache Axis2**) y utilícelo en todas las pruebas de soapUI que trabajaremos en el resto de los capítulos.
5. Puede consultar **README.txt** de **WebServicesSample-Deliverable.zip** para obtener más información sobre el procedimiento de instalación.

## El problem domain

Nuestro proyecto se basará en un sistema de reserva de hotel hipotético, que está destinado a ser utilizado por un personal administrativo de un hotel. El sistema consta de tres funciones básicas de la siguiente manera:

* Gestión de invitados
* Gestión de habitaciones
* Gestión de reservas

Veamos la arquitectura de alto nivel de la aplicación de reserva de hotel de muestra que vamos a discutir en este capítulo:

![image](https://github.com/adolfodelarosades/Java/assets/23094588/852175a5-2de1-4d16-bbc6-088811eaa210)

El sistema de reservas hoteleras se compone de tres entidades fundamentales; **Huésped, Habitación y Reserva( Guest, Room, y Reservation )**. Cada invitado se identifica por nombre, dirección y edad (name, address y age). Las habitaciones se identifican por número de habitación, tipo de habitación y tamaño de la habitación (room number, room type y room size). La reserva de una habitación se realiza asignando un huésped a una habitación.

No vamos a complicar demasiado nuestro proyecto, ya que nuestro objetivo es obtener un conjunto de web services para probar con soapUI en los próximos capítulos. Por lo tanto, omitimos deliberadamente algunas interrelaciones entre estas entidades. Por ejemplo, asumimos que un huésped solo puede hacer una reserva a la vez.

## Requisitos previos del proyecto

Antes de comenzar a implementar el proyecto, hagamos el entorno de proyecto listo.

### Java

Vamos a desarrollar el proyecto de muestra usando Java. Por lo tanto, asegúrese de instalar JDK1.6 o una versión posterior en su máquina.

### Apache Ant

Usaremos Apache Ant para construir nuestro proyecto. Por supuesto, puede usar cualquier herramienta de compilación que prefiera.

Puede descargar la última versión de Apache Ant desde http://ant.apache.org/bindownload.cgi y seguir la guía de instalación para configurar Ant en su máquina.

### MySQL

MySQL se utilizará como sistema de gestión de base de datos en nuestro proyecto de muestra. Todos los datos utilizados en el sistema de reserva de hotel de muestra serán almacenado en una base de datos MySQL. Por lo tanto, debemos configurar MySQL en nuestras máquinas. Podemos descargar MySQL desde http://www.mysql.com/downloads/mysql/ y seguir las instrucciones dadas en la guía de instalación para configurarlo en su máquina.

Configuración de Apache Axis2
Existen numerosos marcos de web services que se pueden utilizar en el desarrollo y la implementación de web services. Apache CXF ( http://cxf.apache.org/ ) y Apache Axis2 ( http://axis.apache.org/axis2/java/core/ ) son dos ejemplos de marcos de web services de código abierto populares. Los marcos de web services RESTful puros como RESTeasy ( https://www.jboss.org/resteasy/ ) también se pueden usar en la implementación de web services.

Usaremos los web services Apache Axis2marco en nuestro proyecto de muestraporque Apache Axis2 es principalmente un motor de web services basados ​​en SOAP y nuestro proyecto de muestra se centra en un conjunto de web services basados ​​en SOAP. Configuremos Axis2 en nuestra máquina de acuerdo con los siguientes pasos:

Puedes descargar el binariodistribución de Apache Axis2 desde http://axis.apache.org/axis2/java/core/download.cgi . Descargue el binario y extráigalo en una carpeta en su sistema de archivos.
CONSEJO
Apache Axis2-1.6.1 era la última versión en el momento de escribir el libro. Puede descargar la misma o la última versión.

Deje que la carpeta extraída de la distribución binaria Axis2 sea AXIS2_HOME. Abra una ventana de comando o shell y cambie el directorio a AXIS2_HOME/bin.
Exporte la AXIS2_HOMEvariable de entorno de la siguiente manera:
En Linux:

exportar AXIS2_HOME=/home/usuario/axis2-1.6.1
En Windows:

      establecer AXIS2_HOME=/inicio/usuario/axis2-1.6.1
Inicie el servidor Axis2 porejecutando axis2server.sho axis2server.batde la siguiente manera:
sh eje2servidor.sh
Configuración de directorios de origen del proyecto
A partir de ahora, hemos configurado el entorno de tiempo de ejecución de Java, Apache Ant, el sistema de administración de bases de datos MySQL y Apache Axis2.Ahora, vamos a configurar la estructura de carpetas de origen de nuestra muestra.proyecto de desarrollo de web services para que podamos comenzar a agregar código.

Cree un directorio en su sistema de archivos, asígnele el nombre sample-project.
Cree los siguientes subdirectorios en la sample-projectcarpeta:
src : se utiliza para almacenar los archivos fuente de Java
build : el archivo antbuild.xmlse almacenará aquí
conf : se utiliza para almacenar todos los archivos de configuración

## Diseño de los web services
Nuestro ejemplo de sistema de reserva de hotel esimplementado utilizando web services basados ​​en SOAP. De acuerdo con las tres entidades básicas utilizadas en el sistema, podemos planificar tener tres web services explicados a continuación:

Servicio de Gestión de Huéspedes :
GuestManagementServiceserá usado para agregue, elimine o recupere los detalles de los invitados en el sistema. Este web services consta de los siguientes métodos:

addGuest( name, address, age)
getGuestDetails( name)
deleteGuest ( name)
Servicio de gestión de habitaciones :
Agregar, eliminar y recuperar los detalles de las habitaciones son administrados por elRoomManagementService que incluye los siguientes métodos:

addRoom( roomNumber, roomType, roomSize)
getRoomDetails( roomNumber)
deleteRoom( roomNumber)
Servicio de reserva :
ReservationServicese utiliza para gestionar las reservas de habitaciones del sistema, como la creación de una nuevareserva, averiguando el los detalles de la reserva de una habitación en particular y eliminar una reserva existente. Los siguientes métodos están incluidos en este web services:

addReservation( roomNumber, guestName, reserved_from, reserved_to)
getReservationDetails( roomNumber)
removeReservation( reservationID)
Creando la base de datos
Utilizamos una base de datos MySQL para almacenar la información en nuestro sistema de gestión hotelera de muestra. Vamos a crear la base de datos y añadirtres tablas correspondientes a las tres entidades anteriores.

Abra un shell de MySQL o un editor e ingrese la siguiente declaración:
crear base de datos HOTEL_RESERVATION_DB;
Agregue las siguientes tres tablas a la base de datos:
UTILIZAR HOTEL_RESERVATION_DB;
			 
CREAR TABLA SI NO EXISTE GUEST_T(
            nombre VARCHAR(100) NO NULO,
			dirección VARCHAR(200),
			edad INT NO NULO,
			CLAVE PRIMARIA(nombre));
			
CREAR TABLA SI NO EXISTE HABITACIÓN_T(
			room_number INT NO NULO,
			room_type VARCHAR(100) NO NULO,
			room_size varchar (100) NO NULO,
			CLAVE PRIMARIA(habitación_número));

CREAR TABLA SI NO EXISTE RESERVA_T(
		res_id INT NO NULO AUTO_INCREMENT,
			nombre_invitado VARCHAR(100) NO NULO,
			room_no INT NO NULO,
			Reserved_from FECHA NO NULO,
			Reserved_to FECHA NO NULO,
			CLAVE PRINCIPAL (res_id),
			FOREIGN KEY(guest_name) hace referencia a GUEST_T(name),
			FOREIGN KEY(room_no) hace referencia a ROOM_T(room_number));
Ahora, tenemos el esquema de la base de datos listo para nuestro sistema. Procedamos con la implementación de los web services.

## Implementando los web services
Como hemos visto en la sección Diseño de los web services , vamos a utilizar tres web services diferentes para manejar las funciones de gestión de huéspedes, habitaciones y reservas. También hemos discutido que se utilizan tres tablas MySQL para almacenar información en cada uno de estos web services. vamos a poner juntostodos estos elementos y comenzar a implementar nuestro sistema.

En primer lugar, debemos definir los beans Java de huésped, habitación y reserva que se utilizan como objetos de transferencia de datos en nuestro sistema.

La fuente completa de todas las clases de bean Java se puede encontrar en la src\com\sample\reservation\dtocarpeta del paquete de código.

Invitado.java :
Guest.javaes un bean de Java que representa una entidad invitada en nuestro sistema. La clase consta de las variables nombre, dirección y edad, así como sus correspondientes métodos getter/setter.

paquete com.sample.reservation.dto;

Invitado de clase pública {

    cadena privada nombre;
    dirección de cadena privada;
    edad interna privada;

    public Guest(String name, String address, int age) {
           }

    Invitado público () {
        
    }

    Cadena pública getNombre() {
    }

    public void setName(nombre de la cadena) {
    }

    public String getAddress() {
            }

    public void setAddress(String dirección) {
    }

    public int getEdad() {
            }

    public void setAge(int edad) {
    }
}
Este es un bean de Java simple y el propio código explica el propósito de esta clase en particular. Puedes guardar estoclass debajo de la srccarpeta de acuerdo con la estructura del paquete.
Del mismo modo, agreguemos Room y Clases de frijol de reserva.

Habitación.java :
Room.javaes un bean de Java que representa una entidad de habitación en nuestro sistema. El código para el mismo es comosigue:

paquete com.sample.reservation.dto;

sala de clase pública {

    numero de habitacion privado;
    tipo de habitación de cadena privada;
    Cuerda privada roomSize;

    public Room(int roomNumber, String roomType, String roomSize) {
       
       
       
    }

    sala pública(){
        
    }

    public int obtenerNúmeroDeHabitación() {
           }

    public void setRoomNumber(int roomNumber) {
    }

    public String getRoomType() {
    }

    public void setRoomType(String roomType) {

    }

    public String getRoomSize() {
       
    }

    public void setRoomSize(String roomSize) {
       
    }
}
Reserva.java :
Reservation.javaes un frijol de Java para elentidad de reserva en nuestro sistema. El código del mismo es el siguiente:

paquete com.sample.reservation.dto;


Reserva de clase pública {

    ID de reserva privada int;
    cadena privada guestName;
    numero de habitacion privado;
    privado Fecha reservada_desde;
    privado Fecha reservada_para;


    Fecha pública getReserved_from() {
    }

    public void setReserved_from(Fecha de reserva_desde) {
    }

    fecha pública getReserved_to() {
    }

    public void setReserved_to(Fecha reservada_to) {

    }

    


    public int getReservationID() {
    
    }

    public void setReservationID(int reserveID) {
    }

    public String getGuestName() {
    }
    public void setNombreInvitado(String nombreInvitado) {
    }

    public int obtenerNúmeroDeHabitación() {

    }

    public void setRoomNumber(int roomNumber) {

    }
}
Ya que tenemos los tres Java beans listos, las firmas de métodos de las tres clases de web services, que vamos a implementar en breve, tendrá el siguiente aspecto. Estas clases se expondrán como web services en nuestra aplicación de muestra.

Servicio de Gestión de Huéspedes :
GuestManagementServiceclaseconsta de addGuest, getGuestDetailsy deleteGuestmétodos.

servicio de gestión de huéspedes de clase pública {



//Se agrega un nuevo huésped al sistema al invocar este método. El método // devuelve verdadero si el invitado se agrega correctamente.
    public boolean addGuest(String nombre, String dirección, int edad){

    }

//Los detalles de un invitado existente se recuperan usando este método
    Invitado público getGuestDetails(String guestName){       

    }

//Se elimina un invitado existente al invocar este método. Podemos //implementar este método para devolver un booleano similar al //método addGuest(). Sin embargo, para demostrar el //patrón de intercambio de mensajes IN-ONLY, dejémoslo vacío.
    public void deleteGuest(String nombre del huésped){    

    }
}
Servicio de gestión de habitaciones :
RoomManagementServiceincluye tres métodos, addRoom, getRoomDetailsydeleteRoom como sigue:

servicio de gestión de habitaciones de clase pública {

//Se agrega una nueva habitación al sistema al invocar este método. //El método devuelve verdadero si la habitación se agrega con éxito

    public boolean addRoom(int roomNumber, String roomType, String roomSize){        

    }

//Los detalles de una habitación existente se recuperan usando este método

    sala pública getRoomDetails(int roomNumber){

    }

// Se puede eliminar una habitación existente invocando este método

    public void deleteRoom(int roomNumber){

    }
}
Servicio de reserva :
ReservationServiceconsta de addReservation, getReservationDetailsy removeReservationmétodos siguientes:

servicio de reserva de clase pública {

//Se reserva una habitación de hotel para un huésped invocando este método
    public boolean addReservation(int roomNumber, String guestName, Fecha de reserva_desde, Fecha de reserva_hasta){

    }
//Los detalles de una reserva existente se pueden encontrar llamando a //este método
Reserva pública getReservationDetails(int RoomNumber) {

}

// Se puede eliminar una reserva existente invocando este método

public void removeReservation(int reserveID) {

}
            
}
Manejo de fallas de web services
¿Pensamos en escenarios como intentar agregar un invitado que ya está disponible en la GUEST_Tmesa? ¿O lo hicimos?intentar eliminar una habitación que no existe? Necesitamos manejar estos casos excepcionales y proporcionar a los usuarios errores significativos. Podemos implementar clases de excepción asociadas con cada una de las clases de web services anteriores comosigue.

Cree un nuevo paquete com.sample.reservation.exceptiony agregue las siguientes tres clases de excepción:

Excepción 1 :
GuestManagementException de clase pública extiende Excepción {

    mensaje de cadena privado;

    GuestManagementException pública () {

    }

    Public GuestManagementException(Mensaje de cadena) {

        super(mensaje);

    }

    cadena pública getMessage() {

        volver super.getMessage();

    }

    public void setMessage(Mensaje de cadena) {

        este.mensaje = mensaje;

    }

}
Excepción 2 :
clase pública RoomManagementException extiende Excepción {

    mensaje de cadena privado;

    public void setMessage(Mensaje de cadena) {

        este.mensaje = mensaje;

    }

     cadena pública getMessage() {

        volver super.getMessage();

    }

    RoomManagementException pública () {

    }

    RoomManagementException pública (mensaje de cadena) {

        super(mensaje);

    }

   

}
Excepción 3 :
   clase pública ReservationManagementException extiende Excepción{
    Excepción pública de gestión de reservas () {
    }

    Public ReservationManagementException(Mensaje de cadena) {
        super(mensaje);
    }

   cadena pública getMessage() {
        volver super.getMessage();
    }

    public void setMessage(Mensaje de cadena) {
        este.mensaje = mensaje;
    }
    mensaje de cadena privado;

}
Administrar las operaciones de la base de datos
Es una práctica de programación recomendada administrar todas las interacciones de la base de datos a través de un módulo o una clase separados. Por lo tanto, podemos tener una clase dedicada a las tareas de manejo del almacenamiento de la base de datos. Dejar que esto class be Storage.javay téngalo bajo un nuevo paquete, com.sample.reservation.database.

El Storage.javaclass se utiliza para establecer la conexión a la base de datos y ejecutar consultas SQL en cada invocación de método de las clases de implementación del web services. Por ejemplo, si se llama al addGuest()método de , el método correspondiente de la clase maneja las interacciones de la base de datos. Del mismo modo, para todos los métodos enGuestManagementServiceaddGuest()Storage clases de implementación de web services, podemos tener los métodos correspondientes en Storage.javaclase.

Echemos un vistazo a cómo manejamos el Las operaciones CRUD ( Crear Leer Actualizar Eliminar ) asociadas con elGuestManagementServiceusoStorage.java del código fuente completo de laStorage.javaclase se pueden encontrar ensrc\com\sample\reservation\database\Storage.javael paquete de código.

Almacenamiento de clase pública {

//Primero, necesitamos establecer la conexión jdbc con HOTEL_ //RESERVATION_DB
//Leeremos los detalles de conexión de la base de datos MySQL desde un //archivo de propiedad, que se colocará en el directorio conf del web services //Archivo de archivo (HotelReservation.aar)
    conexión privada getConnection(){
//La lógica de manejo de la conexión JDBC se insertará aquí
//Leemos nombre de usuario, contraseña, nombre de host (o IP) y puerto de mysql
//base de datos del archivo mysql.properties que se coloca en conf
//directorio del archivo del web services.
    }    

//El método correspondiente a addGuest() en GuestManagementService.

    // Esto se usa para agregar un nuevo invitado a la tabla GUEST_T

    public boolean addGuest(Invitado invitado) {
        //Compruebe si el invitado ya existe antes de agregar un nuevo //invitado
        if (getGuestDetails(guest.getName()) == null) {
                //Ejecute INSERT SQL Query para agregar una nueva fila a la tabla //GUEST_T
                String sqlStatement = "INSERTAR EN LOS VALORES DE GUEST_T ('" + guest.getName()
                        + "','" + invitado.obtenerDirección() + "', " + invitado.obtenerEdad() + ")";
                declaración.execute(sqlStatement);
    }
//El método correspondiente a getGuestDetails() en //GuestManagementService.

    // Esto se usa para obtener detalles de un huésped en particular de la tabla //GUEST_T

    Invitado público getGuestDetails(String nombre) {
        //Ejecute SELECT SQL Query para recuperar la fila correspondiente //de la tabla GUEST_T

        String sqlStatement = "SELECT * FROM GUEST_T WHERE nombre = '" + nombre + "'";
    }
     //El método correspondiente a deleteGuest() en //GuestManagementService
    //Esto se usa para eliminar un invitado de la tabla GUEST_T
    public void deleteGuest(String nombre) {
        if (getGuestDetails(nombre) != null) {

                //Ejecute DELETE SQL Query para recuperar la //fila correspondiente de la tabla GUEST_T

                String sqlStatement = "ELIMINAR DE INVITADO_T DONDE nombre = '" + nombre + "'";
    }
}
Como Storage.javaes un controlador de conexión JDBC, simplemente administra todas las transacciones relacionadas con la base de datos involucradas en nuestro proyecto de muestra. Si se produce un error relacionado con la base de datos durante estas transacciones, manejamos esos errores a través de una clase de excepción separada, StorageException.java.

El código fuente completo de StorageException.javaLa clase se puede encontrar src\com\sample\reservation\exception\StorageException.javaen el paquete de código.

Ahora, debería poder compilar el clases que hemos implementado hasta ahora. Si está trabajando en este proyecto utilizando un entorno de desarrollo de Java integrado (IDE), como Eclipse, puede compilar el proyecto muy fácilmente. Asegúrese de agregar el archivo jar del controlador JDBC de MySQL a la ruta de clase, ya que es necesario para establecer la conexión de la base de datos MySQL. Tú puedes descargarel controlador MySQL JDBC de http://www.mysql.com/downloads/connector/j/ .

Si no desea utilizar ningún IDE de Java, puede utilizar el script de compilación ant ( build.xml) proporcionado en buildla carpeta del paquete de código.

CONSEJO
Antes de que todas las clases de implementación de servicios estén disponibles como web services reales, se recomienda probar la Storage.javaclase por separado para garantizar que las transacciones de la base de datos se realicen correctamente. Puede agregar una prueba simple de Junit para probar cada método de Storage.java.

Completar las clases de implementación del web services
En la sección Diseño de web services , observamos las firmas de métodos de las tres clases de web services, GuestManagementService, RoomManagementServicey ReservationService. Es hora de concluir nuestra discusión sobre las clases de implementación de web services ya que tenemos todos losclases dependientes listas por ahora. Como ejemplo, veremos la implementación de GuestManagementService.java.

NOTA
El código fuente completo de las tres clases de implementación de web services se puede encontrar en la src\com\sample\reservationcarpeta del paquete de código.

servicio de gestión de huéspedes de clase pública {

    //Añadiendo un nuevo invitado al sistema.
    //Creamos un nuevo objeto Guest y llamamos a la operación addGuest() de
    //Clase de almacenamiento para insertar el nuevo registro de invitado en la tabla GUEST_T

    public boolean addGuest(String name, String address, int age)
            

        Invitado invitado = nuevo Invitado();
        invitado.setName(nombre);
        guest.setAddress(dirección);
        invitado.setEdad(edad);

        Almacenamiento almacenamiento = nuevo Almacenamiento();
       
            almacenamiento.addGuest(invitado);
            devolver verdadero;
               }

    }

    //recuperando los detalles de un invitado.
    //Al llamar al método getGuestDetails() de la clase Storage
    // obtenemos el registro de invitado correspondiente de la tabla GUEST_T

    public Guest getGuestDetails(String guestName) {
        Almacenamiento almacenamiento = nuevo Almacenamiento();
        
            Invitado invitado = almacenamiento.getGuestDetails(guestName);
              invitado de vuelta;
                }

    //Eliminar un invitado existente.
    //Llamamos al método deleteGuest() de la clase Storage para eliminar un invitado
	//de la tabla GUEST_T

    public void deleteGuest(String nombre del huésped) {

        Almacenamiento almacenamiento = nuevo Almacenamiento();

        
            Invitado invitado = almacenamiento.getGuestDetails(guestName);
            almacenamiento.deleteGuest(guest.getName());
        }
        
## Implementación de web services
Aunque desarrollamos todas las clases de Java incluidas en nuestro sistema de reserva de hotel de muestra, aún no las hemos convertido en web services.En otras palabras, aun así, nuestras tres clases de implementación de web services no pueden ser invocadas por un cliente de web services, como soapUI. En esta sección, creamos un artefacto implementable para que podamos implementar los servicios en un contenedor de servicios como Apache Axis2.

Hay varias formas de implementar un web services en el motor SOAP de Apache Axis2. Usaremos el mecanismo de implementación basado en el archivo de servicio donde creamos un archivo desplegable con todos los artefactos del servicio y lo copiamos en la carpeta de implementación del servidor Axis2. En este mecanismo, el artefacto desplegable se conoce como Axis2 Archive( aar).

Para implementar un servicio Axis2 como un aararchivo, debe incluirse un descriptor de implementación. El descriptor de implementación de Axis2 se conoce como services.xmly debe colocarse dentro de la META-INFcarpeta del aararchivo. Le services.xmldice al motor Axis2 los detalles, como qué servicios están incluidos en el archivo de servicios, qué operaciones están expuestas a través del web services, etc.

Dado que tenemos tres web services diferentes, podemos implementarlos como tres archivos Axis2 ( aar) o incluir todo en un solo archivo. En nuestro proyecto de muestra, empaquetaremos todas las clases de implementación de servicios y las dependencias en un solo archivo de servicio. Dado que seguimos el segundo enfoque, debemos considerar el concepto de grupo de servicios Axis2 en el que podemos asociar varios servicios dentro de un grupo e implementarlos juntos.

Con todos estos detalles, el services.xmlaspecto de nuestros web services es el siguiente.

Tenga en cuenta que GuestManagementServiceaquí solo se muestra el. El archivo completo services.xmlse puede encontrar en confla carpeta del paquete de código.

<serviceGroup name="HotelReservation">
    <nombre del servicio="Servicio de gestión de huéspedes"
             targetNamespace="http://sample.com/reservation/guest">
        <descripción>
            web services de gestión de invitados
        </descripción>
        <esquema schemaNamespace="http://sample.com/reservation/guest/types"
                elementFormDefaultQualified="verdadero">
            <mapping namespace="http://sample.com/reservation/guest/types"
                     paquete="com.muestra.reserva.dto"/>
        </esquema>
        <mensajeReceptores>

            <messageReceiver mep="http://www.w3.org/2006/01/wsdl/in-only"
                             class="org.apache.axis2.rpc.receivers.RPCInOnlyMessageReceiver"/>
            <messageReceiver mep="http://www.w3.org/2006/01/wsdl/in-out"
                             class="org.apache.axis2.rpc.receivers.RPCMessageReceiver"/>
        </mensajeReceptores>
        <parameter name="ServiceClass">com.sample.reservation.GuestManagementService</parameter>
        <operación nombre="addGuest" mep="http://www.w3.org/2006/01/wsdl/in-out">
            <actionMapping>urna:addGuest</actionMapping>
            <messageReceiver class="org.apache.axis2.rpc.receivers.RPCMessageReceiver"/>
        </operación>
        <operación nombre="getGuestDetails" mep="http://www.w3.org/2006/01/wsdl/in-out">
            <actionMapping>urna:getGuestDetails</actionMapping>
            <messageReceiver class="org.apache.axis2.rpc.receivers.RPCMessageReceiver"/>
        </operación>
        <operación nombre="deleteGuest" mep="http://www.w3.org/2006/01/wsdl/in-only">
            <actionMapping>urna:borrarInvitado</actionMapping>
            <messageReceiver class="org.apache.axis2.rpc.receivers.RPCInOnlyMessageReceiver"/>
        </operación>
    </servicio>
</grupodeservicios>
Aquí, todos los web services se agrupan bajo el <serviceGroup>elemento. Puede encontrar que la clase de implementación del servicio se describe como un parámetro, < parameter name="ServiceClass">. Una explicación completa del services.xmldescriptor está más allá del alcance de este libro. Puede encontrar más información sobre esto en http://axis.apache.org/axis2/java/core/docs/axis2config.html#Service_Configuration .

Después de completar services.xmlpara todos lostres web services, asegúrese de copiarlo a confla carpeta en la estructura de nuestro proyecto.

También debemos asegurarnos de actualizar las siguientes propiedades en conf/mysql.propertiesel archivo que usamos para leer los detalles de conexión de la base de datos:

mysql.host: Es el nombre de host o IPdirección del servidor de la base de datos mysql

mysql.port: Es el puerto en el queel servidor mysql se está ejecutando

mysql.username: Es el usuario root de mysqlbase de datos

mysql.password:Es la contraseña deel usuario raíz

Ahora, estamos listos para compilar todo el proyecto y generar un archivo Axis2 archive( aar). Para eso, puede usar la hormiga build.xmlque se encuentra en buildla carpeta del paquete de código. Copie el build.xmla la buildsubcarpeta en su carpeta de proyecto. Cuando ejecuta antel comando desde buildel directorio, se creará HotelReservation.aaren el directorio raíz del proyecto con la siguiente estructura:


Una vez que tenga HotelReservation.aar, estará listo para implementarlo en Apache Axis2. Puede copiar HotelReservation.aara AXIS2_HOME/repository/servicesla carpeta.

Echa un vistazo al siguiente ejemplo:

proyecto de muestra de cd
        cp HotelReservation.aar /home/user/axis2-1.6.1/repository/services/
NOTA
En este punto, asegúrese de copiar MySQLControlador JDBC que puede haber descargado de http://www.mysql.com/downloads/connector/j/ a AXIS2_HOME/lib la carpeta para facilitar la conectividad jdbc entre las clases de implementación del web services y la base de datos MySQL.

Si ya ha iniciado el servidor, los servicios se implementarán automáticamente. Si no es así, simplemente reinicie el servidor Axis2. Abra un navegador web y acceda http://localhost:8080/axis2/services/, encontrará los tres web services como se muestra en la siguiente captura de pantalla:


Debería poder ver los WSDL decada uno de estos web services accediendo a las siguientes URL:

http://localhost:8080/axis2/services/GuestManagementService?wsdl

http://localhost:8080/axis2/services/RoomManagementService?wsdl

http://localhost:8080/axis2/services/ReservationService?wsdl
  
  
## Resumen
Dedicamos este capítulo a crear un proyecto de muestra, que usó algunos web services para implementar un sistema simple de reserva de habitaciones de hotel. Comenzamos desde cero y creamos tres objetos Java antiguos simples ( POJO ). Luego los expusimos como web services implementándolos en Apache Axis2. Estos tres web services, a saber GuestManagementService, RoomManagementService,y ReservationService se utilizarán a lo largo de este libro. Todas nuestras discusiones sobre soapUI se basarán en estos servicios. Por lo tanto, incluso si no siguió el proyecto de muestra, es recomendable descargar WebServicesSample-Deliverable.zipdesde http://www.PacktPub.com/support , siga las instrucciones proporcionadas README.txtpara implementarHotelReservation.aaren Apache Axis2 y prepare los servicios para probar las muestras de soapUI que analizaremos en los próximos capítulos.
