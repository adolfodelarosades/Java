# 3. Instalar y ejecutar Eclipse

Su máquina virtual contiene todo el software que necesita para crear **Bullhorn** (**Oracle Database 12c, SQL Developer y Java 1.8**), pero no contiene el IDE de Eclipse. Deberá descargarlo e instalarlo usted mismo. Afortunadamente, el proceso de instalación es muy sencillo.

#### INSTALE ECLIPSE EN LA MÁQUINA VIRTUAL

Para instalar Eclipse en la máquina virtual, deberá abrir Firefox y descargar el archivo de Eclipse. Luego, necesitarás extraer los archivos del archivo. A continuación, deberá ejecutar el programa de instalación que se incluye en los archivos comprimidos. Finalmente, abra Eclipse.

1. Desde la máquina virtual, abra el navegador web Firefox. Puede acceder a Firefox haciendo clic en el menú Aplicaciones y seleccionando el icono del navegador web Firefox.

2. A continuación, vaya a http://www.eclipse.org/downloads.

3. Haga clic en el botón naranja para descargar Eclipse. Instalarás la última versión, que se llama **Oxygen**.

4. Serás dirigido a otra página con un botón naranja Descargar. Haga clic en este también.

5. Seleccione la opción para abrir con Archive Manager cuando se muestre esta ventana. Archive Manager es el programa que extraerá sus archivos.

6. Se le pedirá que seleccione una carpeta en la que desea colocar los archivos extraídos. Busque la carpeta Inicio y seleccione Extraer.

7. Marque la opción para abrir la carpeta para ver los archivos. Una vez que vea los archivos extraídos, busque el archivo llamado **eclipse-install**.

8. Seleccione la opción para instalar Eclipse para Java EE.

9. Su carpeta debe ser /home/oracle/eclipse/jee-oxygen.

10. Haga clic en Iniciar.

11. Acepte el espacio de trabajo predeterminado. Aquí es donde se guardarán los archivos de su proyecto.

Acaba de instalar Eclipse Oxygen.

#### CÓMO CAMBIAR EL PUERTO EN TOMCAT

De forma predeterminada, Tomcat está configurado para escuchar en los siguientes números de puerto: 8005, 8080 y 8009. El puerto que más nos interesa es el 8080, ya que se utiliza para el acceso HTTP. Cuando ejecuta una aplicación web en Eclipse usando Tomcat, la URL se convierte en **`http://localhost:8080/ApplicationName`**. Sin embargo, a veces estos puertos son utilizados por otro software que se ejecuta en la computadora. Afortunadamente, Eclipse facilita el cambio de números de puerto.

1. Desde su proyecto web, en la vista Servidores, haga doble clic en el nombre del servidor.

2. Eso abrirá una página de configuración para Tomcat de la siguiente manera:

3. Observe que los números de puerto se muestran en la tabla de la derecha. Haz click para editar; Por ejemplo:

4. Una vez que cambie el número de puerto para HTTP de 8080 a 9000, debe presionar **`Ctrl + S`** para guardar el cambio y reiniciar el servidor.

Su aplicación ahora debería ejecutarse sin conflictos. Si surge un conflicto, entonces ha elegido otro puerto usado. Repita el proceso con un número de puerto diferente. Es mejor seleccionar un puerto dentro del rango de 1025 a 65535. Puede buscar "Números de puertos conocidos" para encontrar muchos artículos que explican el razonamiento aquí.
