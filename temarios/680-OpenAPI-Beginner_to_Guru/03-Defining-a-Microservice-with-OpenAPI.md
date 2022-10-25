# 3. Defining a Microservice with OpenAPI 6 clases • 26 min

* Introduction 01:45
* Swagger Hub 03:59
* OpenAPI Specification 05:03
* OpenAPI Info Object 05:14
* OpenAPI Servers Object 03:37
* Assignment - Add Servers 1 preguntas
* OpenAPI Paths Object 06:26
* Assignment - List Beers 1 preguntas
* OpenAPI Quiz 6 preguntas

## Introduction 01:45

Okay first one to get you a good solid overview of the technologies and some of the history behind OpenAPI is important in defining all those terms so we have a foundation to build from.

In this section, of course, we are actually gonna start going in and defining operations in our OpenAPI specification. So we're gonna start from scratch and go through and start building an OpenAPI specification.

So we're gonna look at the major components and we will go through this step by step and will literally develop our OpenAPI specification. So we're just gonna start off with some very simple things, some very simple examples.

But we will start actually working with an OpenAPI specification. Now one of the important features of OpenAPI is its ability to find data structures that is schema that will be coming up after the section will start doing a deep dive on schema and then OpenAPI has a very powerful feature called reusable components. 

So an entire section on a very powerful tool. We'll be have a whole section on that. And then finally another upcoming section on the course is on OpenAPI parameters so we won't be talking about parameters for a little bit but also very important not only your old parameters but query parameters, headers, cookies things like that, things that can be passed into the API.

But first we're gonna tackle this section of the course and that is just starting get our feet wet with OpenAPI and starting to work with that specification of building up our OpenAPI specification and we will do that step by step step in this section of the course.

<hr>

![image](https://user-images.githubusercontent.com/23094588/197559574-1df9f1e3-7bf9-4b25-883c-27a6bf450062.png)

Primero vamos a obtener una buena visión general sólida de las tecnologías y parte de la historia detrás de **OpenAPI** es importante para definir todos esos términos, por lo que tendremos una base sobre la cual construir.

![image](https://user-images.githubusercontent.com/23094588/197561353-124bd170-3101-4cb2-9466-8ed66a8590a0.png)

En esta sección, por supuesto, vamos a comenzar a definir operaciones en nuestra especificación OpenAPI. Así que vamos a empezar desde cero y comenzar a construir una **especificación OpenAPI**.

Así que vamos a ver los componentes principales y lo veremos paso a paso y literalmente desarrollaremos nuestra especificación OpenAPI. Así que vamos a empezar con algunas cosas muy simples, algunos ejemplos muy simples. Pero comenzaremos a trabajar con una especificación OpenAPI. 

Ahora, una de las características importantes de OpenAPI es su capacidad para encontrar ***estructuras de datos*** que son esquemas, que aparecerán después de que la sección comience a profundizar en el esquema y luego OpenAPI tiene una característica muy poderosa llamada ***componentes reutilizables***. Así que toda una sección sobre una herramienta muy poderosa. Vamos a tener una sección completa sobre eso. 

Y, finalmente, otra próxima sección del curso es sobre ***los parámetros de OpenAPI***, por lo que no hablaremos de parámetros por un rato, sino que también es muy importante no solo sus parámetros antiguos, sino también los parámetros de consulta, encabezados, cookies, cosas así, cosas que pueden ser pasado a la API.

Pero primero vamos a abordar esta sección del curso y eso es solo comenzar a mojarnos los pies con OpenAPI y comenzar a trabajar con esa especificación de construir nuestra especificación OpenAPI y lo haremos paso a paso en esta sección del curso.

## Swagger Hub 03:59

In this video, we are gonna start taking a look at SwaggerHub. So swagger is the company supported by Smart Bear. This is the company that is actually came up with a Swagger specification, originally the predecessor to OpenAPI that is now a consortium behind it but Swagger and Smart Bear have a variety of commercial tools that they do.

So here I am looking at SwaggerHub. We are gonna be using the Swagger editor within SwaggerHub. It is a free editor. You can get in, sign up for free. There's no cost to it at all. I am using this just as a convenience because it does offer some nice tools for us to utilize and to see how the OpenAPI specification develops.

We can see that right on the screen as we progress with the course. Now you do not need to use this. This is optional. We are gonna be working with OpenAPI in YAML and you can use any text editor you'd like. Again this is free I guess just step through getting this signed up so I will leave a link to this in the course resources and just come in here and you can click on try for free and say create a free account so I just clicked on that.

Now you can sign up create a user name, email and password like that or if you are signed into GitHub You can also create an account with GitHub and that's my preference to go ahead and use that.

So I'm gonna click on this. You can use either one here that is up to you. So I'm gonna just say Create Account with GitHub and now you can see that this is in my SwaggerHub.

Github might ask you to allow authorization to SwaggerHub. I think that's a step that I completed a long time ago and you can see here I have a variety of things that I've been experimenting with in my SwaggerHub account and what I wanna do is come over here and say Create New create a ew API. And here we have 2.0, 3.0. I definitely wanna be using 3.0. And I'm gonna say no template and I'll call this openapicourse like so.

I'm gonna say 1.0 and this is gonna be OpenAPI Course and I want that to be my owner and that is gonna be public and I'm not going to do the auto mocking, this is a feature of SwaggerHub itself, not gonna be doing that and this is gonna a publicly available document.

And now all I gotta do is come over here and say create API and see they're creating magic in the background there. And now this is the SwaggerHub editor we can see here.

This is the YAML that we have to work with. And over here we have the OpenAPI Course. So this is a flavor of Swagger UI. So we can see this specification in the right hand side and then on the left hand side is going to be the YAML and you can see that SwaggerHub did create a very small stub using the information that I provided.

Remember I gave a version 1.0 and then I gave it a title of OpenAPI Course. And again these are optional. And here I can just say I'll say specification for specification for OpenAPI Course.

You can see there is a brief delay. And this here got provided right away. So that's I'm gonna stop here and we'll start going through developing the Open API specification and we'll go through this in more detail in upcoming videos.

<hr>

En este video, vamos a comenzar a echar un vistazo a [SwaggerHub](https://swagger.io/tools/swaggerhub/). 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197564617-dfb1fabc-888b-4864-873a-377f324297bd.png">


Entonces **Swagger** es la compañía respaldada por **Smart Bear**. Esta es la compañía a la que realmente se le ocurrió una especificación **Swagger**, originalmente el predecesor de **OpenAPI** que ahora es un consorcio detrás, pero **Swagger** y **Smart Bear** tienen una variedad de herramientas comerciales que hacen.

Así que aquí estoy mirando **SwaggerHub**. Vamos a usar el **editor Swagger** dentro de **SwaggerHub**. Es un editor gratuito, puedes entrar, regístrate gratis, no hay ningún costo para ello en absoluto. Estoy usando esto solo como una conveniencia porque ofrece algunas buenas herramientas para que las utilicemos y veamos cómo se desarrolla la **especificación OpenAPI**. Podemos verlo directamente en la pantalla a medida que avanzamos en el curso. Ahora no necesitas usar esto. Esto es opcional. 

Vamos a trabajar con **OpenAPI** en **YAML** y puedes usar cualquier editor de texto que quieras. Una vez más, esto es gratis, supongo que solo debes registrarte, solo entra aquí

![image](https://user-images.githubusercontent.com/23094588/197565842-950e383e-a70d-4df9-8bdc-34c0426312d0.png)

para crear una cuenta gratis, así que simplemente hice clic en el botón.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197566139-46c5876e-303c-4215-8bfc-696d802968dc.png">


Ahora puede registrarse y crear un nombre de usuario, correo electrónico y contraseña así o si ha iniciado sesión en GitHub. También puede crear una cuenta con GitHub y esa es mi preferencia para seguir adelante y usarla.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197566363-f188aded-7db8-4efe-aac9-35fb887ca37e.png">

Así que voy a hacer clic en el botón **Authorize SmartBear**. Github pide la autorización a SwaggerHub.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197566773-4370d5af-1de1-412c-b48e-a0a51c0cb594.png">

Me pide más datos para el registro, una vez rellenados me sale la siguiente pantalla.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197567181-3d805809-f4fd-461f-8c8e-9cc676e8f177.png">


Ahora ya está en su **SwaggerHub**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197569291-56861fa4-d025-4a0a-994c-7d8637a77f72.png">

Vamos a ***Create New --> Create New API***

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197569620-14b5edb7-cb28-4647-bdd8-48b7dfa8a867.png">

Vamos a rellenar la información con los sguientes datos:

<img width="625" alt="image" src="https://user-images.githubusercontent.com/23094588/197570284-52db6053-5f6b-48a9-ba88-e3556a2cb49f.png">

Y ahora todo lo que tengo que hacer es pulsar en **Create API**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197570710-bf1b0116-7880-4c89-96c1-9cc81d8c8c04.png">

Y ahora me aparece **el editor de SwaggerHub** que podemos ver en la imagen. En la parte izquierda tenemos nuestro **YAML** con el que tenemos que trabajar y en el lado derecho tenemos el resultado obtenido, vemos el título **OpenAPI Course**, la versión **1.0**, la versión del Open API **OAS3** ymás información. 

Entonces podemos ver la especificación en el lado derecho y luego en el lado izquierdo estará el **YAML** y pueden ver que **SwaggerHub** creó un código auxiliar muy pequeño usando la información que proporcioné. Recuerde que le di una versión 1.0 y luego le di un título **OpenAPI Course**. 

En nuestro YAML vamos a meter un valor a la **`description`** que actualmente esta vacia.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197572890-7b278426-62ae-4c28-8c20-50cd94538785.png">

Puede ver que hay un breve retraso después de introducir el valor de **`description`** pero de inmediato el cambio se refleja en la parte derecha.

Así que me detendré aquí y comenzaremos a desarrollar la especificación de API abierta y veremos esto con más detalle en los próximos videos.


## OpenAPI Specification 05:03

Okay, on the screen, I have the GitHub account for the [OpenAPI specification](https://github.com/OAI/OpenAPI-Specification). 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197574010-2061580c-1cb6-4f12-ac1c-65afba41aa41.png">

So this is where all the source code behind the OpenAPI lives. It lives inside of this GitHub repository. I will provide a link to this in the course resources so you can go right here. Now there's a few things I wanna point out in here specifically for the course that we are gonna be taking a look at. If you come in here and take a look at the examples directory inside a GitHub can see that we have version 2.0 and 3.0.

Again I'm not focusing on 2.0 but I am gonna be looking at 3.0.

Here are a number of different examples.

Remember we looked at petstore so here's the petstore. YAML has the OpenAPI specification.

You can see that there's several different implementations of the OpenAPI specification that we can

look at.

So some really good examples when you need to see how to do something you can go through and review

these and let's go back over here. Then the next thing we wanna take a look here is this IMPLEMENTAIONS

this markdown file here IMPLEMENTATIONS. These are known implementations for OpenAPI3.0.

We can see that there's a number of tooling that's been set up in different programs that are available.

This list is always growing. I highly recommend taking a look at it and there's different technologies

that are available.

I'm primarily a Java developer so you can see a number of Java tools there.

I can barely spell Ruby but there are Ruby tools there, Node.js, Typescript, PHP. So a large number of

tools that we have available.

Remember I said that we are gonna be using the SwaggerHub editor.

Here are some specific tools for working with OpenAPI.

Some specific editors. A lot of people like Visual Studio.

I've actually used this one here at the top Visual Studio Code extension is quite nice. So you might

prefer to use Sisual Studio.

It's a free tool that is an editorial that you can use.

And I actually know of some that are not actually available here so this is not a complete list by any

means, there is actually additional tooling that is not on this list.

Then you can see here User Interfaces.

So these are tools that we'll take in the OpenAPI specification and give you documentation.

So we've already seen swagger-ui in action.

And here are some additional options.

So Widdershins that is a quite popular.

As far as generating end user documentation from your OpenAPI specification, I personally like Redoc

quite a bit.

This is a very nice tool for generating and user documentation from your OpenAPI specification and

now you can also see we have Server Implementations, Client Implementations, Code Generators.

So there's a number of different code generators that you can utilize with the OpenAPI specification.

Let's take it back over here.

And remember I said that the OpenAPI specification is backed by a formal schema.

Here is the JSON schema.

If you wanna go through and see exactly,

this is where you can really take a look at how the OpenAPI schema is defined this is the raw source

code for that so to speak but we'll be looking at this through a different approach. I'm not gonna get

too deep on that it's come back over here and then finally I highly recommend going through this documentation

that there's a lot of documentation to this.

You can see tools and libraries participation how it is licensed if you wanna contribute to this

project it is an open source project.

So they even have a technical steering committee developing guidelines so the lot here obviously I'm

not gonna go through every single thing we're just talking about trying to get up to OpenAPI and

you can see here that we are currently on 3.0.2.

And if I click to this, this link is actually gonna take me in two versions.

So but I'll just go ahead and click on this.

This is the documentation for the OpenAPI schema and we will be getting very very familiar with this.

Specifically we are gonna be looking at developing against the OpenAPI schema and we will be looking

at the specific like the OpenAPI object. You can see here this is the top-level schema specification

and we will be going through this in upcoming videos.

This documentation here for OpenAPI is very rich it's very detailed and you should consider this document

and the single source of truth for when you're working with OpenAPI documentation.

<hr> 

De acuerdo, en la pantalla, tengo la cuenta de GitHub para la [OpenAPI specification](https://github.com/OAI/OpenAPI-Specification). 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197574010-2061580c-1cb6-4f12-ac1c-65afba41aa41.png">

Así que aquí es donde vive todo el código fuente detrás de OpenAPI. Vive dentro de este repositorio de GitHub. Ahora, hay algunas cosas que quiero señalar aquí específicamente para el curso que vamos a estar echando un vistazo a. Si entra aquí y echa un vistazo al directorio de **examples** dentro de una lata de GitHub mira que tenemos la versión 2.0, 3.0 y 3.1.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197574947-4870e3be-f506-4c63-bed6-9d30433aba94.png">

Nuevamente, no me estoy enfocando en 2.0, pero voy a mirar 3.0.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197575245-522d4991-8ae0-4a22-af1f-294b333b6062.png">

Aquí hay varios ejemplos diferentes. Recuerda que miramos la tienda de mascotas, así que está en **`petstore.yaml`** la tienda de mascotas. El YAML tiene la especificación OpenAPI. Puede ver que hay varias implementaciones diferentes de la especificación OpenAPI que podemos mirar. Entonces, algunos ejemplos realmente buenos cuando necesita ver cómo hacer algo que puede revisar y revisar estos.


Volvamos a la raíz. Luego, lo siguiente que queremos ver es **`IMPLEMENTATIONS.md`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197576154-0fa0de42-c963-4772-a03c-570cb9113b67.png">

Estas son implementaciones conocidas para OpenAPI3.0. Podemos ver que hay una serie de herramientas que se han configurado en diferentes programas que están disponibles. Esta lista siempre está creciendo. Recomiendo encarecidamente echarle un vistazo y hay diferentes tecnologías que están disponibles. Soy principalmente un desarrollador de Java, por lo que puede ver una serie de herramientas de Java allí. Apenas puedo deletrear Ruby, pero hay herramientas de Ruby, Node.js, Typescript, PHP. Así que un gran número de herramientas que tenemos disponibles.

Recuerde que dije que usaremos el editor SwaggerHub. Aquí hay algunas herramientas específicas para trabajar con OpenAPI. Algunos editores específicos. A mucha gente le gusta Visual Studio. De hecho, he usado este aquí en la parte superior. La extensión de código de Visual Studio es bastante agradable. Así que podrías Prefiero usar Visual Studio.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197576817-5ae78425-5aef-4fe1-b6f4-4ccef85fb629.png">

Es una herramienta gratuita que es una editorial que puedes usar. Y en realidad sé de algunos que no están disponibles aquí, por lo que esta no es una lista completa de ninguna manera significa que en realidad hay herramientas adicionales que no están en esta lista.

Entonces puedes ver aquí las User Interfaces.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197577136-459bdedc-1d5e-4e7d-9d47-8907779f4db8.png">

Estas son herramientas que tomaremos en la especificación OpenAPI y les daremos documentación.  Así que ya hemos visto **swagger-ui** en acción. Y aquí hay algunas opciones adicionales como **Widdershins** es bastante popular, en cuanto a generar documentación de usuario final a partir de su especificación OpenAPI, personalmente me gusta **Redoc** bastante, esta es una muy buena herramienta para generar documentación de usuario a partir de su especificación OpenAPI.

También puede ver que tenemos implementaciones de servidor **Server Implementations**, implementaciones de cliente **Client Implementations**, generadores de código **Code Generators**. Por lo tanto, hay varios generadores de código diferentes que puede utilizar con la especificación OpenAPI.

Retomémoslo a la raíz y entremos en **schemas**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197578294-572e5471-a726-4b76-aab3-5ad7669b6ed8.png">

Entramos a la v3.0

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197579342-1b8e312a-0d5f-4ba2-a8c8-ee0d4e66befe.png">


Y recuerde que dije que la especificación OpenAPI está respaldada por un esquema formal, aquí está el **schema.json**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197579543-03143f5a-bb7e-49b2-8e5c-6d6be3ed6e1d.png">

Si quieres pasar y ver exactamente, aquí es donde realmente puede echar un vistazo a cómo se define el esquema OpenAPI esta es la fuente sin procesar código para eso, por así decirlo, pero lo veremos a través de un enfoque diferente. no voy a conseguir demasiado profundo en que ha vuelto aquí.

Y finalmente recomiendo revisar esta documentación que hay mucha documentación sobre esto **README.md**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197579953-5301e25f-f53c-4614-8ebd-aad2f9c5048a.png">

Puede ver la participación de herramientas y bibliotecas, cómo se licencia si desea contribuir a esto proyecto es un proyecto de código abierto. Incluso tienen un comité directivo técnico que desarrolla pautas, por lo que obviamente estoy aquí.

Puede ver la versión actualmente estamos en 3.0.2 y si hago clic en esto, este enlace me llevará en dos versiones. Así que seguiré adelante y haré clic en esto. Esta es la documentación para el esquema OpenAPI y nos familiarizaremos mucho con esto. Específicamente, vamos a buscar el desarrollo contra el esquema OpenAPI y buscaremos en el específico como el objeto OpenAPI. Puede ver aquí que esta es la especificación de esquema de nivel superior y revisaremos esto en próximos videos.

**Esta documentación aquí para OpenAPI es muy rica, es muy detallada y debe considerar este documento y la única fuente de verdad para cuando esté trabajando con la documentación de OpenAPI.**


## OpenAPI Info Object 05:14

This video we're gonna be taking a closer look at the OpenAPI information object.

But first one step back. 

You can see here I have the OpenAPI object and this is the definition of that object.

And remember we looked at this image here.

This is the image that we looked at previously in the course in the OpenAPI 3.0.

You can see the different boxes here.

I have info, servers, security, paths, tags, externalDocs and components.

And if we look at this the different properties here you can see I have info, servers, paths, components,

security, tags and externalDocs.

So this table maps directly to this image that we had.

So you can see how that that lines up.

And these are all the major components inside of OpenAPI.

Now you can see here that we are saying we have the bold REQUIRED. So for of valid OpenAPI specification

at a minimum, we need the OpenAPI property, the info property and the path's property.

So these are the minimum things that we can have for the OpenAPI specification.

Now if I come back over here to SwaggerHub, we can see that the stub that was created. We have OpenAPI

info object and then an empty paths object.

So these are the minimum required.

So the editor when we created that, it did set up the minimum properties for us.

Now you can see here this OpenAPI specification I wanna say the version this must be a valid version

and I am on 3.0.2. So the first thing I wanna do is come over here and change this to a 2 and that

that sets up that version 2 is a very minor release so it's probably just a correcting small problems

with documentation and some type.

So probably not a major difference in functionality.

Now the next thing we wanna be looking at in this video is we have this information object.

So let me scroll down to that.

This is the info objects so we can see here that actually has a number of properties for a title, description,

termsOfService, contact, license and version.

So we can see that only title and version are required and you can see here that to do title and version

for us the description is optional but if I come in here to the editor and if I do control space and

I'm just sitting the control space and it might be different on a Windows keyboard but for OSX, you

can see this brings up the different properties and lets say I wanna do contact, I let in my contact information.

This becomes another object and if I come up we can see these are the properties so name I'll put in

my name, url

and my email and this is my valid email.

You email me I will read it.

I can't guarantee you will respond because I do get a ton of email but now you can see as I update this

over on the right hand side of the screen where the documentation as you can see this is also updating

and let's take a look at the specification.

I can also do a license so see the license object so this all information and I'll go ahead and follow

the Apache 2.0 as well.

So we'll just do the same license there.

So come over here again.

Remember your spacing gonna watch your spacing and see license and now you can see that I made a mistake

and I'm getting an error there.

So url and i'm pasting in that url

Apache 2.0.

So this sets up our information object.

Let's double check there.

So you can see here

I put in contact.

I didn't do termsOfService,

that is an optional property.

Let's go ahead and add that as well

over here

termsOfService

like so.

So now that is a fully completed information object and again these properties do have to match.

So you see here how these objects are.

So we have title, description and so on.

These are all properties that I am providing to that.

So again what's going on here this is the info object.

These are properties of it and then that info object has a contact object and also a license object

and we can see here this corresponds we have the info object and then these are the different properties

you can see out the OpenAPI specification saying that contact is not just simply a string it is actually

a structured object that is expecting inside the specification.

<hr>

En este video vamos a echar un vistazo más de cerca al objeto de información de OpenAPI.

Pero primero un paso atrás. Puede ver aquí que tengo el **objeto OpenAPI** y esta es la definición de ese objeto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/197742206-f7c5f316-b58e-4f84-ac1e-53196baca0d1.png">

Y recuerda que vimos esta imagen. 

<img width="921" alt="image" src="https://user-images.githubusercontent.com/23094588/197743043-31612866-66a5-44f0-9704-7b967bde7656.png">

Esta es la imagen que vimos anteriormente en el curso en OpenAPI 3.0.

Puedes ver las diferentes cajas aquí. 

<img width="595" alt="image" src="https://user-images.githubusercontent.com/23094588/197743354-8596f831-44dc-4b9a-b730-edab26f8a242.png">

Tengo información **info**, servidores **server**, seguridad **security**, rutas **paths**, etiquetas **tags**, documentos externos **externalDocs** y componentes **components**.

Y si observamos las diferentes propiedades aquí, puede ver que tengo información, servidores, rutas, componentes, seguridad, etiquetas y documentos externos.

<img width="930" alt="image" src="https://user-images.githubusercontent.com/23094588/197743957-5c393ed4-1c95-4e32-b214-f98875e69814.png">

Así que esta tabla se asigna directamente a esta imagen que teníamos, puedes ver cómo eso se alinea. Estos son todos los componentes principales dentro de OpenAPI.

<img width="936" alt="image" src="https://user-images.githubusercontent.com/23094588/197744977-a7a77045-ed05-4d08-bbf8-738b66561153.png">

Ahora puede ver aquí que estamos diciendo que tenemos **REQUIRED**. Entonces, para una especificación OpenAPI válida como mínimo, necesitamos la propiedad **openapi**, la propiedad de información **info** y la propiedad de la ruta **path**. Estas son las cosas mínimas que podemos tener para la especificación OpenAPI.

Ahora, si vuelvo aquí a **SwaggerHub**, podemos ver que se creó el código auxiliar. 

<img width="628" alt="image" src="https://user-images.githubusercontent.com/23094588/197746364-ef261b19-d0e1-4259-80db-ee9dedc6743f.png">

Tenemos **openapi**, **info** y luego un objeto **path** vacío, estos son los mínimos requeridos, además tenemos **servers** que no es requerido pero que se creo al generar el código.

Entonces, cuando creamos eso, el editor configuró las propiedades mínimas para nosotros.

Ahora puede ver aquí esta especificación de OpenAPI. Quiero decir que la versión debe ser una versión válida y estoy en 3.0.2. Entonces, lo primero que quiero hacer es venir aquí y cambiar esto a 2 y eso eso establece que la versión 2 es una versión muy secundaria, por lo que probablemente solo sea una corrección de pequeños problemas con documentación y algún tipo.

Entonces, probablemente no sea una gran diferencia en la funcionalidad.

Ahora, lo siguiente que queremos ver en este video es que tenemos este objeto de información.

Así que permítanme desplazarme hacia abajo hasta eso.

Estos son los objetos de información, por lo que podemos ver aquí que en realidad tiene una serie de propiedades para un título, descripción, TermsOfService, contacto, licencia y versión.

Entonces podemos ver que solo se requieren el título y la versión y puede ver aquí que para hacer el título y la versión para nosotros la descripción es opcional pero si entro aquí al editor y si controlo el espacio y Solo estoy sentado en el espacio de control y podría ser diferente en un teclado de Windows, pero para OSX, usted Puedo ver que esto muestra las diferentes propiedades y digamos que quiero hacer contacto, dejo mi información de contacto.

Esto se convierte en otro objeto y si aparezco podemos ver que estas son las propiedades, así que pondré el nombre mi nombre, URL y mi correo electrónico y este es mi correo electrónico válido.

Envíame un correo electrónico y lo leeré.

No puedo garantizar que responderá porque recibo un montón de correos electrónicos, pero ahora puede ver cómo actualizo esto.

en el lado derecho de la pantalla donde la documentación, como puede ver, también se está actualizando y echemos un vistazo a la especificación.

También puedo hacer una licencia, así que vea el objeto de la licencia, así que esta es toda la información y seguiré adelante.

el Apache 2.0 también.

Así que haremos la misma licencia allí.

Así que ven aquí de nuevo.

Recuerde que su espaciado observará su espaciado y verá la licencia y ahora puede ver que cometí un error y estoy recibiendo un error allí.

Así que url y estoy pegando en esa url apache 2.0.

Así que esto configura nuestro objeto de información.

Comprobemos dos veces allí.

Así que puedes ver aquí

me pongo en contacto.

No hice los términos de servicio,

esa es una propiedad opcional.

Sigamos adelante y añadamos eso también.

aqui

términos de servicio

al igual que.

Así que ahora es un objeto de información completamente completo y nuevamente estas propiedades tienen que coincidir.

Así que ven aquí cómo son estos objetos.

Así que tenemos título, descripción y así sucesivamente.

Estas son todas las propiedades que estoy proporcionando a eso.

De nuevo, lo que está pasando aquí es el objeto de información.

Estas son sus propiedades y luego ese objeto de información tiene un objeto de contacto y también un objeto de licencia.

y podemos ver aquí esto corresponde, tenemos el objeto de información y luego estas son las diferentes propiedades

puede ver la especificación OpenAPI que dice que el contacto no es solo una cadena, en realidad es

un objeto estructurado que espera dentro de la especificación.

## OpenAPI Servers Object 03:37
## Assignment - Add Servers 1 preguntas
## OpenAPI Paths Object 06:26
## Assignment - List Beers 1 preguntas
## OpenAPI Quiz 6 preguntas
