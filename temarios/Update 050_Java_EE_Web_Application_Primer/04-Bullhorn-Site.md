# 4. Descripción general del sitio Bullhorn

El diagrama de la Figura 4-1 ilustra cómo encaja el sitio. Sólo se muestran los componentes principales. Es posible que desee agregar páginas y clases adicionales según sea necesario.

<img width="715" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/5bfe3958-3da1-4540-8376-253a1d644c83">

**Figura 4-1 Los componentes que componen Bullhorn**

## Los Componentes de Bullhorn

* **Servlets** Clases Java que amplían el servidor web para proporcionar una interfaz para el navegador y la base de datos u otros servlets.

* **JPA classes** Clases API de persistencia de Java que se utilizan para comunicarse entre los servlets y la base de datos.

* **Request objects** representan información enviada entre el navegador y los servlets. Esta información puede incluir direcciones de correo electrónico y contraseñas que utiliza el servlet para permitir el acceso al sitio.

* **Sessions** son el método o enfoque del servidor web para retener datos mientras el usuario accede al sitio.

* **User objects** La información del usuario se almacena en una clase que se almacenará en la sesión y estará disponible para todas las páginas del usuario actual.

* **JSP** (**Java Server Pages**) Páginas web que contienen HTML y tags de la **JSP Standard Tag Library** para agregar funcionalidad. Debido a que contienen código, pueden representar dinámicamente la request(solicitud) de cada usuario. La JSP Standard Tag Library permite que cada persona vea su propia versión de la página.

* **Páginas HTML** (**Hypertext Markup Language**). HTML es un sistema para etiquetar archivos de texto para controlar fuentes, colores e imágenes en sus páginas web.

<hr>

**Tip**

Para evitar que su HTML se vuelva demasiado complicado, use **CSS** (**Cascading Style Sheets**) y **JavaScript** para controlar la presentación de su contenido y deje que HTML controle el diseño.

<hr>

La aplicación Bullhorn contiene páginas web para *iniciar sesión*, *inicio*, *noticias* y *perfil de usuario*. El usuario comienza en la página de inicio de sesión. Una vez que el usuario hace clic en el botón Iniciar sesión, la request (datos del formulario de inicio de sesión(login)) se enviará al servlet de inicio de sesión(login).

El servlet de inicio de sesión(login) validará al usuario con la base de datos. Un usuario válido se almacenará en la sesión, que es la forma en que el sitio web recuerda datos entre visitas a la página. Los usuarios no válidos no pasarán de la página de inicio de sesión hasta que ingresen una combinación correcta de nombre de usuario y contraseña.

Crearemos otros objetos (clases) para validar datos o soportar las clases y páginas que se muestran en el diagrama.

## ¿Cómo se ve cada página?

La página de inicio de sesión contendrá cuadros de texto en los que el usuario ingresará su correo electrónico y contraseña. Esta información se verificará en el servlet de inicio de sesión. Si coinciden con lo que hay en la base de datos, el usuario será redirigido a su página de inicio. Si no coinciden, se le pedirá al usuario que inicie sesión nuevamente. Los usuarios que llegan a la página de inicio de sesión pero no están registrados en el sitio pueden registrarse para iniciar sesión haciendo clic en el enlace **"Join"**. Consulte la Figura 4-2.

<img width="1030" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a3a49b1c-8be6-49d1-9f3b-88c51820e63d">


**Figura 4-2 La página de inicio de sesión contiene cuadros de texto para correo electrónico y contraseña y un botón para iniciar sesión en la aplicación.**

La página de inicio permitirá a cada usuario crear una nueva publicación. Cada publicación está limitada a 141 caracteres, por lo que la página de inicio impone esta restricción (consulte la Figura 4-3). Una vez que el usuario inicia sesión, todas las páginas contienen una barra de navegación en la parte superior que le permite navegar a diferentes páginas, ver o editar su perfil y buscar publicaciones que contengan una palabra específica.

<img width="1094" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/34a70954-0db7-4c58-b147-e9c5bc4261e6">

**Figura 4-3 La página de inicio contiene un formulario para enviar una publicación a la base de datos. El formulario contiene un cuadro de texto y botones para enviar la publicación o borrar el formulario.**

Cada página contiene la misma barra de navegación, que permite al usuario moverse por la aplicación. La barra de navegación contiene el logotipo, enlaces a la página de inicio y a la página de noticias, y un cuadro de búsqueda. También muestra el nombre del usuario que inició sesión. El usuario también puede seleccionar entre varias opciones de usuario, que se implementan como una lista desplegable. Estos incluyen cerrar sesión, ver o editar el perfil y enviar comentarios. Consulte la Figura 4-4.

<img width="1078" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/25a82821-1b12-4bd9-855b-bf17b807fa90">

**Figura 4-4 La barra de navegación en Bullhorn se muestra en la parte superior de cada página**

El enlace **"News Feed(Noticias)"** en la barra de navegación llevará al usuario a la página de noticias, que muestra todas las publicaciones de todos los usuarios. La dirección de correo electrónico de cada usuario es un enlace que mostrará la información del perfil del usuario. Al hacer clic en **Search** en la barra de navegación también se mostrará la fuente de noticias, pero filtrada a publicaciones que contienen el texto ingresado en el cuadro de texto search. Consulte la Figura 4-5.

<img width="1112" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/805ff499-ca09-460a-8d86-9e799d64d6fe">

**Figura 4-5 La página de noticias muestra todas las publicaciones que están en la base de datos.**

El perfil de un usuario es de sólo lectura. Muestra su correo electrónico, lema, fecha de inscripción e imagen de avatar, si corresponde. Los usuarios pueden ver los perfiles de otros usuarios haciendo clic en sus nombres de usuario en la página news feed(noticias). Consulte la Figura 4-6.

<img width="1110" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/bf0bb096-57a7-46fb-a108-2d05411bf8e4">

**Figura 4-6 La página de perfil de un usuario mostrada en vista de solo lectura

### Editar un perfil

Si un usuario ve su propio perfil, entonces se puede editar el perfil. Consulte la Figura 4-7.

<img width="1110" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/043ce17d-d01c-4ffc-a7f5-cbaaead2a0f5">

**Figura 4-7 La página de perfil del usuario que ha iniciado sesión se muestra con cuadros de texto y un botón para que el usuario pueda realizar cambios.**

La página de soporte no muestra mucho, solo algo de texto para informarle que existe. Podríamos modificar esto para incluir un cuadro de texto que enviará un correo electrónico o agregará un registro a la base de datos. Luego, la persona de soporte podría verificar periódicamente si hay nuevos mensajes. Consulte la Figura 4-8.

<img width="1044" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/387fb7cd-6ae7-43f8-b215-d0a45046dfc4">

**Figura 4-8 La página de soporte podría permitirle a los usuarios enviar solicitudes al administrador web**
