# 10. Validación de Datos 34:57

* Comprobando la integridad de los datos en el servidor 16:02
* Validando los datos en el cliente con JQuery 18:55

## Comprobando la integridad de los datos en el servidor 16:02

En esta lección validaremos los datos en el servidor. Es importante validar los datos para no comprometer su integridad. Nos valdemos de el API [Commons Validator](http://commons.apache.org/proper/commons-validator/) para realizar algunas validaciones estandar como pueden ser:

* ABANumberCheckDigit
* CalendarValidator
* CreditCardValidator
* EmailValidator
* IBANCheckDigit
* PercentValidator
* TimeValidator
* UrlValidator

Entre muchas más.

1. Descargar el archivo `commons-validator-1.6-bin.zip` descomprimirlo, copiar el archivo `commons-validator-1.6.jar` dentro de la carpeta `lib` y añadirlo a la Build path.

2. Abrir el bean `Administrador.java` donde crearemos un método de validación de este bean 

```java
public boolean isValidAdministrador() {
   sb = new StringBuilder();
   boolean valorRetorno = false;
		
   //Uso de Commonds validate para el Email
   EmailValidator emailValidator = EmailValidator.getInstance();
   if(! emailValidator.isValid(email)) {
      sb.append("* Email invalido");
      valorRetorno = false;
   }
		
   if(contrasena.equals("")) {
      sb.append("* Contraseña no puede estar vacía");
      valorRetorno =  false;
   }
		
   if(contrasena.length() < 4) {
      sb.append("* Contraseña debe contener mínimo 4 caracteres");
      valorRetorno =  false;
   }
				
   if(nombre.equals("")) {
      sb.append("* Nombre no puede estar vacío.");
      valorRetorno =  false;
   }
		
   if(sb.length() == 0) {
      valorRetorno = true;
   }
		
   return valorRetorno;
}
```

3. Tambén en `Administrador.java` creamos un método para retornar el valor de nuestro StringBuilder `sb``

```java
public String getErrorForm() {
   return (sb != null) ? sb.toString() : new StringBuilder().toString();//cadena vacía sino se cumple
}
```

4. En `Servlet.java` antes de insertar el registro a la BD haremos la validación.

```java
...
} else if(accion.contentEquals("registrarAdministrador")) {
				
   Administrador administrador = new Administrador();
   administrador.setEmail(request.getParameter("email"));
   administrador.setContrasena(request.getParameter("contrasena"));
   administrador.setNombre(request.getParameter("nombre"));
   administrador.setRespuesta(request.getParameter("respuesta"));
				
   if (sesion.getAttribute("urlImagen") != null) {
      if (!sesion.getAttribute("urlImagen").equals("")) {
	 administrador.setUrlImagen((String) sesion.getAttribute("urlImagen"));
      } 
   }
   administrador.setIdPregunta(Integer.parseInt(request.getParameter("pregunta")));
				
   if (administrador.isValidAdministrador()) {
      if (!new Cuenta(con).existeAdministrador(request.getParameter("email"))) {
	 //Insertar en la BD
	 //forma anonima
	 if (new Cuenta(con).registrarAdministrador(administrador)) {
	    request.setAttribute("msg", "Administrador creado correctamente");
	 } else {
	    request.setAttribute("msg", "Error al crear Administrador");
	 }
      } else {
         request.setAttribute("msg", "¡El Administrador ya existe!");
      } 
   } else {
      request.setAttribute("msg", administrador.getErrorForm());
   }
   //Redirige a la misma página
   setRespuestaControlador("registroAdministrador").forward(request, response);
}
...
```

### Ejecución de la Aplicación


![10-validaciones](images/10-ej-1.png)

![10-validaciones](images/10-ej-2.png)

![10-validaciones](images/10-ej-3.png)

Si presionamos el botón Crear sin introducir ningún dato se muestran los mensajes de validación.

![10-validaciones](images/10-ej-4.png)

Si metemos una validación de menos de 3 caracteres muestra estas validaciones

![10-validaciones](images/10-ej-5.png)

si se mete una contraseña de 4

![10-validaciones](images/10-ej-6.png)

Solo muetra las validaciones de email y nombre

![10-validaciones](images/10-ej-7.png)

Si metemos un email invalido

![10-validaciones](images/10-ej-8.png)

Muestra la validación

![10-validaciones](images/10-ej-9.png)

si metermos todos los datos

![10-validaciones](images/10-ej-10.png)

Nos indica que el administrador a sido dado de alta 

![10-validaciones](images/10-ej-11.png)

Y vemos el registro en la BD.

![10-validaciones](images/10-ej-12.png)

## Validando los datos en el cliente con JQuery 18:55
