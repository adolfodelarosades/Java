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

In this video we're gonna take a look at why we actually wanna be using the OpenAPI. 

So first off, OpenAPI ,the standard is to just use it all OpenAPI as one word, no space between Open or API, so it just says I have it there on the first line. This is often short for OpenAPI specification and you do see this often abbreviated as OA3 which stands for OpenAPI version 3. 

Now OpenAPI is also a widely adopted standard for describing APIs. So very important to stress the strong industry support behind OpenAPI. Some of the major backers included Microsoft, Google, and IBM. There's actually a much larger consortium than that but these are the major players. 

OpenAPI is also considered technology as agnostic. This is one things that I really like about it because it goes across multiple disciplines so developers using Java or .net or Ruby virtually any major language all can benefit from using OpenAPI, because it is such an open standard. 

RESTful API, which we've been looking at, they are rather technology agnostic. You can implement them in any language. OpenAPI as well also technology agnostic, meaning that any type of developer using a major programming language can benefit from utilizing OpenAPI. Some important things to understand about OpenAPI. 

The specification is defined in YAML or JSON. I personally prefer YAML because YAML is a little bit lighter and JSON is a little bit more structured. So, JSON is JavaScript Object Notation. We often see that used for payloads. But for anything with specification, I personally prefer YAML. You may prefer JSON and I'm not going to specify one or the other. That is really up to you. 

Now the OpenAPI specification itself is backed by a formal schema. A schema is going to find how the document is laid out. So it's gonna find all the sections, all the properties, and the data type. So it becomes a very structured document. So we get an object model of that. Because it is structured, we can actually read it programmatically, and having this capability to actually read it in programmatically because it is a structured document. This opens it up to a lot of things. So OpenAPI tools, that there's a whole suite of open source, and in some cases closed source Converters, Validators GUI Editors.

You can even stand up Mock Services, SDK Generators, Documentation generators, all driven from this OpenAPI specification. For example if you use Postman for exercising your API calls, you can actually take an OpenAPI specification and bring it into Postman and get full functionality and inside of Postman. That just takes just a few seconds. Another thing that's really nice about OpenAPI is OpenAPI CodeGen. You can generate server-side code for over 20 different languages or client-side code for over 40 different languages. So these are all templates that are going to develop libraries of code based on the OpenAPI specification, so that specification, having all that detail in a structured document allows us to do a number things with it.

Now also why you wanna be using OpenAPI is have a single source of truth. With an OpenAPI specification, that really becomes the definition of what that API is supposed to do. So imagine if you're in a situation where you don't have an open API, what defines that API? What is it actually supposed to do? Is it the source code? Is that what's supposed to do? Does designed document on the corporate wiki, is that what is supposed to do? Is it the Unit tests? Email messages between developers? Or perhaps all the above or none of the above? 

Without a formal specification, when you get into an organization, if the API is perceived to be misbehaving or incorrect, what is this the actual source of truth?

What is that API supposed to do? This is where the OpenAPI specification really is a powerful tool because it defines what that API is supposed to do and you code to it. So you'd actually code to the specification if the source code implements this specification, you can assume that it is correct.

Now one of the hats I worked at, I am personally working at a company called Velo Payments and I am on the integration team so I oversee our public facing API's. We've adopted OpenAPI within our organization to solve a lot of these problems and within Velo Payments, we take microservices, we define them against an OpenAPI specification, so that is our single source of truth. 

Now with that OpenAPI specification in our Unit tests we have tooling that is going to validate every request and response. So, when our unit 
tests are running against our controller code, we are validating that OpenAPI specification so it's built into our testing process and in our software development process of course we're gonna be running these unit tests as we develop our code. And then also in our CI/CD process of continuous integration continuous deployment, those processes also have hooks into doing OpenAPI specification. So in our built-in development process, if we do something that is not according to the OpenAPI specification, our test will fail. 

So, we get notified right away if there's a delta. And then Consumer Driven Contracts, obviously, I am big on the Spring Framework. Spring Framework, within the Spring community, there is a Spring Cloud Contract. This allows Consumer Driven Contracts. This is definitely outside the scope of the course but I want to alert you to have the capability of doing Consumer Driven Contracts and we're defining those inside of OpenAPI extensions. So nice capability there. And then Velo itself, we've published over let's say over eight languages of SDKs using OpenAPI generated codes. 

We're generating source code using OpenAPI CodeGen and then that is driving our SDK development for consumers of our API, our public API and then also our public facing documentation that go out to our website, Developer center. You can see a link to our API documentation. That 
documentation is being developed and generated from our OpenAPI specification. So you can see here how central OpenAPI has become to our development process because we are looking at people consuming our APIs, it could be tens, thousands, or tens of thousands of people that are gonna be utilizing our APIs. We want those well documented and accurate. 

So this tells us that our APIs are doing what the specification does and then through our testing and development process we have a high degree of confidence that the OpenAPI specification does accurately reflect our APIs.

<hr>

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/197411914-6aefede5-8439-408b-bdf1-965d21098ae9.png">

En este video, veremos por qué realmente queremos usar OpenAPI.

<img width="999" alt="image" src="https://user-images.githubusercontent.com/23094588/197411950-2d69031d-38de-48f8-acd7-23f6d03a258a.png">

Entonces, en primer lugar, OpenAPI, el estándar es usar todo OpenAPI como una sola palabra, sin espacio entre Open o API, por lo que solo dice que lo tengo allí en la primera línea. A menudo, esto es la abreviatura de la **especificación OpenAPI** y verá que a menudo se abrevia como **OA3**, que significa **OpenAPI versión 3**.

Ahora OpenAPI también es un estándar ampliamente adoptado para describir las API. Es muy importante destacar el fuerte apoyo de la industria detrás de OpenAPI. Algunos de los principales patrocinadores incluyeron a Microsoft, Google e IBM. En realidad, hay un consorcio mucho más grande que ese, pero estos son los principales actores.

OpenAPI también se considera tecnología como agnóstica. Esta es una de las cosas que realmente me gustan porque abarca múltiples disciplinas, por lo que los desarrolladores que usan Java o .net o Ruby prácticamente cualquier lenguaje principal pueden beneficiarse del uso de OpenAPI, porque es un estándar tan abierto.

**API RESTful**, que hemos estado analizando, son bastante independientes de la tecnología. Puede implementarlos en cualquier lenguaje. **OpenAPI** también es independiente de la tecnología, lo que significa que cualquier tipo de desarrollador que use un lenguaje de programación importante puede beneficiarse de la utilización de **OpenAPI**. 

<img width="997" alt="image" src="https://user-images.githubusercontent.com/23094588/197412075-a04b8f53-b54f-484f-9dde-aad3e4f9563b.png">

Algunas cosas importantes para entender sobre OpenAPI.

La especificación se define en **YAML** o **JSON**. Personalmente, prefiero **YAML** porque **YAML** es un poco más ligero y **JSON** está un poco más estructurado. Entonces, **JSON** es la notación de objetos de **JavaScript**. A menudo vemos que se usa para cargas útiles. Pero para cualquier cosa con especificación, personalmente prefiero **YAML**. Puede que prefieras **JSON** y no voy a especificar uno u otro. Eso realmente depende de ti.

Ahora, la especificación de **OpenAPI** en sí misma está respaldada por un esquema formal. Un esquema va a encontrar cómo se presenta el documento. Así que encontrará todas las secciones, todas las propiedades y el tipo de datos. Entonces se convierte en un documento muy estructurado. Entonces obtenemos un modelo de objeto de eso. Debido a que está estructurado, podemos leerlo programáticamente y tener esta capacidad para leerlo programáticamente porque es un documento estructurado. Esto lo abre a muchas cosas. 

Entonces, las herramientas OpenAPI, que hay un conjunto completo de convertidores de código abierto y, en algunos casos, de código cerrado, editores de GUI de validadores.

Incluso puede implementar servicios simulados, generadores SDK, generadores de documentación, todos impulsados desde esta especificación OpenAPI.

Por ejemplo, si usa Postman para ejercitar sus llamadas API, puede tomar una especificación OpenAPI e incorporarla a Postman y obtener la funcionalidad completa dentro de Postman. Eso solo toma unos segundos. 

Otra cosa muy buena de OpenAPI es OpenAPI CodeGen. Puede generar código del lado del servidor para más de 20 lenguajes diferentes o código del lado del cliente para más de 40 lenguajes diferentes. Estas son todas las plantillas que van a desarrollar bibliotecas de código basadas en la especificación OpenAPI, por lo que esa especificación, tener todos esos detalles en un documento estructurado, nos permite hacer varias cosas con ella.

<img width="991" alt="image" src="https://user-images.githubusercontent.com/23094588/197414285-3c7551c7-7608-4278-95e6-8352238b9866.png">

Ahora también por qué quieres usar OpenAPI es tener una única fuente de verdad. Con una especificación OpenAPI, eso realmente se convierte en la definición de lo que se supone que debe hacer esa API. Así que imagina si estás en una situación en la que no tienes una API abierta, ¿qué define esa API? ¿Qué se supone que debe hacer en realidad? ¿Es el código fuente? ¿Es eso lo que se supone que debe hacer? ¿El documento diseñado en el wiki corporativo es eso lo que se supone que debe hacer? ¿Son las pruebas unitarias? ¿Mensajes de correo electrónico entre desarrolladores? ¿O quizás todo lo anterior o nada de lo anterior?

Sin una especificación formal, cuando ingresa a una organización, si se percibe que la API se está comportando mal o es incorrecta, ¿cuál es esta la fuente real de la verdad?

¿Qué se supone que debe hacer esa API? Aquí es donde la especificación OpenAPI realmente es una herramienta poderosa porque define lo que se supone que debe hacer esa API y usted codifica para ella. Entonces, en realidad codificaría según la especificación si el código fuente implementa esta especificación, puede suponer que es correcto.

<img width="1003" alt="image" src="https://user-images.githubusercontent.com/23094588/197414371-e5956fa3-d07e-4e16-992e-51199c17de4e.png">

Ahora, uno de los sombreros en los que trabajé, estoy trabajando personalmente en una empresa llamada Velo Payments y estoy en el equipo de integración, por lo que superviso nuestras API públicas. Adoptamos **OpenAPI** dentro de nuestra organización para resolver muchos de estos problemas y dentro de Velo Payments, tomamos microservicios, los definimos contra una especificación OpenAPI, por lo que esa es nuestra única fuente de verdad.

Ahora, con esa especificación OpenAPI en nuestras pruebas unitarias, tenemos herramientas que validarán cada solicitud y respuesta. Entonces, cuando nuestra unidad las pruebas se ejecutan en nuestro código de controlador, estamos validando esa especificación OpenAPI para que esté integrada en nuestro proceso de prueba y en nuestro proceso de desarrollo de software, por supuesto, ejecutaremos estas pruebas unitarias a medida que desarrollamos nuestro código. Y luego, también en nuestro proceso de CI/CD de implementación continua de integración continua, esos procesos también tienen ganchos para hacer la especificación OpenAPI. Entonces, en nuestro proceso de desarrollo incorporado, si hacemos algo, Si algo no está de acuerdo con la especificación OpenAPI, nuestra prueba fallará.

Entonces, nos notifican de inmediato si hay un delta. Y luego los Contratos impulsados por el consumidor, obviamente, me gusta Spring Framework. Spring Framework, dentro de la comunidad Spring, existe un Spring Cloud Contract. Esto permite los Contratos Impulsados por el Consumidor. Esto definitivamente está fuera del alcance del curso, pero quiero alertarlo para que tenga la capacidad de realizar contratos impulsados por el consumidor y estamos definiéndolos dentro de las extensiones de OpenAPI. Tan buena capacidad allí. Y luego Velo en sí, hemos publicado, digamos, más de ocho lenguajes de SDK utilizando códigos generados por OpenAPI.

Estamos generando código fuente usando OpenAPI CodeGen y luego eso está impulsando nuestro desarrollo de SDK para los consumidores de nuestra API, nuestra API pública y luego también nuestra documentación pública que sale a nuestro sitio web, Centro de desarrolladores. Puede ver un enlace a nuestra documentación API.

Que la documentación se está desarrollando y generando a partir de nuestra especificación OpenAPI. Así que pueden ver aquí cuán central se ha vuelto OpenAPI para nuestro proceso de desarrollo porque estamos viendo a las personas que consumen nuestras API, podrían ser decenas, miles o decenas de miles de personas que utilizarán nuestras API. Los queremos bien documentados y precisos.

Entonces, esto nos dice que nuestras API están haciendo lo que hace la especificación y luego, a través de nuestro proceso de prueba y desarrollo, tenemos un alto grado de confianza en que la especificación OpenAPI refleja con precisión nuestras API.

##  Pet Clinic on Swagger Editor 06:09

In this video we are gonna get our first look at an OpenAPI specification. 

So up on the screen here, I have Swagger Editor open. So swagger is the precursor to OpenAPI. The first edition of what became OpenAPI was known as Swagger. Ultimately, a company called **SmartBear** bought them or acquired that somehow. I forget exactly how. And then the 2.0 version they renamed it to OpenAPI and now we are on version 3.0 of OpenAPI. 

So the folks that SmartBear have this online tool and on the left-hand side of the screen this is the OpenAPI specification in YAML and then on the right hand side of the screen is Swagger UI.

This is a UI program that is looking at the OpenAPI specification, provide you a functional website of that. So we are gonna be focusing on the left-hand side of the screen. Up here on the screen, this is YAML. This is a formal specification and we are gonna be going through this in a lot more detail. I just want to get our feet wet in this video of what's going on in here.

So I'm gonna highlight lines 2 through 6 and this is an object. So the OpenAPI specification, the different sections are considered objects. So line 2, that is the start of the information object. You can see that the information object has a version property, a title property, a license property. 

So these are all different properties that we have available for that. And don't worry too much right now. We are going to go through each of these objects in a lot more detail. I'm just going through a high-level overview of this. So that is an information object. And here, this is very important. This whole section here on line 10, this is an operation object. So, here on line 10, we are saying for pets. So again, we're looking at the pet store example, classic example of a REST API. On line 10 we are saying a get action against pets is going to give us a list of all pets in the system. I can see here this is an operation object. 

Here, we have a parameter that specifies a query parameter that we can supply. And then down here, you can see this is a response. So when we do a get we are going to get a 200 response, and that's a description. We will see a link in the header and then also we can expect that this content is gonna be provided back. So let me scroll up a little bit here.

I get to the line 56. Again, on line 56, now we are specifying a URL with a ID value that is in the path. We can see here petID, that is a path parameter. And now we can see that the parameter description is saying path. Again we are gonna look at each one of these in a lot more depth. So we can see how this document is structured. These are several operations that we have. And then down here, we can see the components that is making up this. So let's take a look at the Swagger UI that is being generated from this. You can see here this is a get all pets. I can actually extend that out, I believe, by clicking on it and we can see that this information here List all pets. You can see here where it says list all pets that's that summary that's coming from over here. 

That is how this documentation is getting generated. Let's see here. This actually allows you to try it out.

So I'm gonna click on Try it out here. Now I'm gonna say Execute.

And let's see.

I did try it out and you can see down here that we are getting a type error Failed to fetch. So what's happening here it is this shooting this command and unfortunately it looks like this Swagger.io v1/pets is not up right now. So I have tested this in the past, and you can actually invoke the API.

It's actually quite nice. So I do clear if the backend server here, this petstore.swagger.io doesn't seem to be responding, but if it was clicking on this, I would get something back from it. But unfortunately, I am not at this particular point in time. It could just be because their server is going on.

There's some maintenance. But this is a nice feature because what you can do here is you can actually specify more than one server and execute the API. So again, what's happening here, the key takeaway I want you to have is that you have on the left hand side of the screen, the OpenAPI specification and on the right hand side of the screen is Swagger UI that is using that specification. Not only is giving us a really nice look and feel for the website where we can see the various operations that we can utilize, we can actually click on Try it out. And if unfortunately that server is not responding. But if it was, this is all using Javascript and reflection against the API, the API specification that we would be able to utilize it. 

So really nice functionality. Unfortunately it's not working for this example but we will find a example to utilize this coming up in the course. Again, don't be too concerned I just wanted to give you a very high-level overview. On the left-hand side of screen, this is the OpenAPI specification and is showing you an actual OpenAPI for the pet store example. And each one of these operations, the schema objects that we're 
going to go through, we will get into each one in depth and explain things in a lot more detail. So a lot more detail to come. This is just a high-level overview. I wanted to get you an example using Swagger pet store to see what an actual OpenAPI specification looks like, so you can see that on the right hand side. And I will include a link to the OpenAPI specification in the course resources before you go ahead and examine that in more depth.

<hr>

En este video, veremos por primera vez una especificación de OpenAPI.

URL Recursos: https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v3.0/petstore.yaml

URL: https://editor.swagger.io/

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197416506-9058ad5d-6ac5-41a9-8b4e-5a919601cc8c.png">

Nos indica que existe un nuevo editor.

URL: https://editor-next.swagger.io/

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197416547-2af60012-8e90-4b1c-9792-9dfa876add4e.png">

Vamos a basarnos en la siguiente pantalla.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197416506-9058ad5d-6ac5-41a9-8b4e-5a919601cc8c.png">

Entonces, en la pantalla aquí, tengo **Swagger Editor** abierto. Así que **Swagger** es el precursor de **OpenAPI**. La primera edición de lo que se convirtió en **OpenAPI** se conoció como **Swagger**. Finalmente, una empresa llamada **SmartBear** los compró o los adquirió de alguna manera. Olvidé exactamente cómo. Y luego a la versión 2.0 le cambiaron el nombre a **OpenAPI** y ahora estamos en **la versión 3.0 de OpenAPI**.

Entonces, la gente de **SmartBear** tiene esta herramienta en línea y en el lado izquierdo de la pantalla está **la especificación OpenAPI** en **YAML**

<img width="754" alt="image" src="https://user-images.githubusercontent.com/23094588/197416890-2356be84-b601-47ea-831d-d0d286a29350.png">

y luego en el lado derecho de la pantalla está la interfaz de usuario de Swagger.

<img width="766" alt="image" src="https://user-images.githubusercontent.com/23094588/197416935-d780187e-f6fc-4aef-a36b-079c4a6f86c3.png">

Este es un programa de interfaz de usuario UI que está analizando la especificación **OpenAPI**, le proporciona un sitio web funcional. Así que vamos a centrarnos en el lado izquierdo de la pantalla. 

<img width="754" alt="image" src="https://user-images.githubusercontent.com/23094588/197416890-2356be84-b601-47ea-831d-d0d286a29350.png">

Aquí arriba en la pantalla, esto es **YAML**. Esta es una especificación formal y vamos a analizarla con mucho más detalle. Solo quiero mojarnos los pies en este video de lo que está pasando aquí.

<img width="739" alt="image" src="https://user-images.githubusercontent.com/23094588/197417222-959e2df5-6517-459a-80ee-4f55cac45dfc.png">

Tenemos la sección **`info`** este es un objeto. En la especificación OpenAPI, las diferentes secciones se consideran objetos. Así que en la línea 2 comienzo del objeto **`info`**. Puede ver que el objeto de información tiene una propiedad de versión, una propiedad de título, una propiedad de licencia, etc. Estas son todas las diferentes propiedades que tenemos disponibles para eso. Y no te preocupes demasiado ahora. Vamos a revisar cada uno de estos objetos con mucho más detalle. Solo estoy pasando por una descripción general de alto nivel de esto. 

<img width="1511" alt="image" src="https://user-images.githubusercontent.com/23094588/197417458-b88ce89d-706e-4c64-8ed3-5d8806105982.png">

Toda esta sección en la imagen es muy importante, este es un objeto de operación. En la línea 41, tenemos **`\pet`** para mascotas. Entonces, nuevamente, estamos viendo el ejemplo de la tienda de mascotas, un ejemplo clásico de una API REST. En la línea 41 decimos que una acción de obtener mascotas nos dará una lista de todas las mascotas en el sistema. Puedo ver aquí que este es un objeto de operación.

Aquí tenemos un parámetro que especifica un parámetro de consulta que podemos proporcionar. Y luego aquí abajo, pueden ver que esto es una respuesta. Entonces, cuando hagamos un get, obtendremos una respuesta 200, y esa es una descripción. Veremos un enlace en el encabezado y luego también podemos esperar que este contenido se devuelva. Así que permítanme desplazarme un poco hacia arriba aquí.

Llego a la línea 56. Nuevamente, en la línea 56, ahora estamos especificando una URL con un valor de ID que está en la ruta. Podemos ver aquí petID, que es un parámetro de ruta. Y ahora podemos ver que la descripción del parámetro dice ruta. Una vez más, vamos a ver cada uno de estos con mucha más profundidad. Entonces podemos ver cómo está estructurado este documento. Estas son varias operaciones que tenemos. Y luego aquí abajo, podemos ver los componentes que componen esto. 

<img width="752" alt="image" src="https://user-images.githubusercontent.com/23094588/197417817-cab05902-26e7-47b3-a741-fcb3b693e6ef.png">

Entonces, echemos un vistazo a la interfaz de usuario de **Swagger** que se genera a partir de esto. Puede ver aquí que se trata de obtener todas las mascotas. De hecho, puedo ampliar eso, creo, haciendo clic en él y podemos ver que esta información aquí enumera todas las mascotas. Puede ver aquí donde dice enumerar todas las mascotas, ese es el resumen que viene de aquí.

Así es como se genera esta documentación. Veamos aquí. Esto realmente te permite probarlo.

Así que voy a hacer clic en Pruébalo aquí. Ahora voy a decir Ejecutar y veamos.

<img width="732" alt="image" src="https://user-images.githubusercontent.com/23094588/197417886-936f4869-f0e4-4482-ade8-041510fd558e.png">

Lo probé y puedes ver aquí abajo que estamos recibiendo un error de tipo Failed to fetch. Entonces, lo que está sucediendo aquí es disparar este comando y, lamentablemente, parece que este Swagger.io v1/pets no está activo en este momento. Así que probé esto en el pasado, y en realidad puedes invocar la API.

En realidad es bastante agradable. Así que aclaro si el servidor back-end aquí, este petstore.swagger.io no parece estar respondiendo, pero si estuviera haciendo clic en esto, obtendría algo de él. Pero desafortunadamente, no estoy en este momento en particular. Podría ser simplemente porque su servidor está funcionando.

Hay algo de mantenimiento. Pero esta es una buena característica porque lo que puede hacer aquí es especificar más de un servidor y ejecutar la API. Entonces, nuevamente, lo que está sucediendo aquí, la conclusión clave que quiero que tenga es que tiene en el lado izquierdo de la pantalla, la especificación OpenAPI y en el lado derecho de la pantalla está Swagger UI que está usando esa especificación. No solo nos brinda una apariencia realmente agradable para el sitio web donde podemos ver las diversas operaciones que podemos utilizar, sino que también podemos hacer clic en Pruébelo. Y si lamentablemente ese servidor no responde. Pero si lo fuera, todo esto es usando Javascript y la reflexión contra la API, la especificación de la API que podríamos utilizar.

Muy buena funcionalidad. Lamentablemente, no funciona para este ejemplo, pero encontraremos un ejemplo para utilizarlo en el curso. Nuevamente, no se preocupe demasiado, solo quería darle una descripción general de muy alto nivel. En el lado izquierdo de la pantalla, esta es la especificación OpenAPI y le muestra una OpenAPI real para el ejemplo de la tienda de mascotas. y cada uno de estas operaciones, los objetos de esquema que estamos vamos a pasar, profundizaremos en cada uno y explicaremos las cosas con mucho más detalle. Así que muchos más detalles por venir. Esta es solo una descripción general de alto nivel. Quería darle un ejemplo usando la tienda de mascotas Swagger para ver cómo se ve una especificación OpenAPI real, para que pueda ver eso en el lado derecho. E incluiré un enlace a la especificación OpenAPI en los recursos del curso antes de que continúe y examine eso con más profundidad.

##  OpenAPI 2.0 vs 3.0 03:12

Here on the screen what I have is a comparison of OpenAPI 2.0 vs 3.0.

So these are the top level objects that are defined in the specification.

You can see that there is a lot of similarity but also some significant differences.

The primary thing that they did transitioning from 2.0 to 3.0 was trying to make it the components more

reusable and easier to define standardize components so they really did a nice job with this redefinition.

I think from going from 1.0 swagger to OpenAPI 2.0, they learned quite a bit because of just how much

the community accepted it and then basically they were able to reflect upon that and improve on it so

the OpenAPI 3.0 is definitely going to be the way forward as we move forward in the industry with

OpenAPI.

So the rest of the course we will be focused on 3.0 because I expect the people using OpenAPI are gonna

quickly move away from OpenAPI 2.0 so number of companies are already doing this that is underway.

But I do want forewarn you if you're in the industry and at companies you may see 2.0 out there but

I expect companies that will be upgrading to 3.0 quite quickly.

So coming up in the course what we are gonna start doing is we will be looking at the OpenAPI specification

and each one of these boxes here.

This corresponds to an object an object being defined in the OpenAPI schema.

So we looked briefly at the information object and in the previous video we will be looking at each

section here.

Not only the information server security want to talk about on paths.

So as far as pass as to how the actual operations occur.

So a lot of information to go forward with and what we will do is take a closer look at each one of

these major components and the components that make up those.

So there's a number of objects underpass that we have to work with so going forward in the course we

will definitely be getting into this and getting a lot more hands on experience utilizing OpenAPI 3.0.

<hr>

Aquí en la imagen lo que tengo es una comparación de OpenAPI 2.0 vs 3.0.

<img width="1371" alt="image" src="https://user-images.githubusercontent.com/23094588/197418126-8a36f9e2-f68b-4494-8d97-96a50a2c9b7d.png">

Estos son los objetos de nivel superior que se definen en la especificación. Puedes ver que hay mucha similitud pero también algunas diferencias significativas.

Lo principal que hicieron en la transición de 2.0 a 3.0 fue intentar que los componentes fueran más componentes estandarizados reutilizables y más fáciles de definir, por lo que realmente hicieron un buen trabajo con esta redefinición.

Creo que al pasar de 1.0 swagger a OpenAPI 2.0, aprendieron bastante debido a cuánto la comunidad lo aceptó y luego, básicamente, pudieron reflexionar sobre eso y mejorarlo para que **OpenAPI 3.0** definitivamente será el camino a seguir a medida que avanzamos en la industria con API abierta.

Entonces, el resto del curso nos enfocaremos en 3.0 porque espero que las personas que usan OpenAPI van a alejarse rápidamente de OpenAPI 2.0, por lo que varias empresas ya están haciendo esto que está en marcha.

Pero quiero advertirle si está en la industria y en las empresas, puede ver 2.0 por ahí, pero espero que las empresas se actualicen a 3.0 con bastante rapidez.

<img width="702" alt="image" src="https://user-images.githubusercontent.com/23094588/197418389-7e2eed3b-cb8e-4166-a2d5-e38f877abf11.png">

Entonces, en el curso, lo que vamos a comenzar a hacer es ver la especificación OpenAPI y cada una de estas cajas aquí. Esto corresponde a un objeto que se define en el esquema de OpenAPI. Así que vimos brevemente el objeto de información **info** y en la sección anterior veremos cada sección aquí. No solo la de la del servidor **servers**, la de seguridad **security**, quiero hablar sobre las rutas **paths**. En cuanto a cómo se producen las operaciones reales. Así que tenemos mucha información para seguir adelante y lo que haremos es echar un vistazo más de cerca a cada uno de estos componentes principales y los componentes que los componen **components**.

Así que hay una serie de objetos subterráneos con los que tenemos que trabajar, así que en el futuro en el curso definitivamente se involucrará en esto y obtendrá mucha más experiencia práctica utilizando OpenAPI 3.0.

##  YAML Crash Course 07:28

In this video we are going to go through a little crash course in YAML.

Now if you're already comfortable writing the YAML go ahead skip over this video.

I'm just gonna give you a very brief overview of how to utilize YAML.

This is the language that we are going to be using to define our OpenAPI specifications so you can

see here on the screen I'll put this link in the course resources so you can go to this website and

I just wanna highlight a couple of things and we'll actually go ahead and then write some.

So here YAML is basically just a simple text file.

So use any text editor that you're comfortable with.

Do not use something like Microsoft Word to edit it.

You wanna use a true text editor such as TextWrangler, Notepad, VI.

There's a number of different text editor such can use or 90 e,

these are all valid ways to go ahead and edit.

YAML you do not wanna be using a word processor like word that will add an additional characters

that will cause you headaches down the road.

So you can see here the three dashes that is a document start that is actually optional you do not need

to add that in. Comments,

you can see the pound sign or hashtag

some people would like that is going to indicate the everything after that is going to be a comment and

let you scroll up here just a little bit.

Here is the biggest thing of YAML is you're gonna have a key colon and then a value so that the value

can be a string.

You do not need to quote the strings.

It can be a a number ,scientific_notation.

I've never need to use that within YAML but that is an option.

And then here boolean that's true or false.

You can actually have a null_value or you can even have keys with spaces.

There's a lot of flexibility inside of YAML and let's see here and go down here a little bit.

So you have a literal_block.

This is a very important.

You'll be seeing this in OpenAPI because you'll start off with that pipe character and you'll have

multiple lines of text so that is how you do that.

That's a very handy way.

And then let's scroll up here.

This here nesting this is a very important thing and you'll definitely be seeing this inside of

OpenAPI.

So here you are going to have a_nested_map.

So here you have key: value, another_key

and then another_nested_map.

So this is effectively building an object and you are gonna be seeing a lot of this inside of

OpenAPI inside the specification so you'll see a lot of syntax are very much like this.

The other key thing that we are going to see is what this author's calling sequences.

I think of them as a list of arrays.

So here you have a property so that there's a_sequence and then dash an item.

So it's very very important stuff here.

And this is really all the primary features that you are gonna be using in terms of OpenAPI.

These are the primary things. I will leave a link here.

I'm gonna jump over and just create a YAML document on the fly here and show you how easy it is

to write YAML syntax so we can jump over to IntelliJ and come up here and I'm just

gonna come in here and this is IntelliJ editor and let's see we're going resources and up and say

New File and I'm not gonna say this but the file extension you wanna use is yaml or yml

so you can either do I prefer yaml. You can also do yml so that that is a convention that is widely

accepted either or that is up to you.

I'm gonna say OK there.

So now I'm just gonna say This is a comment. Now I can come up with somekey: value so that's just

a key and a value.

Copy that.

Call it somekey you can see intelligent it's smart enough to say that is an error because that key value

does need to be unique to the document and I'll say

so you can see here.

Start off with comment on line one.

And then this is an inline comment so after that hashtag or pound sign everything.

After that it's going to be a comment.

Now let's call it myObject.

Now I can say I'm gonna say a stringProperty and then I can also do a numberProperty.

So that's gonna be 123.

And then I can also do a listProperty like I'm calling this a listProperty and now I'm just gonna

go like this val 1, val 2, val 3.

So this is just creating a essentially an object. You can see that this is actually a map. So this map has of

different keys to it.

And then finally this listProperty is just a list of three values.. space correct.

And we could even do a nested map here of myObj2 and I can say this

So you can see YAML does give you a lot of versatility primarily what you are gonna be doing is setting

up objects that are gonna be in line with the OpenAPI schema and we will be going through that and

a lot more detail coming up in the course but that's schema is gonna describe objects like this.

And this is how the entire OpenAPI document where your specification is going to be developed by having a

complex thing or complex key like this.

This document can now be passed by a computer and read into that.

So coming up in the course this was just kind of freeform.

We will be going through looking at the OpenAPI schema specification specifically and applying that

to YAML. So the biggest tricks to YAML remembering that you do need unique keys and then your objects

minimum of two spaces.

I personally prefer four spaces for the indentations but that is personal preference of mine.

I think it's a little more readable in two spaces.

And the hardest thing is one of the biggest problems beginners are gonna run into is having problems

with their spacing and getting things off like that just does cosmetics.

When you have spacing that is inconsistent and that can cause some very odd issues and when you're trying

to validate your OpenAPI specification it's very easy to make a error in spacing.

<hr>

En este video, vamos a realizar un pequeño [curso intensivo en YAML](https://learnxinyminutes.com/docs/yaml/).

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197418892-82fcfe0c-5387-4f2b-88b0-0a0adfc19f09.png">

Ahora, si ya te sientes cómodo escribiendo el **YAML**, salta este video.

Solo le daré una breve descripción general de cómo utilizar **YAML**. Este es el lenguaje que vamos a utilizar para definir nuestras  especificaciones de OpenAPI para que pueda ver aquí en la pantalla y solo quiero resaltar un par de cosas y seguiremos adelante y luego escribiremos algunas.

<img width="985" alt="image" src="https://user-images.githubusercontent.com/23094588/197419044-cb17e58b-a3c0-45a7-b9ee-4486a7177cb4.png">

Así que aquí YAML es básicamente un simple archivo de texto. Así que use cualquier editor de texto con el que se sienta cómodo. No utilice algo como Microsoft Word para editarlo. Quiere usar un verdadero editor de texto como TextWrangler, Notepad, VI. Hay varios editores de texto diferentes que pueden usar, todas estas son formas válidas de seguir adelante y editar. **YAML**, no quieres usar un procesador de textos como Word que agregará caracteres adicionales eso te causará dolores de cabeza en el futuro.

Entonces puede ver aquí los tres guiones que son un inicio de documento que en realidad es opcional que no necesita para agregar eso. Comentarios, puedes ver el signo de libra o el hashtag a algunas personas les gustaría que eso indique que todo lo que sigue será un comentario y déjate desplazarte hasta aquí solo un poco.

<img width="846" alt="image" src="https://user-images.githubusercontent.com/23094588/197419232-5cdddd72-898e-4afd-a7fc-5794fb0fdaad.png">

Lo más importante de YAML es que tendrá una ***clave dos puntos y luego un valor*** para que el valor puede ser una *cadena*. No es necesario citar las cadenas. Puede ser un *número*, *notación científica*. Nunca he necesitado usar eso dentro de **YAML**, pero esa es una opción. Y luego aquí *booleano* que es verdadero o falso. De hecho, puede tener un *valor nulo* o incluso puede tener *claves con espacios*. Hay mucha flexibilidad dentro de YAML y veamos aquí y bajemos un poco.

<img width="938" alt="image" src="https://user-images.githubusercontent.com/23094588/197419382-de0347e6-9e9f-434a-a004-9af095bf4368.png">

Entonces tienes un *literal_block*, esta es una muy importante. Verá esto en OpenAPI porque comenzará con ese carácter de canalización y tendrá 
varias líneas de texto, así es como se hace eso. Esa es una forma muy práctica.

Y luego vamos a desplazarnos hasta aquí.

<img width="896" alt="image" src="https://user-images.githubusercontent.com/23094588/197419452-48bd539a-7d6e-4f56-8672-9271ef324d52.png">

Esto aquí anidado es algo muy importante y definitivamente lo verás dentro de API abierta. Así que aquí vas a tener un_mapa_anidado. Así que aquí tienes la clave: valor, otra_clave y luego otro_mapa_anidado. Entonces, esto es efectivamente construir un objeto y verás mucho de esto dentro de OpenAPI dentro de la especificación, por lo que verá que mucha sintaxis es muy parecida a esta.

La otra clave que vamos a ver es cómo llama este autor son las secuencias.

<img width="722" alt="image" src="https://user-images.githubusercontent.com/23094588/197419509-d9aa4694-cfdc-4d8a-a420-1739feb57ce3.png">

Pienso en ellos como una lista de matrices. Así que aquí tienes una propiedad para que haya una_secuencia y luego un elemento. Así que son cosas muy, muy importantes aquí. Y estas son realmente todas las funciones principales que utilizará en términos de OpenAPI. Estas son las cosas primarias. 


Saltaré y simplemente crearé un documento YAML y le mostraré lo fácil que es para escribir la sintaxis YAML, vamos a IntelliJ y en el paquete  

<img width="438" alt="image" src="https://user-images.githubusercontent.com/23094588/197419736-7ca393bc-2949-4148-b2ff-15a349924ec7.png">

Vamos a crear un Nuevo archivo, pero la extensión de archivo que desea usar es yaml o yml así que puedes prefiero yaml. También puede hacer yml para que sea una convención ampliamente aceptado o eso depende de usted.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197419786-c34586bc-d45b-445c-9010-1ff568e909b0.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197419803-dcf07535-763d-4a47-b5eb-812038e3d1fd.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197419819-7836911b-5352-4bdd-8311-1baeda5e96a6.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197419827-3f989ade-7379-43f4-8d4d-726092b4227d.png">

Voy a decir OK.

Vamos a escribir el siguiente código:


```yaml
# This is a comment

somekey: value

somekey2: value # This is another comment

myObject:
    stringProperty: asdf asdf asdf
    numberProperty: 123
    listProperty:
        - val 1
        - val 2
        - val 3
        - myObj2:
              val33: asdf
              val44: asdfasdfadf
```

<img width="876" alt="image" src="https://user-images.githubusercontent.com/23094588/197420011-7814de2c-e7ee-407e-8744-92ff3e292a7c.png">

Empezamos con un comentario. Ahora se me ocurre una clave: valor, así que eso es solo una clave y un valor.

Llámalo alguna clave, puedes ver inteligente, es lo suficientemente inteligente como para decir que es un error porque ese valor clave necesita ser único para el documento y diré para que puedas ver aquí. Comience con un comentario en la línea uno.

Y luego, este es un comentario en línea, así que después de ese hashtag o libra firme todo.

Después de eso va a ser un comentario.

Ahora llamémoslo **`myObject`**, ahora puedo decir que voy a decir una propiedad de cadena y luego también puedo hacer una propiedad de número, así que serán 123. Y luego también puedo hacer una **`listaPropiedad`** como si llamara a esto una listaPropiedad y ahora solo voy a ve así val 1, val 2, val 3.

Así que esto es solo crear esencialmente un objeto. Puedes ver que esto es en realidad un mapa. Así que este mapa tiene de diferentes claves para ello.

Y finalmente, esta propiedad de lista es solo una lista de tres valores... espacio correcto. E incluso podríamos hacer un mapa anidado aquí de myObj2 y puedo decir esto.

Entonces puede ver que YAML le brinda mucha versatilidad, principalmente lo que va a hacer es configurar crear objetos que estarán en línea con el esquema OpenAPI y revisaremos eso y aparecerán muchos más detalles en el curso, pero ese esquema describirá objetos como este.

Y así es como se va a desarrollar todo el documento OpenAPI donde se va a desarrollar su especificación al tener un cosa compleja o clave compleja como esta. Este documento ahora se puede pasar por una computadora y leerlo.

Así que viene en el curso este wa Es solo una especie de forma libre.

Examinaremos específicamente la especificación del esquema OpenAPI y la aplicaremos. a YAML. Entonces, los trucos más grandes para YAML recuerdan que necesita claves únicas y luego sus objetos mínimo de dos espacios.

Personalmente, prefiero cuatro espacios para las sangrías, pero esa es mi preferencia personal. Creo que es un poco más legible en dos espacios.

Y lo más difícil es que uno de los mayores problemas con los que se encontrarán los principiantes es tener problemas con su espaciamiento y quitarse las cosas así solo hace cosméticos.

Cuando tiene un espaciado que es inconsistente y eso puede causar algunos problemas muy extraños y cuando está intentando para validar su especificación OpenAPI, es muy fácil cometer un error en el espaciado.

##  OpenAPI Specification Quiz 10 preguntas
