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

![19-01](images/19-01.png)
![19-02](images/19-02.png)
![19-03](images/19-03.png)
![19-04](images/19-04.png)
![19-05](images/19-05.png)
![19-06](images/19-06.png)
![19-07](images/19-07.png)
![19-08](images/19-08.png)
![19-09](images/19-09.png)
![19-10](images/19-10.png)
![19-11](images/19-11.png)
![19-12](images/19-12.png)
![19-13](images/19-13.png)
![19-14](images/19-14.png)
![19-15](images/19-15.png)
![19-16](images/19-16.png)

# 20 Creación de un nuevo perfil de configuración 11:01 

[PDF Perfiles.pdf](pdfs/18_Perfiles.pdf)

## Resumen Profesor

No existe.

## Transcripción

![20-01](images/20-01.png)
![20-02](images/20-02.png)
![20-03](images/20-03.png)
![20-04](images/20-04.png)
![20-05](images/20-05.png)
![20-06](images/20-06.png)
![20-07](images/20-07.png)
![20-08](images/20-08.png)
![20-09](images/20-09.png)

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

![21-01](images/21-01.png)
![21-02](images/21-02.png)
![21-03](images/21-03.png)
![21-04](images/21-04.png)
![21-05](images/21-05.png)
![21-06](images/21-06.png)
![21-07](images/21-07.png)
![21-08](images/21-08.png)

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

![22-01](images/22-01.png)
![22-02](images/22-02.png)
![22-03](images/22-03.png)
![22-04](images/22-04.png)
![22-05](images/22-05.png)

# 23 Despliegue en Heroku 16:18 

[PDF Heroku.pdf](pdfs/21_Heroku.pdf)

## Resumen Profesor

No existe.

## Transcripción

![23-01](images/23-01.png)
![23-02](images/23-02.png)
![23-03](images/23-03.png)
![23-04](images/23-04.png)
![23-05](images/23-05.png)
![23-06](images/23-06.png)

# Contenido adicional 5

* [PDF Base_de_datos_real__Postgresql.pdf](pdfs/17_Base_de_datos_real__Postgresql.pdf)
* [PDF Perfiles.pdf](pdfs/18_Perfiles.pdf)
* [PDF Actuator.pdf](pdfs/19_Actuator.pdf)
* [PDF Dockerizacion.pdf](pdfs/20_Dockerizacion.pdf)
* [PDF Heroku.pdf](pdfs/21_Heroku.pdf)
