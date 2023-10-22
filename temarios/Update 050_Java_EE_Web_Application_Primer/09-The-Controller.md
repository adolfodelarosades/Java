# 9. El controlador

La ***capa de controlador*** de nuestra aplicación contiene código para manejar la lógica específica de la aplicación. Esto incluye preocupaciones como recibir datos de páginas web, enviar datos a las clases en la capa de servicio y enviar al usuario el siguiente servlet o JSP, según corresponda. El controlador no accede directamente a la base de datos. El controlador descubre lo que hay que hacer, luego encuentra la clase correcta en la capa de servicio o en la capa de presentación y llama a esa clase para que haga su trabajo. En nuestra aplicación, la mayor parte del código del controlador reside en servlets Java.

## ¿Qué es un servlet?

***Los servlets son clases de Java que responden a solicitudes HTTP entrantes***. La solicitud la envía el navegador cada vez que navega a una URL o envía un formulario. Los servlets residen dentro del servidor web (Tomcat) y escuchan las solicitudes. Luego, entran en acción y procesan la solicitud. Piense en "¡los operadores están esperando!" Cuando crea un servlet, en realidad está ampliando la funcionalidad del contenedor de servlet, Tomcat. Piense en Tomcat como un servidor web que sabe cómo trabajar con servlets y archivos JSP además de HTML.

La URL (dirección web) de su servlet se verá algo así como **`http://localhost:8080/webTest/SimpleServlet`**, donde **`localhost`** es el nombre que representa su computadora, **`8080`** es el número de puerto, **`webTest`** es el nombre de la aplicación (o proyecto) y **`SimpleServlet`** es la URL del servlet como se indica en la anotación **`@WebServlet`** del servlet.

El código de servlet en el Listado 9-1 presenta un servlet que se puede encontrar en la URL de **`SimpleServlet`** como se especifica en el atributo **`@WebServlet`**. No contiene ningún código para procesar una solicitud, solo muestra la estructura. Un servlet contiene dos métodos, **`doGet`** y **`doPost`**. Cada uno corresponde al método get o post de un formulario. Cuando se envía el formulario, el atributo de método de la etiqueta del formulario debe establecerse en **`GET`** si solo está utilizando los valores del formulario para recuperar datos de solo lectura, como otra página web. Si el formulario web utiliza **`GET`**, los datos se transfieren dentro de la URL. Puede ver el parámetro y sus valores en la URL después de el símbolo **`?`**. Esto permite al usuario copiar y pegar un enlace y obtener los mismos resultados nuevamente.

Al enviar datos al servidor para ingresarlos a la base de datos, debe utilizar el método **`POST`**. **`POST`** no utiliza la URL para enviar datos. Los parámetros y valores se transfieren al servidor en un paquete de datos. Esto tiene varias ventajas, incluido el hecho de que el formulario y los datos enviados no se pueden marcar como favoritos. El uso de **`POST`** también permite que un formulario envíe mayores cantidades de datos.

**Listado 9-1 Un Simple Web Servlet (excluyendo declaraciones de importación)**

```java
@WebServlet("/SimpleServlet")
public class SimpleServlet extends HttpServlet {

   protected void doGet(
                HttpServletRequest request,    HttpServletResponse response)
                throws ServletException, IOException {
        //code to handle GET requests goes here
   }

   protected void doPost(
                HttpServletRequest request,    HttpServletResponse response)
                throws ServletException, IOException {
        //code to handle POST requests goes here
   }
}
```

### Obtener los datos del formulario en el servlet

Cuando el usuario hace clic en el botón Submit, los datos del formulario se envían al servlet en el request object. El servidor web se encarga de esto. El contenedor de servlets, Tomcat, pondrá el objeto de solicitud a disposición de su servlet. Su entrada, denominada **`userName`**, contendrá el nombre que el usuario ha escrito. El servlet puede leer ese nombre usando el siguiente código:

```java
//set a variable with the value from the request              
String userEmail = request.getParameter("userEmail");
```

### Enviar los datos a la página siguiente

Puede agregar cualquier dato (incluidos objetos como **`ArrayLists`**) a la solicitud o sesión. Estos estarán disponibles en la siguiente página a la que llame el servlet. Tenga en cuenta que el request packet de la solicitud entrante no permanecerá dentro del alcance, por lo que es necesario volver a colocar los datos en un nuevo request packet.

```java
//put the value back in the servlet's request              
request.setAttribute("userEmail", userEmail);
```

Ahora el servlet tiene los datos en una variable llamada **`userEmail`**. Ahora estás escribiendo código Java, por lo que puedes trabajar con él como mejor te parezca. Usaremos las variables **`userEmail`** y **`userPassword`** para guardar los datos y luego validar que coincidan con nuestras expectativas. Al principio simplemente crearemos un método para validar valores conocidos. Más adelante, usaremos la base de datos para almacenar los datos válidos y crearemos código Java para consultar la base de datos y verificar los resultados.

Una vez que el servlet valide al usuario, será redirigido a la página de inicio. Si ingresaron una contraseña no válida, serán redirigidos nuevamente a la página de inicio de sesión.

### Cómo el servlet encuentra la página siguiente

Después de que el servlet haya validado y procesado todos los datos entrantes, desea indicarle que lleve al usuario a la página siguiente.

La última línea de los métodos **`doPost`** o **`doGet`** de su servlet se encargará de eso. Cuando el servlet llegue a esta línea de código, enviará al usuario a la página correcta.

```java
/redirect to next page as indicated by the value of the nextURL variable                
String nextURL = "home.jsp";

getServletContext().getRequestDispatcher(nextURL)
    .forward(request,response);
```

### Cómo establecer valores en su página de salida

Cree una página jsp llamada **`home.jsp`**. Agregue el siguiente código a su página para que lea los valores de los parámetros del servlet. La notación **`${userEmail}`** leerá el parámetro del request packet. Lo configuras en el servlet.

```html
<html>
    <head>
        <title>The results of my form</title>
    </head>
<body>
    <h1>Using GET Method to Read Form Data</h1>
        <ul>
            <li><p><b>First Name:</b> ${firstName} </p></li>
            <li><p><b>Last Name:</b> ${lastName} </p></li>
        </ul>
</body>
</html>
```

### Cómo funciona el botón Log Out

Cuando el usuario quiere cerrar sesión, simplemente finaliza su sesión. Eso facilita el cierre de sesión. La mayoría de los usuarios no harán clic en el botón **Log Out**. Para ellos, la sesión finaliza cuando se alcanza el tiempo de espera de la sesión. Puede configurar la propiedad de tiempo de espera de la sesión o utilizar el valor predeterminado de 20 minutos.

Cree un formulario que pasará un parámetro llamado **`action`** con un valor de **`logout`** a su servlet de inicio de sesión. Para pasar ese parámetro, creará una entrada oculta y le asignará un nombre y un ID de **`action`** con un valor de **`logout`**.

La acción del formulario será el nombre del servlet de inicio de sesión. Cuando el servlet recibe el parámetro, invalidará la sesión y redirigirá al usuario a la página de inicio de sesión. El código Java para finalizar una sesión es **`session.invalidate();`**.

## El código de Login Servlet

**Listado 9-2 El código para el Login Servlet**

```java
//LoginServlet.java
package controller;
/*
 * the login servlet processes login.jsp. The servlet has one job
 * which is to validate the user and add them to the session so
 * that user will be available to all pages. If the user is not valid
 * then the login servlet will redirect back to the login page.
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.DbUser;
import model.Bhuser;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                //this page does not require user to be logged in
                String useremail = request.getParameter("email");
                String userpassword = request.getParameter("password");
                String action = request.getParameter("action");
                //String remember = request.getParameter("remember");
                String nextURL = "/error.jsp";

                //get an instance of the session so we can set attributes to it
                //the JSP and NavBar will read from the session
                //The session is one of the primary ways we maintain state
                //in an otherwise stateless web application
                HttpSession session = request.getSession();

                //create an instance of the user and put it in the session
                //only add the user to the session if the user if valid.
                //The presence of the user is used to determine who
                //owns the site and will be used to connect to the database
                if (action.equals("logout")){
                        session.invalidate();
                        nextURL = "/login.jsp";

                }else{                                                                              
                        if (DbUser.isValidUser(useremail,userpassword)){
                                Bhuser user = DbUser.getUserByEmail(useremail);
                                session.setAttribute("user", user);
                                int gravatarImageWidth = 30;
                                String gravatarURL =
                                        DbUser.getGravatarURL(useremail, gravatarImageWidth);
                                session.setAttribute("gravatarURL", gravatarURL);
                                nextURL = "/home.jsp";
                        }else{
                                nextURL = "/login.jsp";
                        }
                }
                //redirect to next page as indicated by the value of the nextURL variable
                getServletContext().getRequestDispatcher(nextURL).forward(request,response);
        }

}
//End of LoginServlet.java
```

## El código del News Feed Servlet

**Listado 9-3 El código para el News Feed Servlet**

```java
//Newsfeed.java
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bhpost;
import service.DbPost;

@WebServlet("/Newsfeed")
public class Newsfeed extends HttpServlet {
        private static final long serialVersionUID = 1L;

    public Newsfeed() {
        super();
    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                //users can get to this servlet through a get request so handle it here
                //With a get request the parameters are part of the url.
                //We already handle everything in doPost so just call that.
                doPost(request,response);
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                long filterByUserID = 0;
                String searchtext = "";                                                                              

                //set the value of the next page. It should change in the code below.
                String nextURL = "/error.jsp";

                //get user out of session.
                //If they don't exist then send them back to the login page.
                //kill the session while you're at it.
                HttpSession session = request.getSession();
                if (session.getAttribute("user")==null){
                        nextURL = "/login.jsp";
                        session.invalidate();
                        response.sendRedirect(request.getContextPath() + nextURL);
                    return;//return prevents an error
                }

                //get posts based on parameters; if no parameters then get all posts
                List<Bhpost> posts = null;                                                                              
                if (request.getParameter("userid")!=null
                                && !request.getParameter("userid").isEmpty()){
                        filterByUserID = Integer.parseInt(request.getParameter("userid"));
                        posts = DbPost.postsofUser(filterByUserID);

                }else if (request.getParameter("searchtext")!=null
                                && !request.getParameter("searchtext").isEmpty()){
                        searchtext = request.getParameter("searchtext").toString();
                        posts = DbPost.searchPosts(searchtext);

                }else{
                        posts = DbPost.bhPost();
                }

                //add posts to request
                request.setAttribute("posts", posts);
                //display posts in newsfeed.jsp
                nextURL = "/newsfeed.jsp";
                //redirect to next page as indicated by the value of the nextURL variable
                getServletContext().getRequestDispatcher(nextURL).forward(request,response);
        }

}
//end of Newsfeed.java
```

## El código del PostServ Servlet

**Listado 9-4 El código para el PostServ Servlet**

```java
//PostServ.java
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import model.Bhpost;
import model.Bhuser;
import service.DbPost;

@WebServlet("/PostServ")
public class PostServ extends HttpServlet {
        private static final long serialVersionUID = 1L;

    public PostServ() {
        super();
    }

    protected void doPost(HttpServletRequest request,
                                        HttpServletResponse response)
                                              throws ServletException, IOException {

                String posttext = request.getParameter("posttext");
                String nextURL = "/error.jsp";

                //Get user out of session. If they don't exist then
                //end the session and send them back to the login page.
                HttpSession session = request.getSession();                                                                              
                if (session.getAttribute("user")==null){
                        nextURL = "/login.jsp";
                        session.invalidate();
                } else {

                //Get the user out of the session
                Bhuser bhuser = (Bhuser)session.getAttribute("user");

                //insert the post
                Bhpost bhPost = new Bhpost();
                bhPost.setBhuser(bhuser);
                Date postdate = Calendar.getInstance().getTime();//today's date
                bhPost.setPostdate(postdate);
                bhPost.setPosttext(posttext);
                DbPost.insert(bhPost);
                nextURL = "/Newsfeed";//go to newsfeed servlet to show all posts
                }

                //the value of nextURL will be newsfeed, login, or error
                getServletContext().getRequestDispatcher(nextURL)
                    .forward(request, response);
        }
}
//end of PostServ.java
```

## El código de Profile Servlet

**Listado 9-5 El código para el Profile Servlet**

```java
//ProfileServlet.java
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import service.DbUser;
import model.Bhuser;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

    public ProfileServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                                                                              
                /*
                 * simplify this so that it always requires two parameters, userid and action
                 * action is view or edit. If edit then the userID of the session(user) must be same as userID for profile
                 * since you can only edit your own.
                 * all urls coming to this page must contain both parameters or get error.
                 */
                HttpSession session = request.getSession();
                String nextURL = "/error.jsp";
                long userid = 0;
                String action = "";
                Bhuser profileUser = null;
                Bhuser loggedInUser = null;

                //get user out of session. If they don't exist then send them back to the login page.
                //kill the session while you're at it.
                if (session.getAttribute("user")==null){
                        nextURL = "/login.jsp";
                        session.invalidate();
                        response.sendRedirect(request.getContextPath() + nextURL);
                    return;//return prevents an error
                }

                try{
                userid = Long.parseLong(request.getParameter("userid"));
                action = request.getParameter("action");                                                                              

                //update profile for user in request variable if action = updateprofile
                if (request.getParameter("action").equals("updateprofile")){
                        long uid = Long.parseLong(request.getParameter("userid"));
                        String userEmail = request.getParameter("useremail");
                        String userMotto = request.getParameter("usermotto");
                        Bhuser updateUser = DbUser.getUser(uid);
                        updateUser.setMotto(userMotto);
                        updateUser.setUseremail(userEmail);
                        DbUser.update(updateUser);
                }

                //get the user from the parameter
                profileUser = DbUser.getUser(userid);
        //get the current user out of the session
                loggedInUser = (Bhuser) session.getAttribute("user");

                if (profileUser.getBhuserid()==loggedInUser.getBhuserid()){
                        //display profile as form
                        //the session variable editProfile is used by the JSP to
                        //display the profile in edit mode
                        session.setAttribute("editProfile", true);                                                                              
                }else{
                        //display profile read-only
                        //the session variable editProfile is used by the JSP to
                        //display the profile in read-only mode
                        session.setAttribute("editProfile", false);
                }

            //populate the data in the attributes
                int imgSize = 120;
                SimpleDateFormat sdf = new SimpleDateFormat("MMM d, yyyy");
                String joindate = sdf.format(profileUser.getJoindate());
                request.setAttribute("userid", profileUser.getBhuserid());
                request.setAttribute("userimage",
                                DbUser.getGravatarURL(profileUser.getUseremail(), imgSize));
                request.setAttribute("username", profileUser.getUsername());
                request.setAttribute("useremail", profileUser.getUseremail());
                request.setAttribute("usermotto", profileUser.getMotto());
                request.setAttribute("userjoindate", joindate);
                nextURL = "/profile.jsp";

                }catch(Exception e){                                                                              
                        //print the exception so we can see it while testing the application
                        //in production it isn't a good idea to print to the console since it
                        //consumes resources and will not be seen
                        System.out.println(e);
                }
                //redirect to next page as indicated by the value of the nextURL variable
                getServletContext().getRequestDispatcher(nextURL)

        .forward(request,response);
        }
}
//ProfileServlet.java
```

## El código de AddUser Servlet

**Listado 9-6 El código para el AddUser Servlet**

```java
//AddUser.java
package controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Bhuser;
import service.DbUser;                                                                              

@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
        private static final long serialVersionUID = 1L;
    public AddUser() {
        super();
    }

        protected void doPost(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {

                HttpSession session = request.getSession();

                //This page does not require user to be logged in
                String userName = request.getParameter("userName");
                String userEmail = request.getParameter("userEmail");
                String userPassword = request.getParameter("userPassword");
                String userMotto = request.getParameter("userMotto");
                String nextURL = "/error.jsp";
                //check if user exists (by email)
                Bhuser user = DbUser.getUserByEmail(userEmail);

                //create user and add them if they don't exit
                if (user == null){
                        user = new Bhuser();
                        user.setUsername(userName);
                        user.setUseremail(userEmail);                                                                              
                        user.setUserpassword(userPassword);
                        Date joindate = Calendar.getInstance().getTime();
                        user.setJoindate(joindate);
                        user.setMotto(userMotto);
                        DbUser.insert(user);
                        nextURL = "/home.jsp";
                }else{
                        String message = "You have an account - ";
                        request.setAttribute("message", message);
                        nextURL = "/login.jsp";
                }

                //add the user to the session
                session.setAttribute("user", user);

                //redirect to next page as indicated by the value of the nextURL variable
                getServletContext().getRequestDispatcher(nextURL)

        .forward(request,response);
        }

}
// end of AddUser.java
```
