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

### :computer: Ejemplo Proyecto Singleto

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

Aquí reforzamos que el ambito sea singleton.

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

Al ejecutar la aplicatición tenemos.

<img src="images/10-08.png">

<img src="images/10-05.png">

<img src="images/10-06.png">

# 11 Otros ámbitos 4:25 

[PDF 3-2_Otros_ambitos.pdf](pdfs/3-2_Otros_ambitos.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/11-01.png">

<img src="images/11-02.png">

<img src="images/11-03.png">

<img src="images/11-04.png">

<img src="images/11-05.png">

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
