# 6. Envío de correos electrónicos 40:42

* Configuración previa 04:18
* Creación de una clase manejadora de correos 17:13
* Implementación de envío de correos electrónicos en la Vista y el Controlador 12:34
* Completando el código de envío de correos 06:37

## Configuración previa 04:18

Para poder enviar correos con Java necesitamos:

* un cuenta de Correo
* Un API 

### Configurar Cuenta de Correo

Para poder envíar correos en Java hay que configurar una cuenta de correos desde donde vamos envíar los correos, esta puede ser una cuenta hotmail, gmail o una cuenta de un servidor que tengamos contratado, este último caso es el que configuraremos aquí.

![6-email-1](images/6-email-1.png)

![6-email-2](images/6-email-2.png)

![6-email-3](images/6-email-3.png)

![6-email-4](images/6-email-4.png)

![6-email-5](images/6-email-5.png)

![6-email-6](images/6-email-6.png)

![6-email-7](images/6-email-7.png)

![6-email-8](images/6-email-8.png)

### Configigurar JavaMail API (compat) » 1.4.7

[JavaMail API (compat) » 1.4.7](https://mvnrepository.com/artifact/javax.mail/mail/1.4.7)

Necesitamos descargar la librería `javax.mail.jar`, en enlace abterior nos permite descargar `mail-1.4.7.jar`
el cual lo añadimos en la carpeta `lib` y lo añadimos al Build Path.

![6-lib-email](images/6-lib-email.png)

## Creación de una clase manejadora de correos 17:13

En esta lección vamos a crear una clase manejadora de correos. 

La nueva clase la crearemos en un nuevo paquete llamado `util` dentro de este paquete crearemos la clase `ManejadorCorreos.java` esta clase tiene que hacer los siguientes pasos:

* Iniciarlizar las propiedades de conexión como Host, Puerto, Usuario, Autenticación
* Inicializar una sesión de email con todas las propiedades previamente definidas
* Composición del mensaje pasando como parámetro la sesión. Establece emisor, destinatario, asunto y mensaje
* Crear un objeto que modela un objeto para el transportedel transporte, crea un canal de comunicación para el mensaje. 

Una vez hecho todo esto crearemos una clase de prueba `TestManejadorCorreos.java` para el envio de correos, con un método ``.



## Implementación de envío de correos electrónicos en la Vista y el Controlador 12:34
## Completando el código de envío de correos 06:37
