# 2. OpenAPI Schema 8 clases • 44 min

* Introduction 01:55
* What is an API? 07:05
* HTTP Protocol 05:08
* HTTP Request Methods 06:11
* Why use OpenAPI? 07:06
* Pet Clinic on Swagger Editor 06:09
* OpenAPI 2.0 vs 3.0 03:12
* YAML Crash Course 07:28
* OpenAPI Specification Quiz 10 preguntas

## Introduction 01:55

Okay, hopefully, the housekeeping section of the course at the beginning that wasn't too painful to get through. 

In this section of the course, we are gonna start taking a look at OpenAPI. We need to go through and just define some very important terminology like what is an API and we are gonna step back and take a look at HTTP and RESTful APIs, in general at a very high level. So, I get a lot of different skill levels going through the course. Some of this might be redundant. If you are already a rockstar on doing RESTful APIs, you may wanna skip some of the videos in this section of the course. 

There's other background information on OpenAPI, how the specification actually evolve and came to be. We're just some kind of laying down some ground work about what OpenAPI is, where its use, how to use it, the technologies envolved, obviously HTTP, RESTful type services. All the type of stuff that is gonna be into the subject matter that we are gonna be dealing with OpenAPI. 

In the next section of the course, we are gonna start defining services with OpenAPI specification. Actually start writing some yaml code. If you don't know what yaml stands for, don't worry, we'll cover that in this section. We will start documenting that API using the OpenAPI specification. 

Another very important feature in the following on section is gonna be OpenAPI Schema. So, this is how we define that datatypes in our API. And then, after that, we are gonna start getting into using reusable components. Really cool capability of OpenAPI. But first, we are gonna jump in and just start looking at what is an API, some of the technologies that we are gonna be dealing with so that we have common language around using the OpenAPI specification and technologies that go into defining an API. So, set back and enjoy this section of the course.

<hr>

![image](https://user-images.githubusercontent.com/23094588/197333010-d06c7273-dbdd-45ec-be5f-d0ba661bf883.png)

La sección introductoría del curso al principio no fue demasiado dolorosa para pasar.

![image](https://user-images.githubusercontent.com/23094588/197333038-fa91aa64-3add-4b87-9935-88a8c0973cee.png)

En esta sección del curso, vamos a empezar a echar un vistazo a OpenAPI. Necesitamos analizar y simplemente definir una terminología muy importante como qué es una **API** y vamos a dar un paso atrás y echar un vistazo a las **API HTTP** y **RESTful**, en general a un nivel muy alto. Por lo tanto, obtendrá muchos niveles de habilidad diferentes durante el curso. Algo de esto podría ser redundante. Si ya es un rockstar en hacer API RESTful, es posible que desee omitir algunos de los videos en esta sección del curso.

Hay otra información de fondo sobre OpenAPI, cómo evolucionó realmente la especificación y cómo llegó a ser. Solo estamos estableciendo un trabajo preliminar sobre qué es OpenAPI, dónde se usa, cómo usarlo, las tecnologías involucradas, obviamente **HTTP**, servicios de tipo **RESTful**. Todo el tipo de cosas que van a estar en el tema que vamos a tratar con OpenAPI.

En la siguiente sección del curso, comenzaremos a definir servicios con la **especificación OpenAPI**. De hecho, comience a escribir **código yaml**. Si no sabe qué significa **yaml**, no se preocupe, lo cubriremos en esta sección. Comenzaremos a documentar esa API utilizando la especificación OpenAPI.

Otra característica muy importante en la siguiente sección será **OpenAPI Schema**. Entonces, así es como definimos esos tipos de datos en nuestra API. Y luego, después de eso, vamos a empezar a utilizar componentes reutilizables. Capacidad realmente genial de OpenAPI. Pero primero, vamos a saltar y comenzar a ver qué es una API, algunas de las tecnologías con las que vamos a tratar para que tengamos un lenguaje común sobre el uso de la especificación OpenAPI y las tecnologías que se utilizan para definir una API. 

Entonces, relájese y disfrute de esta sección del curso.

## What is an API? 07:05

In this video we're gonna talk about what is an API. So an API stands for an application programming interface. This is actually a very broad term so you see it applied to a number of different things. 

The exact definition is very hard to pin down but API itself applications so we're talking about a computer application. This could be a website. It could be a mobile application. It could be a computer programmer running on your desktop or some type of server, so some type of computer program. And then programming, this is gonna be instructions to complete a task. And then interface is where the two systems meet and interact. 

So basically, an API is method for two computer applications to speak to each other so have some type of conversation invoke an action something like that. 

So that's a key takeaway. It's what we wanna say an API is. Now, APIs themselves come in a number of different flavors. For example, if you click on a link in an email message this is a type of API. It tells your device to open up the web browser and go to this website. So, this is gonna be done by an API. And then some are very technology specific. If you have an iPhone or some type of Android phone, a lot of times one application could open up another application and this can be done at a low level that APIs that are very specific to that operating system of the device. 

These are considered closed APIs. And then other types of API's adopt broadly accepted standards and these are considered what's called Open API's. For the Programmable Web APIs allow the internet to function as we know it. So if you think about searching on Google, what's gonna happen there is your web browser when you type into that search box and click Submit, your web browsers underneath the covers is doing HTTP POST to one of Google servers that's gonna have a field in it with what you're searching on. So this is the language that Google can understand so they hear that request and then they respond back to your browser with a HTML document with contents of your search. So this is how that communication happens. 

So we're using HTTP to talk. We are using the post action and then your browser is getting an HTML document back which is what you see on the screen. So this is how that API works. In this course, we are gonna be focused on APIs that are gonna be used in web developments. These APIs follow open standards and are widely used. Now these types APIs they are often referred to as web services. 

There's two primary types of web services: SOAP and REST or RESTful. We are gonna be focusing on RESTful Web Services. 

The SOAP is a much older standard. You still see it out there quite a bit especially in the insurance industry. It seems like in finance. But most of the modern web, like anything. If you're on Facebook, you're using RESTful Web Services to Facebook servers through your browser or if you're shopping on Amazon I guarantee you're using a bunch of RESTful web services. So these by far are the most popular currently right now with technology. 

RESTful web services have become very popular because of their simplicity and versatility. They are right now the de facto standard for web services. REST stands for Representable State Transfer. The representation is typically gonna be JSON. Still see a lot of XML out there too. The state transfers are gonna be doing by HTTP. This whole concept was established by a guy named Rory Fielding in this year 2000 doctoral dissertation. 

So within REST terminology, we are using HTTP, we're using verbs for GET, POST and DELETE. These are messages that were gonna be working with the server on. So messages are gonna be in JSON or XML typically. 

A URI, this is very important. This is a Uniform Resource Identifier. It's a unique string identifying a resource. And then, URL is Uniform Resource Locator. 

So a URL is just a URI with network information. So, www.example.com that would be that URI and then we add in the HTTP, that is going to be the network how we talk to that resource. Now some important things, we have idempotence. This is an e word but it's Idempotence. This means that this property can be applied multiple times and not change the result. So for example when we refresh a web page typically with a GET operation, we are not gonna be changing anything on the server. 

In theory at least even though that's not always the case with all the marketing and things that are watching your browser. But the GET operation is considered to be idempotent. Another thing about REST services, that it is stateless. So the server is not gonna maintaining any type of state for you. That is gonna be a stateless thing so we're not maintaining state on either side. And then HATEOS or HATEOS some people say Hypermedia as the engine of application state. So a REST client should be able to use server provided links to dynamically discover all available resources that it needs access to proceeds the server responds with text secludes hyperlinks to other actions that are currently available. So this is kind of the best of a breed of REST services. You don't see this always implemented. So a lot of services do not implement this but some leading-edge absolutely do implement this and you can do a lot of neat stuff with this. 

Now let's look at some of the verbs. The HTTP - GET, this is gonna be used to read data from a resource. This is read-only and again this is idempotent. It is safe. It does not change the state of the resource. A PUT, this is gonna be used to insert if not found or update if found. So again this is gonna be idempotent so if you do them put multiple times it's not gonna change the result. It's like saving a file multiple times. This is not a safe operation because it does change state of the resource. 

Now in HTTP - POST, this is going to be used to create a new object. This is non-idempotent because multiple posts are expected to create multiple objects. Again not a safe operation either because it does change the state of the resource on the server. So this is the only non-idempotent and non safe HTTP verb that we have to deal with. And then finally the last HTTP action we have to look at is HTTP - Delete. This is again gonna be idempotent so it's gonna have the same effect and behavior and this is also not a safe aberration because it does change the state of the resource.

<hr>
<img width="1013" alt="image" src="https://user-images.githubusercontent.com/23094588/197383112-a0f933f9-2189-4aff-a58e-c53bcc7fbc17.png">

En este video vamos a hablar sobre lo que es una API. 

<img width="888" alt="image" src="https://user-images.githubusercontent.com/23094588/197383135-7c85eb9d-32a7-4da1-82f8-9a21f3145400.png">

Entonces, una **API** significa ***Application Programming Interface - Interfaz de Programación de Aplicaciones***. En realidad, este es un término muy amplio, por lo que se ve aplicado a varias cosas diferentes.

La definición exacta es muy difícil de precisar, pero ***la API en sí es una aplicación***, por lo que estamos hablando de una aplicación informática. Esto podría ser un sitio web. Podría ser una aplicación móvil. Podría ser un programador de computadoras ejecutándose en su escritorio o algún tipo de servidor, es decir, algún tipo de programa de computadora. 

Y luego ***programación***, serán instrucciones para completar una tarea. 

Y luego la ***interfaz*** es donde los dos sistemas se encuentran e interactúan.

Básicamente, ***una API es un método para que dos aplicaciones informáticas se comuniquen entre sí***, de modo que algún tipo de conversación invoque una acción como esa. Así que esa es una conclusión clave. Es lo que queremos decir que es una API. 

<img width="898" alt="image" src="https://user-images.githubusercontent.com/23094588/197383175-2c9a8fe2-6b82-490d-8ec6-7f63a2888f71.png">

Ahora, las propias API vienen en varios sabores diferentes. Por ejemplo, si hace clic en un enlace en un mensaje de correo electrónico, se trata de un tipo de API. Le dice a su dispositivo que abra el navegador web y vaya a este sitio web. Entonces, esto lo hará una API. 

Y luego, algunos son muy específicos de la tecnología. Si tiene un iPhone o algún tipo de teléfono Android, muchas veces una aplicación puede abrir otra aplicación y esto se puede hacer a un nivel bajo que las API son muy específicas para ese sistema operativo del dispositivo.Estas se consideran API cerradas. Y luego, otros tipos de API adoptan estándares ampliamente aceptados y estos se consideran lo que se denomina API abiertas.

<img width="890" alt="image" src="https://user-images.githubusercontent.com/23094588/197383208-eee1541c-cb6e-4ad5-ab16-14026dcceb73.png">

Para las API web programables permiten que Internet funcione como lo conocemos. Entonces, si piensa en buscar en Google, lo que sucederá allí es su navegador web cuando escribe en ese cuadro de búsqueda y hace clic en Enviar, sus navegadores web debajo de las cubiertas están haciendo **HTTP POST** a uno de los servidores de Google que tendrá un campo en él con lo que estás buscando. Entonces, este es el idioma que Google puede entender para que escuchen esa solicitud y luego respondan a su navegador con un documento **HTML** con el contenido de su búsqueda. Así es como sucede esa comunicación.

Así que estamos usando HTTP para hablar. Estamos utilizando la acción de publicación y luego su navegador obtiene un documento HTML que es lo que ve en la pantalla. Así es como funciona esa API. 

<img width="911" alt="image" src="https://user-images.githubusercontent.com/23094588/197383298-87665363-5676-440b-9441-f00ccd48f9c0.png">

En este curso, nos centraremos en las API que se utilizarán en los desarrollos web. Estas API siguen estándares abiertos y son ampliamente utilizadas. Ahora, estos tipos de API a menudo se denominan ***servicios web***.

Hay dos tipos principales de servicios web: **SOAP** y **REST** o **RESTful**. Nos centraremos en los ***servicios web RESTful***.

El SOAP es un estándar mucho más antiguo. Todavía se ve bastante, especialmente en la industria de seguros. Parece que en las finanzas. Pero la mayor parte de la web moderna, como cualquier cosa. Si está en Facebook, está utilizando los servicios web RESTful para los servidores de Facebook a través de su navegador o si está comprando en Amazon, le garantizo que está utilizando un montón de servicios web RESTful. Por lo tanto, estos son, con mucho, los más populares actualmente en este momento con la tecnología.

<img width="893" alt="image" src="https://user-images.githubusercontent.com/23094588/197383406-4cebc4ab-929a-494f-9204-fca4164bd0ec.png">

Los servicios web RESTful se han vuelto muy populares debido a su simplicidad y versatilidad. Son ahora mismo el estándar de facto para los servicios web. 

**REST** significa ***Representational State Transfer - Transferencia de Estado Representable***. La representación normalmente será **JSON**. Todavía veo mucho XML por ahí también. Las transferencias estatales se van a hacer por **HTTP**. 

Todo este concepto fue establecido por un tipo llamado **Rory Fielding** en su tesis doctoral del año 2000.

<img width="892" alt="image" src="https://user-images.githubusercontent.com/23094588/197383428-ba6e753c-5918-4f00-bbc5-2fdfd05964d5.png">

Entonces, dentro de la ***terminología REST***, estamos usando **HTTP**, estamos usando verbos como **GET**, **PUT**, **POST** y **DELETE**. Estos son mensajes que iban a funcionar con el servidor encendido. Entonces, los mensajes normalmente estarán en **JSON** o **XML**.

Una **URI** es un ***Uniform Resource Identifier - Identificador Uniforme de Recursos**. Es una cadena única que identifica un recurso. 

Y luego, **URL** es ***Uniform Resource Locator - Localizador Uniforme de Recursos***. Entonces, una URL es solo un URI con información de red. Entonces, www.example.com sería ese URI y luego agregamos el HTTP, esa será la red con la que hablaremos con ese recurso. 

<img width="906" alt="image" src="https://user-images.githubusercontent.com/23094588/197383443-db214219-cb68-4bb2-829c-9183b1ed6e32.png">

Ahora algunas cosas importantes, tenemos **Idempotencia**. Esta es una eword, pero ¿qué es idempotencia?, **significa que esta propiedad se puede aplicar varias veces y no cambiar el resultado**. Entonces, por ejemplo, cuando actualizamos una página web normalmente con una operación **GET**, no cambiaremos nada en el servidor. Al menos en teoría, aunque ese no siempre es el caso con todo el marketing y las cosas que están vigilando su navegador. Pero la operación **GET** se considera idempotente. 

<img width="892" alt="image" src="https://user-images.githubusercontent.com/23094588/197383471-b57a7374-ded8-441c-9656-213dbaebec7d.png">

Otra cosa sobre ***los servicios REST es que son stateless, no tiene estado***. Entonces, el servidor no mantendrá ningún tipo de estado para usted. Eso va a ser algo sin estado, por lo que no mantendremos el estado en ninguno de los lados. 

Y luego **HATEOS** o **HATEOS**, ***Hypermedia as the Engine of Application State - Hipermedia como Motor del Estado de la Aplicación***. Por lo tanto, un cliente REST debería poder usar los enlaces proporcionados por el servidor para descubrir dinámicamente todos los recursos disponibles a los que necesita acceder. El servidor responde con texto, excluye los hipervínculos a otras acciones que están actualmente disponibles. Así que este es el mejor de una variedad de servicios REST. No ves esto siempre implementado. Por lo tanto, muchos servicios no implementan esto, pero algunos de vanguardia sí lo implementan y puede hacer muchas cosas interesantes con esto.

Ahora veamos algunos de los verbos. 

<img width="897" alt="image" src="https://user-images.githubusercontent.com/23094588/197383502-8bf69162-8089-46e8-a801-6d3a3e831a0b.png">

**HTTP - GET**, se usará para leer datos de un recurso. Esto es de solo lectura y nuevamente esto es idempotente. Es seguro. No cambia el estado del recurso. 

<img width="892" alt="image" src="https://user-images.githubusercontent.com/23094588/197383521-474b6993-b599-4509-97d5-090fd4169586.png">

**HTTP - PUT**, esto se usará para insertar si no se encuentra o actualizar si se encuentra. Entonces, nuevamente, esto será idempotente, por lo que si los coloca varias veces, no cambiará el resultado. Es como guardar un archivo varias veces. Esta no es una operación segura porque cambia el estado del recurso.

<img width="905" alt="image" src="https://user-images.githubusercontent.com/23094588/197383539-68423d31-6878-424f-9700-eb7b37a6ead9.png">

**HTTP - POST**, esto se usará para crear un nuevo objeto. Esto ***no es idempotente*** porque se espera que múltiples publicaciones creen múltiples objetos. Nuevamente, tampoco es una operación segura porque cambia el estado del recurso en el servidor. Así que ***este es el único verbo HTTP no idempotente y no seguro con el que tenemos que lidiar***. 

<img width="891" alt="image" src="https://user-images.githubusercontent.com/23094588/197383569-c12f514a-81f5-4f18-afa0-4d04cf1cdf0f.png">

Y finalmente, la última acción HTTP que tenemos que ver es **HTTP - Delete**. Esto nuevamente será idempotente, por lo que tendrá el mismo efecto y comportamiento y tampoco es una operación segura porque cambia el estado del recurso.


## HTTP Protocol 05:08

In this video, we're gonna be taking a closer look at the HTTP protocol. 

Now one caveat here, if you're comfortable with HTTP already or some background that we're gonna be using about how the API is are formed, go ahead and skip over this video if you're completely comfortable with HTTP. But if not, please continue on. 

I'm gonna get into some details about HTTP and its history and how it is used. So a little history on HTTP development. It was originally started by Tim Berners-Lee of CERN back in 1989. 

HTTP/0.9 is the original proposal that he put out and originally started off as a Telnet friendly protocol. You can see here this is a Telnet command. We don't see Telnet use that much anymore.

When I first started off in computers which was a bit ago, we saw Telnet use quite a bit actually. You can actually Telnet into port 80 at a server and issue HTTP commands and get requests and or do requests and responses. So it's actually kind of cool, so totally legitimate to this. 

If you find a Telnet client, you can actually do this to yourself and issue these commands manually because underneath the covers that's effectively what your web browser is gonna be doing. It was using this protocol. 

So HTTP/1.0 from 1991 to 1995. During this time frame the specifications really grew rapidly. There's a lot of interest in it and a lot of evolving. New software in this timeframe came out known as the web browser. 

So a very interesting time in history as far as technology goes. The standards for HTTP were developed by IETF - Internet Engineering Task Force and also W3C - World Wide Web Consortium.

So these are the two bodies that really helped develop the standards that we still use today. So here in history this is HTTP/1.0. Again, we're using Telnet as an example here, going out connecting to a website, issuing a request there. 

So this is a request and then a response that is being received there. Again, this is using Telnet. This is the exact same thing that things like web browsers are doing underneath the covers that we don't see every day. Now in 1997, that is when HTTP/1 was released or 1.1 I should say and this solved a lot of ambiguities from earlier versions so it added support for keep alive connections, chunked encoding transfers, byte-range request, and request pipelining so this is a very critical release. And then again, we also had another release of this in 1999 and this release was actually still in use today. 

So, there's been some evolution to this so we had in 1999 release and then RFC 7230 in 2014 and all this technology is still in use today and it's used by modern web browsers and components. So in 1.1 we added in a character encoding ,character set and cookies. So we can see here this is an example of where we are doing encoding and getting a cookie back down at the bottom of the screen. And again here is a example of encoding of the actual response and just snippets of the response. 

So you can see there this is actually what's going across the wire in the HTTP protocol. Now in 2015, HTTP/2.0 came out. This is gonna be supported by most servers and browsers by the end of 2015. As of 2017, only 13% of the top 10 million sites supported HTTP 2.0. This does have a high degree of compatibility with HTTP 1.1 and the primary features of this is this was more on transport performance. It improves page load speed by lower latency, higher throughput. 

The differences between the two for us as developers and developing APIs using this protocol are largely transparent. 

So the biggest takeaways for that when we jump to 2.0 the usage is gonna be the same for us so we're not changing anything how we're doing. It's at a large degree of compatibility there, but it's more of a lower a wire. So, you get a lot more performance out of it through lower latency and higher throughput. 

So that's main takeaway. We are seeing more and more of this being adopted with the HTTP 2.0 capabilities. But primary takeaway for you going through this course, functionally in designing APIs using the HTTP protocol, there's really no difference. It's a completely transparent to everything that we're gonna be talking about in the course. 

So, whether we're on 1.x or 2.0 completely does not matter for this. But I wanted to address it here in the course to specify in case you hear about it, if there's a functional changes for us to worry about there, there are not.

<hr>

<img width="1134" alt="image" src="https://user-images.githubusercontent.com/23094588/197403951-5c84887d-c549-4b07-9555-e3e91cc5fe18.png">

En este video, veremos más de cerca el **protocolo HTTP**. 

Ahora una advertencia aquí, si ya se siente cómodo con **HTTP** o algún background que vamos a usar sobre cómo se forma la **API**, continúe y salte este video si te sientes completamente cómodo con **HTTP**. Pero si no, por favor continúa viendolo. 

<img width="1002" alt="image" src="https://user-images.githubusercontent.com/23094588/197404075-032fe8a3-1435-4440-8941-74a7fb8645d2.png">

Voy a entrar en algunos detalles sobre **HTTP** y su historia y como se usa entonces, un poco de historia sobre el desarrollo de **HTTP**.

Originalmente se inició por ***Tim Berners-Lee*** del CERN en 1989. 

HTTP/0.9 es la propuesta original que apagó y originalmente comenzó como un protocolo compatible con Telnet. 

<img width="997" alt="image" src="https://user-images.githubusercontent.com/23094588/197404192-e5245e03-975d-404e-9cc8-c1a15d8620c3.png">

Puedes ver aquí un comando de Telnet. Ya no vemos tanto uso de Telnet. Cuando comencé con las computadoras, hace un poco, vimos el uso de Telnet bastante en realidad. De hecho, puede usar Telnet en el puerto 80 en un servidor y emitir comandos HTTP y obtener solicitudes o hacer solicitudes y respuestas, así que en realidad es genial, tan totalmente legítimo para esto. Si usted encontrar un cliente Telnet, puede hacerlo usted mismo y emitir estos comandos manualmente porque debajo de las cubiertas eso es efectivamente lo que su web navegador va a estar haciendo. 

<img width="1012" alt="image" src="https://user-images.githubusercontent.com/23094588/197404326-6500ac3c-2f2b-4282-ba0c-60693d8d311a.png">

Estaba usando este protocolo. **HTTP/1.0** desde 1991 hasta 1995. Durante este período de tiempo, las especificaciones realmente crecieron  rápidamente.

Hay mucho interés en él y mucha evolución. Nuevo software en este marco de tiempo salió conocido como el navegador web. Así que un momento muy interesante en historia en lo que respecta a la tecnología. 

Los estándares para HTTP fueron desarrollados por **IETF - Grupo de Trabajo de Ingeniería de Internet** y también **W3C - Consorcio World Wide Web**.

Estos son los dos organismos que realmente ayudaron a desarrollar los estándares que todavía uso hoy. Así que aquí en la historia esto es HTTP/1.0. 

<img width="1026" alt="image" src="https://user-images.githubusercontent.com/23094588/197404449-47491b1f-88c6-43ea-b1da-1bc1984057ba.png">

Nuevamente, estamos usando Telnet como un ejemplo aquí, salir conectándose a un sitio web, emitiendo una solicitud allí. Así que esto es una solicitud y luego una respuesta que se está recibiendo allí. De nuevo, esto es usar Telnet. Esto es exactamente lo mismo que cosas como los navegadores web están haciendo debajo de las sábanas que no vemos todos los días. 

<img width="1020" alt="image" src="https://user-images.githubusercontent.com/23094588/197404518-f4070152-7916-407b-9a7b-85d935be13ab.png">

Ahora en 1997, eso es cuando se lanzó **HTTP/1 o 1.1** debería decir y esto resolvió muchas ambigüedades de versiones anteriores, por lo que agregó soporte para mantener conexiones vivas, transferencias de codificación fragmentadas, solicitud de rango de bytes y canalización de solicitud para que esto es una versión muy crítica. 

<img width="1009" alt="image" src="https://user-images.githubusercontent.com/23094588/197404650-2cc89244-d8a9-471e-b1df-8c97da2a34e4.png">

Y, de nuevo, también tuvimos otro lanzamiento de esto en 1999 y esta versión todavía estaba en uso hoy. 

Entonces, hay ha habido alguna evolución en esto, así que tuvimos el lanzamiento de 1999 y luego el RFC 7230 en 2014 y toda esta tecnología todavía está en uso hoy en día y es utilizada por la web moderna navegadores y componentes. 

<img width="1004" alt="image" src="https://user-images.githubusercontent.com/23094588/197404730-53b52e3c-3460-4e04-8498-a61975e22a4b.png">

Así que en 1.1 agregamos encoding, charset y cookies. Así que podemos ver aquí que este es un ejemplo de lo que estamos haciendo codificación y obtener una cookie de nuevo en la parte inferior de la pantalla. 

<img width="1009" alt="image" src="https://user-images.githubusercontent.com/23094588/197404853-0cb318b8-3634-4aba-9e72-2d17402af05e.png">

Y otra vez aquí hay un ejemplo de codificación de la respuesta real y solo fragmentos de la respuesta.  Entonces pueden ver que esto es realmente lo que está pasando a través del cable en el protocolo HTTP. 

<img width="1008" alt="image" src="https://user-images.githubusercontent.com/23094588/197404917-0f2c7514-94fe-4dfa-a39a-ced974df96e9.png">

Ahora, en 2015, salió HTTP/2.0. esto va a ser compatibles con la mayoría de los servidores y navegadores a fines de 2015. A partir de 2017, solo el 13 % de los 10 millones de sitios principales compatibles con HTTP 2.0. 

<img width="1021" alt="image" src="https://user-images.githubusercontent.com/23094588/197405028-933203d6-b0e4-43b2-97fd-9047b6a1b4bc.png">

Esto tiene un alto grado de compatibilidad con HTTP 1.1 y las características principales de esto es que esto fue más sobre el rendimiento del transporte. Mejora la velocidad de carga de la página en menor latencia, mayor rendimiento. Las diferencias entre los dos para nosotros como los desarrolladores y las API en desarrollo que utilizan este protocolo son en gran medida transparentes. 

Entonces, las principales conclusiones de que cuando saltemos a 2.0, el uso será el mismo para nosotros para que no cambiemos nada de lo que estamos haciendo, es en gran medida de compatibilidad allí, pero es más un nivel más bajo un alambre. Por lo tanto, obtiene mucho más rendimiento a través de una latencia más baja y mayor rendimiento. Así que esa es la comida para llevar principal. Estamos viendo más y más de que esto se adopte con las capacidades de HTTP 2.0. Pero la comida para llevar principal para está pasando por este curso, funcionalmente en el diseño de API usando el protocolo HTTP, realmente no hay diferencia. es completamente transparente a todo lo que vamos a estar hablando en el curso. 

Entonces, si estamos en 1.x o 2.0 completamente no importa para esto, pero quería abordarlo aquí en el curso para especificar en caso de que se entere, si hay cambios funcionales de los que debemos preocuparnos, no los hay.

##  HTTP Request Methods 06:11

And this video, we're going to take a closer look at HDTV request methods, and again, if you are comfortable with this content, go ahead and skip over this video.

This is for some background, because these methods become very important to developing API calls on using HTP.

So a lot of things that were going to be talking about dovetail exactly into this. But again, if you are comfortable with this content, go and skip over it.

Otherwise, I'm going to go for it and give you some additional information about how HTTP is actually used.

So request methods.

We also call these verbs and these are used to indicate a desired action to be performed. So a Get is a request for a resource.

So we're going to issue a command against the server for an HTML file or a JavaScript file, some type of image.

It is used like when you go to visit a website, a command is being used to visit that website.

Now there is a head command.

Don't see that use too often, but it's similar to a git.

But it only ask for meta information about that resource.

But you do not get the actual body back.

Now, some other request methods that we see post.

This is used to post data to the service server.

Typical use case is to post data to the server like a checkout form.

So if you're checking out or even like a Google search form, you are going to post to that server.

Noé Put is a request for the enclosed entity to be stored at the supplied URAI.

So if that only exists as as expected to be updated.

In contrast, a post is a create request.

Aput is going to be a create or update request of these very important as to how these firms work.

A delete is to tell the server to delete the specified resource now traces kind of use for troubleshooting,

don't see it used too often.

And this is just to echo the request and then also options.

This is going to return the method supported by the server for the specified neural.

Again, you see that one used too much either.

Connect that tells the server to convert the request into a transparent TCP IP tunnel, typically for

https through an unencrypted proxy.

So these are some low level stuff that you don't use to often.

Patch is an important one, and this is going to apply partial modifications to the specified resource.

And you do see that used to some, but not terribly common either.

Now, there's two types of methods that we talk about are safe methods, these are considered safe because

they only fetch information and do not cause changes on the server.

The safe methods are considered.

Kit had options and trace.

Item Potente, that's kind of a funny word, is item Partons, this is the action.

If there's repetitions of that action, it's not going to have any additional effect.

So put and delete our item.

Potent methods, safe methods are also considered item potent.

Do you want to specify, though, being truly item potent is not enforced by the protocol.

It is expected to be enforced by the developers behind utilizing these methods.

Now, nine item methods, posters, not item put, multiple posts are likely to create multiple resources.

So if you can think of.

I'm sure we've ever seen.

Please click only wants to avoid duplicating things.

We do see people do that on websites at times.

So important thing to remember.

Now, here's a nice chart, you will have an access to a PDF of these slides and of course, resources

so you can download it and keep it up.

So this is a good chart to see all this and interact as far as whether they're safe, i.e. impotent

or cashable no status, because this is very important.

And this is going to dovetail into documenting how our API works because we are going to be relying

on status codes as to how the server responded.

They should be status codes as coming back to us after we've issued a request to the Service 100 series.

Our Informational in Nature 200 series means it was successful.

300 series are redirection.

So the server is going to redirect us to a different URL 400 series, our client site error.

So we've done something wrong on our site.

500 series are indicating that something unexpected happened on the server side.

So some common status codes that we're going to see quite often, especially in API development, two

hundred an OK.

Everything happened, OK?

We're happy with it to everyone.

We've created a resource or two tool for means that the server understood the request and accepted it.

Sometimes this is done with async processing where the server accepts something and then there's background

processing that must occur and no server is just going to return back, saying it accepted three one.

This is moved permanently.

So this is a 300 series status where the server is saying, yes, I understood your request, but that

resource has now been moved to a different URAI 400 bad request often means that you have some type.

Malformed data for a one means that the resource that you are trying to access and you have not supplied

or do not have the security credentials to access for or for not found something that we've probably

all seen when we're browsing the Internet.

And this means that you've requested a resource from the server and the server was not able to find

it 500.

And this is something that you hopefully never see.

But I'm sure everybody has seen a five hundred internal server error.

This means that there's been an error that happened inside the server, not related to your request,

but something inside the server code caused it not to be able to complete their request and then file

three main means that the services temporarily down and not available.

So all these steps codes do go into how we form APIs and the verbs as well.

So these are all tools that we're going to be utilizing to develop our APIs.

<hr>

<img width="1136" alt="image" src="https://user-images.githubusercontent.com/23094588/197405548-6dc45063-558d-425c-9174-7ab5bc1ece45.png">

Y en este video, vamos a echar un vistazo más de cerca a los **HTTP Request Methods - Métodos de Solicitud HTTP**, y nuevamente, si está cómodo con este contenido, continúe y salte este video.

Esto es para algunos antecedentes, porque estos métodos se vuelven muy importantes para desarrollar llamadas API en utilizando HTP. Entonces, muchas cosas de las que se iba a hablar encajan exactamente en esto. Pero, de nuevo, si se siente cómodo con este contenido, sáltelo. De lo contrario, lo haré y le daré información adicional sobre cómo funciona realmente HTTP.

### Request Methods

<img width="1021" alt="image" src="https://user-images.githubusercontent.com/23094588/197405748-584dd8a5-47ed-4140-939c-e9b4778d60ac.png">

Los **Request Methods**, también los llamamos **verbs** y estos se usan para indicar una acción que deseada realizar.

#### GET

Entonces **`get`** sirve para hacer una solicitud de un recurso. Así que vamos a emitir un comando al servidor para obtener un archivo HTML o un archivo JavaScript, algún tipo de imagen. Se usa cuando vas a visitar un sitio web, se usa un comando para visitar ese sitio web.

#### HEAD

Ahora también existe un comando **`head`**. No veo su uso muy a menudo, pero es similar a **`get`**, pero solo solicita ***metainformación*** sobre ese recurso, pero no recuperas el body back.

<img width="1003" alt="image" src="https://user-images.githubusercontent.com/23094588/197406228-0f77ba29-590e-4ace-a1c8-166a9f504b1e.png">

Ahora, algunos otros  **Request Methods** métodos de peticiones - solicitud que vemos.

#### POST

**`post`** se utiliza para enviar datos al servidor. El caso de uso típico es un publicar un formulario de pago y enviar esos datos al servidor. Entonces, si está revisando o incluso usa el formulario de búsqueda de Google, envía datos al servidor.

#### PUT

**`put`** es una petición/solicitud para que la entidad adjunta se almacene en URI suministrada si que es nueva. Pero, si ya existe se espera que se actualice.

Mientras que **`post`** crea un request, **`put`** crea o actualiza un request.

Un **`put`** será una request/solicitud de creación o actualización y esto es muy importantes en cuanto a cómo funcionan.

<img width="996" alt="image" src="https://user-images.githubusercontent.com/23094588/197406949-3c2bc29b-4ee5-4b17-a167-74865040f39d.png">

#### DELETE

Un **`delete`** sirve para decirle al servidor que elimine el recurso especificado.

#### TRACE

Un **`trace`** (rastrea) el tipo de uso para la resolución de problemas, no veo que se use con demasiada frecuencia.

#### OPTIONS

**`options`** devolverá el método admitido por el servidor para la especificación neural, nuevamente su uso tampoco es demasiado.

<img width="1000" alt="image" src="https://user-images.githubusercontent.com/23094588/197407454-ac12c6d9-919f-40e3-a698-5308d7ce4fca.png">

#### CONNECT

**`connect`** le dice al servidor que convierta la solicitud en un túnel IP TCP transparente, generalmente para HTTPS a través de un proxy no cifrado. Así que estas son algunas cosas de bajo nivel que no usas con frecuencia.

#### PATCH

**`patch`** es importante y aplicará modificaciones parciales al recurso especificado. Y ves que solían hacerlo algunos, pero tampoco muy común.

<img width="1001" alt="image" src="https://user-images.githubusercontent.com/23094588/197407671-af3835d1-1ad0-47f3-99c4-f295c7cae2e1.png">

Ahora, hay dos tipos de métodos de los que hablamos que son **Métodos Seguros**, ***estos se consideran seguros porque solo obtienen información y no provocan cambios en el servidor***.

Se consideran **Métodos Seguros** a **GET**, **HEAD**, **OPTIONS** y **TRACE**.

<img width="1005" alt="image" src="https://user-images.githubusercontent.com/23094588/197407867-bd4dfd7d-5c03-412f-ae07-341eb76c5e22.png">

**Idempotencia**, esa es una palabra divertida, es item Partons, esta es la acción. Si hay repeticiones de esa acción, no tendrá ningún efecto adicional. 

Así que **PUT** y **DELETE*** son **Métodos Idempotentes**. 

Los **Métodos Seguros** **GET**, **HEAD**, **OPTIONS** y **TRACE**. también se consideran **Métodos Idempotentes**. 

Sin embargo, no le especifica al protocolo que el item sea Idempotentes. Se espera que los desarrolladores lo apliquen detrás de la utilización de estos métodos.

<img width="1004" alt="image" src="https://user-images.githubusercontent.com/23094588/197408320-ff75c6bb-758f-4d16-8674-aa98547bc036.png">

**POST** NO es idempotente

Es probable que múltiples **`POST`** creen múltiples recursos. ¿Ha visto alguna vez sitios web que le pidan que haga clic en enviar solo una vez?
Vemos que la gente hace eso en los sitios web a veces, algo importante para recordar.

<img width="1045" alt="image" src="https://user-images.githubusercontent.com/23094588/197408514-a2170998-7cad-44ac-bb93-935943f7ab94.png">

Ahora, aquí hay un buen cuadro, este es un buen gráfico para ver todo esto e interactuar en cuanto a las características de los Métodos, porque esto es muy importante.

<img width="995" alt="image" src="https://user-images.githubusercontent.com/23094588/197408762-691ed3c4-de7b-4c18-86a8-d7a429b3b716.png">

Y esto encajará en la documentación de cómo funciona nuestra API porque vamos a confiar en los códigos de estado en cuanto a cómo respondió el servidor.

Deberían ser **Status Codes - Códigos de Estado** que nos llegarán después de que hayamos enviado una petición.

• Los 100 es de naturaleza informativa
• Los 200 indica una solicitud exitosa
• Los 300 son redirecciones
• Los 400 son errores del cliente. Indican que hemos hecho algo mal el nuestro sitio.
• Los 500 son errores del lado del servidor

<img width="993" alt="image" src="https://user-images.githubusercontent.com/23094588/197409056-59b3202e-619d-49a4-8ccf-177167630a56.png">

Entonces, algunos códigos de estado comunes que veremos con bastante frecuencia, especialmente en el desarrollo de API.

• 200 Okay; 201 Created; 202 Accepted, 204 No Content
• 301 Moved Permanently
• 400 Bad Request; 401 Not Authorized; 404 Not Found
• 500 Internal Server Error; 503 Service Unavailable

200 es un OK, todo pasó, ¿de acuerdo? Estamos contentos con todo el mundo. Hemos creado uno o dos recursos para que el servidor comprenda la solicitud y la acepte. A veces, esto se hace con un procesamiento asincrónico en el que el servidor acepta algo y luego hay antecedentes procesamiento que debe ocurrir y ningún servidor simplemente regresará, diciendo que aceptó.

301 Esto se mueve permanentemente. Entonces, este es un estado de la serie 300 donde el servidor dice, sí, entendí su solicitud, pero eso 
El recurso ahora se ha movido a un URI.


400 Bad Request La solicitud incorrecta a menudo significa que tiene algún tipo, Los datos mal formados para uno significan que el recurso al que está intentando acceder y que no ha suministrado o no tiene las credenciales de seguridad para acceder o no encontró algo que probablemente hemos todo visto cuando estamos navegando por Internet. Y esto significa que solicitó un recurso del servidor y el servidor no pudo encontrar

500 Internal Server Error Y esto es algo que, con suerte, nunca verás. Pero estoy seguro de que todo el mundo ha visto un error de servidor interno de 500. Esto significa que ha ocurrido un error dentro del servidor, no relacionado con su solicitud, pero algo dentro del código del servidor hizo que no pudiera completar su solicitud y luego archivar tres medios principales que los servicios están temporalmente caídos y no están disponibles.

Entonces, todos estos códigos de pasos se relacionan con la forma en que formamos las API y los verbos también.

Estas son todas las herramientas que vamos a utilizar para desarrollar nuestras API.

##  Why use OpenAPI? 07:06
##  Pet Clinic on Swagger Editor 06:09
##  OpenAPI 2.0 vs 3.0 03:12
##  YAML Crash Course 07:28
##  OpenAPI Specification Quiz 10 preguntas
