# 20201111 Miercoles

## :computer: `14_gestion_candidatos_persistencia` Continuación...

### Acceso a la Capa de Persistencia con consultas JPA

Para hacer operaciones más personalizadas debemos recurrir a las Consultas JPA

![05-23](images/05-23.png)
![05-24](images/05-24.png)
![05-25](images/05-25.png)
![05-26](images/05-26.png)
![05-27](images/05-27.png)
![05-28](images/05-28.png)

En las Consultas JPA ya no usamos el Objeto `EntityManager` usamos los objetos `Query` y `TypeQuery` los cuales usan el el lenguaje JPQL que es parecido al SQL, pero aplicado a Entidades en lugar de Tablas.

Con la información previa ya podemos realizar el método `recuperarCandidatos()`.

Vamos a hacer una primera versión usando `Query`

```java
public List<Candidato> recuperarCandidatos(){
   String jpql = "Select c From Candidato c";
   Query query = em.createQuery(jpql);
   return (List<Candidato>)query.getResultList();
}
```

Debemos definir un `String` con la sentencia JPQL, donde no seleccionamos atributos especificos sino que ponemos un alias `Select c `, en el `From Candidato c` hacemos referencia a la Entidad **NO A LA TABLA** usando el alias al final. Usando el `EntityManager` creamos un Objeto `Query` usando el método `createQuery` al que le pasamos la sentencia JPQL `Query query = em.createQuery(jpql)` el resultado se almacena en `query`. Con el método `getResultList()` retorna el resultado en una `List` sin tipo, necesitamos por lo tanto hacer un casting a `(List<Candidato>)` que es lo que necesitamos retornar.

Si hasta aquí probamos nuestra aplicación, comprobamos que todo funciona correctamente.

Alternativamente al uso de `Query` podemos usar `TypeQuery`, vamos a ver como queda el mismo método con su uso:

```java
public List<Candidato> recuperarCandidatos(){
   String jpql = "Select c From Candidato c";
   //Query query = em.createQuery(jpql);
   //return (List<Candidato>)query.getResultList();
   TypedQuery<Candidato> query = em.createQuery(jpql, Candidato.class);
   return query.getResultList();
}
```

La principal diferencia entre `Query` y `TypeQuery` como su nombre lo indica es es un Query tipado, por un lado ponemos el generico en el `TypeQuery` y por otro lado incluimos como parámetro la Clase en el método `createQuery`. El resultado ya es del tipo indicado por lo cual ya no es necesario hacer el Casting.

Vamos a ver algunos otros ejemplos para familiarizarnos con las Consultas JPA, pero antes vamos a ver que son las Consultas Parametrizadas.

### Consultas Parametrizadas

![05-29](images/05-29.png)
![05-30](images/05-30.png)
![05-31](images/05-31.png)

### Consultas de Acción

![05-36](images/05-36.png)
![05-37](images/05-37.png)
![05-38](images/05-38.png)

¿Cómo recuperariamos los Candidatos de un Puesto determinado?

```java
public List<Candidato> recuperarCandidatosPuesto(String puesto){
   String jpql = "Select c From Candidato c Where c.puesto = ?1";
   TypedQuery<Candidato> query = em.createQuery(jpql, Candidato.class);
   query.setParameter(1, puesto);
   return query.getResultList();
}
```

¿Cómo buscar un Candidato por su Email?

```java
public Candidato buscarCandidatoPorEmail(String email){
   String jpql = "Select c From Candidato c Where c.email = ?1";
   TypedQuery<Candidato> query = em.createQuery(jpql, Candidato.class);
   query.setParameter(1, email);
		
   // 1er Forma de hacerlo
   /*
   List<Candidato> candidatos = query.getResultList();
   return candidatos.size()>0  ? candidatos.get(0):null;
   */
		
   //2da Forma //Si no encuentra o encuentra más de 1 devuelve excepcion
   try {
      return query.getSingleResult();
   }catch(NoResultException | NonUniqueResultException ex) {
      return null;
   }	
}
```

Aquí planteamos dos soluciones, en la primer recuperamos una lista de Candidatos por su email y si exiten datos en la lista retornamos el primer elemento y si no retornamos `null`.

En la segunda solución de igual manera recuperamos una lista de Candidatos por su email, ***esperando que nos va a retornar solo un valor***, por lo cual usamos el método `getSingleResult()` que retorna un único valor del tipo declarado. Pero en el caso que no exista ningún resultado se dispara la excepción `NoResultException` y si se tiene más de 1 resultado se dispara la excepción `NonUniqueResultException` por lo cual se retorna `null`.

**NOTA:** ***En JPA todas las excepciones son unchecked, por lo que hay que tener sus precauciones para implentarlas cuando sean necesarias.****

¿Cómo eliminamos un Candidato por su Email?

```java
public void eliminarCandidatoPorEmail(String email){	
   EntityTransaction tx=em.getTransaction();
   tx.begin(); //inicio tx siempre que sea consulta de acción
   String jpql = "Delete From Candidato c Where c.email = ?1";
   Query query = em.createQuery(jpql);
   query.setParameter(1, email);
   query.executeUpdate();
   tx.commit();
}
```

En este método como estamos trabajando con una operación de acción necesitamos usar una transacción. Por otro lado como no vamos a retornar nigún resultado podemos usar simplemente `Query`. Para ejecutar la sentencia usamos em método `query.executeUpdate();`
 
El código completo de la Clase `CandidatosService` es:
 
```java
package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.hibernate.NonUniqueResultException;

import model.Candidato;

public class CandidatosService {
	
   private static EntityManager em;
   static {
      EntityManagerFactory factory=Persistence.createEntityManagerFactory("empresaPU");
      em=factory.createEntityManager();
   }
	
   public void altaCandidato(Candidato candidato) {
      EntityTransaction tx = em.getTransaction();
      tx.begin();
      em.persist(candidato);
      tx.commit();
   }
	
   public void eliminarCandidato(int idCandidato) {
      Candidato candidato=em.find(Candidato.class, idCandidato);
		
      EntityTransaction tx = em.getTransaction();
      tx.begin();
      if(candidato!=null) {
         em.remove(candidato);
      }
      tx.commit();
   }
	
   public List<Candidato> recuperarCandidatos(){
      String jpql = "Select c From Candidato c";
      //Query query = em.createQuery(jpql);
      //return (List<Candidato>)query.getResultList();
      TypedQuery<Candidato> query = em.createQuery(jpql, Candidato.class);
      return query.getResultList();
   }
	
   public List<Candidato> recuperarCandidatosPuesto(String puesto){
      String jpql = "Select c From Candidato c Where c.puesto = ?1";
      TypedQuery<Candidato> query = em.createQuery(jpql, Candidato.class);
      query.setParameter(1, puesto);
      return query.getResultList();
   }
	
   public Candidato buscarCandidatoPorEmail(String email){
      String jpql = "Select c From Candidato c Where c.email = ?1";
      TypedQuery<Candidato> query = em.createQuery(jpql, Candidato.class);
      query.setParameter(1, email);
		
      // 1er Forma de hacerlo
      /*
      List<Candidato> candidatos = query.getResultList();
      return candidatos.size()>0  ? candidatos.get(0):null;
      */
		
      //2da Forma //Si no encuentra o encuentra más de 1 devuelve excepcion
      try {
         return query.getSingleResult();
      }catch(NoResultException | NonUniqueResultException ex) {
         return null;
      }
		
   }
	
   public void eliminarCandidatoPorEmail(String email){	
      EntityTransaction tx=em.getTransaction();
      tx.begin(); //inicio tx siempre que sea consulta de acción
      String jpql = "Delete From Candidato c Where c.email = ?1";
      Query query = em.createQuery(jpql);
      query.setParameter(1, email);
      query.executeUpdate();
      tx.commit();
	}
}
```

### La Capa de Vista 

Esta capa no ha sufrido ningun cambio.

### Probar la Aplicación

![14-43-ej](images/14-43-ej.png)

![14-39-ej](images/14-39-ej.png)
![14-40-ej](images/14-40-ej.png)
![14-41-ej](images/14-41-ej.png)
![14-42-ej](images/14-42-ej.png)

## :computer: `15_gestion_candidatos_persistencia_eliminacion`

Partiendo del proyecto `14_gestion_candidatos_persistencia` vamos a crear el proyecto `15_gestion_candidatos_persistencia_eliminacion` en el cual vamos a implementar la funcionalidad de eliminar el Contacto por Email.

![15-01-eje](images/15-01-eje.png)

Nuestra pantalla de Menú debe incluir la nueva opción de Eliminar por Email.

`menu.html`

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menú</title>
<link rel="stylesheet" type="text/css" href="css/w3.css">
</head>
<body>
   <div align="center">
      <h1 class="w3-jumbo">Candidatos</h1>
      <p class="w3-xlarge w3-text-dark-grey">Los mejores candidatos del mercado</p>
  	  <a href="alta.html" class="w3-button w3-dark-grey">Nuevo Candidato</a>
      <a href="candidatos.jsp" class="w3-button w3-dark-grey">Mostrar Candidatos</a>
      <a href="eliminarcandidatoxemail.html" class="w3-button w3-dark-grey">Eliminar Candidatos por Email</a>
   </div>
</body>
</html>
```

Tenemos una nueva página HTML para capturar el Email del contacto que queremos eliminar.

`eliminarcandidatoxemail.html`

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nuevo candidato</title>
<link rel="stylesheet" type="text/css" href="css/w3.css">
</head>
<body>
   <div class="w3-padding">
      <h1>Eliminar Candidato por email</h1>
      <form action="EliminarCandidatoPorEmail" method="post">	
         <label for="email">Email:</label><br>
         <input type="email" name="email" placeholder="Introduce tu email" required="required"><br/><br/>
			
         <input type="submit" value="Eliminar">	
      </form>
   </div>
</body>
</html>
```

En caso de que el email no exista vamos a mostrar una nueva pantalla indicando que ese email no existe.

`noexisteemail.html`

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>No existe el Email</title>
<link rel="stylesheet" type="text/css" href="css/w3.css">
</head>
<body>
   <div align="center" class="w3-padding">
      <h1>No existe el Email.</h1>
   </div>
   <br><br>
   <div align="right" class="w3-padding">
      <a href="menu.html" class="w3-button w3-dark-grey">Volver al menú</a>
   </div>
</body>
</html>
```

Para eliminar el Contacto por Email necesitamos un nuevo Servlet `EliminarCandidatoPorEmail` con el siguiente código.

`EliminarCandidatoPorEmail`

```java
package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Candidato;
import service.CandidatosService;

@WebServlet("/EliminarCandidatoPorEmail")
public class EliminarCandidatoPorEmail extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      CandidatosService service = new CandidatosService();
      String email=request.getParameter("email");
      Candidato candidato = service.buscarCandidatoPorEmail(email);
      if (candidato != null ) {
         service.eliminarCandidatoPorEmail(email);
         request.getRequestDispatcher("menu.html").forward(request, response);
      }else {
         request.getRequestDispatcher("noexisteemail.html").forward(request, response);
      }	
   }
}
```

En este nuevo Servlet usamos dos de los métodos implementados en `CandidatosService` con consultas JPA, primero recuperamos el Candidato por Email si existe lo eliminamos y nos vamos a la pantalla de menú, si no existe mostramos una pantalla indicandolo.

Básicamente eso es todo lo que teniamos que hacer para implementar la funcionalidad de Eliminar Contacto por Email.

### Probar la Aplicación.

![15-02-eje](images/15-02-eje.png)
![15-03-eje](images/15-03-eje.png)
![15-04-eje](images/15-04-eje.png)
![15-05-eje](images/15-05-eje.png)
![15-06-eje](images/15-06-eje.png)

### Named Queries o Consultas Nominadas

![05-32](images/05-32.png)
![05-33](images/05-33.png)
![05-34](images/05-34.png)
![05-35](images/05-35.png)

Las Named Queries nos permiten limpiar nuestras consultas JPA de la capa de Servicio y a la vez siverve para la reutilización de código ya que las sentencias estan en las Entidades y cualquier otra clase que use esas entidades ya puede usar esas sentencias. Como desventaja no se ve exactamente lo que se ejecuta desde las Clases que usen las Entidades siempre habría que consultar la Entidad para visualizar la consulta.

## :computer: `16_gestion_candidatos_persistencia_namedquery`

Partiendo del proyecto `15_gestion_candidatos_persistencia_eliminacion` vamos a crear el proyecto `16_gestion_candidatos_persistencia_namedquery` en el cual vamos a pasar todas las sentencias JPQL desde la clase  `CandidatosService` al la Entidad `Contacto`.

![15-01-eje](images/15-01-eje.png)

Nuestra Entidad `Candidato` modificada nos queda así:

`Candidato`

```java
package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the candidatos database table.
 * 
 */
@Entity
@Table(name="candidatos")
@NamedQuery(name="Candidato.findAll", query="SELECT c FROM Candidato c")
@NamedQuery(name="Candidato.findByPuesto", query="Select c From Candidato c Where c.puesto = ?1")
@NamedQuery(name="Candidato.findByEmail", query="Select c From Candidato c Where c.email = ?1")
@NamedQuery(name="Candidato.deleteByEmail", query="Delete From Candidato c Where c.email = ?1")
public class Candidato implements Serializable {
   private static final long serialVersionUID = 1L;

   @Id
   @GeneratedValue(strategy=GenerationType.IDENTITY)
   private int idCandidato;

   @Column(name="edad")
   private int edad;

   private String email;
   private String foto;
   private String nombre;
   private String puesto;

   public Candidato() {
   }

   public Candidato(int idCandidato, int edad, String email, String foto, String nombre, String puesto) {
      super();
      this.idCandidato = idCandidato;
      this.edad = edad;
      this.email = email;
      this.foto = foto;
      this.nombre = nombre;
      this.puesto = puesto;
   }

   public int getIdCandidato() {
      return this.idCandidato;
   }

   public void setIdCandidato(int idCandidato) {
      this.idCandidato = idCandidato;
   }

   public int getEdad() {
      return this.edad;
   }

   public void setEdad(int edad) {
      this.edad = edad;
   }

   public String getEmail() {
      return this.email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getFoto() {
      return this.foto;
   }

   public void setFoto(String foto) {
      this.foto = foto;
   }

   public String getNombre() {
      return this.nombre;
   }

   public void setNombre(String nombre) {
      this.nombre = nombre;
   }

   public String getPuesto() {
      return this.puesto;
   }

   public void setPuesto(String puesto) {
      this.puesto = puesto;
   }

}
```

Lo que hemos hecho en la Entidad es añadir las siguientes anotaciones:

```java
@NamedQuery(name="Candidato.findAll", query="SELECT c FROM Candidato c")
@NamedQuery(name="Candidato.findByPuesto", query="Select c From Candidato c Where c.puesto = ?1")
@NamedQuery(name="Candidato.findByEmail", query="Select c From Candidato c Where c.email = ?1")
@NamedQuery(name="Candidato.deleteByEmail", query="Delete From Candidato c Where c.email = ?1")
```


![05-39](images/05-39.png)
![05-40](images/05-40.png)
![05-41](images/05-41.png)
![05-42](images/05-42.png)
![05-43](images/05-43.png)
![05-44](images/05-44.png)
![05-45](images/05-45.png)
![05-46](images/05-46.png)
![05-47](images/05-47.png)
![05-48](images/05-48.png)
![05-49](images/05-49.png)
![05-50](images/05-50.png)
![05-51](images/05-51.png)
![05-52](images/05-52.png)
![05-53](images/05-53.png)
![05-54](images/05-54.png)
