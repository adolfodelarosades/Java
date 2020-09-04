# Ejercicios propuestos

1. Realizar una aplicación para cargar los datos de COVID de un cvs o un JSON a base de datos.
Al iniciarse la aplicación, solicitará la dirección del fichero y procederá a cargar en la base de
datos los datos del fichero que no estén ya cargados. Es decir, aquellas combinaciones de
**fecha** y **abreviatura de comunidad** que ya estén en la BD no se cargarán de nuevo.

2. Desarrollar una aplicación para un cajero virtual, utilizando la base de datos `bancadb`. Al
iniciarse el programa se solicitará al usuario la introducción del número de cuenta, si es válido,
se le mostrarán al usuario las opciones a realizar, sino, se mostrará un mensaje de error y el
programa finalizará. Las opciones que debe permitir el programa son: 

   * Sacar dinero
   * Ingresar dinero
   * Mostrar saldo y últimos movimientos (de los últimos 30 días)
   * Realizar transferencia a otra cuenta.

   Se realizará una segunda parte de la aplicación para administradores, que permitirá:
   
   * Añadir nuevas cuentas
   * Nuevos clientes 
   * Titulares asociados a cuentas.

3. Dado el documento JSON con los datos de países, realizar una capa de lógica de negocio
que permita obtener los siguientes datos:

   * Lista de países pertenecientes a la región indicada como parámetro
   * País más poblado
   * Total de países cuyo número de habitantes supere el valor recibido como parámetro
   * Paises cuyos nombres contengan la combinación de letras recibida como parámetro
   * Posición (longitud y latitud) del país cuyo alfa2code se recibe como parámetro
   * Población media de la región que se recibe como parámetro
   * Tabla con las regiones y la población total de cada una

   Nota: Un país contiene la siguiente información: 
   
       * Nombre
       * Capital
       * Área
       * Población

4. Desarrollar una aplicación cliente-servidor para la gestión de los datos Covid. Por un lado, el
servidor será una aplicación que recibirá por parte del cliente el nombre de la comunidad
autónoma, entregándole como respuesta un resumen de datos de esa comunidad: 

   * Total positivos
   * Media de positivos diarios
   * Fecha de pico de contagios de esa comunidad
   
   Implementar también un cliente que conecte con el servidor, mande el nombre de la
comunidad y guarde los resultados en un fichero de texto local
