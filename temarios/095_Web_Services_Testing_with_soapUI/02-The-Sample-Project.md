# Capítulo 2. El proyecto de muestra
En este libro, seguimos un enfoque práctico para aprender a probar servicios web con soapUI. Le recomendamos enfáticamente que tenga su computadora con usted mientras lee el libro y pruebe los escenarios de prueba que se describirán a lo largo de este libro.

En este capítulo, cubriremos los siguientes temas:

Preparando el entorno del proyecto
Diseño de los servicios web
Implementando los servicios web
Despliegue de los servicios web
Como primer paso del aprendizaje práctico, presentaremos un proyecto de muestra en este capítulo. Nuestro objetivo es construir un proyecto simple pero completo que cubra la considerable cantidad de funciones relacionadas con las pruebas de servicios web. Diseñaremos y construiremos un proyecto de muestra con algunos servicios web. Comenzamos desde cero, siguiendo el enfoque de desarrollo de servicios web de código primero donde primero escribimos clases de Java y luego las implementamos en un contenedor de servicios web.

CONSEJO
Hay dos formas dedesarrollo de servicios web; enfoques de contrato primero y código primero. En un enfoque de contrato primero, la definición del servicio web o el WSDL se crea inicialmente y la implementación del servicio se realiza después de eso. En un enfoque de código primero, las clases de implementación del servicio se desarrollan al principio y, por lo general, el contenedor de servicios en el que se implementa el servicio web genera automáticamente el WSDL. En nuestro proyecto de muestra, seguiremos el segundo enfoque, el desarrollo de servicios web con código primero, ya que es relativamente más fácil crear servicios web desde cero.

No discutiremos ningún aspecto de prueba dentro de este capítulo. Nuestro enfoque es construir la base para los últimos capítulos de este libro, donde planeamos usar soapUI para probar el proyecto de muestra. Si cree que puede seguir adelante con soapUI sin perder tiempo en el proyecto de muestra de servicios web, solo usará el resultado del proyecto, que es un conjunto de servicios web.

CONSEJO
Descargando el código de ejemplo

Puede descargar los archivos de código de ejemplo para todos los libros de Packt que haya comprado desde su cuenta en http://www.PacktPub.com . Si compró este libro en otro lugar, puede visitar http://www.PacktPub.com/support y registrarse para recibir los archivos directamente por correo electrónico.

Si decidió omitir el proyecto de muestra y simplemente usar los servicios web resultantes, los siguientes pasos lo ayudarán a implementar rápidamente y use los servicios web con soapUI:

Descargue la muestra de servicios webde http://www.PacktPub.com/support . Extraiga WebServicesSample-Deliverable.zipa su sistema de archivos local. Encontrará HotelReservation.aarel archivo y dbscriptsla carpeta en la raíz de la carpeta extraída.
Ejecútelo dbscripts/HotelReservationDBSchema.sqlen su servidor de base de datos MySQL para crear la base de datos y las tablas de muestra.
Modifique los valores de mysql.host, mysql.port, mysql.usernamey mysql.passwordpropiedades en mysql.propertiesel archivo que se puede encontrar dentro confde la carpeta de HotelReservation.aar.
Implemente HotelReservation.aaren Apache Axis2 (consulte la sección Implementación de servicios web al final de este capítulo para saber cómo implementar servicios web en Apache Axis2) y utilícelo en todas las pruebas de soapUI que trabajaremos en el resto de los capítulos.
Puede consultar el README.txtde WebServicesSample-Deliverable.zippara obtener más información sobre el procedimiento de instalación.
El dominio del problema
Nuestro proyecto se basará en un sistema de reserva de hotel hipotético, que está destinado a ser utilizado por un personal administrativo de unhotel. El sistema consta de tres funciones básicas de la siguiente manera:

Gestión de invitados
Gestión de habitaciones
Gestión de reservas
Veamos la arquitectura de alto nivel delaplicación de reserva de hotel de muestra que vamos a discutir en este capítulo:


El sistema de reservas hoteleras se compone de tres entidades fundamentales; Huésped, Habitación y Reserva. Cada invitado se identifica por nombre, dirección y edad. Las habitaciones se identifican por número de habitación, tipo de habitación y tamaño de la habitación. La reserva de una habitación se realiza asignando un huésped a una habitación.

No vamos a complicar demasiado nuestro proyecto, ya que nuestro objetivo es obtener un conjunto de servicios web para probar con soapUI en los próximos capítulos. Por lo tanto, omitimos deliberadamente algunas interrelaciones entre estas entidades. Por ejemplo, asumimos que un huésped solo puede hacer una reserva a la vez.
