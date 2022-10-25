# Spring Boot + Swagger 3 (OpenAPI 3) Hello World Example

https://www.javainuse.com/spring/boot_swagger3

## Introducción

En el tutorial anterior habíamos implementado [Spring Boot + Swagger Hello World Example](https://github.com/adolfodelarosades/Java/blob/master/temarios/680-OpenAPI-Beginner_to_Guru/ejemplos/SpringBoot-Swagger2.md). Vimos qué es **Swagger** y por qué es útil implementarlo. El ejemplo usaba una versión anterior de **Swagger**.

## ¿Qué es Swagger y Open API Specification?


La **OpenAPI Specification (formerly Swagger Specification)** es un formato de descripción de **API** para **API REST**. Un archivo OpenAPI le permite describir toda su API.

**Swagger** es un conjunto de herramientas de código abierto creadas en torno a la **especificación OpenAPI** que puede ayudarlo a diseñar, crear, documentar y consumir **API REST**.

<img width="754" alt="image" src="https://user-images.githubusercontent.com/23094588/197801486-29334fde-5d42-498d-83db-ada9417822d3.png">

En los últimos años, **Swagger** se ha convertido en el estándar para definir o documentar su **API**. Anteriormente conocido como **Swagger Specification**, este formato ha sido donado a la Open API Initiative (o OAI) la cual es un Linux Foundation Collaborative Project.

En julio de 2017, la **OpenAPI Specification 3.0.0** finalmente fue lanzada por **Open API Initiative**. Esto ha mejorado las [especificaciones con respecto a las anteriores](https://swagger.io/specification/).

La **springdoc-openapi java library** implementa la especificación OpenAPI 3.0.0 y se usará aquí.
The springdoc-openapi java library implements the OpenAPI Specification 3.0.0 and will be used here.

## Spring Boot Swagger- Tabla de Contenido


* Spring Boot + Swagger Example Hello World Example
* Spring Boot + Swagger- Understanding the various Swagger Annotations
* Spring Boot + Swagger + Profile - Implementing Spring Boot Profile for a Swagger application
* Spring Boot + Swagger 3 (OpenAPI 3) Hello World Example
* Spring Boot + Swagger 3 (OpenAPI 3) + Security Example

## Video

Este tutorial se explica en el siguiente [video de Youtube](https://www.youtube.com/watch?v=_OCwQwfd6YI).

## Vamos a empezar

Crearemos un proyecto **Spring Boot** y luego implementaremos la especificación **OpenAPI 3** para documentar las **API REST**. El proyecto maven que desarrollaremos es el siguiente:

<img width="303" alt="image" src="https://user-images.githubusercontent.com/23094588/197803732-87add07b-cfbc-4ea1-b066-e1a54760bc42.png">

El **`pom.xml`** tendrá la dependencia **`springdoc-openapi`*.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.2.8.RELEASE</version>
		<relativePath /> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.javainuse</groupId>
	<artifactId>boot-swagger-3</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>boot-swagger-3</name>

	<properties>
		<java.version>1.8</java.version>
	</properties>

	<dependencies>
		<!-- Swagger UI -->
		<dependency>
			<groupId>org.springdoc</groupId>
			<artifactId>springdoc-openapi-ui</artifactId>
			<version>1.2.32</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
	</dependencies>

	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

</project>
```

Cree la clase de dominio denominada **`Employee`**. También más adelante en la clase de Controlador realizaremos operaciones CRUD para el objeto **`employee`**. Por lo tanto, también sobreescribiremos(overriding) los métodos **`equals`** y **`hashCode`** en la clase **`Employee`**.

```java
package com.javainuse.model;

public class Employee {
	private String empId;
	private String name;
	private String designation;
	private double salary;

	public Employee() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((designation == null) ? 0 : designation.hashCode());
		result = prime * result + ((empId == null) ? 0 : empId.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		long temp;
		temp = Double.doubleToLongBits(salary);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Employee other = (Employee) obj;
		if (designation == null) {
			if (other.designation != null)
				return false;
		} else if (!designation.equals(other.designation))
			return false;
		if (empId == null) {
			if (other.empId != null)
				return false;
		} else if (!empId.equals(other.empId))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (Double.doubleToLongBits(salary) != Double.doubleToLongBits(other.salary))
			return false;
		return true;
	}

}
```

En la clase de Controlador, crearemos una lista de empleados. Luego expondremos los REST GET, POST y DELETE endpoints. Cree la clase de Controlador de la siguiente manera:

```java
package com.javainuse.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.javainuse.model.Employee;

@RestController
public class EmployeeController {

	private List<Employee> employees = createList();

	@RequestMapping(value = "/employees", method = RequestMethod.GET, produces = "application/json")
	public List<Employee> firstPage() {
		return employees;
	}

	@DeleteMapping(path = { "/{id}" })
	public Employee delete(@PathVariable("id") int id) {
		Employee deletedEmp = null;
		for (Employee emp : employees) {
			if (emp.getEmpId().equals(id)) {
				employees.remove(emp);
				deletedEmp = emp;
				break;
			}
		}
		return deletedEmp;
	}

	@PostMapping
	public Employee create(@RequestBody Employee user) {
		employees.add(user);
		System.out.println(employees);
		return user;
	}

	private static List<Employee> createList() {
		List<Employee> tempEmployees = new ArrayList<>();
		Employee emp1 = new Employee();
		emp1.setName("emp1");
		emp1.setDesignation("manager");
		emp1.setEmpId("1");
		emp1.setSalary(3000);

		Employee emp2 = new Employee();
		emp2.setName("emp2");
		emp2.setDesignation("developer");
		emp2.setEmpId("2");
		emp2.setSalary(3000);
		tempEmployees.add(emp1);
		tempEmployees.add(emp2);
		return tempEmployees;
	}
}
```

Finalmente, cree la clase de arranque **Spring Boot** de la siguiente manera:

```java
package com.javainuse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SwaggerSpringDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SwaggerSpringDemoApplication.class, args);
	}

}
```

Iniciar el proyecto. Si ahora vamos a **`localhost:8080/swagger-ui.html`**, podemos ver la interfaz de usuario de **Swagger** de la siguiente manera:

<img width="845" alt="image" src="https://user-images.githubusercontent.com/23094588/197806629-907d0218-5258-46c4-9080-3b8eafff398f.png">

Además, si vamos a **`http://localhost:8080/v3/api-docs`**, la descripción de OpenAPI estará disponible en la siguiente URL para el formato json:

<img width="641" alt="image" src="https://user-images.githubusercontent.com/23094588/197806996-e4d859c8-c6b5-44b9-9a1e-63516c9a5af5.png">

