# 1. Introducción - 3 clases • 24 min

* Introducción al curso 06:05
* Instalación JDK (opcional) 13:40
* Instalación IntelliJ IDEA 04:39

## Introducción al curso 06:05

Bienvenidos al curso de pruebas unitarias con **JUnit5** y **Mockito** en Java.

Este curso está orientado a estudiantes que quieren aprender solamente **JUnit5** y **Mockito** nada más. Pero también aquellos que quieran aprender todo lo que es pruebas en **Sprint**.

Por lo tanto, vamos a ver dos grandes parte del curso partiendo desde la base, desde cero y después vamos a ver cómo se trabaja, como se integran también estas dos herramientas en **Spring Boots**.

![image](https://user-images.githubusercontent.com/23094588/195302668-c94ac9ec-215f-4fe4-b095-395d5f5b8456.png)

Bien, los componentes que vamos a ver son los siguientes por el lado de **JUnit5**.  

Comenzando con un ***desarrollo guiado por pruebas unitarias que se le conoce como TDD***, antes siquiera de haber comenzado a escribir el código, vamos a comenzar a realizar nuestras pruebas unitarias y a medida que vamos probando nuestro código que vamos escribiendo, vamos implementando los métodos, nuestro código, las clases y dando funcionalidad.

Vamos a ver todo lo que es ***Assertions***, la clase más importante de **JUnit5** para las afirmaciones con diferentes tipos afirmaciones por ejemplo **`assertEquals`**, **`assertTrue`**, **`assertFalse`**, **`assertNull`** en fin, afirmar nuestro código, nuestras variables y objetos.

Y también todo lo el manejo de errores con **`assertThrows`**, manejo de excepciones. Afirmar, por ejemplo, que nuestro código lance una excepción esperada, validar que nuestro manejo de error sea el correcto.

**`assertAll`** ejecutar un grupo de ***Assertions*** de afirmaciones.

***Anotaciones*** como ***`@DisplayName`*** y ***`@Disabled`***.

El ***ciclo de vida de una clase*** de test de unit ***`@AfterEach`***, ***`@BeforeEach`***, ***`@AfterAll`*** y ***`@BeforeAll`***, lo vamos a ver en detalle en el curso.

También tenemos los ***test condicionales*** utilizando anotaciones ***`@EnabledOnOs`***, ***`@EnabledOnJre`***, etc.

También tenemos ***Assumptions***, que nos permite suponer que cierta condición se cumple, muy parecido a las anotaciones condicionales que tenemos arriba, pero esto es a nivel de código, un poco más programático.

***Test anidados***, clases de tests que se anotan con **`@Nested`** para dar una jerarquía, una organización, una estructura a nuestras pruebas unitarias, utilizando clases anidadas que también se les conoce como ***Inner class***.

**`@RepeatedTest`** para crear ***tests repetidos***.

También tenemos los ***tests parametrizados*** con la anotación **`@ParameterizedTest`**.

Uso de etiquetas **`@Tag`** para categorizar, etiquetar nuestros métodos, nuestras pruebas unitarias.

***Independencia***, en fin y mucho más.


![image](https://user-images.githubusercontent.com/23094588/195310958-3d4a7c6d-63f0-4bbb-a667-7a935ea9dfd7.png)

tema que vamos a ver en foquito dependencias mock.

Vamos a realizar un test a una clase.

Podría ser un service que tiene dependencia, tiene otras instancias de objeto que se utilizan, pero

estas dependencia la vamos a emular porque lo que no interesa realmente probar la clase en cuestión.

La clase por ejemplo servis que contiene esta dependencia y la dependencia, simplemente las implementamos

como un mock, la simulamos de una forma simple.

Utilizando este framework vamos a utilizar los verifi para ver qué métodos se están invocando, que

se están llamando de estas dependencias.

Anotacion como Mok Inyec, Mocks Captor estèn UIF para ejecutar una prueba unitaria con una extensión

por ejemplo como Akito manejo de errores Exepciones con Ben Trou Argument Matters que nos permite validar

quienes están ejecutando los métodos con cierto tipo de argumento, con cierto patrón de argumento y

cierto coinciden argument captor tiene fondo para capturar un argumento familas de métodos dú algo por

ejemplo dú áncer du fru para manejo de excepciones du return en tipicamente para dar un comportamiento

para simular los métodos mock cuando no devuelven nada, cuando son vacíos son void y también se utiliza

mucho en conjunto con los espías.

Vienen a continuación los Speight, que es un híbrido entre un mock, un objeto simulado y el objeto

real.

Por lo tanto, también nos permite invocar los métodos reales, no necesariamente simular el comportamiento

de un método, sino también hasta la llamada real a un método y mucho más.

Bueno, y todo por el lado de Springwood Primum Test Integración con Yuni 5 como Akito.

Como ya mencioné al principio, este curso está orientado a personas que quieren aprender Yuni 5 y moquitos

desde cero, es decir, sin Springwood.

Por lo tanto, vamos a aprender desde cero, desde la base con Estodo Framework y después vamos a ir

a una sección aparte de todo lo que hemos visto de Yuni 5 y poquito.

Y lo vamos a integrar y lo vamos a trabajar en una aplicación con Spring Buto y vamos a aprender bien

todo lo que experimentes utilizando estas dos herramientas y también mucho más, porque también se incluyen

anotaciones como Mock Bin y Atto Willet, que para intución de dependencia Nok Bin es para registrar

un componente Spring, pero que es un Mok no es el objeto real de una implementación.

Por ejemplo, es un mock que está simulado.

En realidad no queremos probar el objeto real de esa dependencia de terceros.

Lo que queremos realmente probar en nuestra propio código matracas de servis, que depende de beans

también.

Vamos a ver.

Lo que prueba de integración, por ejemplo, para trabajar con controladores con Mok MVC usando la anotación

web MS Test Data JPA test también torque integración con persistencia mucho más.

Todo lo relacionado con Springwood.

Bueno, quién soy yo?

Me llamo Andres Guzman, Instituto de Udemy.

Hace bastante tiempo ya tengo más de 20 años de experiencia en desarrollo en Java.

Ya tengo una gran cantidad de estudiantes más de 100 mil y con cursos de gran trayectoria en Udemy como

el Master Completo de Java desde cero, uno de los más vendido en la plataforma Udemy y también el mejor

calificado con cerca de ochenta y dos horas.

También tengo un curso de Spring Framework desde cero y con una gran cantidad de alumnos, el de Java

Master, cerca de cuarenta y dos mil, un poco más, el de Spring Framework más de 20000 con excelentes

calificaciones 4,8 4,7 de Nigro servicio utilizando Spring Cloud Springwood 4,7.

Es decir, la calificación a los cursos hablan por sí sola.

Así que te invito a que te escribas este curso que va a estar muy completo y te hace vivir mucho en

lo profesional.

Apúntate y te espero adentro.

## Instalación JDK (opcional) 13:40

Bienvenidos.

Continuamos con la descarga de la instalación del JDK, el JDK es el kit de desarrollo para Aullaban,

contiene todas las clases y librerías para poder escribir y desarrollar nuestras aplicaciones en Yaba.

Entonces vamos a buscar por JDK y hacemos clic en cualquiera.

Pero hay un detalle importante.

Por ejemplo, si seleccionamos esta de acá, hacemos un clic, aparece una página más antigua, incluso

tiene la versión 8 y hasta el momento de grabar este video, la última versión es la 14.

Entonces, bueno, nos vamos a horeca el puntocom.

Quitamos todo esto ya.

Entonces esta sería la página principal de Yaba en Oracle Oracle E.com: Llaba Enter y así que si en

la página actualizada actual de Yaba y en inglés la versión 14, la última disponible hasta el momento

de grabar este video.

Pero bueno, como nueva política de Oracle va sacando versiones cada seis meses en seis meses más la

versión va a ser la 15, pues las 16 y así, pero hasta el momento es la 14.

Pero no se preocupen porque todas nuestras aplicaciones que vamos a ver en el curso va a funcionar desde

la versión 14 en adelante, sin ningún problema.

Es compatible con versiones posteriores, incluso también pueden usar versiones anteriores, por ejemplo

las 12, la 11 y ningún problema.

Actualmente las últimas versiones.

Es decir, desde las 10 en adelante.

Por lo tanto, la 14 solamente se ejecutan y se pueden instalar máquinas de 64 bits.

Pero qué pasa si tengo un equipo en 32 bits?

Bueno, igual pueden hacer el curso, pero en vez de utilizar la 14 tienen que descargar y configurar

la 8.

Bueno, por ejemplo, vámonos acá hacemos un clic en gratis o descargar gratis.

Ya tenemos la ruta, ya va a tecnologías yaba s downloads punto HTML.

Bueno, recuerden que las páginas, lo menú y todo eso me campeando.

Entonces puede que cuando estén viendo esta clase haya cambiado este botón y esté en otra parte, pero

no importa, siempre pueden acceder a través de la ruta o RL, o tal vez se pueden ir.

Por ejemplo por acá se van a downloads, buscan download en el menú, aunque también puede cambiar y

acabo cachaba hacen un clic, se fija y JDK para desarrolladores.

Entramos a la misma página, pero esta es la ruta más importante.

Es lo que importa.

Entonces tenemos la 14, que es la última, pero también tenemos la 11 que de soporte a largo plazo

y la 8.

La 8 la utilizan en caso que tengan 32 bits, es decir, un sistema operativo, un equipo en 32 bits.

La gran mayoría de los ejemplo, el curso también va a funcionar sin problemas.

La 8 van a ver algunas características nuevas de versiones posteriores que no van a funcionar, pero

no se preocupen porque la gran mayoría de los ejemplos y de la características de Java van a funcionar

en cualquier JDK desde la 8 en adelante no es una limitación.

Ahora lo ideal utilizar la 14A que le vamos a utilizar en el curso para aprovechar todas las características

y funcionalidades.

Lo puede descargar de 2 página de la oficial de Oracle y también de la página Open JDK y la versión

Open Source.

Por ejemplo, en la versión oficial de Oracle se van Oracle y JDK descargar download por acá seleccionan

el sistema operativo que corresponda hacia el Linux Mackintosh, Windows.

En el caso Mackintosh y Windows tienen el taller, lo pueden descargar, pero también tienen el comprimido

y también en caso que estén utilizando Linux, cualquier distribución, por ejemplo, use Ubuntu Debian.

Pueden descargar también con el sistema de paquete que corresponda, ahí lo pueden buscar y descargar

JDK la versión 14, la última o por lo menos la más actualizada posible desde la 11 hasta la 14.

Ahora recuerden, si tienen un sistema operativo un 32 tienen que usarla un 8 o la 8.

Entonces en el caso Windows por acá el instalar o el ZIP hacen un clic.

Aceptan ya, pero vamos a utilizar Open JDK, así que voy a cancelar.

Vamos a volver y acá aparece el link para usuarios finales y desarrolladores, está la versión de Oracle

Open JDK.

Hacemos un clic.

J Decaía Tonet listo para utilizar J de K 14 hacen un clic o la última versión de Punilla, quizás en

su momento aparezca la 15 o 16 bien, pero independiente descarga para Linux Mackintosh y Windows 64

bueno siempre hacer el 64 y está en comprimido ya.

Entonces la idea es que sea portable, se descarga zip, se descomprime en algún directorio y lo configuramos.

Configuramos la variable de ambiente path y ya bajo respecto a licencias para desarrollar Open JDK,

bueno, y también la versión de Oracle.

Ambas versiones tanto Oracle como Open JDK para desarrollar es completamente gratis.

No hay licencia.

Ahora, si quiero colocar en producción nuestra aplicaciones con licencia comercial, ahí tengo que

pagar licencias, pero solamente para producción para un tema comercial y se recomienda utilizar la

versión de la oficial.

Bueno, aparte el soporte incluye parches de seguridad y actualizaciones, mientras que si utilizamos

Open JDK para producción lo podemos hacer sin ningún problema, sin pagar licencia total es Open Source

Open JDK, no hay licencia, pero el problema es que no trae parche de seguridad para producción, no

trae nuevas actualizaciones.

Entonces es un tema importante.

Toman en cuenta y por defecto me muestra la última versión en JDK de A Punto NET o en Open JDK.

Pero si quiero ver las demás versiones, por ejemplo descargar la ONCE, me voy archivo acá o la ruta

J de cada punto ya ASP.NET Larch Archivo y acá están todas las versiones.

También la pueden descargar, pero como consejo para efector curso utilicen la última vez.

Entonces vamos a descargar.

En mi caso Windows hacen un clic.

Comienza la descarga.

Una que se carga.

Lo vamos a configurar bien para el curso.

Vamos a ocupar un directorio, por ejemplo en mi caso de dos punto cursos yaba, pero independiente

el que utilicen.

Lo importante es que sea lo más simple posible, que no tenga caracteres especiales, que no tenga espacio

en blanco, ni acentos, ni eñes, ningún carácter especial, solamente alfanumérico y todo juntos tiene

espacio.

Es muy importante porque después podríamos tener muchos errores y problemas cuando queramos ejecutar

nuestras aplicaciones.

Acá tengo el Open JDK, lo copian de descarga, lo pegan acá y lo descomprime entonces utilizando cualquier

herramienta.

En mi caso 7 zip es traer acá.

En el caso de Linux, de Making Touch, utilizan, por ejemplo, target zeta para comprimir mediante

terminal.

Acá está el directorio.

El más importante, el fin que contiene todos los ejecutables por acá y eso es lo que tienen que configurar

en nuestro sistema operativo.

Entonces vamos a copiar esta ruta.

La copian?

Y otro tema importante en caso de que hayan instalado la versión instalar DJ de cambio, en el caso

de Windows se instala en archivos de programas o program files en la carpeta YABA.

Entonces se van a esa ruta directorio, entran al JDK y copian la ruta, incluyendo el VIM.

Entonces, tanto para Open JDK comprimido como para la versión de Oracle de Java, hay que configurar

la variable ambiente.

Entonces nos vamos a buscar en el sistema operativo.

En el buscador colocan variables variables o variables de entorno o de ambiente.

Hacen un clic.

Se abre esta ventana.

Nos vamos en opciones avanzadas variable entorno.

Perfecto.

Y acá tenemos dos tipos del usuario y del sistema de sistema operativo de forma global.

Lo vamos a configurar solamente para el usuario, pero también lo pueden hacer acá.

No hay ningún problema.

Nos vamos a Pat.

Doble clic o editar.

Y con doble clic o nuevo pegamos la ruta, incluyendo el pin que contiene los ejecutables.

Bien, y eso sería todo.

Ahora, otro detalle importante.

Puede que tengan instalado una versión del JDK o del JRE que sea más antigua y puede que esté configurado

en el PATH.

Entonces lo que tienen que hacer es eliminar cualquier versión de Java que tengan, ya sea J.D, Cajo,

Tarré o se dice por ahí Oracle.

Ya Backpack o Yaba los seleccionan y eliminan.

Dejan solamente la nueva instalación del JDK el 14.

Nada más.

Una sola.

Aceptar y también revisan, por si acaso en variable el sistema, se van a paz y también revisan si

tienen alguna otra instalación del JDK o J r, por ejemplo la 1 8, la 1 7 1 6.

Alguna más antigua que diga, por ejemplo, alguna ruta con Oracle, con Java conlleva path o JRE,

la seleccionan y la eliminan y listo.

Siempre una porque si no, si tenemos la 14 y la 1 8, por supuesto que vamos a tener conflicto.

Entonces una sola.

Lo siguiente es configurar la variable de entorno ya bajón también en cualquiera de los dos en sistema

o en el usuario nuevo en mayúscula.

Ya bajó un todo mayúscula separado con que un bajo es una constante en YABA guión bajo jom todo mayúscula.

Pegamos la ruta pero sin Elvin, quitamos el fin y quitamos el latch o diagonal.

Dejamos solamente la ruta base JDK 14.

La base aceptamos.

Hoy la tenemos.

Ya bajó.

Perfecto.

Aceptamos, aceptamos y vamos al terminal a probar, por ejemplo Empower Schell o en CMD o en el terminal

de sistema operativo correspondiente en Linux Making Touch.

Ejecuta el comando Yaba menos versión.

Puedes ser menos versión o menos menos versión.

Ya tenemos la 14.

Si aparece la última versión, la 14 es porque quedó bien configurado en el Paz.

Y también, como decía con Beno, menos versión también es lo mismo.

También podemos probar ya va a compilar el compilador, ya va C, ya va C ya con Pilcher menos versión

enter y también la 14A.

Veamos ahora cómo configurar YABA en Linux y Mackintosh.

Esta parte es opcional solamente para usuarios de Linux y Mackintosh.

Explicar cómo se configura la variable path y ya bajó bien una vez que tengan instalado el JDK.

En el caso de Linux también es muy simple se van al archivo profile o environment, que son los archivos

globales para configurar variar el ambiente o solamente para el usuario batch.

RC Entonces, por ejemplo, ya sea en profile o environment o en batch RC con algún editor, por ejemplo

con PY o con Pimm, agregan export de abajó y la ruta todo en mayúscula con guión bajo.

Igual la ruta luego es por Path y configuramos la variable del JDK en paz.

Pero ya tenemos la ruta base ya bajó sino peso y ajó variable ambiente la estamos reutilizando.

Le agregamos le concatenados.

El pin es el larch bin 2 punto si no peso path y con esto el 2.5 peso path.

Agregamos o anexados toda la configuración que teníamos antes en el path, es decir, todas las demás

aplicaciones y rutas que teníamos configurada en path.

Perfecto.

Guardamos, cerramos y ejecutamos en el terminal Source y el nombre del archivo su ubicación y revisamos

con eco.

En el terminal Eco Path consigno peso variable.

El ambiente eco ya bajó con si no peso también la hora, el ambiente y debería mostrar la ruta y su

contenido.

Para el caso Mackintosh es muy similar.

Se utiliza el profile de forma global o batch profile para el usuario, solamente para el usuario y

también con cualquier editor.

Agregamos export ya ajó en mayúscula separÃ con guión bajo igual, sino peso, paréntesis y la ubicación.

Esta es la ubicación genérica o base de Java es makin touch, por ejemplo si lo instalamos con Umbrío,

pero si no coloca en la ruta que corresponda es Port Path igual reutilizando ya oum la variable ambiente

sino peso y le agregamos el bit.

La carpeta bin es el archivo bin 2 punto y anexados path toda la configuración que teníamos ante en

área de paz.

Todas las rutas y aplicaciones que teníamos.

Guardamos ejecutamos en el terminal source el nombre del archivo y luego revisamos con eco pad, con

eco y abajo.

Y para finalizar un tema importante que es solamente para la versión del JDK 8 no incluye el JRE.

Por lo tanto tenemos que instalar el J r el raiting que para ejecutar las aplicaciones hinchaban lo

tenemos que instalar de forma separada del JDK, mientras que en versiones posteriores la once, las

doce hasta la 14, el JDK con el J viene todo junto.

Es decir, el JDK ya incluye el JRE.

No se tiene que estar a la parte.

De hecho no existe el JRE para instalar aparte en la versión 14, solo en la versión 8 y inferiores

incluso eso lo podemos ver en la página.

Si nos vamos a la pagina de Oracle ya va a 14 solamente JDK porque ya incluye JRE, pero si bajamos

a 8 Java, 8 JDK y JRE, ambos se descargan y se instalan de forma independiente.

Pero esto solamente en caso de que tengan 32 bits y utilicen Java 8 y recuerden el JDK es el.

Kit desarrollo todas las librerías y clases para desarrollar y escribir aplicaciones en Java.

El JRE es el RIETI para ejecutar nuestras aplicaciones en Java, en la máquina virtual de Java.

Nada más.

Nos vemos en la siguiente clase.


## Instalación IntelliJ IDEA 04:39

Bien, continuamos con el ÍDE, nuestro entorno de desarrollo integrado para desarrollar, para crear

el código, vamos a utilizar inteligir hoy día uno de los más robustos que hay en el mercado.

Bueno, junto con Eclipse también uno de los dos más utilizados, pero intelige es más utilizado aún.

De Eclipse más o menos.

Se estima que el 60 por ciento de los desarrolladores en Java utilizan este IDE muy flexible y muy ruto,

cosa que vamos a ver en el curso.

Nos vamos a la página Nyet Brains PuntoCom.

Acá tenemos la ruta Jet Brains PuntoCom.

Nos vamos a Tools en IDE.

Acá tenemos intelige hoy día.

Entonces hacemos un click.

Esta es la página principal del IDE para Yaba de Nyet Brains y descargamos.

Nos vamos a Download y tenemos dos versiones la Ultimate, que es como la empresarial para desarrollar

que es de pago, solamente podemos descargar una versión de prueba limitada, pero tenemos la comunity,

que es la que vamos a usar en el curso.

Bueno, la comunity tiene todo lo necesario y lo suficiente para el curso.

Acá tiene las ventajas, lo que incluye y lo que no se incluye en el Open Source, en la versión comunity

versus la comercial.

Pero todo lo demás, es decir, lo que no se incluya en el IDE, lo puedo manejar con otras herramientas

open source, por supuesto, o con playing.

En fin, hay alternativas, pero elide la base que se incluye en la versión de Comunida con mi Unity

es más que suficiente para programar y trabajar en Java.

Bien, entonces nos vamos a descargar acá.

También pueden seleccionar el sistema operativo, por ejemplo, se van a Mackintosh o a Linux y también,

pero por defecto muestra el sistema operativo que detecta de forma automática.

Pueden descargar la versión ejecutable, instalarle de puntuó exe o en zip que es portable.

Vamos a descargar Download Puppets.

Perfecto.

Acá pide un registro.

Pero bueno, no necesario registrar el mail.

Simplemente hacen un clic en Descargar y de forma automática se comienza a descargar.

También me pueden demorar un rato de que son cerca de 600 mega, así que puede morar un rato según la

conexión y una vez que haya finalizado la carga, continuamos con la instalación.

Pegamos la descarga de download, la pegamos en nuestro directorio del curso curso YABA con doble clic.

Instalamos un Wistar bastante simple.

Colocamos siguiente la ruta por defecto pueden escoger la que quieran siguiente.

Acá seleccionamos que nos cree un atajo, ya sea en 64 o 32.

Bueno, voy a colocar 64 y también opciones lo pueden marcar, por ejemplo, que de forma automática

asocie este ensanchaba de Groovy de Kotlin para Android.

Enfín, siguiente instalas.

Esperamos un rato.

Bueno, básicamente por defecto, toda la configuración es por defecto, que viene en el IDE.

Bien, y al final da la opción para ejecutar, para correr, el IDE intelige la idea, lo seleccionamos

y finalizar acá nos pregunta si queremos compartir datos, colocar que sí o que no puede poner, que

no importar configuraciones de algún directorio o no importar por defecto.

En caso de que hayamos tenido instalado otra versión, ponemos ok, bien y al principio nos pregunta

qué tema o qué diseño queremos utilizar.

Por ejemplo alguno oscuro darks hola o light.

Bueno, light es como el diseño claro y por defecto que viene en el IDE, muy similar al que trae Eclipse

por defecto.

Bueno, para el curso voy a usar el oscuro, más que nada porque un poco más cómodo para la vista,

un poco más agradable, pero al final es un tema de gusto.

Pueden utilizar cualquiera todos siguiente acá pregunta sobre los plugins para customizar.

Dejamos todo por defecto, dejamos habilitado lo que viene y lo demás todo por defecto.

No tocamos nada.

Siguiente Instalar algunas herramientas por ejemplo para soporte a lenguaje Scala y otra cosa también

vamos a omitir.

Nos vamos a instalar nada más.

Solamente nuestro IDE y comenzar.

Acá tenemos nuestra ventana principal por defecto, que nos permite crear un proyecto, abrir un proyecto,

obtener desde versión de control, por ejemplo con IT, actualizar playing y configuraciones.

Pero bien, vamos a quedar hasta acá porque la siguiente clase vamos a comenzar con el curso, vamos

a comenzar con crear un proyecto.

Acá nos vemos en la siguiente clase.
