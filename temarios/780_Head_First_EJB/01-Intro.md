# Capítulo 1. Introducción a EJB: Bienvenido a EJB

**Enterprise JavaBeans es fácil**. Bueno, al menos cuando compara EJB con lo que tendría que hacer para escribir su propio servidor empresarial escalable, transaccional, seguro y concurrente. En este capítulo, desarrollaremos, implementaremos y ejecutaremos una aplicación EJB, antes de profundizar en los detalles. Antes de que terminemos, veremos el uso, los beneficios y las características de EJB, y veremos (brevemente) cómo funcionan los contenedores EJB. Echaremos un vistazo de alto nivel a la arquitectura de EJB y aprenderemos sobre los tres tipos de beans. Cuanto más comprenda de este capítulo, menos tendrá que memorizar más adelante, así que no se lo salte. (Si es un experto en EJB, probablemente pueda salirse con la suya con un vistazo rápido).


## OBJETIVOS

Descripción general de Enterprise Javabeans

#### Oficial:

1.1 Identificar el uso, beneficios y características de la tecnología Enterprise Javabeans, para la versión 2.0 de la especificación EJB.


#### Lo que realmente significa:

Necesita saber cómo funciona EJB en general, para qué sirve, qué proporciona y qué no .

Debe comprender la arquitectura general de EJB y cómo esa arquitectura admite las funciones de EJB. Por ejemplo, debe saber que EJB admite transacciones, seguridad y simultaneidad, pero no garantiza el equilibrio de carga, la conmutación por error o la agrupación en clústeres. Debe saber que **EJB admite tres tipos de beans**: **session(de sesión)**, **entity(de entidad)** y **message-driven(controlados por mensajes)**, y que los beans de sesión pueden ser **stateless(sin estado)** o **stateful(con estado)**.


## ¿De qué tratan los EJB?

**Desarrollo basado en componentes**

Con enterprise javabeans, puede desarrollar componentes básicos ( --EJB components-- ) que usted u otra persona pueden ensamblar y volver a ensamblar en diferentes aplicaciones. Por ejemplo, puede crear un **Customer bean** ( ***bean*** es otra palabra para ***componente*** ) que representa a un cliente en una base de datos. Puede usar ese bean Customer en un programa de contabilidad, un sistema de carrito de compras de comercio electrónico, una aplicación de soporte técnico o prácticamente cualquier otra aplicación que pueda necesitar representar a un cliente. De hecho, con algunos beans, es posible que el desarrollador de beans y el ensamblador de la aplicación no trabajen para la misma empresa ni se conozcan entre sí.

Si es un desarrollador de beans, puede crear un **Order bean**, un **Payroll bean** o un **ShoppingCart bean** que los desarrolladores de alguna empresa no relacionada puedan comprar y usar para construir sus propias aplicaciones personalizadas.

Una belleza del desarrollo basado en componentes es que lleva la reutilización de código a un nivel completamente nuevo. En lugar de reutilizar las clases de Java , puede reutilizar una mayor parte de la funcionalidad. ¡A menudo, puede modificar la forma en que funciona un bean sin siquiera tocar su código Java! Aprenderá en este capítulo que cuando implementa un bean en un servidor, puede configurar y personalizar el bean de forma declarativa, a través de un *descriptor de implementación basado en XML*, para cambiar la forma en que se comporta el bean en tiempo de ejecución.

**Con el desarrollo basado en componentes, lleva la reutilización de código a un nivel completamente nuevo. Con el desarrollo OO, reutiliza las clases, pero con los componentes, reutiliza una mayor parte de la funcionalidad y puede personalizarlos sin tocar el código**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/53f13c79-0673-402b-aa56-91fb264a7863)

Fred ensambla una aplicación de compras en línea utilizando dos componentes que compró en Beans-R-Us, más un tercer componente que Fred desarrolló en su empresa.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/454729b6-5a24-4d1b-8ee2-fc73a73c57ef)

Bill ensambla una aplicación de soporte técnico utilizando dos componentes que compró de Beans-R-Us, más dos componentes que desarrolló él mismo.
