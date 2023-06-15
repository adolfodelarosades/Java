# Introducción

Supongamos que su empresa quiere vender productos en línea. Tienes ***una base de datos*** que te da el precio y el estado del inventario de cada artículo. Sin embargo, su base de datos no habla ***HTTP, el protocolo que utilizan los navegadores web***. Tampoco genera ***HTML, el formato que necesitan los navegadores web***. ¿Qué puedes hacer? Una vez que los usuarios saben lo que quieren comprar, ¿cómo recopila esa información? Desea personalizar su sitio para las preferencias e intereses de los visitantes, pero ¿cómo? Desea realizar un seguimiento de las compras de los usuarios a medida que compran en su sitio, pero ¿qué técnicas se requieren para implementar este comportamiento? Cuando su sitio web se vuelva popular, es posible que desee comprimir las páginas para reducir el ancho de banda. ¿Cómo puede hacer esto sin que su sitio falle para aquellos visitantes cuyos navegadores no soportan la compresión? En todos estos casos, necesita un programa que actúe como intermediario entre el navegador y algún recurso del lado del servidor. Este libro trata sobre el uso de la plataforma Java para este tipo de programa.

“Espera un segundo”, dices. "¿No escribiste ya un libro sobre eso?" Bueno, sí. ***En mayo de 2000, Sun Microsystems Press y Prentice Hall publicaron el segundo libro de Marty Hall, Core Servlets and JavaServer Pages***. Tuvo un éxito que superó las expectativas más salvajes, vendió aproximadamente 100 000 copias, se tradujo al búlgaro, chino simplificado, chino tradicional, checo, francés, alemán, hebreo, japonés, coreano, polaco, ruso y español, y fue elegido por Amazon como uno de los cinco mejores libros de programación informática de 2001. ¡Qué divertido!

Desde entonces, el uso de **Servlets** y **JSP** ha seguido creciendo a un ritmo fenomenal. La plataforma Java 2 se ha convertido en la tecnología elegida para desarrollar aplicaciones de comercio electrónico, sitios web dinámicos y aplicaciones y servicios habilitados para la web. Los **Servlets** y **JSP** siguen siendo la base de esta plataforma: proporcionan el vínculo entre los clientes web y las aplicaciones del lado del servidor. Prácticamente todos los principales Web servers for Windows, UNIX (including Linux), Mac OS, VMS, y mainframe operating systems ahora admiten tecnología **Servlets** y **JSP**, ya sea de forma nativa o por medio de un complemento. Con solo una pequeña cantidad de configuración, puede ejecutar **Servlets** y **JSP** en **Microsoft IIS**, **Apache Web Server**, **IBM WebSphere**, **BEA WebLogic**, **Oracle Application Server 10g** y docenas de otros servidores. El rendimiento de los motores JSP y servlet comerciales y de código abierto ha mejorado significativamente.

Para sorpresa de nadie, este campo sigue creciendo a un ritmo acelerado. Como resultado, ya no podíamos cubrir la tecnología en un solo libro. ***Core Servlets and JavaServer Pages , Volumen 1: Core Technologies***, cubre las capacidades de **Servlets** y **JSP** que probablemente usará en casi todos los proyectos de la vida real. Este libro, ***Volume 2: Advanced Technologies***, cubre funciones que puede usar con menos frecuencia pero que son extremadamente valiosas en aplicaciones robustas. Por ejemplo,

* **Deployment descriptor file.**. Mediante el uso adecuado del archivo **deployment descriptor, web.xml**, puede controlar muchos aspectos del comportamiento de la aplicación web, desde la precarga de servlets hasta la restricción del acceso a los recursos y el control de los tiempos de espera de las sesiones.
* **Web application security**. ¡En cualquier aplicación web actual, la seguridad es imprescindible! El modelo de seguridad de **Servlets** y **JSP** le permite crear fácilmente páginas de inicio de sesión(login pages) y controlar el acceso a los recursos.
* **Custom tag libraries**. Las Custom tags mejoran significativamente el diseño de JSP. Las Custom tags le permiten desarrollar fácilmente su propia library de tags reutilizables específicas para sus aplicaciones comerciales. Además de crear sus propias tags, cubrimos la **Standard Tag Library (JSTL)**.
* **Event handling**. Con el framework de eventos, puede controlar la inicialización y el cierre de la aplicación web, reconocer la destrucción de sesiones HTTP y establecer valores para toda la aplicación.
* **Servlet and JSP filters**. Con los filtros, puede aplicar muchas acciones previas y posteriores al procesamiento. Por ejemplo, registrar solicitudes entrantes, bloquear el acceso y modificar la servlet or JSP response.
* **Apache Struts**. Este framework mejora en gran medida la arquitectura **model-view-controller (MVC)** estándar disponible con **Servlets** y **JSP**. Más importante aún, Apache Struts sigue siendo uno de los framework más comunes utilizados en la industria.

### Quién debería leer este libro

La audiencia principal son los desarrolladores que están familiarizados con las tecnologías básicas de **Servlets** y **JSP**, pero que desean hacer uso de capacidades avanzadas. Como cubrimos muchos temas en este libro: el deployment descriptor, seguridad, listeners, custom tags, JSTL, Struts, Ant: es posible que desee comenzar primero con las tecnologías de mayor interés y luego leer el material restante. La mayoría de las aplicaciones web comerciales de **Servlets** y **JSP** aprovechan las tecnologías que se presentan a continuación, por lo que en algún momento querrá leer el libro completo.

Si es nuevo en **Servlets** y **JSP**, querrá leer ***Core Servlets and Java-Server Pages, Volume 1: Core Technologies***. Además de enseñarle cómo instalar y configurar un contenedor de servlet, el Volumen 1 brinda una excelente cobertura de las especificaciones de **Servlets** y **JSP**. El Volumen 1 proporciona el material básico para este libro.

Ambos libros asumen que está familiarizado con la programación Java básica. No es necesario que sea un desarrollador Java experto, pero si no sabe nada sobre el lenguaje de programación Java, este no es el lugar para comenzar. Después de todo, la tecnología **Servlets** y **JSP** es una aplicación del lenguaje de programación Java. Si no conoces el lenguaje, no puedes aplicarlo. Entonces, si no sabe nada sobre el desarrollo básico de Java, comience con un buen libro introductorio como ***Thinking in Java, Core Java, or Core Web Programming***, todos de Prentice Hall.

### Acerca del sitio web

El libro tiene un sitio web complementario en http://volume2.coreservlets.com/ . Este sitio gratuito incluye:

* Código fuente documentado para todos los ejemplos que se muestran en el libro, que se puede descargar para su uso sin restricciones.
* Enlaces a todas las URL mencionadas en el texto del libro.
* Sitios de descarga actualizados para servlet y software JSP.
* Información sobre descuentos en libros.
* Adiciones al libro, actualizaciones y noticias.

### Sobre los autores

**Marty Hall** es presidente de coreservlets.com, Inc., una pequeña empresa que ofrece cursos de formación y servicios de consultoría relacionados con la tecnología Java del lado del servidor. También enseña Java y programación Web en el programa de posgrado a tiempo parcial en Ciencias de la Computación de la Universidad Johns Hopkins, donde dirige las áreas de concentración de Computación Distribuida y Tecnología Web. Marty es autor de cinco libros de Prentice Hall y Sun Microsystems Press: la primera y segunda ediciones de ***Core Servlets y JavaServer Pages***, ***More Servlets y JavaServer Pages***, y la primera y segunda ediciones de ***Core Web Programming***. Puede ponerse en contacto con Marty en hall@coreservlets.com.

**Larry Brown** es gerente de Redes y Sistemas en un laboratorio de Investigación y Desarrollo de la Marina de los EE.UU. Es coautor de las segundas ediciones de ***Core Web Programming***, también de Prentice Hall y Sun Microsystems Press. Puede comunicarse con Larry en larry@lmbrown.com .

***Yaakov Chaikin*** es consultor sénior en una empresa de desarrollo de software con sede en Columbia, MD. Además de su trabajo diario, enseña tecnologías de desarrollo Web en el programa de posgrado en Ciencias de la Computación de Loyola College en Maryland, donde dirige la carrera de Desarrollo Web. A veces, también ayuda a su esposa con su negocio de diseño web/gráfico, tbiq.com. Se puede contactar a Yaakov en yaakov.chaikin@gmail.com .

