# 1. Introduction to Microservices

* Technical requirements
* My way into microservices
   * Benefits of autonomous software components
   * Challenges with autonomous software components
   * Enter microservices
   * A sample microservice landscape
* Defining a microservice
* Challenges with microservices
* Design patterns for microservices
   * Service discovery
      * Problem
      * Solution
      * Solution requirements
   * Edge server
      * Problem
      * Solution
      * Solution requirements
   * Reactive microservices
      * Problem
      * Solution
      * Solution requirements
   * Central configuration
      * Problem
      * Solution
      * Solution requirements
   * Centralized log analysis
      * Problem
      * Solution
      * Solution requirements
   * Distributed tracing
      * Problem
      * Solution
      * Solution requirements
   * Circuit breaker
      * Problem
      * Solution
      * Solution requirements
   * Control loop
      * Problem
      * Solution
      * Solution requirements
   * Centralized monitoring and alarms
      * Problem
      * Solution
      * Solution requirements
* Software enablers
* Other important considerations
* Summary

Este libro no elogia ciegamente los microservicios. En cambio, se trata de cómo podemos usar sus beneficios mientras podemos manejar los desafíos de construir microservicios escalables, resistentes y manejables.

Como introducción a este libro, en este capítulo se tratarán los siguientes temas:

* Cómo aprendí sobre los microservicios y qué experiencia tengo de sus beneficios y desafíos
* ¿Qué es una arquitectura basada en microservicios?
* Desafíos con los microservicios
* Patrones de diseño para manejar desafíos
* Habilitadores de software que pueden ayudarnos a manejar estos desafíos
* Otras consideraciones importantes que no están cubiertas en este libro


## Requerimientos técnicos

No se requieren instalaciones para este capítulo. Sin embargo, puede que le interese echar un vistazo a las convenciones del modelo C4, https://c4model.com , ya que las ilustraciones de este capítulo están inspiradas en el modelo C4.

Este capítulo no contiene ningún código fuente.

## Mi camino hacia los microservicios

Cuando me enteré por primera vez del concepto de Microservicios en 2014, me di cuenta de que había estado desarrollando microservicios (bueno, más o menos) durante varios años sin saber que se trataba de microservicios. Participé en un proyecto que comenzó en 2009 en el que desarrollamos una plataforma basada en un conjunto de características separadas. La plataforma se entregó a varios clientes que la implementaron localmente. Para facilitar a los clientes la elección de las funciones que querían usar de la plataforma, cada función fue desarrollada como un **componente de software autónomo**; es decir, tenía sus propios datos persistentes y solo se comunicaba con otros componentes mediante API bien definidas.

Dado que no puedo discutir características específicas en la plataforma de este proyecto, he generalizado los nombres de los componentes, que están etiquetados desde el **Componente A** hasta el **Componente F**. La **composición** de la plataforma en un conjunto de componentes se ilustra a continuación:

<img width="962" alt="image" src="https://user-images.githubusercontent.com/23094588/211681470-f74ed1ae-d41f-490f-bb6c-6648f4277fc3.png">

En la ilustración, también podemos ver que cada componente tiene su propio almacenamiento para datos persistentes y no comparte bases de datos con otros componentes.

Cada componente se desarrolla usando **Java** y **Spring Framework**, empaquetado como un archivo ***WAR*** e implementado como una aplicación web en un contenedor web **Java EE**, por ejemplo, **Apache Tomcat**. Según los requisitos específicos del cliente, la plataforma se puede implementar en uno o varios servidores. Una implementación de dos nodos puede tener el siguiente aspecto:

<img width="995" alt="image" src="https://user-images.githubusercontent.com/23094588/211681694-2be4d3ec-2c77-4d82-be8e-e1214b7a87ae.png">


### Beneficios de los componentes de software autónomos

De este proyecto, aprendí que descomponer la funcionalidad de la plataforma en un conjunto de componentes de software autónomos proporciona un número de beneficios:

* Un cliente puede implementar partes de la plataforma en su propio entorno de sistema, integrándolo con sus sistemas existentes utilizando sus APIs bien definidas.
   El siguiente es un ejemplo en el que un cliente decidió implementar el **Componente A**, el **Componente B**, el **Componente D** y el **Componente E** de la plataforma e integrarlos con dos sistemas existentes en el entorno de sistemas del cliente, el **Sistema A** y el **Sistema B**:
   
   <img width="908" alt="image" src="https://user-images.githubusercontent.com/23094588/211682118-c0dfe57c-c113-4ef6-b15a-7bd84d4b6647.png">

* Otro cliente puede elegir reemplazar partes de la funcionalidad de la plataforma con implementaciones que ya existen en el entorno del sistema del cliente, potencialmente requiriendo cierta adopción de la funcionalidad existente en las APIs de la plataforma. El siguiente es un ejemplo en el que un cliente reemplazó el **Componente C** y el **Componente F** en la plataforma con su propia implementación: 

   <img width="881" alt="image" src="https://user-images.githubusercontent.com/23094588/211682306-41019c28-e756-4d9f-9f65-b5123af6704f.png">

* Cada componente de la plataforma se puede entregar y actualizar por separado. Gracias al uso de APIs bien definidas, un componente puede actualizarse a una nueva versión sin depender del ciclo de vida de los otros componentes.
   El siguiente es un ejemplo en el que el **Componente A** se actualizó de la versión **v1.1** a la **v1.2**. El **Componente B**, que llama al **Componente A**, no necesita actualizarse ya que utiliza una API bien definida; es decir, sigue siendo el mismo después de la actualización (o al menos es compatible con versiones anteriores):
   
   <img width="861" alt="image" src="https://user-images.githubusercontent.com/23094588/211682596-1989d952-35c4-4837-a6da-071fe1dc4f6e.png">

* Gracias al uso de APIs bien definidas, cada componente de la plataforma también se puede escalar a varios servidores independientemente de los otros componentes. El escalado se puede realizar para cumplir con los requisitos de alta disponibilidad o para manejar mayores volúmenes de solicitudes. En este proyecto específico, se logró mediante la configuración *manual* de balanceadores de carga frente a varios servidores, cada uno ejecutando un contenedor web Java EE. Un ejemplo en el que el **Componente A** se ha escalado a tres instancias es el siguiente:

   <img width="899" alt="image" src="https://user-images.githubusercontent.com/23094588/211682824-354b4078-f248-45e5-956b-8f89fe43ee6f.png">
   
### Desafíos con componentes de software autónomos

Mi equipo también aprendió que descomponer la plataforma introdujo una serie de nuevos desafíos que no estuvimos expuestos(al menos no en el mismo grado) al desarrollar aplicaciones monolíticas más tradicionales:

* Agregar nuevas instancias a un componente requería configurar manualmente los balanceadores de carga y configurar manualmente nuevos nodos. Este trabajo requería mucho tiempo y era propenso a errores.
* Inicialmente, la plataforma era propensa a errores causados por los otros sistemas con los que se comunicaba. Si un sistema dejaba de responder a las solicitudes que se enviaban desde la plataforma de manera oportuna, la plataforma rápidamente se quedaba sin recursos cruciales, por ejemplo, subprocesos del sistema operativo, específicamente cuando se exponía a una gran cantidad de solicitudes simultáneas. Esto provocó que los componentes de la plataforma se colgaran o incluso chocaran. Dado que la mayor parte de la comunicación en la plataforma se basa en la comunicación síncrona, el bloqueo de un componente puede provocar fallas en cascada; es decir, los clientes de los componentes fallidos también podrían fallar después de un tiempo. Este es conocido como una **cadena de fallas(chain of failures)**.
* Mantener la configuración en todas las instancias de los componentes consistente y actualizada rápidamente se convirtió en un problema, causando mucho trabajo manual y repetitivo. Esto llevó a problemas de calidad de vez en cuando.
* Monitoreando el estado de la plataforma en términos de problemas de latencia y uso de hardware (por ejemplo, uso de CPU, memoria, discos y la red) era más complicado en comparación con el monitoreo de una sola instancia de una aplicación monolítica.
* La recopilación de archivos de registro(log files) de varios componentes distribuidos y la correlación de eventos de registros relacionados de los componentes también fue difícil, pero factible ya que la cantidad de componentes era fija y conocida de antemano.

Con el tiempo, abordamos la mayoría de los desafíos que se mencionaron en la lista anterior con una combinación de herramientas desarrolladas internamente e instrucciones bien documentadas para manejar estos desafíos manualmente. La escala de la operación estaba, en general, a un nivel en el que los procedimientos manuales para lanzar nuevas versiones de los componentes y manejar problemas de tiempo de ejecución eran aceptables, aunque no fueran deseables.

### Enter microservices

Aprender sobre arquitecturas basadas en microservicios en 2014 me hizo darme cuenta de que también se habían llevado a cabo otros proyectos luchando con desafíos similares(en parte por razones distintas a las que describí anteriormente, por ejemplo, los grandes proveedores de servicios en la nube que cumplen con los requisitos de escala web). Muchos pioneros de microservicios habían publicado detalles de las lecciones que habían aprendido. Fue muy interesante aprender de estas lecciones.

Muchos de los pioneros inicialmente desarrollaron aplicaciones monolíticas que los hicieron muy exitosos desde una perspectiva empresarial. Pero con el tiempo, estas aplicaciones monolíticas se volvieron cada vez más difíciles de mantener y evolucionar. También se volvieron desafiantes para escalar más allá de las capacidades de las máquinas más grandes disponibles (también conocido como **escalado vertical**). Eventualmente, los pioneros comenzaron a encontrar formas de dividir las aplicaciones monolíticas en componentes más pequeños que se podían lanzar y escalar independientemente unos de otros. Escalando los componentes pequeños se pueden realizar mediante el **escalado horizontal**, es decir, implementando un componente en varios servidores más pequeños y colocando un equilibrador de carga delante de él. Si se realiza en la nube, la capacidad de escalado es potencialmente infinita: solo es cuestión de cuántos servidores virtuales traiga(dado que su componente puede escalar horizontalmente en una gran cantidad de instancias, pero hablaremos de eso más adelante).

En 2014, también aprendí sobre una serie de nuevos proyectos de código abierto que entregaron herramientas y frameworks que simplificaron el desarrollo de microservicios y podrían usarse para manejar los desafíos que vienen con una arquitectura basada en microservicios. Algunos de estos son los siguientes:

* Pivotal lanzó **Spring Cloud**, que envuelve partes de **Netflix OSS** para proporcionar capacidades como el descubrimiento de servicios dinámicos, la gestión de la configuración, el seguimiento distribuido, la ruptura de circuitos y más.
* También aprendí sobre **Docker** y la revolución de contenedores, que es excelente para minimizar la brecha entre el desarrollo y la producción. Ser capaz de empaquetar un componente no solo como un artefacto de tiempo de ejecución desplegable(por ejemplo, un archivo Java **`war`** o un **`jar`**), sino como una imagen completa, lista para lanzarse como un contenedor en un servidor que ejecuta Docker, fue un gran paso adelante para el desarrollo y las pruebas.

<hr>

## 💡 

Por ahora, piense en un contenedor como un proceso aislado. Aprenderemos más sobre los contenedores en el Capítulo 4, Implementación de nuestros microservicios mediante Docker.

<hr>

* Un motor de contenedores(container engine), como Docker, no es suficiente para poder utilizar contenedores en un entorno de producción. Se necesita algo que pueda garantizar que todos los contenedores estén en funcionamiento y que pueda escalar los contenedores en una cantidad de servidores, proporcionando así una alta disponibilidad y mayores recursos informáticos.
* Este tipo de productos es conocidos como **orquestadores de contenedores(container orchestrators)**. Varios productos han evolucionado en los últimos años, como **Apache Mesos**, **Docker en modo Swarm**, **Amazon ECS**, **HashiCorp Nomad** y **Kubernetes**. **Kubernetes** fue desarrollado inicialmente por Google. Cuando Google lanzó v1.0 en 2015, también donó Kubernetes a **CNCF**( https://www.cncf.io/ ). Durante 2018, **Kubernetes** se convirtió en una especie de estándar de facto, disponible tanto como un preempaquetado(pre-packaged) para uso local como un servicio de la mayoría de los principales proveedores de nube(cloud providers).

## 📖 

Como se explica en https://kubernetes.io/blog/2015/04/borg-predecessor-to-kubernetes/, Kubernetes es en realidad una reescritura basada en código abierto de un orquestador de contenedores interno, llamado **Borg**, utilizado por Google durante más de una década antes de que se fundara el proyecto Kubernetes.

<hr>

* En 2018 comencé a aprender sobre el concepto de **malla de servicios(service mesh)** y cómo una malla de servicios puede complementar un orquestador de contenedores para descargar aún más los microservicios de las responsabilidades para hacerlos manejables y resistentes.

### A sample microservice landscape

AQUIIIIIIII

## Defining a microservice
## Challenges with microservices
## Design patterns for microservices
### Service discovery
#### Problem
#### Solution
#### Solution requirements
### Edge server
#### Problem
#### Solution
#### Solution requirements
### Reactive microservices
#### Problem
#### Solution
#### Solution requirements
### Central configuration
#### Problem
#### Solution
#### Solution requirements
### Centralized log analysis
#### Problem
#### Solution
#### Solution requirements
### Distributed tracing
#### Problem
#### Solution
#### Solution requirements
### Circuit breaker
#### Problem
#### Solution
#### Solution requirements
### Control loop
#### Problem
#### Solution
#### Solution requirements
### Centralized monitoring and alarms
#### Problem
#### Solution
#### Solution requirements
## Software enablers
## Other important considerations
## Summary

