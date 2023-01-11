# Introduction

* foreword
* preface
* acknowledgments
* about this book
* about the author
* about the cover illustration




![image](https://user-images.githubusercontent.com/23094588/211879449-e7597e75-5144-4e37-891b-b47687f1161d.png)

![image](https://user-images.githubusercontent.com/23094588/211879763-1eb27535-e07c-45d4-8565-bc8cdd001452.png)

## Prefacio - Foreword

Nacido como una alternativa a los **EJB** a principios de la década de 2000, **Spring Framework** superó rápidamente a su oponente con la simplicidad de su modelo de programación, la variedad de sus funciones y sus integraciones de bibliotecas de terceros. El ecosistema **Spring** creció a lo largo de los años hasta convertirse en el framework de desarrollo más amplio y maduro disponible en cualquier lenguaje de programación. Su principal competidor abandonó la carrera cuando **Oracle** detuvo la evolución de **Java EE 8** y la comunidad se hizo cargo de su mantenimiento a través de **Jakarta EE**.

Según encuestas recientes ( http://mng.bz/l9VB y http://mng.bz/B1Ar ), **Spring** es el framework subyacente a más de la mitad de las aplicaciones Java. Este hecho genera una enorme base de código que hace que sea fundamental para cualquier desarrollador de **Java** aprender **Spring**, ya que es inevitable que encuentre esta tecnología en su carrera. Llevo 15 años desarrollando aplicaciones con **Spring**, y hoy en día los equipos que entreno en cientos de empresas utilizan **Spring** casi todos.

La realidad es que, a pesar de ser tan popular, es bastante difícil encontrar material introductorio de calidad. La documentación de referencia tiene miles de páginas y describe todas las sutilezas y detalles que podrían ser útiles en escenarios muy específicos, por lo que no es una opción para un recién llegado. Si bien los videos y tutoriales en línea generalmente no logran involucrar al estudiante, muy pocos libros capturan la esencia del **Spring Framework**, y a menudo dedican largas páginas a debatir temas que resultan irrelevantes para los problemas que enfrenta el desarrollo de aplicaciones modernas. Con este libro, sin embargo, es muy difícil encontrar algo que quitar; todos los conceptos tratados son temas recurrentes en el desarrollo de cualquier aplicación **Spring**.

Se lleva suavemente al lector a un nivel suficiente para volverse rápidamente productivo en un proyecto basado en el **Spring Framework**. Mi propia experiencia entrenando a miles de empleados me mostró que la gran mayoría de los desarrolladores que trabajan con **Spring** hoy en día no ven las ideas tan claramente como las pinta este libro. Además, los desarrolladores desconocen las muchas trampas sobre las que este libro advierte a sus lectores. En mi opinión, este libro es una lectura obligada para cualquier desarrollador que comience con su primer proyecto **Spring**.

La atención con la que Laurenţiu anticipa las típicas preguntas que surgen en la mente del lector demuestra su amplia experiencia enseñando **Spring** en clase. Esta fluidez de enseñanza le permite al autor adoptar un tono cálido y personal que hace de este libro una lectura placentera y sin esfuerzo. El libro tiene una estructura clara y nítida, y realmente me encantó cómo los temas complejos se revelaron, explicaron y reiteraron progresivamente en los capítulos posteriores.

Este libro se destaca porque al lector también se le presentan preocupaciones fundamentales con respecto a un proyecto heredado que utiliza el **Spring Framework**. En un ecosistema dominado por **Spring Boot**, me resulta muy útil echar un vistazo debajo del capó. Por otro lado, el libro también introduce suavemente al lector a las tecnologías de última generación, como los clientes de **Feign** e incluso la programación reactiva.

Les deseo una agradable lectura, y nunca duden en ensuciarse las manos con algún código cada vez que crean que las cosas se complican.


## Prefacio - Preface

Compartir conocimientos y crear material de aprendizaje es un pasatiempo para mí. Además de ser desarrollador de software, también soy docente. Como capacitador de **Java** desde 2009, he enseñado **Java** a miles de desarrolladores con varios niveles de experiencia, desde estudiantes universitarios hasta desarrolladores experimentados en grandes corporaciones. En los últimos años, he llegado a considerar que **Spring** es algo que los principiantes deben aprender. Las aplicaciones de hoy en día ya no se implementan con lenguajes básicos: casi todo se basa en framworks. Dado que **Spring** es el framworks de aplicaciones más popular en el mundo de **Java** hoy en día, **Spring** es algo que un desarrollador debe aprender en sus primeros pasos de desarrollo de software.

Al enseñar **Spring** a los principiantes, me di cuenta de que todavía se trata como algo que aprendes solo cuando ya tienes algo de experiencia en codificación. Cuando comencé a escribir *Spring Start Here*, ya había muchos tutoriales, libros y artículos sobre el tema, pero mis alumnos continuaron diciéndome que encontraban esos materiales difíciles de entender. Me di cuenta de que el problema no era que el material de aprendizaje existente no fuera excelente, sino que no había una guía de estudio dedicada para un principiante absoluto, así que decidí escribir un libro que no considere a **Spring** como algo que aprendes después de tener algo de experiencia, sino algo que puede aprender con un conocimiento básico mínimo.

La tecnología cambia rápidamente. Pero no solo está cambiando la tecnología. También debemos considerar cómo podemos mejorar la forma en que enseñamos estas tecnologías. Hace algunos años, uno comenzaba a aprender los fundamentos del lenguaje y se empleaba como desarrollador sin siquiera saber qué es un framework. Pero hoy, estas cosas son diferentes. Aprender todos los detalles de un lenguaje por adelantado ya no es la forma de desarrollar rápidamente las habilidades que necesita para trabajar en un equipo de desarrollo de software. Ahora, recomiendo a los desarrolladores comenzar con los fundamentos y, una vez que se sientan cómodos con los conceptos básicos, comiencen a aprender un framework de aplicación. **Spring** es, en mi opinión, el mejor framework de aplicaciones para empezar a aprender. Comprender los conceptos básicos de **Spring** también abre puertas para aprender otras tecnologías.

Diseñé *Spring Start Here* para que sea el libro con el que desea comenzar a aprender el **Spring Framework**. Este libro lo guía paso a paso, brindándole todo el conocimiento teórico esencial, acompañado de ejemplos que aplican en la práctica los temas discutidos. Espero que este libro le brinde un valor significativo a usted, el lector, y lo ayude a aumentar rápidamente su conocimiento de **Spring** y le abra las puertas para un mayor aprendizaje.

## Agradecimientos - Acknowledgments

Este libro no sería posible sin la gran cantidad de personas inteligentes, profesionales y amigables que me ayudaron durante todo el proceso de desarrollo.

## Sobre este libro - About this book

Dado que abrió este libro, asumo que es un desarrollador de software en el ecosistema de **Java** que descubrió que es útil aprender **Spring**. Este libro le enseña los fundamentos de **Spring**, asumiendo que no sabe nada sobre frameworks y, por supuesto, sobre **Spring**.

Comenzará con lo que es un framework y luego aprenderá gradualmente los conceptos básicos de **Spring** con ejemplos aplicados. No solo aprenderá a usar los componentes y las capacidades del framework, sino que también aprenderá lo esencial de lo que sucede detrás de escena en estas capacidades. Saber cómo funciona el framework cuando usa un componente en particular lo ayuda a diseñar mejores aplicaciones y resolver problemas más rápido.

Cuando termine este libro, habrá aprendido las siguientes habilidades, que son muy relevantes en la implementación de aplicaciones:

* Configuración y uso del contexto **Spring** y la inyección de dependencias con **Spring**
* Diseño y uso de aspectos.
* Implementación de aplicaciones web
* Implementar el intercambio de datos entre aplicaciones
* Persistir datos
* Implementacion de Testing

Descubrirá que este libro es valioso por lo siguiente:

* Trabajando en una aplicación usando **Spring** para su trabajo
* Tener éxito en una entrevista técnica para un rol de desarrollador de Java
* Obtención de su certificación **Spring**

Incluso si el primer propósito de este libro no es prepararlo para una certificación de **Spring**, lo considero una lectura obligada antes de profundizar en los detalles que normalmente requiere un examen de certificación.

### Quién debería leer este libro

Este libro es para desarrolladores que comprenden la programación básica orientada a objetos y los conceptos de **Java** y desean aprender **Spring** o refrescar sus conocimientos básicos de **Spring**. No necesita tener experiencia previa con ningún framework, pero debe comprender **Java** porque este es el lenguaje que usamos a lo largo de los ejemplos del libro.

**Spring** es una de las tecnologías más encontradas en las aplicaciones de **Java** y probablemente se usará aún más en el futuro. Para un desarrollador de **Java**, esto hace que **Spring** sea un elemento imprescindible hoy en día. Aprender lo que le enseño en este libro lo ayudará a mejorar sus habilidades, le brindará los conocimientos básicos de **Spring** y las habilidades que necesita para aprobar con éxito una entrevista de **Java** y trabajar en una aplicación que utilice tecnologías de **Spring**. El libro también abre puertas para profundizar en el estudio de los detalles de **Spring** que son más complejos.

### Cómo está organizado este libro: una hoja de ruta(roadmap)

Este libro está dividido en dos partes que abarcan 15 capítulos. Comenzaremos nuestra discusión (en la primera parte del libro) con ejemplos sencillos para mostrarle cómo hacer que **Spring** conozca su aplicación. Luego, crearemos ejemplos que le permitan comprender el núcleo de cualquier aplicación **Spring** del mundo real. Una vez que terminemos con los conceptos básicos de **Spring Core**, analizaremos los conceptos básicos de **Spring Data** y **Spring Boot**.

Desde el capítulo 2 hasta el final de este libro, encontrará que los aspectos teóricos van acompañados de proyectos en los que aplicamos las nociones que discutimos. Explico el código en estos ejemplos fragmento por fragmento. Mi recomendación es que construyas estos ejemplos conmigo mientras lees. Luego, puedes comparar tu resultado con mi solución.

Como se presenta en la siguiente figura, diseñé los capítulos del libro para leerlos en el orden indicado. En los capítulos 2 a 5, donde analizamos el contexto de **Spring**, es posible que encuentre ejemplos predominantemente teóricos. Para cualquier persona con poca o ninguna experiencia con **Spring**, es esencial comenzar de esta manera. ¡No te preocupes! Presento los fundamentos de la manera más sencilla posible, y luego nuestros ejemplos y discusiones se vuelven gradualmente más sofisticados para reflejar el código listo para producción del mundo real.

<img width="931" alt="image" src="https://user-images.githubusercontent.com/23094588/211935540-e155f0d2-ad5b-4349-80eb-4e899561ffae.png">

**Figura 1** Si comienza con ningún (o muy poco) conocimiento sobre **Spring**, la mejor manera de leer el libro es comenzar con el primer capítulo y leer todo en orden.

Si ya comprende bien el ***contexto de Spring*** y ***Spring AOP***, puede omitir la parte 1 e ir directamente a la parte 2, "Implementación" (capítulos 7-15), como se presenta en la siguiente figura.

<img width="869" alt="image" src="https://user-images.githubusercontent.com/23094588/211935868-b6bde8b3-3d0e-4b6f-a71d-4d53dd29328f.png">

**Figura 2.** Si ya comprende la base del ***Spring framework*** y sabe cómo usar el ***contexto de Spring(Spring context)** y los ***aspectos de diseño(design aspects)***, puede comenzar con la parte 2, donde usamos las capacidades de Spring para implementar escenarios de duplicación de aplicaciones(apps mirroring scenarios) que enfrenta en sistemas del mundo real.

Una vez que termine de leer este libro, habrá aprendido muchas habilidades para desarrollar aplicaciones como un profesional. Aprenderá a conectarse a bases de datos utilizando las técnicas más comunes en la actualidad y aprenderá cómo hacer que las aplicaciones se comuniquen entre sí. Terminaremos el libro enseñando un tema crítico: las pruebas. Sazonaré el texto aquí y allá agregando historias de mi experiencia y notas con valiosos consejos.

Recuerda que **Spring** es un vasto universo, y un libro no te enseñará todo sobre él. Con este libro, comienza con el framework y aprende las habilidades fundamentales del uso de los valiosos componentes de **Spring**. A lo largo del libro, hago referencia, cuando corresponde, a otros recursos y libros que detallan los temas que discutimos. Le recomiendo encarecidamente que lea esos recursos y libros adicionales para ampliar su perspectiva sobre los temas discutidos.

### Sobre el código

El libro proporciona alrededor de 70 proyectos, en los que trabajaremos en los capítulos 2 al 14. Cuando trabajo en un ejemplo específico, menciono el nombre del proyecto, que implementa ese ejemplo. Mi recomendación es tratar de escribir su ejemplo desde cero y luego usar el proyecto provisto solo para comparar su solución con la mía. Este enfoque lo ayudará a comprender mejor los conceptos que está aprendiendo.

Cada uno de los proyectos está construido con **Maven**, lo que facilita la importación a cualquier IDE. Usé **IntelliJ IDEA** para escribir los proyectos, pero puede optar por ejecutarlos en **Eclipse**, **Netbeans** o cualquier otra herramienta de su elección. El ***Apéndice F*** le brinda una descripción general de las herramientas recomendadas.

Este libro contiene muchos ejemplos de código fuente, tanto en listados numerados como en línea con el texto normal. En ambos casos, el código fuente se formatea en una fuente de ancho fijo como esta para separarlo del texto ordinario. A veces, el código también está en negrita para resaltar el código que ha cambiado con respecto a los pasos anteriores del capítulo, como cuando se agrega una nueva función a una línea de código existente. En muchos casos, se ha reformateado el código fuente original; hemos agregado saltos de línea y rediseñado la sangría para acomodar el espacio de página disponible en el libro. En casos raros, incluso esto no fue suficiente, y los listados incluyen marcadores de continuación de línea ( ➥). Además, los comentarios en el código fuente a menudo se eliminan de las listas cuando el código se describe en el texto. Las anotaciones de código acompañan a muchos de los listados, destacando conceptos importantes.

### Foro de discusión liveBook

La compra de *Spring Start Here* incluye acceso gratuito a un foro web privado administrado por Manning Publications donde puede hacer comentarios sobre el libro, hacer preguntas técnicas y recibir ayuda del autor y de otros usuarios. Para acceder al foro, vaya a https://livebook.manning.com/#!/book/spring-start-here/discussion . También puede obtener más información sobre los foros de Manning y las reglas de conducta en https://livebook.manning.com/#!/discussion .

El compromiso de Manning con nuestros lectores es proporcionar un lugar donde pueda tener lugar un diálogo significativo entre lectores individuales y entre lectores y el autor. No es un compromiso de participación específica por parte del autor, cuya contribución al foro es voluntaria (y no remunerada). ¡Le sugerimos que intente hacerle algunas preguntas desafiantes al autor para que su interés no se desvíe! El foro y los archivos de debates anteriores estarán accesibles desde el sitio web de la editorial mientras el libro esté impreso.


## Sobre el Autor - About the author

Laurenţiu Spilcă es líder de desarrollo dedicado y capacitador en Endava, donde lidera el desarrollo de proyectos en el mercado financiero con usuarios en Europa, EE.UU. y Asia. Tiene más de 10 años de experiencia. Laurenţiu cree que es importante no solo ofrecer software de alta calidad, sino también compartir conocimientos y ayudar a otros a mejorar. Estas creencias lo han llevado a diseñar e impartir cursos relacionados con las tecnologías **Java** y realizar presentaciones y talleres. Su cuenta de Twitter es @laurspilca.


## Sobre la ilustración de la portada - About the cover illustration

La figura de la portada de *Spring Start Here* se titula “Femme d'ajaccio isle de Corse”, o una mujer de Ajaccio en la isla de Córcega. La ilustración está tomada de una colección de trajes de gala de varios países de Jacques Grasset de Saint-Sauveur (1757-1810), titulada Trajes de Différents Pays , publicada en Francia en 1797. Cada ilustración está finamente dibujada y coloreada a mano. La rica variedad de la colección de Grasset de Saint-Sauveur nos recuerda vívidamente cuán diferentes culturalmente eran las ciudades y regiones del mundo hace apenas 200 años. Aislados unos de otros, las personas hablaban diferentes dialectos e idiomas. En las calles o en el campo, era fácil identificar dónde vivían y cuál era su oficio o posición en la vida solo por su vestimenta.

La forma de vestir ha cambiado desde entonces y la diversidad por regiones, tan rica en la época, se ha desvanecido. Ahora es difícil distinguir a los habitantes de los diferentes continentes, y mucho menos a los diferentes pueblos, regiones o países. Quizás hemos cambiado la diversidad cultural por una vida personal más variada, ciertamente por una vida tecnológica más variada y acelerada.

En una época en la que es difícil distinguir un libro informático de otro, Manning celebra la inventiva y la iniciativa del negocio informático con portadas de libros basadas en la rica diversidad de la vida regional de hace dos siglos, revivida por Grasset de Saint- Los cuadros de Sauveur.

