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

![14-39-ej](images/14-39-ej.png)
![14-40-ej](images/14-40-ej.png)
![14-41-ej](images/14-41-ej.png)
![14-42-ej](images/14-42-ej.png)



![05-32](images/05-32.png)
![05-33](images/05-33.png)
![05-34](images/05-34.png)
![05-35](images/05-35.png)
![05-36](images/05-36.png)
![05-37](images/05-37.png)
![05-38](images/05-38.png)
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
