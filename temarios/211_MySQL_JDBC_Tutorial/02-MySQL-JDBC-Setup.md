# Configuración del entorno de desarrollo MySQL JDBC

Este tutorial le muestra cómo configurar un entorno de desarrollo que lo ayude a trabajar con MySQL y JDBC. También ilustra cómo cargar una base de datos de muestra en MySQL para practicar en los tutoriales posteriores.

Para configurar el entorno de desarrollo, debe:

Descargue e instale JDK si no está disponible en su máquina local. Usaremos Java JDK 8u45.
Descargue e instale NetBeans IDE. Puede usar cualquier IDE de Java como Eclipse o IntelliJ, que también está bien. Elegimos NetBeans IDE porque es fácil de instalar y fácil de usar. Usaremos NetBeans IDE versión 8.0.2. Oracle también proporciona el uso de NetBeans IDE y JDK en un archivo de instalación, por lo que solo necesita descargar uno e instalar tanto JDK como NetBeans.
Descargue e instale MySQL Connector/J.
Descargue e instale NetBeans IDE con JDK
Para descargar e instalar NetBeans IDE con JDK, siga los pasos a continuación:

Primero, debe ir a la página de descarga de Oracle Java y hacer clic en el botón de descarga de NetBeans con JDK. Se tarda unos minutos en completar la descarga.

1 descargar netbeans ide con jdk
2 aceptar y descargar
En segundo lugar, haga doble clic en el archivo de instalación y siga el proceso. Solo tiene que hacer clic en el botón Siguiente hasta que se complete.

En tercer lugar, una vez que se completa la instalación, puede iniciarla haciendo doble clic en el icono del IDE de NetBeans.

Descargue e instale MySQL Connector/J
Primero, vaya a la página Descargar Conector/J en el sitio web mysql.com.

En segundo lugar, seleccione su plataforma adecuada. Usaremos la plataforma Windows. Puede elegir su plataforma especificada en la lista desplegable Seleccionar plataforma.

descargar MySQL Conector J
En tercer lugar, haga doble clic en el archivo de instalación para instalar MySQL Connector/J. Una vez que se complete el proceso de instalación, puede encontrar el archivo JAR que incluirá en su aplicación Java como se muestra en la pantalla a continuación:

archivo mysql conectorj
Cargue la base de datos de ejemplo MySQL JDBC
Usaremos una base de datos de muestra nombrada mysqljdbcpor el bien de la demostración. A continuación se ilustra el diagrama de la base de datos:

diagrama de base de datos de ejemplo mysql jdbc
Hay tres tablas en la base de datos de ejemplo.

candidatos: almacena datos de candidatos como nombre, apellido, fecha de nacimiento (fecha de nacimiento), teléfono y correo electrónico.
habilidades: almacena las habilidades de los candidatos
Candidate_skills: los vínculos de la tabla dinámica entre candidatos y habilidades
Puede descargar la base de datos de muestra a través del siguiente enlace:

Descargue la base de datos de ejemplo MySQL JDBC

Para cargar la base de datos de ejemplo, puede realizar los siguientes pasos:

Haga clic en el icono Crear un nuevo esquema en la barra de herramientas.

1 crear nuevo esquema
Ingrese el nombre del esquema, mysqljdbc, y haga clic en el botón Aplicar

2 ingrese el nombre del esquema
MySQL Workbench abrirá un cuadro de diálogo para mostrarle la declaración DDL para crear un nuevo esquema, simplemente haga clic en el botón Aplicar.

3 clic en el botón Aplicar
Haga clic en el botón Finalizar para completar el paso de creación del esquema.

4 clic en el botón Finalizar
Para cargar la estructura y los datos de la tabla, elija la base de datos mysqljdbc, haga clic con el botón derecho y elija Establecer como esquema predeterminado.

5 establecer mysqljdbc como el esquema predeterminado
En el menú Archivo, seleccione el elemento de menú Ejecutar secuencia de comandos SQL….

6 elija Ejecutar secuencia de comandos SQL
Busque la ubicación donde descargó el archivo de base de datos de muestra mysqljdbc.sql, seleccione el archivo y haga clic en el botón Abrir.

7 abrir archivo de secuencia de comandos
MySQL Workbench mostrará un cuadro de diálogo como el siguiente, simplemente haga clic en el botón Ejecutar para ejecutar el script.

8 Cuadro de diálogo Ejecutar secuencia de comandos SQL
Una vez que el script se haya ejecutado correctamente, haga clic en el botón Cerrar.

9 Ejecución de secuencia de comandos
Para ver el resultado, haga clic en mysqljdbc y haga clic en el botón Actualizar. Verá que todas las tablas se cargaron correctamente.

10 Actualizar base de datos de muestra
En este tutorial, le mostramos cómo configurar el entorno de desarrollo para trabajar con JDBC y MySQL y cargar la mysqljdbcbase de datos de muestra.
