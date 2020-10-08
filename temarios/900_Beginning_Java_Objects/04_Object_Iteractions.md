# 04 Interacciones entre Objetos

Como aprendió en el Capítulo 3, los objetos son los componentes básicos de un sistema de software orientado a objetos. En tal sistema, los objetos colaboran entre sí para lograr metas enun sistema común, similares a las hormigas en un hormiguero, o los empleados de una corporación, o las células de su cuerpo. Cada objeto tiene una estructura y una misión específicas; estas respectivas misiones se complementan entre sí para lograr la misión general del sistema en su conjunto.

En este capítulo, aprenderá

* Cómo se utilizan los métodos para especificar el comportamiento de un objeto
* Los diversos elementos del código que crean un método
* Cómo los objetos publican sus métodos como servicios para otros
* Cómo los objetos se comunican con uno, otro, y los servicios de otro para colaborar
* Cómo los objetos mantienen sus datos y cómo protegen sus datos para garantizar su integridad.
* El poder de los lenguajes OO tienen una característica conocida como **ocultación de información**, y cómo la ocultación de información se puede utilizar para limitar el efecto dominó en el código de una aplicación cuando los detalles privados de implementación de una clase cambian inevitablemente.

* Cómo un tipo especial de función conocida por un constructor puede usarse para inicializar el estado de un objeto cuando se instancia por primera vez

## Events Drive Object Collaboration - Los Eventos Impulsan la Colaboración de Objetos

En su forma más simple, el proceso de desarrollo de software orientado a objetos implica los siguientes cuatro pasos básicos:

1. Establecer adecuadamente los requisitos funcionales y la misión general de una aplicación.
2. Diseñar las clases apropiadas, sus estructuras de datos, comportamientos y relaciones entre sí, necesarias para cumplir con estos requisitos y misión.
3. Creación de instancias de estas clases para crear los tipos adecuados y el número de instancias de objetos
4. Configurar estos objetos en movimiento a través de **external triggering events- eventos desencadenantes externos**

Piense en un hormiguero: a primera vista, es posible que no vea ninguna actividad aparente. Pero si dejas caer una barra de chocolate cerca, una ráfaga de actividad comienza repentinamente cuando las hormigas se apresuran a recoger las "golosinas", así como a reparar cualquier daño que pueda haber sido causado si dejaste caer la barra de chocolate demasiado cerca del hormiguero!

Dentro de una aplicación orientada a objetos (el "hormiguero"), los objetos ("hormigas") pueden ser puestos en movimiento por un evento externo como

* El clic de un botón en la interfaz de usuario gráfica SRS, indica el deseo del alumno de registrarse en un curso en particular.
* La recepción de información de algún otro sistema automatizado, como cuando el SRS recibe una lista de todos los estudiantes que han pagado su matrícula del sistema de facturación de la universidad.

Tan pronto como un sistema OO ha detectado un evento desencadenante de este tipo, los objetos apropiados reaccionan, prestando servicios ellos mismos y/o solicitando servicios de otros objetos en forma de reacción en cadena, hasta que se haya logrado algún objetivo general de la aplicación. Por ejemplo, la solicitud para registrarse en un curso realizada por un usuario estudiante a través de la GUI de la aplicación SRS puede involucrar la colaboración de muchos objetos diferentes, como se ilustra en la Figura 4-1:

* Un objeto `Student` (una abstracción de un usuario estudiante ***real***)
* Un objeto `DegreeProgram` (programa de acuerdo) con el objetivo de garantizar que el curso solicitado sea realmente necesario para que el alumno pueda graduarse
* El objeto `Course` apropiado, para asegurarse de que haya disponible para el alumno en ese curso
* Un objeto `Classroom` (aula), que representa la sala en la que se realizará el curso, para verificar su capacidad de asientos.
* Un objeto `Transcript` (transcripción), específicamente, la `Transcript` del `Student` de interés, para asegurar que el estudiante haya cumplido con todos los requisitos previos del curso.

![04-01](images/04-01.png)

