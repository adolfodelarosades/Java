# 5 Elementos orientados a producción 72m

* 19 Añadir una base de datos real: Postgresql 18:03 
* 20 Creación de un nuevo perfil de configuración 11:01 
* 21 Monitorización con Actuator 8:54 
* 22 Dockerización de nuestra aplicación 17:48 
* 23 Despliegue en Heroku 16:18 
* Contenido adicional 5

# 19 Añadir una base de datos real: Postgresql 18:03 

[PDF Base_de_datos_real__Postgresql.pdf](pdfs/17_Base_de_datos_real__Postgresql.pdf)

## Resumen Profesor

### Instalación de Postgresql con docker

Tenemos que ejecutar los siguientes comandos

```sh
docker pull postgres
docker run --name postrgresql1 -p 5432:5432 -e POSTGRES_PASSWORD=postgresql -d postgres
```

Las siguientes veces que queramos poner en ejecución el contenedor, podemos hacerlo o bien *a través del* Docker Explorer *de Spring Tool Suite* o con el siguiente comando:

```sh
docker start postgresql1
```

### Conexión a través del cliente *cli* psql

Una vez que el contenedor ha iniciado, podemos ejectuar el cliente psql a través del siguiente comando

```sh
docker exec -ti postgresql1 psql -U postgres -W postgres
```

### Instalación del cliente gráfico pgAdmin4

Se puede realizar también con Docker, a través de los siguientes comandos

```sh
docker pull dpage/pgadmin4
docker run --name pgadmin4 -p 5050:80 -e "PGADMIN_DEFAULT_EMAIL=user@domain.com" -e "PGADMIN_DEFAULT_PASSWORD=password" -d page/pgadmin4
```

En las siguientes ocasiones que queramos ponerlo en ejecución, debemos ejecutar

```sh
docker start pgadmin4
```

Para acceder, a través de nuestro navegador cargamos la http://localhost:5050.

*¡OJO! Cuando vayamos a crear la conexión con nuestra base de datos, si introducimos localhost como URL no será capaz de conectar, porque entendrá como local el propio contenedor donde se ejecuta el cliente pgAdmin. Si introducimos la IP de nuestro ordenador, podremos conectar con tranquilidad.*

## Transcripción

# 20 Creación de un nuevo perfil de configuración 11:01 

[PDF Perfiles.pdf](pdfs/18_Perfiles.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 21 Monitorización con Actuator 8:54

[PDF Actuator.pdf](pdfs/19_Actuator.pdf)

## Resumen Profesor

La dependencia necesaria para incluir Spring Boot Actuator en nuestro proyecto es:

```html
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

### *Endpoints*

Los *endpoints de Actuator* te permiten monitorear e interactuar con tu aplicación. Spring Boot incluye varios *endpoints* integrados y te permite agregar los tuyos propios. Por ejemplo, el *endpoit* `health` proporciona información básica de *salud* de la aplicación.

*La lista completa de endpoints la puedes encontrar en https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-features.html#production-ready-endpoints*

### Habilitar *endpoints*

Por defecto, la mayoría de los endpoints están habilitados. Si los quieres habilitar/deshabilitar, lo puedes hacer a través de propiedades. Por ejemplo, para habilitar el *endpoint* de `shutdown` lo haríamos así:

```sh
management.endpoint.shutdown.enabled=true
```

### Exponer *endpoints*

Si bien la mayoría de los endpoints están habilitados, solo unos pocos están expuestos a través de la web.

*La lista de endpoints expuestos por defecto y los que no lo están la puedes encontrar en https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-features.html#production-ready-endpoints-exposing-endpoints*

Si queremos exponer uno, varios o todos los enpoints, también lo podemos hacer a través de propiedades.

```sh
management.endpoints.web.exposure.include=*
management.endpoints.web.exposure.exclude=env,beans
```

Esto nos permite exponer todos, salvo `env` y `beans`

### Spring Boot Admin

Se trata de un proyecto no oficial que ofrece un GUI desarrollado en Angular.js para Spring Boot Actuator. Tiene un esquema de funcionamiento similar al de los microservicios.

Puedes encontrar información, el código fuente y screenshots sobre el proyecto en https://github.com/codecentric/spring-boot-admin.

## Transcripción

# 22 Dockerización de nuestra aplicación 17:48

[PDF Dockerizacion.pdf](pdfs/20_Dockerizacion.pdf)

## Resumen Profesor

### Versión mejorada de Dockerfile

Tal y como se propone en el tutorial de **Dockerización de una aplicación Spring Boot**, un fichero `jar` de una aplicación Spring Boot es por defecto, bastante pesado; este, además, suele tener varias capas, debido a como se realiza el empaquetado del propio `jar`. Si lo *desempacamos* y lo dividimos, podemos realizar una carga más rápida de nuestra aplicación. Esto lo podemos conseguir con el siguiente `Dockerfile`:

```sh
FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]
```

donde `hello.Application` es el nombre cualificado de la clase anotada con `@SpringBootApplication` en nuestro proyecto.

## Transcripción

# 23 Despliegue en Heroku 16:18 

[PDF Heroku.pdf](pdfs/21_Heroku.pdf)

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional 5

* [PDF Base_de_datos_real__Postgresql.pdf](pdfs/17_Base_de_datos_real__Postgresql.pdf)
* [PDF Perfiles.pdf](pdfs/18_Perfiles.pdf)
* [PDF Actuator.pdf](pdfs/19_Actuator.pdf)
* [PDF Dockerizacion.pdf](pdfs/20_Dockerizacion.pdf)
* [PDF Heroku.pdf](pdfs/21_Heroku.pdf)
