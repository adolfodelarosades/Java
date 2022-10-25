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

Tenemos **openapi**, **info** y luego un objeto **path** vacío, estos son los mínimos requeridos, además tenemos **servers** que no es requerido pero que se creo al generar el código. Cuando creamos esto, el editor configuró las propiedades mínimas para nosotros.

Ahora puede ver en la documentación de la especificación de OpenAPI que estamos revisando es la 3.0.2. 

<img width="1280" alt="image" src="https://user-images.githubusercontent.com/23094588/197750944-8ee9d25b-67ae-417b-90ed-70698ab568b4.png">

Entonces, lo primero que vamos a hacer es que en **SwaggerHub** vamos a cambiar **openapi: 3.0.0**  por la **openapi: 3.0.2**, 

<img width="615" alt="image" src="https://user-images.githubusercontent.com/23094588/197751945-904aa34c-b254-4bc7-9f09-0539b6300a97.png">


el **2** establece que la una versión muy secundaria, por lo que probablemente solo sea una corrección de pequeños problemas con documentación y algún tipo. Entonces, probablemente no sea una gran diferencia en la funcionalidad.

Ahora, lo siguiente que queremos ver es que tenemos una sección **Info Object**.

<img width="694" alt="image" src="https://user-images.githubusercontent.com/23094588/197752396-97dcfb35-ea79-41f6-bd8a-d2bc05d3901f.png">

Estos son los objetos de información, por lo que podemos ver aquí que en realidad tiene una serie de propiedades para un título, descripción, TermsOfService, contacto, licencia y versión.

Entonces podemos ver que solo se requieren el título y la versión y puede ver aquí que para hacer el título y la versión para nosotros la descripción es opcional pero si entro al editor

<img width="591" alt="image" src="https://user-images.githubusercontent.com/23094588/197882828-abc2644c-fc95-4c0f-b458-575bf4876390.png">

y si damos CTRL + SPACE puede ver que muestra las diferentes propiedades que podemos insertar en la sección **`info`**

<img width="869" alt="image" src="https://user-images.githubusercontent.com/23094588/197883082-3ff20742-fab5-45d5-9317-fa7c10c1a2bd.png">


y digamos que quiero hacer contacto, dejo mi información de contacto. Esto se convierte en otro objeto y si vemos la parte derecha podemos ver las propiedades insertadas, así que pondré el nombre mi nombre, URL y mi correo electrónico y este es mi correo electrónico válido.

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/23094588/197883831-1d891eed-ec5f-4bd0-81f4-4551a642a914.png">

en el lado derecho de la pantalla donde la documentación, como puede ver, también se está actualizando y podemos ver la información que metimos.

Echemos un vistazo a la especificación.

<img width="1375" alt="image" src="https://user-images.githubusercontent.com/23094588/197884731-9a5065c0-7f3d-4109-a9bc-9119d74ac74a.png">

También puedo tener una licencia, así que vea el objeto de la licencia, que tiene un **`name`** y **`url`** adelante.

Así que haremos la misma licencia en nuestro editor, recuerde que con CTRL + SPACE vera los campos que puede insertar

<img width="932" alt="image" src="https://user-images.githubusercontent.com/23094588/197885571-af34e9e0-2fc9-421a-bddf-3716af89d621.png">

<img width="1197" alt="image" src="https://user-images.githubusercontent.com/23094588/197885761-b2d96f0e-c4ae-40bd-96d8-9eb735b9fba4.png">

Así que esto configura nuestro objeto de información.

También tenemos una propiedad opcional **`termsOfService`**  añadamos eso también.

<img width="1154" alt="image" src="https://user-images.githubusercontent.com/23094588/197886774-21942735-5690-48ac-aba3-f71838132bc6.png">

Así que ahora es un objeto de información completamente completo y nuevamente estas propiedades tienen que coincidir.

Así que vea cómo son estos objetos, tenemos título, descripción y así sucesivamente. Estas son todas las propiedades que estoy proporcionando. Dentro tenemos el objeto de información con son sus propiedades y luego ese objeto de información tiene un objeto de contacto y también un objeto de licencia y podemos ver que esto corresponde, tenemos el objeto de información y luego estas son las diferentes propiedades, puede ver la especificación OpenAPI que dice que el contacto no es solo una cadena, en realidad es un objeto estructurado.

<img width="1364" alt="image" src="https://user-images.githubusercontent.com/23094588/197887587-7e44aa0d-0733-4507-8094-b83ce9e1c3ff.png">

**NOTA**: En nuestro Editor algunas propiedades las tengo entre apostrofes y otras no ¿Debe llevarlo siempre?

## OpenAPI Servers Object 03:37

In this video, we're gonna take a look at the next major component inside The OpenAPI specification that is the servers object. So you can see here in the middle of the screen we have a field name called the servers and that takes in Server Object.

So let's go ahead and take a look at the specification, you can see that servers.

This is an optional property so we don't have to specify it but we can. And what this is is a way to give your end users information about where the API is available. So let's go ahead and take a look at the Server Object and you can see here that it is an object representing a server.

And if we do specify we do need to give it a url that is required and then the other properties are optional. So let me scroll up here a little bit so you can see here is the servers property.

This is in YAML in the center of the screen there and you can see how we have a development staging and an API production server. So very simple implementation.

Now you do have an optional property here. Scroll up here, you can see that we have variables so let's take a quick look at that. I'm not gonna demonstrate this because I've never had a need to use the variables. So that is a feature where you can specify a variable and also give it an enumerated value something optional.

I've never had a need to do that but it is a feature of the OpenAPI specification.

But what I wanna do now is come over and what we wanna do is define the server block in our OpenAPI specification. So I'm gonna jump over to SwaggerHub.

And I'm just gonna come here, hit enter and we can see that we get servers like so. So that there's url that is the required property.

We're just gonna say https: and you'd see there I had that red warning until that was specified and now I can also come in here and say description and say Development Server and that's really all we need to do as far as defining that servers block.

And then on the right hand side of the screen we can see now I have a Servers option and if I had more than one listed there, I would have this option to do use it.

So some UI tools like this can actually reach out and call that Servers so anything to put it into your specification.

If you have like a sandbox or development server running and this will help your OpenAPI specification when it is running inside of swagger-ui, it allow people to actually exercise the API and get feedback from it.

So kind of handy to have.

So again just review that real quick.

Let's come back to the specification so the servers element and so the OpenAPI specification takes a list or an array of server objects and the url is a required property but the description and variables of those are optional properties.

And I did not go through the variables but that is a element there that you can use.

I've never personally had a need to use variables within the server properties.

<hr>

En este video, vamos a echar un vistazo al siguiente componente principal dentro de la especificación OpenAPI que es el objeto de los servidores **`servers`**. 

<img width="1348" alt="image" src="https://user-images.githubusercontent.com/23094588/197889100-fad638b9-4fa4-40a8-9fcd-0960013ec868.png">

Así que pueden ver aquí en el medio de la pantalla que tenemos un nombre de campo llamado servidores y que incluye el objeto del servidor. Así que avancemos y echemos un vistazo a la especificación, pueden ver esos servidores.

Esta es una propiedad opcional, por lo que no tenemos que especificarla, pero podemos hacerlo. Y esto es una forma de dar a sus usuarios finales información sobre dónde está disponible la API. Así que sigamos adelante y echemos un vistazo al objeto del servidor **`[Server Object]`** y pueden ver aquí que es un objeto que representa un servidor.

<img width="1308" alt="image" src="https://user-images.githubusercontent.com/23094588/197889519-59dd0530-6e33-4437-82f8-f7b2935cd9f3.png">

<img width="1138" alt="image" src="https://user-images.githubusercontent.com/23094588/197889615-f67ab634-d5e2-4630-9b98-af66b6570cc3.png">

Y si especificamos, necesitamos darle una URL que sea obligatoria y luego las otras propiedades son opcionales. 

Permítanme desplazarme un poco hacia abajo para que puedan ver que aquí está la propiedad de los servidores.

<img width="1032" alt="image" src="https://user-images.githubusercontent.com/23094588/197889898-e9d530d5-afac-44d8-a561-339a04ed8385.png">

Esto está en YAML en el centro de la pantalla y puede ver cómo tenemos una etapa de desarrollo y un servidor de producción de API. Así que una implementación muy simple.

<img width="1035" alt="image" src="https://user-images.githubusercontent.com/23094588/197890054-f2fb7951-1435-4ce7-bfb8-2ec53734ec95.png">

<img width="1029" alt="image" src="https://user-images.githubusercontent.com/23094588/197890347-7fa93691-afbd-4f5b-8050-b79353edd623.png">


Ahora tienes una propiedad opcional aquí. Desplácese hacia arriba aquí, puede ver que tenemos variables, así que echemos un vistazo rápido a eso. No voy a demostrar esto porque nunca tuve la necesidad de usar las variables. Esa es una característica en la que puede especificar una variable y también darle un valor enumerado algo opcional. Nunca tuve la necesidad de hacer eso, pero es una característica de la especificación OpenAPI.

Pero lo que quiero hacer ahora es venir y lo que queremos hacer es definir el bloque del servidor en nuestra especificación OpenAPI. Así que voy a saltar a SwaggerHub y solo voy a venir aquí, presionar enter y podemos ver que tenemos servidores así. Para que haya una URL que sea la propiedad requerida. (EN MI CASO AL CREARLO SE HABIA INSERTADO LOS SERVIDORES).

<img width="1129" alt="image" src="https://user-images.githubusercontent.com/23094588/197890691-ce8d6105-c616-4512-ae23-bd18fdfa6460.png">

Solo diremos https: y verás que tenía esa advertencia roja hasta que se especificó y ahora también puedo entrar aquí y decir descripción y decir Servidor de desarrollo y eso es realmente todo lo que tenemos que hacer en cuanto a definir que bloquean los servidores.

Y luego, en el lado derecho de la pantalla, podemos ver que ahora tengo una opción de Servidores y si tuviera más de uno en la lista, tendría esta opción para usarlo.

Entonces, algunas herramientas de interfaz de usuario como esta pueden comunicarse y llamar a esos servidores, así que cualquier cosa para ponerlo en su especificación.

Si tiene una sandbox o un servidor de desarrollo en ejecución y esto ayudará a su especificación OpenAPI cuando se ejecuta dentro de swagger-ui, permite que las personas realmente ejerzan la API y obtengan comentarios de ella.

Tan útil para tener. Así que, de nuevo, revísalo muy rápido.

Volvamos a la especificación, por lo que el elemento de servidores y la especificación OpenAPI toman una lista o una matriz de objetos de servidor y la URL es una propiedad requerida, pero la descripción y las variables de esas son propiedades opcionales.

<img width="1027" alt="image" src="https://user-images.githubusercontent.com/23094588/197891318-c52cc1b4-b722-4cf9-8ef8-8668333c4c69.png">


Y no revisé las variables, pero ese es un elemento que puedes usar. Personalmente, nunca tuve la necesidad de usar variables dentro de las propiedades del servidor.

## Assignment - Add Servers 1 preguntas

Aprenda a agregar servidores en OpenAPI.

<img width="572" alt="image" src="https://user-images.githubusercontent.com/23094588/197891799-a8c498da-8b78-49ed-9308-fd27e1ffc6b6.png">


Agregar dos servidores adicionales a la especificación OA3: 

* https://qa.example.com -  QA Control de calidad
* https://prod.example.com - Producción

Preguntas de esta tarea:

¿Cuántos servidores puede agregar a una especificación OpenAPI?

<img width="1190" alt="image" src="https://user-images.githubusercontent.com/23094588/197893014-40a6de76-60b8-4458-be3e-741586f9effb.png">

## OpenAPI Paths Object 06:26

This video we're gonna start to take a look at the paths object.

So this is the next major component within The OpenAPI specification. Remember we just looked at info servers and now we're taking a look at the paths object.

This is a required object so toggle over here.

Remember right now we do have this properly defined but it is defined as an empty array.

So there's really nothing to it but that satisfies the OpenAPI schema because that is a required property but it can be empty which makes our current specification valid as far as being a valid OpenAPI specification.

Let's take a little bit closer look at that.

So the PathsObject. So lets click onto that and we can see here that it holds an array of path item objects.

So it can be empty.

But we want these path item objects here and you really need field pattern on this,

this is important.

This is gonna be the path for your API so that that path on the server so remember like here we're

showing pets by id..

Here's a pets/mine.

So this one here I expect that would list my pets.

That's kind of what that is implying.

So there's a number of different paths that we can work against.

So now for under that we are going to have a path item object.

So let's take a closer look at the Path Item Object.

And this here this is a path item object.

And if you notice we have get, put, post, delete, options, head, patch, trace this ugly looks just like the

http verb.

So that's exactly what this is.

And this is gonna be the verb operations.

Now let's take a closer look at this.

This is all the http operations that's how we specify that.

And then that property gets an operation object.

So let's take a closer look at a get and here's a number of parameters that are fields that we can specify

on this object does get a little complex.

And in this video we are gonna go through a very high level of this and then we'll start exploring out

these other features so we're gonna provide a very minimal definition of an operation.

So here what we wanna do is just do a very minimal and the only thing that we need to provide on this

is the response object.

So we need to provide a response and here we can provide a default.

But I'm gonna do an HTTP Status Code.

I'll show you exactly how to do that.

And that is going to be a response object.

And here you can see this is going to give us a description, headers, content and links.

And the only property that is required is the description so we can do a very very simple implementation

of this.

So let me go through and show you how to do this.

I'm gonna come back over to the editor now and I'm going to get rid of that empty array like so and

now I can do.

I'm gonna do v1 for version one of API and this is a convention.

Let's do customers like so and you can see there the is now flashing red because it's not happy about that.

Gonna come down and do a get. So I'm specifying a get operation and now I can do responses like so I can

say 200 and I'm doing single quotes because I want that to be a string.

Now I can do a description like so and we'll say that is a list of customers like so you could see there

I took the web editor a second but it eventually resolved that and you can see here this is not we're

getting a little funny on the syntax and I think Optionally you can make that a string like that note

is something that you can do optionally but it is not required.

Often defined the past just like that.

So I'm saying /v1 for customers and for a get operation I'd have a response of 200

and description and if I had additional operations, just gonna show you that real quick

and I can say put.

So if you developed a RESTful API's, you can see here. Now I got the get an output so that's how we define

those multiple operations against this path.

I do not wanna do that. I just wanted to demonstrate that for you.

So you can see how this is coming together.

So again in the paths we now have a path operation against this

url v1/customers. I'm saying that is an HTTP get and I am expecting a response of 200 and

the description of that response is going to be List of Customers. I'm gonna come over to the right-hand side of the

screen to swagger UI. You can see now I have a default.

So I'm not specifying anything there yet.

I'm not sure where that property's coming from but we will get to that.

But now I have a get operation.

If I click on that we can see here that saying No parameters and other responses I have a 200

of List of Customers.

And if I had additional http codes that I wanted to list here I couldn't list them out and expand this

out.

But this is all stuff that we're gonna explore coming up in the course. The paths object is a very

versatile, very complex.

This is really where the meat and potatoes are of oOpenen API. In this video,

I just wanna get you introduced to it and we will be learning a lot more about the features of the

OpenAPI paths object.

<hr>

En este video, vamos a comenzar a echar un vistazo al objeto de rutas **`paths`**.

<img width="1022" alt="image" src="https://user-images.githubusercontent.com/23094588/197893592-cefa97e5-4616-439b-9e41-74992681c487.png">


Así que este es el próximo componente principal dentro de la especificación OpenAPI. Recuerde que acabamos de ver la información, servidores y ahora estamos echando un vistazo al objeto de rutas **`paths`**.

Este es un objeto obligatorio.

<img width="1035" alt="image" src="https://user-images.githubusercontent.com/23094588/197894026-dd5db122-141c-4104-a896-1b99ebec82e7.png">

Recuerde que en este momento tenemos esto correctamente definido, pero está definido como un array vacío.

<img width="602" alt="image" src="https://user-images.githubusercontent.com/23094588/197894249-27db69c3-1fff-4774-9c34-3bf5a4d373f8.png">

Entonces, realmente no hay nada que no satisfaga el esquema OpenAPI porque esa es una propiedad requerida pero puede estar vacío, lo que hace que nuestra especificación actual sea válida en cuanto a ser una especificación OpenAPI válida.

Echemos un vistazo un poco más de cerca a **Paths Object**, así que hagamos clic en eso y podemos ver aquí que contiene una matriz de objetos de elementos de ruta.

<img width="1031" alt="image" src="https://user-images.githubusercontent.com/23094588/197894595-26159698-a784-4d09-b1cb-1e10f607191e.png">

<img width="1039" alt="image" src="https://user-images.githubusercontent.com/23094588/197894871-997ec8cd-8e3b-4234-892d-88b3b8cfd453.png">

<img width="1032" alt="image" src="https://user-images.githubusercontent.com/23094588/197894958-2aa594ed-9e06-49fd-9c42-fece21c35ff3.png">


Entonces puede estar vacío, pero queremos estos objetos de elementos de ruta **`paths`** aquí y realmente necesita un patrón de campo (field pattern) en esto, esto es importante.

Esta será la ruta para su API para que esa ruta en el servidor recuerde que aquí estamos mostrando mascotas por id. Aquí hay una mascota/la mía.

<img width="1023" alt="image" src="https://user-images.githubusercontent.com/23094588/197895779-8d24e6d8-b04a-4991-a6a6-c66bd9149234.png">

Así que este de aquí espero que enumere a mis mascotas. Eso es un poco lo que eso implica. Entonces, hay varios caminos diferentes contra los que podemos trabajar.

Así que ahora vamos a tener un objeto de elemento de ruta.

Así que echemos un vistazo más de cerca al objeto de elemento de ruta.

<img width="793" alt="image" src="https://user-images.githubusercontent.com/23094588/197896272-2823b20f-0d30-4c35-8f2e-593d91d87218.png">

Y esto aquí es un objeto de elemento de ruta y si nota que tenemos **`get`**, **`put`**, **`post`**, **`delete`**, **`options`**, **`head`**, **`patch`**, **`trace`** estos son verbos **http**. Así que eso es exactamente lo que es esto. Y estas van a ser las operaciones del verbo.

Ahora echemos un vistazo más de cerca a esto. Estas son todas las operaciones http, así es como lo especificamos. Y luego esa propiedad obtiene un objeto de operación.

Así que echemos un vistazo más de cerca a un **`get`** vamos a pulsar en

<img width="1134" alt="image" src="https://user-images.githubusercontent.com/23094588/197896954-e46a0c04-c459-4a9f-b589-4bb4b614d721.png">


y aquí hay una serie de parámetros que son campos que podemos especificar

<img width="699" alt="image" src="https://user-images.githubusercontent.com/23094588/197897138-2944309d-c464-4caa-a449-bcdd05efa44d.png">

este objeto se vuelve un poco complejo.

Y en este video vamos a pasar por un nivel muy alto de esto y luego comenzaremos a explorar estas otras funciones, por lo que proporcionaremos una definición mínima de una operación. Así que aquí lo que queremos hacer es hacer un mínimo y lo único que tenemos que proporcionar en este 
es el objeto de respuesta **`response`**.

<img width="1032" alt="image" src="https://user-images.githubusercontent.com/23094588/197897444-f9b42980-368a-460e-959e-1991be885fd2.png">

<img width="1050" alt="image" src="https://user-images.githubusercontent.com/23094588/197897642-409a6bf2-ec7b-416e-bbaa-d0a37363713a.png">

Entonces, debemos proporcionar una respuesta y aquí podemos proporcionar un valor predeterminado. Pero voy a hacer un código de estado HTTP.

Te mostraré exactamente cómo hacerlo. Y eso va a ser un objeto de respuesta.

<img width="1056" alt="image" src="https://user-images.githubusercontent.com/23094588/197897894-2b0ebd14-0198-4c2f-b30b-58e4db7114fe.png">

Y aquí puede ver que esto nos dará una descripción, encabezados, contenido y enlaces. Y la única propiedad que se requiere es la descripción para que podamos hacer una implementación muy simple de esta.

Así que déjame pasar y mostrarte cómo hacer esto. Voy a volver al editor ahora y voy a deshacerme de esa matriz vacía así y ahora puedo hacer.

<img width="1176" alt="image" src="https://user-images.githubusercontent.com/23094588/197899025-68ff1111-5806-4653-84cf-b164e4b958f5.png">

Voy a hacer v1 para la versión uno de la API y esto es una convención. Hagamos que a los clientes les guste y pueden ver que ahora está parpadeando en rojo porque no está contento con eso. Voy a bajar y hacer un get. Así que estoy especificando una operación de obtención y ahora puedo hacer respuestas como para poder diga 200 y estoy entre comillas simples porque quiero que sea una cadena. Ahora puedo hacer una descripción como esta y diremos que es una lista de clientes como para que pueda ver allí

Tomé el editor web por un segundo pero finalmente resolvió eso y puedes ver del lado derecho esto no es que estemos poniéndome un poco divertido con la sintaxis y creo que opcionalmente puedes hacer que una cadena como esa nota es algo que puede hacer opcionalmente pero no es obligatorio.

A menudo define el pasado así. Así que estoy diciendo /v1 para clientes y para una operación de obtención tendría una respuesta de 200 y descripción y si tuviera operaciones adicionales, solo les mostraré eso muy rápido y puedo decir **`put`**.

<img width="1216" alt="image" src="https://user-images.githubusercontent.com/23094588/197899565-3e5c6b18-e1c3-41df-aa04-d637eaccdb1c.png">

Entonces, si desarrolló una **API RESTful**, puede ver aquí. Ahora obtuve una salida, así es como definimos esas múltiples operaciones contra este camino.

No quiero hacer eso. Solo quería demostrarte eso. Así que quitamos el **`put`**.

<img width="1180" alt="image" src="https://user-images.githubusercontent.com/23094588/197899946-c0f26468-80d2-400f-b66b-f56a6920092b.png">


Así que puedes ver cómo se está uniendo esto. Entonces, de nuevo en las rutas, ahora tenemos una operación de ruta contra este url v1/clientes. Estoy diciendo que es un HTTP get y espero una respuesta de 200 y la descripción de esa respuesta será Lista de clientes. Voy a pasar al lado derecho de la 
pantalla a swagger UI. Puedes ver que ahora tengo un valor predeterminado. Así que no estoy especificando nada allí todavía. No estoy seguro de dónde viene esa propiedad, pero llegaremos a eso.

Pero ahora tengo una operación get. Si hago clic en eso, podemos ver aquí que dice Sin parámetros y otras respuestas Tengo un 200 de Lista de Clientes. Y si tuviera códigos http adicionales que quisiera enumerar aquí, no podría enumerarlos y expandir esto afuera.

Pero esto es todo lo que vamos a explorar en el curso. El objeto paths es un objeto muy versátil, muy complejo.

Aquí es donde realmente están la carne y las papas de oOpenen API. En este video, Solo quiero que te lo presenten y aprenderemos mucho más sobre las características del Objeto de rutas OpenAPI.


## Assignment - List Beers 1 preguntas

<img width="548" alt="image" src="https://user-images.githubusercontent.com/23094588/197900688-540410f8-d3c0-48d3-845d-bd248206dc56.png">

Agregue una operación OpenAPI para enumerar cervezas

* Agregar nueva operación para url - /v1/beers
* HTTP GET method
* 200 response
* 404 (Not Found) response

Preguntas de esta tarea

¿El objeto de operación de OpenAPI tiene una propiedad en desuso?

Sí, hay una propiedad booleana en el objeto de operación que se usa para indicar si la operación está obsoleta.

<img width="660" alt="image" src="https://user-images.githubusercontent.com/23094588/197901210-0c0f4dfe-b82e-4762-91bd-d7b5fbceed7f.png">

<img width="1185" alt="image" src="https://user-images.githubusercontent.com/23094588/197901553-7e317624-de69-4c8f-9ec0-2e22ead87444.png">

## OpenAPI Quiz 6 preguntas
