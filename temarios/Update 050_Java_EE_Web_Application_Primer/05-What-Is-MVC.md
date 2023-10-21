# 5. ¿Qué es MVC?
Dave Wolf1  y A. J. Henley2

(1)Nueva York, EE.UU.

(2)Washington, D.C., Distrito de Columbia, EE.UU.

El patrón modelo-vista-controlador (MVC) es un patrón de diseño de software que se utiliza para crear aplicaciones web basadas en datos. Un patrón de diseño es una solución general que aborda desafíos comunes de diseño de software. Si bien no es un diseño terminado, puede considerar un patrón de diseño como una plantilla o un conjunto de mejores prácticas.

Seguir el patrón MVC significa que pretende mantener separadas la capa de presentación (vista), la lógica empresarial (controlador) y la capa de base de datos (modelo). Los cambios realizados en una capa afectarán mínimamente a las demás.

El beneficio real de MVC no se ve al escribir el código, sino al mantenerlo. El código está en unidades independientes y se puede mantener sin tener que tener toda la aplicación en la cabeza.

La formación de equipos en torno a MVC es más fácil. El diseño se presta a la segmentación entre diferentes personas o grupos. Imagine un equipo de visualización responsable de excelentes vistas, un equipo de modelo que sepa todo sobre los datos y un equipo de controlador que comprenda el flujo de aplicaciones y las reglas comerciales. Cada uno puede trabajar en su parte de la aplicación al mismo tiempo sin tener en cuenta a los demás equipos. Esto permite un desarrollo de aplicaciones más rápido.

Otra gran ventaja de MVC es la reutilización de código. La lógica de la aplicación implementada en el modelo y el controlador se reutiliza para cada vista diferente.

El modelo, la vista, el controlador y el servicio en Bullhorn
Cuando piense en el modelo, piense en la base de datos. Generalmente, el modelo se construye primero. El modelo debe almacenar los datos. El modelo puede constar de clases que se comunican con la base de datos. El modelo en Bullhorn está representado por la base de datos Oracle y las clases de entidad, que representan las tablas en Oracle.

Una vez que haya creado el modelo de datos y las clases que forman parte del modelo, pase a los servicios. Los servicios son todo el código que interactúa con el modelo.

A continuación, pase al controlador. El controlador es parte de la aplicación web y mueve datos entre los servicios y la vista. El controlador también determina qué página o servlet se llama a continuación. En Bullhorn, los servlets también son el controlador. Este no es siempre el caso. El controlador es simplemente el código que controla la lógica específica de la aplicación. Dado que se trata de una aplicación web, los servlets se encargan de obtener datos de la vista y determinar qué JSP se mostrará a continuación. Si tiene clases Java que contienen esa funcionalidad, serán parte del controlador.

La parte de la aplicación que el usuario realmente ve se llama vista. Presenta los datos al usuario y obtiene datos del usuario, que luego se devuelven al modelo a través de los servicios y el controlador. La vista en Bullhorn consta de JSP (páginas de servidor Java) que utilizan Bootstrap, CSS (hojas de estilo en cascada), JavaScript e imágenes. Todas las partes de la vista funcionan para crear las páginas que se muestran en el navegador del usuario. Consulte la Figura 5-1.


Figura 5-1 Los componentes de Bullhorn están divididos lógicamente en capas llamadas Modelo, Vista, Controlador y Servicio.
Consejo
Realizar validación en cada capa. Los datos pueden llegar a su aplicación a través de formas que usted no anticipó cuando la desarrolló inicialmente, no solo a través del navegador. Por ejemplo, puede llegar a ser que necesites importar información a tu base de datos. O bien, puede escribir más adelante un servicio web que interactúe directamente con su capa de servicio.
