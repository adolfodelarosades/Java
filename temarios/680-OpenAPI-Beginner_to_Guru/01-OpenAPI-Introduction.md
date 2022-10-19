# 1. OpenAPI Introduction 5 clases • 22 min

* Welcome 01:11
* Meet Your Instructor 03:48
* Getting the Most out of your OpenAPI Course 03:52
* Slack Group for OpenAPI: Beginner to Guru 00:59
* GitHub Workflow 12:20


## Welcome 01:11

I'd like to welcome you to my OpenAPI course. I'm hoping this course will be a very comprehensive course on how to use OpenAPI because it's such a critical tool for defining specifications for your APIs.

Now in this section on the course, what we're gonna do is just go through some basic housekeeping, get you introduced to the course, get you introduced to me, give you some advice on how to effectively complete this course.

So, just basic housekeeping in this section. And then in the next section, we are going to start looking at OpenAPI itself, get you some history on OpenAPI and some information about how OpenAPI actually came to be and then following sections, we'll go into actually starting to define some services in OpenAPI, start utilizing that OpenAPI specification, and defining an API in it and then after that, one of the great features of OpenAPI is having a very strong schema. We'll start getting some hands-on in that. But first, let's go in and take care of the basic housekeeping and then the next section will actually start diving into OpenAPI.

<hr>

Me gustaría darle la bienvenida a mi curso OpenAPI. Espero que este curso sea muy completo sobre cómo usar OpenAPI porque es una herramienta fundamental para definir las especificaciones de sus API.

![image](https://user-images.githubusercontent.com/23094588/196720276-4f3fc1ee-640c-4018-bdc2-30de7b00a202.png)

Ahora, en esta sección del curso, lo que vamos a hacer es revisar algunas tareas básicas de limpieza, presentarles el curso, presentarme, darles algunos consejos sobre cómo completar este curso de manera efectiva.

Entonces, solo conceptos básicos en esta sección. Y luego, en la siguiente sección, comenzaremos a ver OpenAPI en sí, le daremos un poco de historia sobre OpenAPI y alguna información sobre cómo se creó realmente OpenAPI y luego, en las siguientes secciones, comenzaremos a definir algunos servicios en OpenAPI, comience a utilizar esa especificación de OpenAPI y defina una API en ella y luego, una de las mejores características de OpenAPI es tener un esquema muy sólido. Empezaremos a ponernos manos a la obra en eso. Pero primero, entremos y ocupémonos de los conceptos básicos y luego la siguiente sección comenzará a sumergirse en OpenAPI.


## Meet Your Instructor 03:48

In this video, I thought I'd take a moment to introduce myself. I am the founder of Spring Framework Guru. This is a website I created way back in 2015, really dedicated to helping people learn Java and Spring technology. So Spring is a Java-based framework and using the enterprise quite a bit and within Java and Spring, it's very common language to be using to develop enterprise-grade web services and that's kind of what got me down on path of OpenAPI. I am working for a start-up. It's called the Velo payments. And as of November 2018, that is the name of the company. There's been some rumors that we might be rebranding. If you've ever lived in a start-up, it seems like about every six months or six to twelve months they like to rebrand. 

So, we've actually had the name for quite a while so we are officially overdue to rebrand. But right now, Velo Payments, I've led the effort to adopt OpenAPI within Velo payments. One of the hats that I wear the startup is I am on the integrations team and what this means is I have the responsibility for setting up our Developer Center and of the clients that we have that are gonna be integrating with our public facing APIs. I have the responsibility of not only onboarding them but working with them for their use of there APIs and supporting them as they use them 18 months ago or so, maybe not quite that long, we were using Spring REST Docs. Produced okay documentation. It had its limitations. It was not a standard. It would produce an HTML specification. It look nice on a web page but it was not a natural API specification. It did not nearly have 
the benefits that OpenAPI does. In this course we will be looking at those benefits of what those are, what open API brings to the table. Like I said I've led that adoptation, so I've written those and a lot of OpenAPI specifications for different API endpoints. So I do have a lot of experience in working with OpenAPI through my role of using it to communicate public facing APIs. If you think about having a public facing API, you can have a number of different technologies coming at a number of different skill levels, a number of different shops, languages, the works. 

So, as an API consumer, if you turn the tables as an API consumer, it becomes very important to have proper API documentation. So that's really what led me down the path to create this course for OpenAPI because I did see the benefits. I have seen the benefits of being in a start-up where we are actually using that. A little bit more about me, I live in Saint Petersburg, Florida. I actually reside right downtown. I walk everywhere or I bike everywhere. I'm also a very avid cyclist. Actually at the time of recording, I will be leaving actually tomorrow afternoon to Fort Myers Beach and then Thursday morning I will be doing an annual bike ride called 72 hours Key West. 

I'll be riding my bicycle 280 miles from Fort Myers Beach to Key West over a period of three days. But this is an annual fundraiser that I do. Raises some money for children in need and I also really enjoy the ride and the riders that I ride with. It's just a outstanding time. So coming up in the course, we are gonna cover a lot of ground on an OpenAPI. I'm really happy with how this course has turned out. And the information in this course, I'm really excited to present it to you. I think you're gonna have a lot of fun taking this course and learning about why you wanna be using OpenAPI in your organization.

<hr>

En este video, pensé en tomarme un momento para presentarme. Soy el fundador de Spring Framework Guru. Este es un sitio web que creé en 2015, realmente dedicado a ayudar a las personas a aprender la tecnología Java y Spring. Entonces, Spring es un framework basado en Java y usa bastante la empresa y dentro de Java y Spring, es un lenguaje muy común para desarrollar servicios web de nivel empresarial y eso es lo que me puso en el camino de OpenAPI. Estoy trabajando para una start-up, se llama Velo Payments y a partir de noviembre de 2018, ese es el nombre de la empresa. Ha habido algunos rumores de que podríamos cambiar de marca. Si alguna vez ha vivido en una nueva empresa, parece que cada seis meses o seis a doce meses les gusta cambiar de marca.

Entonces, en realidad hemos tenido el nombre durante bastante tiempo, por lo que oficialmente estamos atrasados en cambiar la marca. Pero en este momento, Velo Payments, lideré el esfuerzo de adoptar OpenAPI dentro de los pagos de Velo. Uno de los sombreros que uso en la puesta en marcha es que estoy en el equipo de integraciones y lo que esto significa es que tengo la responsabilidad de configurar nuestro Centro de desarrolladores y de los clientes que tenemos que se integrarán con nuestras API públicas. Tengo la responsabilidad no solo de incorporarlos, sino también de trabajar con ellos para el uso de sus API y brindarles asistencia cuando los usan hace aproximadamente 18 meses, tal vez no tanto, estábamos usando Spring REST Docs. Documentación bien producida. Tenía sus limitaciones. No era un estándar. Produciría una especificación HTML. Se veía bien en una página web, pero no era una especificación de API natural casi no tenía los beneficios que hace OpenAPI. 

En este curso, veremos esos beneficios de lo que son, lo que la API abierta trae a la mesa. Como dije, he liderado esa adopción, así que he escrito esas y muchas especificaciones de OpenAPI para diferentes puntos finales de API. Así que tengo mucha experiencia trabajando con OpenAPI a través de mi rol de usarlo para comunicar API públicas. Si piensa en tener una API de cara al público, puede tener varias tecnologías diferentes con diferentes niveles de habilidad, varias tiendas, idiomas, los trabajos.

Entonces, como consumidor de API, si cambia las tornas como consumidor de API, se vuelve muy importante tener la documentación de API adecuada. Eso es realmente lo que me guió por el camino para crear este curso para OpenAPI porque vi los beneficios. He visto los beneficios de estar en una empresa nueva donde realmente estamos usando eso.

Entonces, en el curso, vamos a cubrir mucho terreno en OpenAPI. Estoy muy contento de cómo ha quedado este curso. Y la información en este curso, estoy muy emocionada de presentársela. Creo que se divertirá mucho tomando este curso y aprendiendo por qué quiere usar OpenAPI en su organización.

## Getting the Most out of your OpenAPI Course 03:52

In this video, I'm gonna talk about how you can get the most out of this course. I'm gonna give you some tips about how to maximize your learning in the course. The number one tip that I have for people is glaringly obvious, take time to complete this course. I see the metrics on the course is people will purchase this course and actually never start it. I don't know why. I know people get busy with other stuff and distracted, so you're not gonna get any benefit out of this course if you never started. I also see a lot of people that will start into a course but they never finished the course. So, to get the most out of course, it means me being Captain Obvious, you have to take the course.

A lot of times it boils down to time management, so a pro tip that I have for you, put time on your calendar. Make a meeting with yourself to enhance your skills. So just go ahead and make that meeting, block that time and dedicate your time to completing this course. Now a couple of other tips that I have, go through and do the quizzes and also do the assignments. So you're gonna get a lot of benefit from learning by doing the coding exercises and also by applying your knowledge to the quizzes. This is proven in educational research.

I'm not just making this up because I actually do have a master's degree in education so having these different formats does reinforce what you've learned. So getting your hands on, taking the time and going through the coding exercises, what's gonna happen is you're going to retain the information a lot better. Now a couple housekeeping things. 

Swagger Hub, we are gonna be using Swagger Hub in the course to edit Open API specifications. This is a commercial product. It's free. You do have to register. It is free to use. It is not the focus of the course. I'm not gonna get into Swagger Hub itself a lot. It's got a lot of really cool features but I'm focusing the course on OpenAPI specifically. Now you do not need to register and use Swagger Hub. There are a couple alternatives. 

A Visual Studio Code is a really nice application. It's a IDE. It is free to download and use.  There are some OpenAPI plugins. This will help you with the OpenAPI schema. IntelliJ, also. I'm a big fan of IntelliJ. I use it almost every day in my work. There is a free Community Edition and IntelliJ also has some OpenAPI plugins that you can utilize to help you with the schema inside of it. 

At the end of the day, any text editor is gonna work just fine for working with the OpenAPI specification. Some popular ones are like Notepad, Text Wrangler, Sublime Text. You might have your own personal favorite. It's absolutely valid to skip over Swagger Hub and use one of these editors. Do not use Word or any other word processing program. What these will do, they'll create it into a document and you're not gonna have true yml. So, you do not wannao be doing that but go ahead and use any text editor that you like. Now another feature of the course is a exclusive Slack community. I encourage you to go ahead and join that because I will be on Slack and my teachers assistants will also be on Slack, also students. So, if you're having a problem with the course and you have a question, you can raise it there and get a prompt response. And in this section of the course, it's gonna be a separate section. You can go ahead and sign up for Slack. I'll send you an email.

So actually all automated in the background so you register and then some APIs in the background are gonna fire and get you enrolled in Slack. So in summary, number one tip, do the course. Make some time for yourself and actually work through the course. Do the exercises. Do the coding assignments. Embrace the course and go through it and learn a lot. And then also, it is your choice to use Swagger Hub or your preferred text editor. Either is gonna work just fine. And finally, I highly encourage you to go ahead and join the Slack community. We'll have a lot of people in there and if you run into a problem, have a question, the community, myself, or one of my teachers assistants will be there to help you out.

<hr>

![image](https://user-images.githubusercontent.com/23094588/196725339-b0b4c13c-94b2-4cea-8580-ed63b189d034.png)

En este video, voy a hablar sobre cómo puedes aprovechar al máximo este curso, te voy a dar algunos consejos sobre cómo maximizar tu aprendizaje en el curso. 

![image](https://user-images.githubusercontent.com/23094588/196725846-76970910-ecf9-4892-ad56-a93d297b9907.png)

El consejo número uno que tengo para las personas es muy obvio: ***tómese el tiempo para completar este curso***. Veo que las métricas del curso son que las personas comprarán este curso y en realidad nunca lo comenzarán no sé por qué. Sé que la gente está ocupada con otras cosas y se distrae, por lo que no obtendrá ningún beneficio de este curso si nunca comenzó. 

También veo a muchas personas que comenzarán un curso pero nunca terminaron el curso. Entonces, para aprovechar al máximo el curso, significa que yo soy el Capitán Obvio, ***tienes que hacer el curso***.

Muchas veces todo se reduce a la gestión del tiempo, así que tengo un consejo profesional para ti: pon tiempo en tu calendario. Haz una reunión contigo mismo para potenciar tus habilidades. Así que siga adelante y haga esa reunión, bloquee ese tiempo y dedique su tiempo para completar este curso. 

![image](https://user-images.githubusercontent.com/23094588/196726657-8087c2b5-619f-4265-b443-140907d51802.png)

Ahora un par de otros consejos que tengo, ***repase y haga los cuestionarios*** y también ***haga las tareas***. Por lo tanto, obtendrá un gran beneficio al ***aprender haciendo los ejercicios de codificación*** y también ***aplicando su conocimiento a las pruebas***. Esto se demuestra en la investigación educativa.

No me estoy inventando esto porque en realidad tengo una maestría en educación, por lo que tener estos diferentes formatos refuerza lo que has aprendido. Así que ponte manos a la obra, ***tómate el tiempo y realiza los ejercicios de codificación***, lo que sucederá es que ***vas a retener la información mucho mejor***. 

![image](https://user-images.githubusercontent.com/23094588/196727261-9b9ffc8f-90d5-4ebc-8c42-3fc4ffeae3fa.png)

Ahora un par de cosas de limpieza.

Usaremos **Swagger Hub** en el curso para editar las Especificaciones del API. Este es un producto comercial. Tienes que registrarte. Es de uso gratuito. No es el enfoque del curso. No voy a entrar mucho en Swagger Hub. Tiene muchas funciones realmente geniales, pero estoy enfocando el curso específicamente en **OpenAPI**. Ahora no necesita registrarse y usar Swagger Hub. 

![image](https://user-images.githubusercontent.com/23094588/196746893-a2d09299-e52a-4ca1-8202-eb5c1bbea7cc.png)

Hay un par de alternativas, **Visual Studio Code** es una aplicación realmente agradable, es un IDE. Es gratis para descargar y usar. Hay algunos complementos de **OpenAPI**. Esto le ayudará con el esquema de OpenAPI. 

**IntelliJ**, también. Soy un gran admirador de IntelliJ. Lo uso casi todos los días en mi trabajo. Hay una **Community Edition** gratuita de IntelliJ, también tiene algunos complementos de OpenAPI que puede utilizar para ayudarlo con el esquema que contiene.

Al final del día, cualquier **Editor de Texto** funcionará bien para trabajar con la especificación OpenAPI. Algunos populares son **Notepad**, **Text Wrangler**, **Sublime Text**. Es posible que tenga su editor favorito. Es absolutamente válido saltarse **Swagger Hub** y usar uno de estos editores. 

No utilice **Word** ni ningún otro programa de procesamiento de textos. Lo que estos harán, lo crearán en un documento y no tendrás un verdadero **yml**. Entonces, no querrás estar haciendo eso, pero sigue adelante y usa cualquier editor de texto que te guste. 

![image](https://user-images.githubusercontent.com/23094588/196748129-d115787e-58b0-42e2-bc2a-00dab423868f.png)

Ahora, otra característica del curso es una exclusiva **Comunidad de Slack**. Los animo a seguir adelante y unirse porque estaré en **Slack** y mis asistentes de maestros también estarán en Slack, también estudiantes. Entonces, si tiene un problema con el curso y tiene una pregunta, puede plantearla allí y obtener una respuesta rápida. Y en esta sección del curso, será una sección separada. Puedes continuar y registrarte en Slack. Te enviaré un email.

Entonces, en realidad, todo está automatizado en segundo plano para que te registres y luego algunas API en segundo plano se activarán y te inscribirán en Slack. 

![image](https://user-images.githubusercontent.com/23094588/196748723-dc0af1c8-1db0-4d82-ac15-eee6215474b5.png)

Entonces, en resumen, el ***consejo número uno, haz el curso***. ***Tómese un tiempo para realmente trabajar en el curso***. ***Haz los ejercicios***. ***Haz las tareas de codificación***. Adopte el curso, revíselo y aprenda mucho. Y luego también, es su elección usar Swagger Hub o su editor de texto preferido. Cualquiera de los dos va a funcionar bien. Y, por último, te animo encarecidamente a que sigas adelante y te unas a la comunidad de Slack. Tendremos mucha gente allí y si se encuentra con un problema, tiene una pregunta, la comunidad, yo mismo o uno de los asistentes de mis maestros estaremos allí para ayudarlo.

## Slack Group for OpenAPI: Beginner to Guru

### Private Slack Channel Exclusive to this course!!

**Get the most out of this course by getting live help from myself and other students!** I've setup a Slack Channel, private and exclusive to students enrolled this course!

Slack is an awesome product to collaborate real time. I will be on Slack to answer your questions, and my teacher's assistants will also be there to help you with the course!

You can use Slack to:

* Get help with the course.
* Help others with problems they are having.
* Share Spring Framework news, tips, and tricks.
* See how others are using the Spring Framework.
* Or just say hi!

### To Get Your Invitation:

1. Go to this [link](go.springframework.gur) to request your invitation.
2. Check your email from an invitation from Slack. 
3. The email subject will be "John Thompson has invited you to join a Slack workspace"
4. Open the email and click on the link to join Spring Framework Guru on Slack.
5. Create your Slack account.
6. Click on the openapi channel and introduce yourself to the community!!
7. Once you've created your account, you can access the Slack Channel anytime here.

Using this Slack Channel you can interact with a whole community of Spring Framework Gurus!

**NOTE:** If you are already a member of the Spring Framework Guru Slack workspace, you will be added to the channel automatically, BUT - *you will not receive another email directly from Slack*.

Sign up and join the Spring Framework Guru Slack community! 

<hr>

### ¡Canal privado de Slack exclusivo de este curso!

**¡Aproveche al máximo este curso recibiendo ayuda en vivo de mí y de otros estudiantes!** ¡Configuré un canal de Slack, privado y exclusivo para los estudiantes inscritos en este curso!

Slack es un producto increíble para colaborar en tiempo real. ¡Estaré en Slack para responder a sus preguntas, y mis maestros asistentes también estarán allí para ayudarlo con el curso!

Puedes usar Slack para:

* Obtenga ayuda con el curso.
* Ayudar a otros con los problemas que están teniendo.
* Comparta noticias, consejos y trucos de Spring Framework.
* Vea cómo otros están usando Spring Framework.
* O simplemente decir hola!

### Para obtener su invitación:

1. Accede a este enlace para solicitar tu invitación.
2. Revisa tu correo electrónico desde una invitación de Slack.
3. El asunto del correo electrónico será "John Thompson te ha invitado a unirte a un espacio de trabajo de Slack".
4. Abra el correo electrónico y haga clic en el enlace para unirse a Spring Framework Guru en Slack.
5. Crea tu cuenta de Slack.
6. ¡Haz clic en el canal de openapi y preséntate a la comunidad!
7. Una vez que haya creado su cuenta, puede acceder al canal de Slack en cualquier momento aquí.

¡Usando este canal de Slack puedes interactuar con toda una comunidad de Spring Framework Gurus!

**NOTA:** Si ya es miembro del espacio de trabajo Spring Framework Guru Slack, se le agregará al canal automáticamente, PERO, *no recibirá otro correo electrónico directamente de Slack*.

¡Regístrese y únase a la comunidad Spring Framework Guru Slack!

## GitHub Workflow 12:20

USING GITHUB
GH Workflow
Forking Repos
Cloning Repos
Compare to Branch
Compare to Source


OK, now you guys are excited about getting to write some code with around spring framework.

GH WORKFLOW

First we're going to pause and take a look at our GitHub workflow.

Now, I've had a lot of students take this course. I think there's like over 40000 now that have enrolled through the course. And I get this question a lot about how should I be working with the GitHub repositories. 
Now, I do have a process that is very helpful for you.

GitHub is not a requirement for this course. It is something very helpful for you to have. If you are new to GitHub, check out Appendix A of the course. There's additional videos on that, links to videos. There's free content on GitHub. Other if you're not familiar with GitHub. But in this video, what I'm going to be doing is talking to you about the workflow. There's a specific workflow that can really help you out with the course. 
So I'm going to jump over to a little video here to talk about the workflow. And you get to see my mad skills with Adobe after effects, my very first little info video that I've done with after effects.

So I hope you enjoy this section and we will get you up to speed on how to use GitHub to your benefit while you're taking this course. 

All source code examples for the course are inside of GitHub. I use git branches for each lesson. Now you're going to get a starting branch, which is the state of the code. At the beginning of the lesson. Changes that I make inside the lesson are then safe to an ending branch. You'll find links to both branches in the course.

Resources using branches like this has two big benefits. 

First, I can go back and update for any errors or new releases of spring. 

Second, you can compare your work to my branches to make comparisons easier.

I recommend people use this workflow first for my repository here on GitHub account.

GitHub is completely free to use.

If you need help with GitHub, check out Appendix A of this course for a collection of videos about how to use GitHub once you have for my repository to your account.

Check out your Falke from your GitHub account to your own local workspace.

Start with the Master Branch and then follow along the coding exercises in the course.

The hands on coding will help you learn and absorb the material in the course.

If you have any problems, you can do a comparison from your own local workspace to the relevant branches

inside of my GitHub repository.

This will help you identify any differences.

Also, by having your own repository, you can share this with others if you run into any problems and

need help, or you can also show this to future employers to show them your work.

Now, if you're uncertain about these steps, don't worry.

In the remainder of this video, I'm going to show you each step, step by step.


FORKING REPOS

So the first thing we want to do in our workflow process is to fork out my repository to your own GitHub

account.

So your account is completely free if you don't have one.

Only takes a minute to sign up.

And I'm going to jump over to Chrome and show you exactly how to fork my repository to your own GitHub

account.

OK, for a repository is very simple to do.

I am signed into a different GitHub account and this is a very old account that I had and simulating

what you would do.

So I am at the spring framework, a repository, but on a different GitHub account.

So this is exactly what you would be to do to fork it.

I have to come up here and click on Fork.

And you asked me, where do I want to go?

I'm going to stay right there.

And it only takes a few seconds, you can see that it's saying that it's forking, we get this little

icon here and now this is forked into my GitHub repository.

And you can see here that it knows that it's been fought so says that it's coming from here.

So if you ever want to go back to my repository from your own GitHub repository, just simply click

on this and you'll see that get back to the original source, which is my repository.

But here this is a repository that you will be using for the course of the next step in the process

is to clone the repository or check it out of GitHub.

So I'm going to go through and show you exactly how to do this now.

Now, cloning the repository is also a very simple process.

So I'm still in my other GitHub account.

And this is where I talk to I'm going to come up here and say, clone, just clicking this to this,

copies of the URL over to the clipboard.

And you do have an option of https or S.H..

I like SSA in a POSIX environment being a Mac OS or Linux free on Windows https is probably going to

generally work out better for you.

And I'm going to jump over it.

I'm going to show you two different ways that we can clone first way we can just come over to the command

line and this assumes that you do have it installed on your machine.

So change to the directory that you wish to be working in for your workspace.

And all I got to do is issue the command git clone and then paste in that URL headhunter and you can

see that git is gone and clone that repository.

If I do a directory here, you can see there's that spring up and then there's the the working files

within it.

So now I'm ready to start developing on this.

The second way to clone out of GitHub as you can do it right from intelligence.

Only toggle over to ontology and show you that now.

So here I am in intelligence, just come up to file a new project from Version Control.

And I'm going to go ahead and base that.

And let's call those two, I think I have one in that temp directory, so let's go ahead and clone it.

And it's going to say yes.

Now, when it first opens it up, it might not detect that it is a MAVEN project and intelligence is

a little inconsistent on this.

So sometimes it does, sometimes it does not.

It might be on the particular flavor of intelligence I'm using that does not detect it, which it looks

like in this example.

It has not has it actually did so did pick up that it is MAVEN project if it does not.

Like I said, that it is a little random.

If it is not, just come in here right click and you'll see in here an option to add it as a maven project.

So like I said, it seems to be completely random.

Sometimes it picks it up as Mavin project.

When I was testing it, it did not.

Here it did.

So just one of those weird, quirky, quirky things that you see now and then.

But here now again, this is now clone to my local repository and I'm all ready to start developing

against it.

So the whole reason we fought the repository to your own and then cloned it is so that you can do comparison.

So being able to compare your your state of your code to my different branches that are going to be

on, there is a very powerful tool.

I'm going to go to intelligence now and show you exactly how easy that is to do.

Okay.

Doing it compares really easy just to for purposes here.

I'm going to go ahead and add a class and I always like this compact middle packages makes things a

little bit easier for us.

I'm going to come in here.

I'm just going to add an FU class because this just temporary I'm adding this and just as an example.

So we're going to go ahead and air quotes at it to get this is a throw away repository for me just for

purposes of this class.

So now what I want to do to do a comparison against GitHub, I come in here right click and the comparison

is going to be based on the folder that you are clicking on.

So I'm going to come up here and I'm going to compare the entire project.

I'm clicking on the root of the source folder.

Actually, I could do the top level project folder too, if I wanted to.

So it just come down here, click on Compare with Branch and if you had any other branches checked out

and you would see them here, origin means that the origin inside of GitHub.

So let's go ahead and take a look at no we'll do adding timeline.

That should give us a bunch of changes.

So what you can see here where things are Ingrey, that means that it's not there.

So they just come up here and say, book controller.

If I click on that, we can see that there is no local resource to compare against and green the food

job out of that.

And to show you here, this only exists in my repository locally.

Now here, this one in blue, that means there's differences.

So I have the file here and it's not shown.

So if I come in here and double click on this now, we can see here this is saying that that is the

remote version and here is my version.

So this line has been added.

So we're seeing the difference there.

And Ontology does a real nice job of showing you the differences.

So if you do have any differences, if you have something that's not working now, you can go and compare

your source code against my source code.

OK, you can see exactly how easy it is to do comparisons against branches inside of GitHub, inside

of your own repository.

But what happens if I make changes?

If I did some type of patch while you're taking the course, since you've worked very simple to do what

we can do is tell it to look at my repository as well.

Very simple command to do that.

And now when we do this from intelligence build, do comparisons to your own faught repository and to

my repository as well to see if I've changed anything, if I've done any updates to versions or possible

bug fixes.

So I'm going to show exactly how to set that up right now instead of indulging.

OK, so what we want to do is we want to add another remote repo to our GitHub configuration locally.

So here on the screen I have where I hit the fork that I did.

Now, what I want to do is I want to grab this guy right here, go to into the original repository.

And now I want to copy this URL here.

Now, I'm going to come back over to intelligency.

And A.J., I'm going to go into the terminal.

Now, this terminal location, you just need to do this from the command line and you want to issue

a very, very simple command again, you need to have get installed on your machine just to get.

Remote ad and then paste in that value there.

Made one mistake there, so I wanted to get a remote add and here I'm going to call it a Sevgi Repo,

I missed the name previously.

And then based in New York, also, I'm going to call that a Suchi repo for that.

And now that is happy now if I come up here and I want to do a get fetch.

So what this is going to do is it looks like it's dropping off the screen there.

Sorry about that.

So I'm going to go out and do a get furch, I could also do that from a command line just to get.

Fetch and that Tull's get to go out to the top of repository and pull down new information.

Now, if I come in here and I do get.

Compared compare with Branch and see, I have origin and then I have SFP Rebozo, these are all the

branches inside the original repository.

So Asaji Repo is going to be my repository.

Origin will be your repository inside of GitHub.

So this allows you to see any changes that I have made to the source code.

Since you talk to your own repo, any changes I made are not going to be pushed a year or so now so

I can see any changes that are made since you did the four.

<hr>
