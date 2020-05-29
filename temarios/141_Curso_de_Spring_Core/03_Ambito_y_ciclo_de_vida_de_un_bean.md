# 3. Ámbito y ciclo de vida de un bean 19m

* 10 Singleton y Prototype 6:01 
* 11 Otros ámbitos 4:25 
* 12 Manejo del ciclo de vida de un bean 9:16 
* Contenido adicional 3

# 10 Singleton y Prototype 6:01 

[PDF 3-1_Singleton_y_Prototype.pdf](pdfs/3-1_Singleton_y_Prototype.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/10-01.png">

<img src="images/10-02.png">

Cuando definimos un bean (en XML hasta ahora) estamos definiendo una "receta", esta receta es la que nos permite crear sobre una clase *instancias*. Sobre esa clase hemos definido nuestro bean y esa receta nos va a permitir crear objetos. 

¿Cuántas instancias se crean de un bean? Somos nosotros quien tenemos que marcar este punto en la configuración.

Con Spring podemos configurar el ambito de un bean a nivel de configuración (sin tener que hacerlo al viejo estilo), es decir sin tener que preocuparnos nosotros de cada uno de los objetos que vamos creando, instanciando, etc. 

Por ambito podemos entender cuantos objetos vamosa tener, la duración de vida, etc.

<img src="images/10-03.png">

Singleton es un ambito en el cual spring se va a encargar de crear una sola instancia y que cada vez que necesitemos esa instancia nos inyectara la referencia de la misma. En memoria solo abra un objeto y cada vez que lo requiramos será ese mismo objeto el que nos sea devuelto.

En este ejemplo tenemos tres beans que hacen referencia al bean `accountDao`, esos tres beans recibiran la misma y además única instancia para todos. Este es el comportamiento más usual tanto es así que es el comportamiento por defecto.

<img src="images/10-04.png">

Para poder indicarlo explícitamente, a un que como ya dijimos para el caso de singleton es el comportamiento por defecto, se hace con el atributo `scope=singleton` de manera que reforzamos la idea de que de este bean solo va existir una instancia compartida para todos.

### :computer: Ejemplo Proyecto Singleton

<img src="images/10-07.png">

*`beans.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

	<bean id="emailService" class="com.openwebinars.beans.EmailService" scope="singleton">
	   <property name="saludator" ref="saludator"></property>
	</bean>
	
	<bean id="saludator" class="com.openwebinars.beans.Saludator">
	   <property name="mensaje" value="Hola alumnos de openwebinars"></property>
	</bean>
	
</beans>
```

Aquí reforzamos que el ámbito sea singleton, pero es el comportamiento por default por lo que podríamos eliminar `scope="singleton"` y el resultado sería el mismo.

*`Saludator.java`*

```java
package com.openwebinars.beans;

public class Saludator {
	
	private String mensaje;
	
	public void setMensaje(String str) {
		this.mensaje = str; 
	}
	
	public String saludo() {
		return (mensaje == null) ? "Hola mundo!!!" : mensaje;
	}

}
```

*`IEmailService.java`*

```java
package com.openwebinars.beans;

public interface IEmailService {
	
	public void enviarEmailSaludo(String str);

}
```

*`EmailService.java`*

```java
package com.openwebinars.beans;

public class EmailService implements IEmailService{
	
	private Saludator saludator;
	
	public void setSaludator(Saludator saludator) {
		this.saludator = saludator;
	}
	
	public void enviarEmailSaludo(String destinatario) {
		System.out.println("Enviando email a " + destinatario);
		System.out.println("Mensaje: " + saludator.saludo());
	}

}
```

*`App.java`*

```java
package com.openwebinars.beans;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
		
		//Abrir contexto
		ApplicationContext appContext = new ClassPathXmlApplicationContext("beans.xml");
		
		
		IEmailService emailService1 = appContext.getBean(IEmailService.class);
		IEmailService emailService2 = appContext.getBean(IEmailService.class);
		
		System.out.println(emailService1);
		System.out.println(emailService2);
		
		//Cerrar contexto
		((ClassPathXmlApplicationContext) appContext).close();

	}

}
```

Al requerir un objeto siempre será el mismo.

Al ejecutar la aplicación tenemos.

<img src="images/10-08.png">

Hemos creado dos referencias de tipo `IEmailService` mediante el método `getBean(IEmailService.class)` hemos pedido que se inyecte la dependencia, podemos comprobar como ambos objetos son exactamente el mismo, aun que sean dos referencias diferentes.

Este es el comportamiento que podemos encontrar.

<img src="images/10-05.png">

Frente al ambito Singleton tenemos el ambito Prototype, en este caso cada vez que hagamos referencia al bean, cada vez que lo requiramos se creara una nueva instancia. Esta instancia además se va a crear en tiempo de ejecución y lo hariamos con `scope="prototype"`. Este uso es muy  poco usual.

<img src="images/10-06.png">

### :computer: Ejemplo Proyecto Prototype

*`beans.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

	
	<bean id="emailService" class="com.openwebinars.beans.EmailService" scope="prototype">
	   <property name="saludator" ref="saludator"></property>
	</bean>
	
	<bean id="saludator" class="com.openwebinars.beans.Saludator">
	   <property name="mensaje" value="Hola alumnos de openwebinars"></property>
	</bean>
	
</beans>
```

Usamos `scope="prototype"`.

*`Saludator.java`*

```java
package com.openwebinars.beans;

public class Saludator {
	
   private String mensaje;
	
   public void setMensaje(String str) {
      this.mensaje = str; 
   }
	
   public String saludo() {
      return (mensaje == null) ? "Hola mundo!!!" : mensaje;
   }

}
```

Este archivo sigue sindo igual.

*`IEmailService.java`*

```java
package com.openwebinars.beans;

public interface IEmailService {
	
   public void enviarEmailSaludo();
   public void enviarEmailSaludo(String str);
   public void setDestinatarioPorDefecto(String destinatario);
	
}
```

La interfaz declara tres métodos.

*`EmailService.java`*

```java
package com.openwebinars.beans;

public class EmailService implements IEmailService{
	
   private Saludator saludator;
   private String destinatarioPorDefecto;
 	
   public void setSaludator(Saludator saludator) {
      this.saludator = saludator;
   }
	
   public void setDestinatarioPorDefecto(String destinatario) {
      this.destinatarioPorDefecto = destinatario;
   }
	
   public void enviarEmailSaludo() {
		
      if( destinatarioPorDefecto != null)
         enviarEmailSaludo(destinatarioPorDefecto);
      else
	 System.out.println("Configure un destinatario por defecto para poder enviar los mensajes");
   }
	
   public void enviarEmailSaludo(String destinatario) {
      System.out.println("Enviando email a " + destinatario);
      System.out.println("Mensaje: " + saludator.saludo());
   }

}
```

Se implementan los tres métodos declarados en la interfaz.

*`App.java`*

```java
package com.openwebinars.beans;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

   public static void main(String[] args) {
		
      //Abrir contexto
      ApplicationContext appContext = new ClassPathXmlApplicationContext("beans.xml");
			
      IEmailService emailService1 = appContext.getBean(IEmailService.class);
      emailService1.setDestinatarioPorDefecto("adolfo@gmail.com");
      emailService1.enviarEmailSaludo();
		
      System.out.println("");
      IEmailService emailService2 = appContext.getBean(IEmailService.class);
      emailService2.enviarEmailSaludo();
		
      //Cerrar contexto
      ((ClassPathXmlApplicationContext) appContext).close();
      
   }

}
```

Aquí creamos dos `emailService`, en uno de ellos en la implementación podemos marcar un destinatario por defecto a la hora de enviar los emails. 

Estamos definiendo el destinatario por defecto en la referencia 1 pero no en la 2, por lo que en este último no tendremos destinatario por defecto.

Al ejecutar la aplicación tenemos:

<img src="images/10-09.png">

En el primer caso se ha enviado el email pero en el segundo caso como no hemos establecido un destinatario, ni hay un destinatario por defecto no se ha podido enviar.

Si el alcance lo tuvieramos como `scope="singleton"` si los mensajes si se enviarían dos veces, por que realmente estamos utilizando el mismo bean por detras.

<img src="images/10-10.png">

Aquí la idea es ilustrar `scope="prototype"` para comprobar que cada que requiramos un bean se crea una nueva instancia caso contrario con `scope="singleton"` donde se usa la misma instancia.

# 11 Otros ámbitos 4:25 

[PDF 3-2_Otros_ambitos.pdf](pdfs/3-2_Otros_ambitos.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/11-01.png">

<img src="images/11-02.png">

Aquí hablaremos de otros ambitos que existen en este caso sobre la Web. Estos ámbitos diferentes a `singleton` y `prototype` los encontraremos cuando trabajemos en un contexto Web, el cual se inicia con `XmlWebApplicationContext`.

Los ámbitos para contextos web son:

* `Request`
* `Session`
* `Application`
* `WebSocket`

Si los usaramos dentro del contexto `ClassPathXmlApplicationContext` se producirá una excepción.

<img src="images/11-03.png">

El ámbito Request permite decir que un objeto va a tener como ciclo o ámbito de vida va a ser cada petición. Por cada nueva petición que nosotros hagamnos se creara una nueva petición y cuando esa petición finalice se descartara el objeto.

Por ejemplo cada vez que hagamos un Login se lanza la petición con un ambito request mediante `scope="request"`.

<img src="images/11-04.png">

Si lo que necesitamos es tener un bean que tenga una vida mayor a la de una petición y que dure a lo largo de toda una sesión de un usuario tenemos el `scope="session"`. Por ejemplo para mantener las preferencias de un usuario a traves de usar una aplicación determinada. Marcando el bean con `scope="session"`, el bean se instanciara cuando la sesión comience y tendra vida a lo largo de diferentes peticiones, no se destruye al finalizar una request, sino que tendrá vida hasta que la sesión se destruya, en ese momento se descarta el objeto.

<img src="images/11-05.png">

Finalmente el que vamos a ver es el de ámbito `application`, usamos `scope="application"`, en este caso se creara un solo objeto por cada `ServletContext` que nosotros creemos, en la práctica se trata de un objeto por cada ejecución de la aplicación que nosotros hagamos. Por ejemplo para una serie de preferencias globales de la aplicación, por ejemplo textos que salgan en los encabezados o pies de página de toda la aplicación.  

# 12 Manejo del ciclo de vida de un bean 9:16 

[PDF 3-3_Manejo_del_ciclo_de_vida.pdf](pdfs/3-3_Manejo_del_ciclo_de_vida.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/12-01.png">

<img src="images/12-02.png">

<img src="images/12-03.png">

<img src="images/12-04.png">

<img src="images/12-05.png">

<img src="images/12-06.png">

<img src="images/12-07.png">

# Contenido adicional 3

* [PDF 3-1_Singleton_y_Prototype.pdf](pdfs/3-1_Singleton_y_Prototype.pdf)
* [PDF 3-2_Otros_ambitos.pdf](pdfs/3-2_Otros_ambitos.pdf)
* [PDF 3-3_Manejo_del_ciclo_de_vida.pdf](pdfs/3-3_Manejo_del_ciclo_de_vida.pdf)
