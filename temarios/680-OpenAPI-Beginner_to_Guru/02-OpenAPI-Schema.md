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

Y luego, algunos son muy específicos de la tecnología. Si tiene un iPhone o algún tipo de teléfono Android, muchas veces una aplicación puede abrir otra aplicación y esto se puede hacer a un nivel bajo que las API son muy específicas para ese sistema operativo del dispositivo.Estas se consideran API cerradas.

<img width="890" alt="image" src="https://user-images.githubusercontent.com/23094588/197383208-eee1541c-cb6e-4ad5-ab16-14026dcceb73.png">

Y luego, otros tipos de API adoptan estándares ampliamente aceptados y estos se consideran lo que se denomina API abiertas. Porque las API web programables permiten que Internet funcione como lo conocemos. Entonces, si piensa en buscar en Google, lo que sucederá allí es su navegador web cuando escribe en ese cuadro de búsqueda y hace clic en Enviar, sus navegadores web debajo de las cubiertas están haciendo **HTTP POST** a uno de los servidores de Google que tendrá un campo en él con lo que estás buscando. Entonces, este es el idioma que Google puede entender para que escuchen esa solicitud y luego respondan a su navegador con un documento **HTML** con el contenido de su búsqueda. Así es como sucede esa comunicación.

Así que estamos usando HTTP para hablar. Estamos utilizando la acción de publicación y luego su navegador obtiene un documento HTML que es lo que ve en la pantalla. Así es como funciona esa API. 

<img width="911" alt="image" src="https://user-images.githubusercontent.com/23094588/197383298-87665363-5676-440b-9441-f00ccd48f9c0.png">

En este curso, nos centraremos en las API que se utilizarán en los desarrollos web. Estas API siguen estándares abiertos y son ampliamente utilizadas. Ahora, estos tipos de API a menudo se denominan ***servicios web***.

Hay dos tipos principales de servicios web: **SOAP** y **REST** o **RESTful**. Nos centraremos en los ***servicios web RESTful***.

El SOAP es un estándar mucho más antiguo. Todavía se ve bastante, especialmente en la industria de seguros. Parece que en las finanzas. Pero la mayor parte de la web moderna, como cualquier cosa. Si está en Facebook, está utilizando los servicios web RESTful para los servidores de Facebook a través de su navegador o si está comprando en Amazon, le garantizo que está utilizando un montón de servicios web RESTful. Por lo tanto, estos son, con mucho, los más populares actualmente en este momento con la tecnología.

<img width="893" alt="image" src="https://user-images.githubusercontent.com/23094588/197383406-4cebc4ab-929a-494f-9204-fca4164bd0ec.png">

Los servicios web RESTful se han vuelto muy populares debido a su simplicidad y versatilidad. Son ahora mismo el estándar de facto para los servicios web. ***REST significa Transferencia de Estado Representable***. La representación normalmente será **JSON**. Todavía veo mucho XML por ahí también. Las transferencias estatales se van a hacer por **HTTP**. Todo este concepto fue establecido por un tipo llamado **Rory Fielding** en esta tesis doctoral del año 2000.

<img width="892" alt="image" src="https://user-images.githubusercontent.com/23094588/197383428-ba6e753c-5918-4f00-bbc5-2fdfd05964d5.png">

Entonces, dentro de la ***terminología REST***, estamos usando **HTTP**, estamos usando verbos para **GET**, **POST** y **DELETE**. Estos son mensajes que iban a funcionar con el servidor encendido. Entonces, los mensajes normalmente estarán en **JSON** o **XML**.

Una **URI**, esto es muy importante. Este es un **Identificador Uniforme de Recursos**. Es una cadena única que identifica un recurso. 

Y luego, **URL** es **Localizador Uniforme de Recursos**. Entonces, una URL es solo un URI con información de red. Entonces, www.example.com sería ese URI y luego agregamos el HTTP, esa será la red con la que hablaremos con ese recurso. 

<img width="906" alt="image" src="https://user-images.githubusercontent.com/23094588/197383443-db214219-cb68-4bb2-829c-9183b1ed6e32.png">

Ahora algunas cosas importantes, tenemos **idempotencia**. Esta es una palabra con e pero es idempotencia. **Esto significa que esta propiedad se puede aplicar varias veces y no cambiar el resultado**. Entonces, por ejemplo, cuando actualizamos una página web normalmente con una operación GET, no cambiaremos nada en el servidor. Al menos en teoría, aunque ese no siempre es el caso con todo el marketing y las cosas que están vigilando su navegador. Pero la operación GET se considera idempotente. 

<img width="892" alt="image" src="https://user-images.githubusercontent.com/23094588/197383471-b57a7374-ded8-441c-9656-213dbaebec7d.png">

Otra cosa sobre ***los servicios REST, no tiene estado***. Entonces, el servidor no mantendrá ningún tipo de estado para usted. Eso va a ser algo sin estado, por lo que no mantendremos el estado en ninguno de los lados. 

Y luego **HATEOS** o **HATEOS**, algunas personas dicen que **Hypermedia** es el motor del estado de la aplicación. Por lo tanto, un cliente REST debería poder usar los enlaces proporcionados por el servidor para descubrir dinámicamente todos los recursos disponibles a los que necesita acceder. El servidor responde con text excluye los hipervínculos a otras acciones que están actualmente disponibles. Así que este es el mejor de una variedad de servicios REST. No ves esto siempre implementado. Por lo tanto, muchos servicios no implementan esto, pero algunos de vanguardia sí lo implementan y puede hacer muchas cosas interesantes con esto.

Ahora veamos algunos de los verbos. 

<img width="897" alt="image" src="https://user-images.githubusercontent.com/23094588/197383502-8bf69162-8089-46e8-a801-6d3a3e831a0b.png">

**HTTP - GET**, se usará para leer datos de un recurso. Esto es de solo lectura y nuevamente esto es idempotente. Es seguro. No cambia el estado del recurso. 

<img width="892" alt="image" src="https://user-images.githubusercontent.com/23094588/197383521-474b6993-b599-4509-97d5-090fd4169586.png">

**HTTP - PUT**, esto se usará para insertar si no se encuentra o actualizar si se encuentra. Entonces, nuevamente, esto será idempotente, por lo que si los coloca varias veces, no cambiará el resultado. Es como guardar un archivo varias veces. Esta no es una operación segura porque cambia el estado del recurso.

<img width="905" alt="image" src="https://user-images.githubusercontent.com/23094588/197383539-68423d31-6878-424f-9700-eb7b37a6ead9.png">

**HTTP - POST**, esto se usará para crear un nuevo objeto. Esto ***no es idempotente*** porque se espera que múltiples publicaciones creen múltiples objetos. Nuevamente, tampoco es una operación segura porque cambia el estado del recurso en el servidor. Así que ***este es el único verbo HTTP no idempotente y no seguro con el que tenemos que lidiar***. 

<img width="891" alt="image" src="https://user-images.githubusercontent.com/23094588/197383569-c12f514a-81f5-4f18-afa0-4d04cf1cdf0f.png">

Y finalmente, la última acción HTTP que tenemos que ver es **HTTP - Delete**. Esto nuevamente será idempotente, por lo que tendrá el mismo efecto y comportamiento y tampoco es una aberración segura porque cambia el estado del recurso.



## HTTP Protocol 05:08
##  HTTP Request Methods 06:11
##  Why use OpenAPI? 07:06
##  Pet Clinic on Swagger Editor 06:09
##  OpenAPI 2.0 vs 3.0 03:12
##  YAML Crash Course 07:28
##  OpenAPI Specification Quiz 10 preguntas
