# Capítulo 3. TRATAMIENTO DE LA SOLICITUD DEL CLIENTE: FORM DATA

Temas de este capítulo

* Uso de **`getParameter`** para leer valores individuales de parámetros preespecificados en los datos del formulario
* Usar **`getParameterValues`** ​​para leer múltiples valores de parámetros preespecificados en los datos del formulario
* Uso de **`getParameterNames`** para descubrir qué parámetros están disponibles
* Manejo de requests `GET` y `POST` con un solo servlet
* Un servlet que hace una tabla de los parámetros de entrada.
* Un servicio de publicación de currículums en línea
* Filtrado de caracteres específicos de HTML

Una de las principales motivaciones para crear páginas web dinámicamente es que el resultado pueda basarse en la entrada del usuario. Este capítulo le muestra cómo acceder a esa entrada.

## 3.1. El  Role de Form Data

Si alguna vez usó un motor de búsqueda, visitó una librería en línea, rastreó las acciones en la Web o solicitó cotizaciones de boletos de avión en un sitio basado en la Web, probablemente haya visto direcciones URL de aspecto extraño como http://host/path?user=Marty+Hall&origin=bwi&dest=lax. La parte después del signo de interrogación (es decir, **`user=Marty+Hall&origin= bwi&dest=lax`** ) se conoce como form data (o query data ) y es la forma más común de obtener información de una página web a un programa del lado del servidor. Los datos del formulario se pueden adjuntar al final de la URL después de un signo de interrogación (como arriba), para **`GET`** requests, o se pueden enviar al servidor en una línea separada, para **`POST`** requests. Si no está familiarizado con los formularios HTML, el Capítulo 16(Using HTML Forms) brinda detalles sobre cómo crear formularios que recopilan y transmiten datos de este tipo.

Extraer la información necesaria de los datos de este formulario es tradicionalmente una de las partes más tediosas de la programación CGI. En primer lugar, debe leer los datos de una manera para las solicitudes **`GET`** (en CGI tradicional, esto suele ser a través de variable de entorno **`QUERY_STRING`**) y una forma diferente para las solicitudes **`POST`** (leyendo la entrada estándar en CGI tradicional). En segundo lugar, debe cortar los pares en los símbolos de unión, luego separar los nombres de los parámetros (a la izquierda de los signos de igual) de los valores de los parámetros (a la derecha de los signos de igual). En tercer lugar, debe decodificar los valores mediante URL. Los caracteres alfanuméricos se envían sin cambios, pero los espacios se convierten en signos más y otros caracteres se convierten en **`%XX`** donde **`XX`** es el valor ASCII (o ISO Latin-1) del carácter, en hexadecimal. Luego, el programa del lado del servidor tiene que revertir el proceso. Por ejemplo, si alguien ingresa un valor de "**`~hall`**, **`~gates`** y **`~mcnealy`**" en un campo de texto con el nombre de usuarios en un formulario HTML, los datos se envían como "**`users=%7Ehall%2C+%7Egates%2C+and+%7Emcnealy`**”, y el programa del lado del servidor tiene que reconstituir la cadena original. Finalmente, la cuarta razón por la que analizar los datos del formulario es tedioso es que los valores se pueden omitir (p. ej., "**`param1=val1&param2=&param3=val3`**") o un parámetro puede tener más de un valor (p. ej., "**`param1=val1&param2=val2&param1=val3`**”), por lo que su código de análisis necesita casos especiales para estas situaciones.

## 3.2. Lectura de Form Data desde el Servlets

Una de las buenas características de los servlets es que todo el análisis de este formulario se maneja automáticamente. Simplemente llame al método **`getParameter`** de **`HttpServletRequest`** y proporcione el nombre del parámetro que distingue entre mayúsculas y minúsculas como argumento. Usas **`getParameter`** exactamente de la misma manera cuando los datos son enviados por **`GET`** que cuando son enviados por **`POST`**. El servlet sabe qué método de request se utilizó y automáticamente hace lo correcto en segundo plano. El valor devuelto es **`String`** correspondiente al valor decodificado en URL de la primera aparición de ese nombre de parámetro. Se devuelve una **`String`** vacía si el parámetro existe pero no tiene valor y es se devuelve **`null`** si no había tal parámetro. Si el parámetro podría tener potencialmente más de un valor, debe llamar a **`getParameterValues`**(que devuelve un array de strings) en lugar de **`getParameter`** (que devuelve una única string). El valor de retorno de **`getParameterValues`** ​​es **`null`** para nombres de parámetros inexistentes y es un array de un elemento cuando el parámetro tiene un solo valor.

Los nombres de los parámetros distinguen entre mayúsculas y minúsculas, por lo que, por ejemplo, **`request.getParameter("Param1")`** y **`request.getParameter("param1")`** no son intercambiables.

**Core Warning**

   :atom: Los valores proporcionados a **`getParameter`** y **`getParameterValues`** ​​distinguen entre mayúsculas y minúsculas.

Finalmente, aunque la mayoría de los servlets reales buscan un conjunto específico de nombres de parámetros, para fines de depuración a veces es útil obtener una lista completa. Use **`getParameterNames`** para obtener esta lista en forma de **`Enumeration`**, cada entrada de la cual se puede convertir a un **`String `** y usarse en una llamada **`getParameter`** o **`getParameterValues`**. Solo tenga en cuenta que la API **`HttpServletRequest`** no especifica el orden en que aparecen los nombres dentro de esa **`Enumeration`**.

**Core Warning**

   :atom: No cuente con que **`getParameterNames`** devuelva los nombres en un orden particular.

## 3.3. Ejemplo: lectura de tres parámetros explícitos

El listado 3.1 presenta un servlet simple llamado **`ThreeParams`** que lee los parámetros de datos del formulario llamados **`param1`**, **`param2`** y **`param3`** y coloca sus valores en una lista con viñetas. El Listado 3.2 muestra un formulario HTML que recopila la entrada del usuario y la envía a este servlet. Mediante el uso de una **`ACTION `** de **`/servlet/coreservlets.ThreeParams`**, el formulario se puede instalar en cualquier parte del sistema que ejecuta el servlet; no es necesario que haya ninguna asociación particular entre el directorio que contiene el formulario y el directorio de instalación del servlet. Recuerde que las ubicaciones específicas para instalar archivos HTML varían de un servidor a otro. Con **JSWDK 1.0.1** y **Tomcat 3.0**, las páginas HTML se colocan en algún lugar de **`install_dir/webpages`** y se accede a través de http://host/path/file.html. Por ejemplo, si el formulario que se muestra en el Listado 3.2 se coloca en **`install_dir/webpages/forms/ThreeParamsForm.html`** y se accede al servidor desde el mismo host en el que se está ejecutando, se accederá al formulario mediante una URL de http://localhost/forms/ThreeParamsForm.html.

Las Figuras 3-1 y 3-2 muestran el resultado de la interfaz HTML y el servlet, respectivamente.

**Figura 3-1. Interfaz HTML resultante de `ThreeParamsForm.html`.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/d7168858-f4a7-4e27-849e-e64a02bd1c90)

**Figura 3-2. Salida del Servlet `ThreeParams`.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/317c547f-12fc-4be1-b03d-e7f1a4a32fcf)


**Listado 3.1. `ThreeParams.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ThreeParams extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "Reading Three Request Parameters";
    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=CENTER>" + title + "</H1>\n" +
                "<UL>\n" +
                "  <LI><B>param1</B>: "
                + request.getParameter("param1") + "\n" +
                "  <LI><B>param2</B>: "
                + request.getParameter("param2") + "\n" +
                "  <LI><B>param3</B>: "
                + request.getParameter("param3") + "\n" +
                "</UL>\n" +
                "</BODY></HTML>");
  }
}
```

Aunque debe especificar la configuración de respuesta (consulte los Capítulos 6 y 7 ) antes de comenzar a generar el contenido, no es necesario que lea los parámetros de la request en ningún momento en particular.

Si está acostumbrado al enfoque CGI tradicional en el que lee los datos **`POST`** a través de la entrada estándar, debe tener en cuenta que puede hacer lo mismo con los servlets llamando a **`getReader`** o **`getInputStream`** en **`HttpServletRequest`** y luego usando esa secuencia para obtener la entrada sin procesar. Esta es una mala idea para los parámetros normales, ya que la entrada no se analiza (separada en entradas específicas para cada parámetro) ni se decodifica como URL (traducida de modo que los signos más se conviertan en espacios y **`%XX`** se reemplace por el carácter ASCII o ISO Latin-1 correspondiente ) al valor hexadecimal **`XX`** ). Sin embargo, leer la entrada sin procesar puede ser útil para archivos cargados o datos **`POST`** enviados por clientes personalizados en lugar de formularios HTML. Tenga en cuenta, sin embargo, que si lee los datos **`POST`** de esta manera, es posible que **`getParameter`** ya no los encuentre.

**Listado 3.2. `ThreeParamsForm.html`**

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
  <TITLE>Collecting Three Parameters</TITLE>
</HEAD>
<BODY BGCOLOR="#FDF5E6">
<H1 ALIGN="CENTER">Collecting Three Parameters</H1>

<FORM ACTION="/servlet/coreservlets.ThreeParams">
  First Parameter:  <INPUT TYPE="TEXT" NAME="param1"><BR>
  Second Parameter: <INPUT TYPE="TEXT" NAME="param2"><BR>
  Third Parameter:  <INPUT TYPE="TEXT" NAME="param3"><BR>
  <CENTER>
    <INPUT TYPE="SUBMIT">
  </CENTER>
</FORM>

</BODY>
</HTML>
```

## 3.4. Ejemplo: Lectura de Todos los Parámetros

El ejemplo anterior extrajo valores de parámetros de los datos del formulario en función de los nombres de parámetros especificados previamente. También supuso que cada parámetro tenía exactamente un valor. Aquí hay un ejemplo que busca todos los nombres de parámetros que se envían y coloca sus valores en una tabla. Resalta los parámetros que tienen valores faltantes, así como los que tienen múltiples valores.

Primero, el servlet busca todos los nombres de los parámetros mediante el método **`getParameterNames`** de **`HttpServletRequest`**. Este método devuelve una **`Enumeration`** que contiene los nombres de los parámetros en un orden no especificado. A continuación, el servlet recorre la **`Enumeration`** de forma estándar, utilizando **`hasMoreElements`** para determinar cuándo detenerse y utilizando **`nextElement`** para obtener cada entrada. Dado que **`nextElement`** devuelve un **`Object`**, el servlet convierte el resultado en un **`String`** y lo pasa a **`getParameterValues`**, produciendo un array de strings. Si ese array tiene una entrada long y contiene solo una cadena vacía, entonces el parámetro no tenía valores y el servlet genera una entrada en cursiva "No Value". Si el array tiene más de una entrada, entonces el parámetro tenía varios valores y los valores se muestran en una lista con viñetas. De lo contrario, el valor principal se coloca en la tabla sin modificar. El código fuente del servlet se muestra en el Listado 3.3, mientras que el Listado 3.4 muestra el código HTML para una interfaz que se puede usar para probar el servlet. Las Figuras 3-3 y 3-4 muestran el resultado de la interfaz HTML y el servlet, respectivamente.

**Figura 3-3. Interfaz HTML que recopila datos para el servlet `ShowParameters`**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/62ab79bb-c6eb-4285-8cdf-c98a40db32bb)


**Figura 3-4. Salida del servlet `ShowParameters`.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/522206a6-dde8-42ae-92a6-97df14753c0a)


Tenga en cuenta que el servlet usa un método **`doPost`** que simplemente llama a **`doGet`**. Eso es porque quiero que pueda manejar requests **`GET`** y **`POST`**. Este enfoque es una buena práctica estándar si desea que las interfaces HTML tengan cierta flexibilidad en la forma en que envían datos al servlet. Vea la discusión del método **`service`** en la Sección 2.6 (The Servlet Life Cycle) para una discusión de por qué es preferible hacer que **`doPost`** llame a **`doGet`** (o viceversa) a overriding **`service`** directamente. El formulario HTML del Listado 3.4 usa **`POST`**, como deberían hacerlo para todos los formularios que tienen campos de contraseña (si no sabe por qué, consulte el Capítulo 16 ). Sin embargo, el servlet **`ShowParameters`** no es específico de esa interfaz en particular, por lo que el sitio de archivo del código fuente en www.coreservlets.com incluye un formulario HTML similar que usa **`GET`** para que pueda experimentar.

**Listado 3.3. `ShowParameters.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class ShowParameters extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "Reading All Request Parameters";
    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=CENTER>" + title + "</H1>\n" +
                "<TABLE BORDER=1 ALIGN=CENTER>\n" +
                "<TR BGCOLOR=\"#FFAD00\">\n" +
                "<TH>Parameter Name<TH>Parameter Value(s)");
    Enumeration paramNames = request.getParameterNames();
    while(paramNames.hasMoreElements()) {
      String paramName = (String)paramNames.nextElement();
      out.print("<TR><TD>" + paramName + "\n<TD>");
      String[] paramValues = request.getParameterValues(paramName);
      if (paramValues.length == 1) {
        String paramValue = paramValues[0];
        if (paramValue.length() == 0)
          out.println("<I>No Value</I>");
        else
          out.println(paramValue);
      } else {
        out.println("<UL>");
        for(int i=0; i<paramValues.length; i++) {
          out.println("<LI>" + paramValues[i]);
        }
        out.println("</UL>");
      }
    }
    out.println("</TABLE>\n</BODY></HTML>");
  }

  public void doPost(HttpServletRequest request,
						HttpServletResponse response)
						throws ServletException, IOException {
    doGet(request, response);
  }
}
```

**Listado 3.4. `ShowParametersPostForm.html`**

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
  <TITLE>A Sample FORM using POST</TITLE>
</HEAD>
<BODY BGCOLOR="#FDF5E6">
<H1 ALIGN="CENTER">A Sample FORM using POST</H1>

<FORM ACTION="/servlet/coreservlets.ShowParameters" METHOD="POST">
  Item Number: <INPUT TYPE="TEXT" NAME="itemNum"><BR>
  Quantity: <INPUT TYPE="TEXT" NAME="quantity"><BR>
  Price Each: <INPUT TYPE="TEXT" NAME="price" VALUE="$"><BR>
  <HR>
  First Name: <INPUT TYPE="TEXT" NAME="firstName"><BR>
  Last Name: <INPUT TYPE="TEXT" NAME="lastName"><BR>
  Middle Initial: <INPUT TYPE="TEXT" NAME="initial"><BR>
  Shipping Address:
  <TEXTAREA NAME="address" ROWS=3 COLS=40></TEXTAREA><BR>
  Credit Card:<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Visa">Visa<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Master Card">Master Card<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Amex">American Express<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Discover">Discover<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Java SmartCard">Java SmartCard<BR>
  Credit Card Number:
  <INPUT TYPE="PASSWORD" NAME="cardNum"><BR>
  Repeat Credit Card Number:
  <INPUT TYPE="PASSWORD" NAME="cardNum"><BR><BR>
  <CENTER>
    <INPUT TYPE="SUBMIT" VALUE="Submit Order">
  </CENTER>
</FORM>

</BODY>
</HTML>
```

## 3.5. Un Servicio de Publicación de Currículums

Los servicios de empleo en línea se han vuelto cada vez más populares últimamente. Un sitio de buena reputación brinda un servicio útil a los solicitantes de empleo al brindar una amplia exposición a sus habilidades y brinda un servicio útil a los empleadores al brindarles acceso a una gran cantidad de posibles empleados. Esta sección presenta un servlet que maneja parte de dicho sitio: la presentación de currículos en línea.

El Listado 3.5 y la Figura 3-5 muestran el formulario HTML que actúa como interfaz para el servlet de procesamiento de currículum. Si no está familiarizado con los formularios HTML, se tratan en detalle en el Capítulo 16. Lo importante que debe entender aquí es que el formulario usa **`POST`** para enviar los datos y que recopila valores para los siguientes nombres de parámetros:

**Figura 3-5. Front end para el Servlet `SubmitResume`**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/8439522e-9009-4b89-b5df-f2a1b9b2a4fe)

![image](https://github.com/adolfodelarosades/Java/assets/23094588/b1b84ab1-2e0a-4601-94ae-fb9ec4436dc5)



* **`headingFont`**

   Los encabezados se mostrarán en esta fuente. Un valor de "default" da como resultado una fuente sans-serif como Arial o Helvetica.

* **`headingSize`**

   El nombre de la persona se mostrará en este point size. Los subtítulos se mostrarán en un tamaño ligeramente más pequeño.

* **`bodyFont`**

   El texto principal (idiomas y habilidades) se mostrará en esta fuente.

* **`bodySize`**

   El texto principal se mostrará en este tamaño de punto.

* **`fgColor`**

   El texto será de este color.

* **`bgColor`**

   El fondo de la página será de este color.

* **`name`**

   Este parámetro especifica el nombre de la persona. Se centrará en la parte superior del currículum en la fuente y tamaño especificado previamente.

* **`title`**

   Este parámetro especifica el cargo de la persona. Se centrará debajo del nombre en un tamaño ligeramente más pequeño.

* **`email`**

   La dirección de correo electrónico del solicitante de trabajo se centrará debajo del título del trabajo dentro de un enlace **`mailto `**.

* **`languages`**

   Los lenguajes de programación enumerados se colocarán en una lista con viñetas en el currículum en línea.

* **`skills`**

   El texto del text area de habilidades se mostrará en la body font en la parte inferior del currículum bajo un encabezado llamado "Skills and Experience".

El listado 3.6 muestra el servlet que procesa los datos del formulario HTML. Cuando se presiona el botón "Preview", el primer servlet lee los parámetros de font y color. Antes de usar cualquiera de los parámetros, verifica si el valor es **`null `** (es decir, hay un error en el formulario HTML y, por lo tanto, falta el parámetro) o es una cadena vacía(empty string) (es decir, el usuario borró el valor predeterminado pero no introdujo nada en su lugar). El servlet usa un valor predeterminado apropiado para cada parámetro en tal caso. Los parámetros que representan valores numéricos se pasan a **`Integer.parseInt`**. Para protegerse contra la posibilidad de números proporcionados por el usuario con un formato incorrecto, esta llamada **`Integer.parseInt`** se coloca dentro de un bloque **`try/catch`** que proporciona un valor predeterminado cuando falla el análisis. Aunque puede parecer un poco tedioso manejar estos casos, generalmente no es demasiado trabajo si hace uso de algunos métodos de utilidad como **`replaceIfMissing`** y **`replaceIfMissingOrDefault`** en el Listado 3.6. Tedioso o no, los usuarios a veces pasan por alto ciertos campos o malinterpretan el formato de campo requerido, por lo que es fundamental que su servlet maneje correctamente los parámetros con formato incorrecto y que lo pruebe con datos con formato correcto e incorrecto.

**Core Approach**

	Diseñe sus servlets para manejar correctamente los parámetros faltantes o con formato incorrecto. Pruébelos con datos mal formados, así como con datos en el formato esperado.


Una vez que el servlet tiene valores significativos para cada uno de los parámetros de font y color, crea una cascading style sheet(hoja de estilo en cascada) a partir de ellos. Si no está familiarizado con las hojas de estilo, son una forma estándar de especificar las fuentes, los tamaños de fuente, los colores, la sangría y otra información de formato en una página web **HTML 4.0**. Las hojas de estilo generalmente se colocan en un archivo separado para que varias páginas web en un sitio puedan compartir la misma hoja de estilo, pero en este caso es más conveniente incrustar la información de estilo directamente en la página usando el elemento **`STYLE `**. Para obtener más información sobre las hojas de estilo, consulte http://www.w3.org/TR/REC-CSS1.

Después de crear la hoja de estilo, el servlet coloca el nombre del solicitante de empleo, el cargo y la dirección de correo electrónico centrados uno debajo del otro en la parte superior de la página. La fuente del encabezado se usa para estas líneas, y la dirección de correo electrónico se coloca dentro de un enlace de hipertexto **`mailto:`** para que los posibles empleadores puedan comunicarse directamente con el solicitante haciendo clic en la dirección. Los lenguajes de programación especificados en el parámetro **`languages`** ​​se analizan mediante **`StringTokenizer`** (suponiendo que se usen espacios o comas para separar los nombres de los idiomas) y se colocan en una lista con viñetas debajo del encabezado "Programming Languages". Finalmente, el texto del parámetro **`skills`** se coloca en la parte inferior de la página debajo del encabezado "Skills and Experience".

Las figuras 3-6 a 3-8 muestran un par de resultados posibles. El listado 3.7 muestra el HTML subyacente del primero de estos resultados.

**Figura 3-6. `SubmitResume` el Servlet después de presionar el botón "Preview" en la Figura 3-5.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/2b643d22-6357-424c-8b62-9dbfc0264cb7)

**Figura 3-7. Otro posible resultado del servlet `SubmitResume`.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/38f58d2d-28c4-47c6-85c4-0055ba7d610f)

**Figura 3-8. `SubmitResume` el servlet cuando se presiona el botón "Submit".**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/b86f5c9b-132a-4712-b167-2f2a363213ab)


**Listado 3.5. `Enviarcurrículum.html`**

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
  <TITLE>Free Resume Posting</TITLE>
  <LINK REL=STYLESHEET
        HREF="jobs-site-styles.css"
        TYPE="text/css">
</HEAD>
<BODY>
<H1>hotcomputerjobs.com</H1>
<P CLASS="LARGER">
To use our <I>free</I> resume-posting service, simply fill
out the brief summary of your skills below. Use "Preview"
to check the results, then press "Submit" once it is
ready. Your mini resume will appear on-line within 24 hours.</P>
<HR>
<FORM ACTION="/servlet/coreservlets.SubmitResume"
      METHOD="POST">
<DL>
<DT><B>First, give some general information about the look of
your resume:</B>
<DD>Heading font:
    <INPUT TYPE="TEXT" NAME="headingFont" VALUE="default">
<DD>Heading text size:
    <INPUT TYPE="TEXT" NAME="headingSize" VALUE=32>
<DD>Body font:
    <INPUT TYPE="TEXT" NAME="bodyFont" VALUE="default">
<DD>Body text size:
    <INPUT TYPE="TEXT" NAME="bodySize" VALUE=18>
<DD>Foreground color:
    <INPUT TYPE="TEXT" NAME="fgColor" VALUE="BLACK">
<DD>Background color:
    <INPUT TYPE="TEXT" NAME="bgColor" VALUE="WHITE">

<DT><B>Next, give some general information about yourself:</B>
<DD>Name: <INPUT TYPE="TEXT" NAME="name">
<DD>Current or most recent title:
    <INPUT TYPE="TEXT" NAME="title">
<DD>Email address: <INPUT TYPE="TEXT" NAME="email">
<DD>Programming Languages:
    <INPUT TYPE="TEXT" NAME="languages">
<DT><B>Finally, enter a brief summary of your skills and
    experience:</B> (use &lt;P&gt; to separate paragraphs.
    Other HTML markup is also permitted.)
<DD><TEXTAREA NAME="skills"
              ROWS=15 COLS=60 WRAP="SOFT"></TEXTAREA>
</DL>
  <CENTER>
    <INPUT TYPE="SUBMIT" NAME="previewButton" Value="Preview">
    <INPUT TYPE="SUBMIT" NAME="submitButton" Value="Submit">
  </CENTER>
</FORM>
<HR>
<P CLASS="TINY">See our privacy policy
<A HREF="we-will-spam-you.html">here</A>.</P>
</BODY>
</HTML>
```

**Listado 3.6. `EnviarResumen.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

/** Servlet that handles previewing and storing resumes
 *  submitted by job applicants.
 */

public class SubmitResume extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    if (request.getParameter("previewButton") != null) {
						showPreview(request, out);
						} else {
						storeResume(request);
						showConfirmation(request, out);
						}
  }
  // Shows a preview of the submitted resume. Takes
  // the font information and builds an HTML
  // style sheet out of it, then takes the real
  // resume information and presents it formatted with
  // that style sheet.

  private void showPreview(HttpServletRequest request,
                          PrintWriter out) {
    String headingFont = request.getParameter("headingFont");
						headingFont = replaceIfMissingOrDefault(headingFont, "");
						int headingSize =
						getSize(request.getParameter("headingSize"), 32);
						String bodyFont = request.getParameter("bodyFont");
						bodyFont = replaceIfMissingOrDefault(bodyFont, "");
						int bodySize =
						getSize(request.getParameter("bodySize"), 18);
						String fgColor = request.getParameter("fgColor");
						fgColor = replaceIfMissing(fgColor, "BLACK");
						String bgColor = request.getParameter("bgColor");
						bgColor = replaceIfMissing(bgColor, "WHITE");
						String name = request.getParameter("name");
						name = replaceIfMissing(name, "Lou Zer");
						String title = request.getParameter("title");
						title = replaceIfMissing(title, "Loser");
						String email = request.getParameter("email");
						email =
						replaceIfMissing(email, "contact@hotcomputerjobs.com");
						String languages = request.getParameter("languages");
						languages = replaceIfMissing(languages, "<I>None</I>");
						String languageList = makeList(languages);
						String skills = request.getParameter("skills");
						skills = replaceIfMissing(skills, "Not many, obviously.");
    out.println
      (ServletUtilities.DOCTYPE + "\n" +
       "<HTML>\n" +
       "<HEAD>\n" +
       "<TITLE>Resume for " + name + "</TITLE>\n" +
       makeStyleSheet(headingFont, headingSize,
                      bodyFont, bodySize,
                      fgColor, bgColor) + "\n" +
       "</HEAD>\n" +
       "<BODY>\n" +
       "<CENTER>\n"+
       "<SPAN CLASS=\"HEADING1\">" + name + "</SPAN><BR>\n" +
       "<SPAN CLASS=\"HEADING2\">" + title + "<BR>\n" +
       "<A HREF=\"mailto:" + email + "\">" + email +
           "</A></SPAN>\n" +
       "</CENTER><BR><BR>\n" +
       "<SPAN CLASS=\"HEADING3\">Programming Languages" +
       "</SPAN>\n" +
       makeList(languages) + "<BR><BR>\n" +
       "<SPAN CLASS=\"HEADING3\">Skills and Experience" +
       "</SPAN><BR><BR>\n" +
       skills + "\n" +
       "</BODY></HTML>");
  }

  // Builds a cascading style sheet with information
  // on three levels of headings and overall
  // foreground and background cover. Also tells
  // Internet Explorer to change color of mailto link
  // when mouse moves over it.

  private String makeStyleSheet(String headingFont,
                                int heading1Size,
                                String bodyFont,
                                int bodySize,
                                String fgColor,
                                String bgColor) {
    int heading2Size = heading1Size*7/10;
    int heading3Size = heading1Size*6/10;
    String styleSheet =
      "<STYLE TYPE=\"text/css\">\n" +
      "<!--\n" +
      ".HEADING1 { font-size: " + heading1Size + "px;\n" +
      "            font-weight: bold;\n" +
      "            font-family: " + headingFont +
                     "Arial, Helvetica, sans-serif;\n" +
      "}\n" +
      ".HEADING2 { font-size: " + heading2Size + "px;\n" +
      "            font-weight: bold;\n" +
      "            font-family: " + headingFont +
                     "Arial, Helvetica, sans-serif;\n" +
      "}\n" +
      ".HEADING3 { font-size: " + heading3Size + "px;\n" +
      "            font-weight: bold;\n" +
      "            font-family: " + headingFont +
                     "Arial, Helvetica, sans-serif;\n" +
      "}\n" +
      "BODY { color: " + fgColor + ";\n" +
      "       background-color: " + bgColor + ";\n" +
      "       font-size: " + bodySize + "px;\n" +
      "       font-family: " + bodyFont +
                    "Times New Roman, Times, serif;\n" +
      "}\n" +
      "A:hover { color: red; }\n" +
      "-->\n" +
      "</STYLE>";
    return(styleSheet);
  }

  // Replaces null strings (no such parameter name) or
  // empty strings (e.g., if textfield was blank) with
  // the replacement. Returns the original string otherwise.

  private String replaceIfMissing(String orig,
                                  String replacement) {
    if ((orig == null) || (orig.length() == 0)) {
      return(replacement);
    } else {
      return(orig);
    }
  }

  // Replaces null strings, empty strings, or the string
  // "default" with the replacement.
  // Returns the original string otherwise.

  private String replaceIfMissingOrDefault(String orig,
                                           String replacement) {
    if ((orig == null) ||
        (orig.length() == 0) ||
        (orig.equals("default"))) {
      return(replacement);
    } else {
      return(orig + ", ");
    }
  }

  // Takes a string representing an integer and returns it
  // as an int. Returns a default if the string is null
  // or in an illegal format.

  private int getSize(String sizeString, int defaultSize) {
    try {
      return(Integer.parseInt(sizeString));
    } catch(NumberFormatException nfe) {
      return(defaultSize);
    }
  }
  // Given "Java,C++,Lisp", "Java C++ Lisp" or
  // "Java, C++, Lisp", returns
  // "<UL>
  //   <LI>Java
  //   <LI>C++
  //   <LI>Lisp
  //  </UL>"

  private String makeList(String listItems) {
    StringTokenizer tokenizer =
      new StringTokenizer(listItems, ", ");
    String list = "<UL>\n";
    while(tokenizer.hasMoreTokens()) {
      list = list + "  <LI>" + tokenizer.nextToken() + "\n";
    }
    list = list + "</UL>";
    return(list);
  }

  // Show a confirmation page when they press the
  // "Submit" button.

  private void showConfirmation(HttpServletRequest request,
                                PrintWriter out) {
    String title = "Submission Confirmed.";
    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY>\n" +
                "<H1>" + title + "</H1>\n" +
                "Your resume should appear on-line within\n" +
                "24 hours. If it doesn't, try submitting\n" +
                "again with a different email address.\n" +
                "</BODY></HTML>");
  }

  // Why it is bad to give your email address to untrusted sites

  private void storeResume(HttpServletRequest request) {
    String email = request.getParameter("email");
    putInSpamList(email);
  }

  private void putInSpamList(String emailAddress) {
    // Code removed to protect the guilty.
  }
}
```

**Listado 3.7. Fuente HTML de la salida de `SubmitResume` que se muestra en la Figura 3-6.**

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Resume for Al Gore Ithm</TITLE>
<STYLE TYPE="text/css">
<!--
.HEADING1 { font-size: 32px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
}
.HEADING2 { font-size: 22px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
}

.HEADING3 { font-size: 19px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
}
BODY { color: BLACK;
       background-color: WHITE;
       font-size: 18px;
       font-family: Times New Roman, Times, serif;
}
A:hover { color: red; }
-->
</STYLE>
</HEAD>
<BODY>
<CENTER>
<SPAN CLASS="HEADING1">Al Gore Ithm</SPAN><BR>
<SPAN CLASS="HEADING2">Chief Technology Officer<BR>
<A HREF="mailto:ithm@aol.com">ithm@aol.com</A></SPAN>
</CENTER><BR><BR>
<SPAN CLASS="HEADING3">Programming Languages</SPAN>

<UL>
  <LI>Java
  <LI>C++
  <LI>Smalltalk
  <LI>Ada
</UL><BR><BR>
<SPAN CLASS="HEADING3">Skills and Experience</SPAN><BR><BR>
Expert in data structures and computational methods.
<P>

Well known for finding efficient solutions to
<I>apparently</I> intractable problems, then rigorously
proving time and memory requirements for best, worst, and
average-case performance.
<P>
Can prove that P is not equal to NP. Doesn't want to work
for companies that don't know what this means.
<P>
Not related to the American politician.
</BODY></HTML>
```

## 3.6. Filtrado de Strings para Caracteres Específicos de HTML

Normalmente, cuando un servlet quiere generar HTML que contenga caracteres como **`<`** o **`>`**, simplemente usa **`&lt;`** o **`&gt;`**, las standard HTML character entities. De manera similar, si un servlet desea que aparezcan comillas dobles o un ampersand dentro de un valor de atributo HTML, utiliza **`&quot;`** o **`&amp;`**. Si no se realizan estas sustituciones, se genera un código HTML con formato incorrecto, ya que **`<`** o **`>`** a menudo se interpretará como parte de una HTML markup tag, una comilla doble en un valor de atributo puede interpretarse como el final del valor, y los ampersands son simplemente ilegales en los valores de atributo. En la mayoría de los casos, es fácil anotar los caracteres especiales y usar los reemplazos HTML estándar. Sin embargo, hay dos casos en los que no es tan fácil realizar esta sustitución manualmente.

El primer caso en el que la conversión manual es difícil ocurre cuando el string se deriva de un extracto de programa o de otra fuente donde ya está en algún formato estándar. Pasar manualmente y cambiar todos los caracteres especiales puede ser tedioso en tal caso, pero olvidar convertir incluso un carácter especial puede resultar en que su página web tenga secciones faltantes o formateadas incorrectamente (vea la Figura 3-9 más adelante en esta sección ) .

**Figura 3-9. Resultado de `BadCodeServlet`: gran parte del fragmento de código se pierde y el texto que sigue al fragmento de código se muestra incorrectamente en una fuente monoespaciada.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/9b388f0c-e5d4-4d44-b334-8ffcc3336fc8)


El segundo caso en el que falla la conversión manual es cuando el string se deriva de datos de formulario HTML. Aquí, la conversión debe realizarse absolutamente en tiempo de ejecución, ya que, por supuesto, los datos de consulta no se conocen en tiempo de compilación. Si no se hace esto para una página web interna, también se pueden perder secciones de la salida del servlet o tener un formato incorrecto si el usuario alguna vez envía estos caracteres especiales. Si no realiza este filtrado de páginas web accesibles desde el exterior, su página también se convierte en un vehículo para el ataque de secuencias de comandos entre sitios. Aquí, un programador malintencionado incrusta parámetros **`GET`** en una URL que hace referencia a uno de sus servlets. Estos parámetros **`GET`** se expanden a HTML elementos **`<SCRIPT>`** que explotan errores conocidos del navegador. Sin embargo, al incrustar el código en una URL que hace referencia a su sitio y solo distribuir la URL, no la página web maliciosa en sí, el atacante puede pasar desapercibido más fácilmente y también puede explotar las relaciones de confianza para hacer que los usuarios piensen que los scripts provienen de un sitio web, fuente confiable (su servlet). Para obtener más detalles sobre este problema, consulte http://www.cert.org/advisories/CA-2000-02.html y http://www.microsoft.com/technet/security/crssite.asp .

### Código para Filtrar

Reemplazar **`<`**, **`>`**, **`"`** y **`&`** en cadenas es un asunto simple, y hay varios enfoques diferentes que pueden realizar la tarea. Sin embargo, es importante recordar que ***las cadenas de Java son inmutables (es decir, no se pueden modificar )***, por lo que la concatenación de cadenas implica copiar y luego descartar muchos segmentos de cadena. Por ejemplo, considere las siguientes dos líneas:

```java
String s1 = "Hello";
String s2 = s1 + " World";
```

Dado que **`s1`** no se puede modificar, la segunda línea hace una copia de **`s1`** y agrega "**`World`**" a la copia, luego la copia se descarta. Para evitar el gasto de generar estos objetos temporales (basura), debe usar una estructura de datos mutable y **`StringBuffer`** es la elección natural. El listado 3.8 muestra un método de filtro estático que utiliza un **`StringBuffer`** para copiar caracteres de manera eficiente desde una string de entrada a una versión filtrada, reemplazando los cuatro caracteres especiales en el proceso.

**Listado 3.8. `ServletUtilities.java`**

```java
package coreservlets;

import javax.servlet.*;
import javax.servlet.http.*;

public class ServletUtilities {

  // Other methods in ServletUtilities shown elsewhere...

  /** Given a string, this method replaces all occurrences of
   *  '<' with '&lt;', all occurrences of '>' with
   *  '&gt;', and (to handle cases that occur inside attribute
   *  values), all occurrences of double quotes with
   *  '&quot;' and all occurrences of '&' with '&amp;'.
   *  Without such filtering, an arbitrary string
   *  could not safely be inserted in a Web page.
   */

  public static String filter(String input) {
    StringBuffer filtered = new StringBuffer(input.length());
    char c;
    for(int i=0; i<input.length(); i++) {
      c = input.charAt(i);
      if (c == '<') {
        filtered.append("&lt;");
      } else if (c == '>') {
        filtered.append("&gt;");
      } else if (c == '"') {
        filtered.append("&quot;");
      } else if (c == '&') {
        filtered.append("&amp;");
      } else {
      }
    }
    return(filtered.toString());
  }
}
```

**Ejemplo**

A modo de ilustración, considere un servlet que intente generar una página web que contenga la siguiente lista de códigos:

```java
if (a<b) {
  doThis();
} else {
  doThat();
}
```

Si el código se insertara en la página web palabra por palabra, **`<b`** se interpretaría como el comienzo de una etiqueta HTML, y todo el código hasta el siguiente **`>`** probablemente se interpretaría como partes mal formadas de esa etiqueta. Por ejemplo, el Listado 3.9 muestra un servlet que genera este fragmento de código y la Figura 3-9 muestra el mal resultado. El listado 3.10 presenta un servlet que no cambia nada excepto filtrar la cadena que contiene el fragmento de código y, como ilustra la figura 3-10, el resultado es correcto.

**Figura 3-10. Resultado de `FilteredCodeServlet`: el uso del método `filter` resuelve problemas con cadenas que contienen caracteres especiales.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/3d44b5d1-7454-4266-9b3f-4acbfec1efb0)


**Listado 3.9. `BadCodeServlet.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/** Servlet that displays a fragment of some Java code,
 *  but forgets to filter out the HTML-specific characters
 *  (the less-than sign in this case).
 */

public class BadCodeServlet extends HttpServlet {
  private String codeFragment =
							"if (a<b) {\n" +
							"  doThis();\n" +
							"} else {\n" +
							"  doThat();\n" +
							"}\n";

  public String getCodeFragment() {
    return(codeFragment);
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "The Java 'if' Statement";

    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY>\n" +
                "<H1>" + title + "</H1>\n" +
                "<PRE>\n" +
                getCodeFragment() +
                "</PRE>\n" +
                "Note that you <I>must</I> use curly braces\n" +
                "when the 'if' or 'else' clauses contain\n" +
                "more than one expression.\n" +
                "</BODY></HTML>");
  }
}
```

**Listado 3.10. `FilteredCodeServlet.java`**

```java
package coreservlets;

/** Subclass of BadCodeServlet that keeps the same doGet method
 *  but filters the code fragment for HTML-specific characters.
 *  You should filter strings that are likely to contain
 *  special characters (like program excerpts) or strings
 *  that are derived from user input.
 */

public class FilteredCodeServlet extends BadCodeServlet {
  public String getCodeFragment() {
    return(ServletUtilities.filter(super.getCodeFragment()));
  }
}
```


