# 6. Creación de una Aplicación Web

Crearemos la aplicación **Bullhorn** como un proyecto web dinámico, lo que nos permitirá desarrollarla con **HTML**, **JSP**, **servlets** y usando **JPA** para conectarnos a la base de datos. Si entiendes qué son todas esas cosas, entonces puedes dejar de leer ahora. Si todavía estás conmigo, esas cosas se explicarán a medida que avancemos.

Nuestra aplicación web dinámica contendrá no sólo páginas **HTML estáticas** sino también páginas de servidor Java (**JSP**) dinámicas y **servlets**. Podremos pasar datos entre las diferentes partes de la aplicación.

La **base de datos** es en realidad una pieza de software independiente con la que se comunicará su aplicación web. En muchos sistemas, la base de datos reside en una computadora completamente diferente. Los **JSP** enviarán información a los **servlets**. Los **servlets** enviarán información a (y obtendrán información de) la **base de datos** a través de la capa de **servicio**. Y el **servlet** enviará el resultado al **JSP**.

<hr>

**Nota**

Es posible enviar información directamente a la base de datos desde un JSP. También es posible enviar información entre dos JSP. No haremos eso aquí. Estamos poniendo un servlet entre cada conversación. Eso nos permite interceptar cada mensaje con algún código Java en el servlet, lo que facilitará la validación, evaluación y redirección de cada mensaje interceptado.

<hr>

#### CREA UN PROYECTO WEB DINÁMICO USANDO ECLIPSE

Eclipse está preconfigurado para varios tipos de proyectos. El **Proyecto Web Dinámico** me parece muy útil. Iniciar uno sólo consta de unos sencillos pasos.

1. En Eclipse, elija ***File ➤ New ➤ Dynamic Web Project***.

   Asígnele un nombre de proyecto, como **`SampleDynamicWebProject`**, como se muestra en el Paso 2.

2. Seleccione el tiempo de ejecución de destino como Tomcat v.8.0 o superior. Es posible que se le solicite que instale Tomcat antes de poder continuar.

<img width="1242" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/006c2281-c703-4dd2-be06-72feac447df9">

3. Haga clic en Finish.

4. Si se le solicita, seleccione "Yes" para asociarlo con una perspectiva Java EE.

5. Una vez que su proyecto contenga algunas páginas web, puede iniciarlas seleccionando la página en el Explorador de proyectos, luego haga clic derecho y seleccione ***Run As ➤ Run on Server***. Su aplicación se iniciará en Eclipse.

<img width="1249" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/21487de9-a69c-491d-b91e-f67ea2409a0f">

**FIGURA 6-1 LA ESTRUCTURA DE CARPETAS DE UN PROYECTO WEB DINÁMICO EN ECLIPSE**

El dynamic web project genera carpetas para organizar el código Java (consulte la Figura 6-1). Las más importantes son la carpeta ***source*** de Java y la carpeta ***web content***. Los servlets y clases de Java deben colocarse en la carpeta **`src`** que se muestra en **Java Resources**. Los archivos JSP pertenecen a la carpeta **`WebContent`**. Los archivos JSP no deben colocarse en **`WEB-INF`** o su aplicación no podrá acceder a ellos. Utilice la carpeta **`lib`** en **`WEB-INF`** para archivos **JAR** (**Java Archive**). Trabajaremos con archivos **JAR** cuando agreguemos la base de datos a nuestro proyecto.

<hr>

**Tip**

Los archivos **JAR** (**Java Archive**) para Bullhorn se pueden encontrar en **`WebContent/WEB-INF/lib`**. Debe copiar todos los archivos JAR en Bullhorn al directorio **`/WEB-INF/lib`** para cualquier aplicación web dinámica que elija desarrollar.

<hr>
