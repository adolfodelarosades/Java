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
## OpenAPI Info Object 05:14
## OpenAPI Servers Object 03:37
## Assignment - Add Servers 1 preguntas
## OpenAPI Paths Object 06:26
## Assignment - List Beers 1 preguntas
## OpenAPI Quiz 6 preguntas
