# 2. Contenedor de inversión de control 42m

* Contenedor de IoC 13:01 
* Mi primer Bean 6:49 
* Inyeccion de dependencias: vía setter vs. vía constructor 12:58 
* Inyeccion automática 9:22 
* Contenido adicional  4

# 06 Contenedor de IoC 13:01 

[PDF 2-1_Contenedor_de_IoC.pdf](pdfs/)

## Resumen Profesor

### Posibles formas de configuración de metadatos

Spring nos permite configurar los metadatos a través de varias formas:

* XML
* Anotaciones
* Código Java (conocido como Java-Config).

A lo largo del curso cubriremos las 3 formas, si bien comenzaremos con XML.

### Dependencia Maven

Cabe recordar que la dependencia *maven* que necesitamos para comenzar a usar el *Spring Ioc container* es:

```html
<dependency>
  <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.0.8.RELEASE</version>
</dependency>
```

### ClassPathXMLApplicationContext vs. FileSystemXMLApplicationContext

En esta lección hemos visto el uso de ambas clases. Durante el resto de lecciones utilizaremos la primera de ellas.

## Transcripción

# 07 Mi primer Bean 6:49 

[PDF ](pdfs/)

## Resumen Profesor

### Cómo nombrar un bean

Un bean, normalmente, tiene un solo nombre; y este debe ser único en el contenedor donde esté registrado. Si necesitamos que tenga más de un nombre, deberíamos declarar un alias.

En XML, para indicar el nombre de un bean, podemos usar su propiedad `id`. Los nombres suelen seguir la notación *Camel Case*: `myBean`, `emailService`, ... Si queremos declararle algún alias, podemos usar la propiedad `name`, indicando los nombre separados por comas, punto y comas o espacios.

### Definición de un bean

Durante este ejemplo solo utilizaremos algunas de las propiedades necesarias de un bean, como el `id`, `name` o `class`. A continuación tenemos una lista más completa:

* `class`
* `name`
* `scope`
* `lazy-init`
* `depends-on`
* `init-method`
* `destroy-method`

## Transcripción

# 08 Inyeccion de dependencias: vía setter vs. vía constructor 12:58 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# 09 Inyeccion automática 9:22 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional  4

