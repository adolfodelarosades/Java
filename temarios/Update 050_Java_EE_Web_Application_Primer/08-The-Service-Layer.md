# 8. La capa de servicio

Su aplicación interactuará con la **DAO** a través de la ***capa de servicio***.

## Crear una clase `DbUtilities`

Cada vez que su aplicación se conecte a la base de datos, ejecutará el mismo código. Puede hacer que su aplicación sea más eficiente creando una clase de métodos reutilizables a los que puede llamar según sea necesario. Crea una clase llamada DbUtilities. Esto le permitirá simplificar las llamadas al Entity Manager cuando necesite leer o escribir en la base de datos. Esta clase será estática (no se requiere creación de instancias). Tendrá un método, getFactory(). Devolverá una instancia de EntityManagerFactory como se identifica en persistence.xml. Consulte el Listado 8-1.

**Listado 8-1 El listado de códigos para la clase `DbUtilities`**

```java
//DbUtil.java
package service;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class DbUtil {
        public static EntityManager getEntityManager(String s) {
                return Persistence.createEntityManagerFactory(s).createEntityManager();
        }
}
//End of DbUtil.java  
```

## Crear la clase DbUser

La clase **`DbUser`** contiene métodos para trabajar con el usuario. **`DbPost`** contiene métodos para trabajar con las publicaciones. Ambas clases son muy similares, por lo que aquí solo se muestran los métodos seleccionados de **`DbUser`**.

```java
//DbUser.java
package service;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import service.util.MD5Util;
import model.Bhuser;

/**
 * @author djw
 * DbUser class contains helper methods for working with Bhusers
 *
 */
public class DbUser {
/**
 * Gets a Bhuser from the database
 * @param userID - primary key from database. Must be type long
 * @return Bhuser
 */
        public static Bhuser getUser(long userID)
        {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                Bhuser user = em.find(Bhuser.class, userID);
                return user;
        }

        public static void insert(Bhuser bhUser) {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                EntityTransaction trans = em.getTransaction();                                                          
                try {
                        trans.begin();
                        em.persist(bhUser);
                        trans.commit();
                } catch (Exception e) {
                        e.printStackTrace();
                        trans.rollback();
                } finally {
                        em.close();
                }
        }
        /**
         * Gets a Gravatar URL given the email and size
         * In accordance with Gravatar's requirements the email will be hashed
         * with the MD5 hash and returned as part of the url
         * The url will also include the s=xx attribute to request a Gravatar of a
         * particular size.
         * References: <a href="http://www.gravatar.com">http://www.gravatar.com</>
         * @param email - email of the user who's gravatar you want
         * @param size - indicates pixel height of the image to be returned. Height and Width are same.
         * @return - the gravatar URL. You can test it in a browser.
         */
        public static String getGravatarURL(String email, Integer size){
                StringBuilder url = new StringBuilder();
                url.append("http://www.gravatar.com/avatar/");
                url.append(MD5Util.md5Hex(email));
                url.append("?s=" + size.toString());
                return url.toString();
        }                                                                                                
        /**
         * Updates the data in a Bhuser
         * Pass the method a Bhuser with all the values set to your liking and
         * this method will update the database with these values.
         * This method doesn't actually return anything but the good feeling
         * that your update has been completed. If it can't be completed then
         * it won't tell you. Sounds like something needs to be added in the future. Hmmm.
         * @param bhUser
         */
        public static void update(Bhuser bhUser) {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                EntityTransaction trans = em.getTransaction();
                try {
                        trans.begin();
                        em.merge(bhUser);
                        trans.commit();
                } catch (Exception e) {
                        System.out.println(e);
                        trans.rollback();
                } finally {
                        em.close();                                                          
                }
        }

        /**
         * Removes a Bhuser from the database.
         * Not sure why you'd want to delete a Bhuser from the database but this
         * method will do it for you. This method does not explicitly remove the user's
         * posts, but most likely you've set up the database with cascading deletes, which
         * will take care of that. Gives no feedback.
         * @param bhUser that you never want to see again
         */
        public static void delete(Bhuser bhUser) {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                EntityTransaction trans = em.getTransaction();
                try {
                        trans.begin();
                        em.remove(em.merge(bhUser));
                        trans.commit();
                } catch (Exception e) {
                        System.out.println(e);
                        trans.rollback();
                } finally {
                        em.close();
                }
        }

        /**
         * Gets a user given their email address.
         * You've got the email when they log in but you really need the
         * user and all its related information                                      . This method will find the user
         * matching that email. The database should ensure that you can't have two users
         * with the same email. Otherwise there's no telling what you'd get.
         * @param email
         * @return Bhuser with that unique email address
         */
        public static Bhuser getUserByEmail(String email)
        {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                String qString = "Select u from Bhuser u "
                                + "where u.useremail=:useremail";
                TypedQuery<Bhuser> q = em.createQuery(qString, Bhuser.class);
                q.setParameter("useremail", email);
                Bhuser user = null;
                try {
                        System.out.println("Getting single user");
                        user = q.getSingleResult();
                        System.out.println(user.getUsername());
                }catch (NoResultException e){
                        System.out.println(e);
                }finally{
                        em.close();
                }
                return user;

        }                                                          

        /**
         * Is this user valid? This method has the answer for you.
         * Checks the database and counts the number of users with this
         * username and password. If it returns 0 then either the username
         * or password don't exist in the database. If it returns 1 then you have found
         * the user with that username and password. If it returns >1 then you need to
         * fix your database.
         * @param userEmail and userPassword
         * @return true or false indicating the user exists or doesn't
         */                                      
        public static boolean isValidUser(String userEmail,String userPassword)
        {
                EntityManager em =
                                DbUtil.getEntityManager("Bullhorn");
                String qString = "Select count(b.bhuserid) from Bhuser b "
                        + "where b.useremail = :useremail and b.userpassword = :userpass";
                TypedQuery<Long> q = em.createQuery(qString,Long.class);
                boolean result = false;
                q.setParameter("useremail", userEmail);
                q.setParameter("userpass", userPassword);

                try{
                        long userId = q.getSingleResult();
                        if (userId > 0)
                        {
                                result = true;
                        }
                }catch (Exception e){                                                          

                        result = false;
                }
                finally{
                                em.close();
                }
                return result;

        }

}
//End of DbUser.java
```

## Crear la clase `DbPost`

```java
//DbPost.java
package service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import model.Bhpost;

public class DbPost {

        public static void insert(Bhpost bhPost) {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");                                                                                                
                EntityTransaction trans = em.getTransaction();
                try {
                        trans.begin();
                        em.persist(bhPost);
                        trans.commit();
                } catch (Exception e) {
                        System.out.println(e.getMessage());
                        trans.rollback();
                } finally {
                        em.close();
                }
        }

        public static void update(Bhpost bhPost) {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                EntityTransaction trans = em.getTransaction();
                try {
                        trans.begin();
                        em.merge(bhPost);
                        trans.commit();
                } catch (Exception e) {
                        trans.rollback();
                } finally {
                        em.close();
                }
        }                                      
        public static void delete(Bhpost bhPost) {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                EntityTransaction trans = em.getTransaction();
                try {
                        trans.begin();
                        em.remove(em.merge(bhPost));                                                          
                        trans.commit();
                } catch (Exception e) {
                        System.out.println(e);
                        trans.rollback();
                } finally {
                        em.close();
                }
        }
                                                      
        public static List<Bhpost> bhPost (){
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                String qString = "select b from Bhpost b";

                List<Bhpost> posts = null;
                try{
                        TypedQuery<Bhpost> query = em.createQuery(qString,Bhpost.class);
                        posts = query.getResultList();

                }catch (Exception e){
                        e.printStackTrace();
                }
                finally{
                                em.close();
                        }
                return posts;
        }

        public static List<Bhpost> postsofUser(long userid)
        {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");                                                          
                List<Bhpost> userposts = null;
                String qString = "select b from Bhpost b where b.bhuser.bhuserid = :userid";

                try{
                        TypedQuery<Bhpost> query = em.createQuery(qString,Bhpost.class);
                        query.setParameter("userid", userid);
                        userposts = query.getResultList();
                }catch (Exception e){
                        e.printStackTrace();
                }
                finally{
                                em.close();
                        }
                return userposts;
        }                                      
        public static List<Bhpost> postsofUser(String useremail)
        {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                List<Bhpost> userposts = null;
                String qString = "select b from Bhpost b "
                                + "where b.bhuser.useremail = :useremail";

                try{
                        TypedQuery<Bhpost> query = em.createQuery(qString,Bhpost.class);
                        query.setParameter("useremail", useremail);
                        userposts = query.getResultList();
                }catch (Exception e){                                                          
                        e.printStackTrace();
                }
                finally{
                                em.close();
                        }
                return userposts;
        }
                                              
        public static List<Bhpost> searchPosts (String search)
        {
                EntityManager em = DbUtil.getEntityManager("Bullhorn");
                List<Bhpost> searchposts = null;
                String qString = "select b from Bhpost b "
                                + "where b.posttext like :search";

                try{
                        TypedQuery<Bhpost> query = em.createQuery(qString,Bhpost.class);
                        query.setParameter("search", "%" + search + "%");
                        searchposts = query.getResultList();
                }catch (Exception e){
                        e.printStackTrace();
                }finally{
                        em.close();
                }return searchposts;
        }

}                                                                                                
//End of DbPost.java
```
