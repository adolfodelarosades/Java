# Introducción

En esta sección, respondemos la pregunta candente: "Entonces, ¿por qué pusieron eso en un libro de programación?"

### ¿Para quién es este libro?

Si puede responder “sí” a ***todas*** estas preguntas:

1. ¿Conoces Java? (No es necesario ser un gurú).

2. ¿Quiere aprender, comprender y recordar EJB, con el objetivo de aprobar el examen SCBCD y desarrollar componentes comerciales?

3. ¿Prefiere una conversación estimulante durante una cena a conferencias secas, aburridas y técnicas?

Este libro es para ti.

### ¿Quién debería probablemente alejarse de este libro?

Si puede responder "sí" a cualquiera ***de*** estos:

1. ¿Eres completamente nuevo en Java?

(No necesita ser avanzado, pero debe tener algo de experiencia. Si no es así, obtenga una copia de Head First Java, ahora mismo, hoy, y luego regrese y obtenga este libro).

<img width="270" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/4de6f6d6-eb38-4790-b501-48ed9db2e75a">

2. ¿Es usted un desarrollador de Java que busca un libro de referencia de EJB?

3. ¿Es usted un veterano de J2EE que busca técnicas de servidor ultra avanzadas, procedimientos específicos del servidor, patrones de diseño empresarial y código largo, complejo y sólido del mundo real?

4. ¿Tienes miedo de probar algo diferente? ¿Preferirías tener una endodoncia que mezclar rayas con cuadros? ¿Crees que un libro técnico no puede ser serio si se antropomorfizan los beans?

<img width="283" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/3170778e-7d33-49a9-a4ea-7aae04345235">

este libro ***no*** es para ti.

## Resources

[Supplemental Content](https://resources.oreilly.com/examples/9780596005719/?_gl=1%2a1e6quz%2a_ga%2aOTcwNTgzODk3LjE2NjY1NjY0NTM.%2a_ga_4WZYL59WMV%2aMTY4NDA5NzQ0NS44My4xLjE2ODQwOTkxMTkuNjAuMC4w)

## Una nota sobre los archivos complementarios

Los archivos complementarios y los ejemplos de este libro se pueden encontrar en http://examples.oreilly.com/9780596005719/ . Utilice un navegador web de escritorio estándar para acceder a estos archivos, ya que es posible que no se pueda acceder a ellos desde todos los dispositivos de lectura electrónica.

Todos los archivos de código o ejemplos a los que se hace referencia en el libro estarán disponibles en línea. Para los libros físicos que se envían con un disco adjunto, siempre que sea posible, hemos publicado todo el contenido de CD/DVD. Tenga en cuenta que, si bien proporcionamos la mayor cantidad de contenido multimedia posible a través de descargas gratuitas, a veces estamos limitados por restricciones de licencia. Dirija cualquier pregunta o inquietud a booktech@oreilly.com.

## Lo que necesitas para este libro.

Además de tu cerebro y un lápiz, necesitas Java, J2EE y una computadora. No necesita ninguna otra herramienta de desarrollo, como un entorno de desarrollo integrado (IDE). Un IDE con reconocimiento de beans puede protegerlo de algunos de los detalles que realmente importan (y en los que se le realizará una prueba), por lo que es mucho mejor que desarrolle el código del bean completamente a mano.  Una vez que realmente comprenda lo que está sucediendo, puede pasar a una herramienta que automatice algunos de los pasos de creación de beans. Le *recomendamos* que utilice una herramienta para crear el  XML deployment descriptor. Puede usar la herramienta de implementación de referencia j2EE o [xDoclet](https://xdoclet.sourceforge.net/xdoclet/index.html).

<hr>

**OBTENER J2EE**

* Si aún no tiene un J2SE SDK 1.3 o superior , lo necesita. Aunque no se garantiza que J2EE funcione con J2SE versión 1.4 o posterior, no debería tener problemas con J2SE 1.4. Pero la especificación garantiza SÓLO compatibilidad con J2SE 1.3. (¡Podrías ser probado en eso!)

* Si aún no tiene un servidor compatible con EJB 2.0, vaya a java.sun.com y descargue J2EE 1.3. Incluye el archivo JAR con toda la API de J2EE (incluidas las clases que necesitará para el desarrollo de EJB) y un servidor de implementación de referencia (RI) de práctica.

* ¡No te hagas con el nuevo J2EE 1.4! El examen se basa en J2EE 1.3, porque 1.4 es demasiado temprano en su vida para tener un uso generalizado en los negocios. Esperamos que muy pocos sistemas empresariales migren a J2EE 1.4 hasta finales de 2004 como muy pronto. Cuando la compatibilidad con J2EE 1.4 alcance una masa crítica, el examen se actualizará a la nueva especificación.

* El SDK de J2EE no incluye la documentación de la API y la necesita. Vuelva a java.sun.com y obtenga los documentos de la API de J2EE. También puede acceder a los documentos de API en línea, sin descargarlos, pero eso es una molestia.

* Una vez que haya descargado y desempaquetado/comprimido/lo que sea (depende de qué versión y para qué sistema operativo), debe agregar algunas variables de entorno, si va a utilizar J2EE RI como su servidor de práctica. La descarga incluye instrucciones, pero espere modificar su PATH y CLASSPATH y agregar nuevas entradas para J2EE_HOME y JAVA_HOME.

* Si vas a hacer el examen, necesitarás las especificaciones. Descargue la especificación EJB 2.0 (¡no 2.1!) y téngala a mano. No hay nada en el examen que no se menciona en la especificación. La mayoría de las respuestas de nuestro examen simulado hacen referencia a páginas específicas en la especificación, donde puede ir para obtener más información sobre por qué podría haberse perdido esa pregunta.

<hr>

***Java 2 Edición Estándar 1.3***

***Java 2 Enterprise Edition 1.3 (que incluye EJB 2.0)***


