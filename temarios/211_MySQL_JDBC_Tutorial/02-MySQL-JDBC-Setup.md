# Configuración del entorno de desarrollo MySQL JDBC

Este tutorial le muestra cómo configurar un entorno de desarrollo que lo ayude a trabajar con **MySQL** y **JDBC**. También ilustra cómo cargar una base de datos de muestra en **MySQL** para practicar en los tutoriales posteriores.

Para configurar el entorno de desarrollo, debe:

1. Descargue e instale **JDK** si no está disponible en su máquina local. Usaremos **Java JDK 8u45**.

2. Descargue e instale **NetBeans IDE**. Puede usar cualquier IDE de Java como **Eclipse** o **IntelliJ**, que también está bien. Elegimos **NetBeans IDE** porque es fácil de instalar y fácil de usar. Usaremos **NetBeans IDE versión 8.0.2**. **Oracle** también proporciona el uso de **NetBeans IDE** y **JDK** en un archivo de instalación, por lo que solo necesita descargar uno e instalar tanto **JDK** como **NetBeans**.

3. Descargue e instale **MySQL Connector/J**.


## Descargue e instale NetBeans IDE con JDK

Para descargar e instalar **NetBeans IDE con JDK**, siga los pasos a continuación:

Primero, debe ir a la página de descarga de **Oracle Java** y hacer clic en el botón de descarga de **NetBeans con JDK**. Se tarda unos minutos en completar la descarga.

![image](https://user-images.githubusercontent.com/23094588/221353843-ed5f5840-ef25-4053-a827-a769e890b3e2.png)

En segundo lugar, haga doble clic en el archivo de instalación y siga el proceso. Solo tiene que hacer clic en el botón **Next** hasta que se complete.

En tercer lugar, una vez que se completa la instalación, puede iniciarla haciendo doble clic en el icono del **IDE de NetBeans**.


## Descargue e instale MySQL Connector/J

Primero, vaya a la [página Download Connector/J](https://dev.mysql.com/downloads/connector/j/) en el sitio web mysql.com.

En segundo lugar, seleccione su plataforma adecuada. Usaremos la plataforma Windows(Yo MAC). Puede elegir su plataforma especificada en la lista desplegable Seleccionar plataforma.

![image](https://user-images.githubusercontent.com/23094588/221353984-b89860bb-3d3d-4fc2-94de-47781ccd26db.png)

En tercer lugar, haga doble clic en el archivo de instalación para instalar **MySQL Connector/J**. Una vez que se complete el proceso de instalación, puede encontrar el archivo **JAR** que incluirá en su aplicación Java como se muestra en la pantalla a continuación:

![image](https://user-images.githubusercontent.com/23094588/221354057-5c19cc62-42be-4c9d-b2ed-060212f7cd8e.png)

En caso de mi MAC el archivo lo tengo en 

![image](https://user-images.githubusercontent.com/23094588/221354109-de8f04a1-a676-40a7-bddd-2c13f243b441.png)


## Cargue la base de datos de ejemplo MySQL JDBC

Usaremos una base de datos de muestra nombrada **mysqljdbc** por el bien de la demostración. A continuación se ilustra el diagrama de la base de datos:

![image](https://user-images.githubusercontent.com/23094588/221354203-3e02f3ba-90fa-4453-97c2-8e0017784dd6.png)

Hay tres tablas en la base de datos de ejemplo.

1. **candidates**: almacena datos de candidatos como nombre(**`first_name`**), apellido(**`last_name`**), fecha de nacimiento(date of birth (**`dob`**), teléfono(**`phone`**) y correo electrónico(**`email`**).
2. **skills**: almacena las habilidades de los candidatos
3. **candidate_skills**: los vínculos de la tabla dinámica entre candidatos y habilidades

Puede descargar la base de datos de muestra a través del siguiente enlace:

[Descargue la base de datos de ejemplo MySQL JDBC](https://www.mysqltutorial.org/setting-up-mysql-jdbc-development-environment/#:~:text=Download%20MySQL%20JDBC%20Sample%20Database)

Para cargar la base de datos de ejemplo, puede realizar los siguientes pasos:

Haga clic en el ***icono Crear un nuevo esquema*** en la barra de herramientas.

![image](https://user-images.githubusercontent.com/23094588/221354523-7a25b0fb-1e0f-4f3c-94b8-a95c45de8fa2.png)

Ingrese el nombre del esquema, **`mysqljdbc`**, y haga clic en el botón Aplicar(apply)

![image](https://user-images.githubusercontent.com/23094588/221354580-15327e3d-2b2c-4dd1-8f42-aa78b2879ace.png)

**MySQL Workbench** abrirá un cuadro de diálogo para mostrarle la DDL statement para crear un nuevo esquema, simplemente haga clic en el botón **Apply**.

![image](https://user-images.githubusercontent.com/23094588/221354603-965c4c24-ca39-4441-a8f2-69bbce7dc6c5.png)

Haga clic en el botón Finalizar para completar el paso de creación del esquema.

![image](https://user-images.githubusercontent.com/23094588/221354634-e9f3fd2c-6dc7-47eb-9cb0-b56e08fa8baa.png)

Para cargar la estructura y los datos de la tabla, elija la base de datos **`mysqljdbc`**, haga clic con el botón derecho y elija Establecer como esquema predeterminado.

![image](https://user-images.githubusercontent.com/23094588/221354666-b4c76184-ded1-4ca5-8a68-1517d5da8076.png)

En el menú **File**, seleccione el elemento de menú **Run SQL Script…**.

![image](https://user-images.githubusercontent.com/23094588/221354710-5ef13dff-8f62-496a-be74-b747da263f52.png)

Busque la ubicación donde descargó el archivo de base de datos de muestra  **`mysqljdbc.sql`**, seleccione el archivo y haga clic en el botón **Open**.

![image](https://user-images.githubusercontent.com/23094588/221354747-242c0799-c7eb-47fc-9d01-f60ec6aa5881.png)

**MySQL Workbench** mostrará un cuadro de diálogo como el siguiente, simplemente haga clic en el botón **Run** para ejecutar el script.

![image](https://user-images.githubusercontent.com/23094588/221354774-596522eb-bdb2-4c89-bf44-115545388b04.png)

Una vez que el script se haya ejecutado correctamente, haga clic en el botón **Close**.

![image](https://user-images.githubusercontent.com/23094588/221354792-f65ef90f-0262-4a48-ada4-ba51ac710c68.png)

Para ver el resultado, haga clic en  **`mysqljdbc`** y haga clic en el botón Refresh. Verá que todas las tablas se cargaron correctamente.

![image](https://user-images.githubusercontent.com/23094588/221354829-ef24c242-dab7-459e-b921-f6f01d7a500e.png)

En este tutorial, le mostramos cómo configurar el entorno de desarrollo para trabajar con **JDBC** y **MySQL** y cargar la base de datos **`mysqljdbc`** 
de muestra.

## 💻 Cargue la base de datos de ejemplo MySQL JDBC en mi Ordenador.

Abrir **Workbeanch**.

![image](https://user-images.githubusercontent.com/23094588/221355671-3e0911df-7c97-427e-b611-81ae05257342.png)

Entro en **Local Instances**.

![image](https://user-images.githubusercontent.com/23094588/221355794-32229f47-6574-42c5-aae9-69b9b69df102.png)

Haga clic en el ***icono Create a new schema*** en la **toolbar** barra de herramientas.

![image](https://user-images.githubusercontent.com/23094588/221355123-a4158f77-4d1d-4f6e-aacc-3045b953d938.png)

![image](https://user-images.githubusercontent.com/23094588/221355902-2651aea7-5226-4760-9cb1-a441bdc3faa8.png)

Ingrese el nombre del schema, **`mysqljdbc`**, y haga clic en el botón **Apply**

![image](https://user-images.githubusercontent.com/23094588/221355936-c1927451-49d0-453a-b6bd-1c4f503c44bf.png)

**MySQL Workbench** abrirá un cuadro de diálogo para mostrarle la DDL statement para crear un nuevo esquema, simplemente haga clic en el botón **Apply**.

![image](https://user-images.githubusercontent.com/23094588/221355972-128591fa-9b54-449e-a421-71ac51cf955a.png)

Una vez que el script se haya ejecutado correctamente, haga clic en el botón **Close**.

![image](https://user-images.githubusercontent.com/23094588/221355999-4111c037-9159-4941-bb8e-ebb28960f33a.png)

Para cargar la estructura y los datos de la tabla, elija la base de datos **`mysqljdbc`**, haga clic con el botón derecho y elija **Set as Default Schema**(Establecer como esquema predeterminado).

![image](https://user-images.githubusercontent.com/23094588/221356042-90a6d9df-361e-45b8-97c8-458a9c61d263.png)

![image](https://user-images.githubusercontent.com/23094588/221356146-68cf7bce-5676-430e-9b2a-831a854860d7.png)

![image](https://user-images.githubusercontent.com/23094588/221356187-97700a85-ebfb-4f94-97b7-47394edcfae5.png)

En el menú **File**, seleccione el elemento de menú **Run SQL Script…**.

![image](https://user-images.githubusercontent.com/23094588/221356251-19e0d09e-ee00-43eb-989f-a5bff231571c.png)

Busque la ubicación donde descargó el archivo de base de datos de muestra  **`mysqljdbc.sql`**, seleccione el archivo y haga clic en el botón **Open**.

![image](https://user-images.githubusercontent.com/23094588/221356336-f6d58be3-2f70-42e4-bf37-c05ae8467a7a.png)

**MySQL Workbench** mostrará un cuadro de diálogo como el siguiente, simplemente haga clic en el botón **Run** para ejecutar el script.

![image](https://user-images.githubusercontent.com/23094588/221356355-8210d870-0a53-49a3-844d-5c926c03c482.png)

Una vez que el script se haya ejecutado correctamente, haga clic en el botón **Close**.

**NOTA:** En el Script hay un pequeño fallo en el orden de la creación de las tablas.

Para ver el resultado, haga clic en  **`mysqljdbc`** y haga clic en el botón **Refresh**. Verá que todas las tablas se cargaron correctamente.

![image](https://user-images.githubusercontent.com/23094588/221356801-db0c0a19-dc65-450e-b015-f755afc8bec8.png)

Tabla **candidates**

![image](https://user-images.githubusercontent.com/23094588/221356868-f9031c80-346d-49b7-af50-8858eb35afdf.png)

Tabla **skills**

![image](https://user-images.githubusercontent.com/23094588/221356964-fe3876a9-4c69-4857-9b60-d6708a76b6e9.png)

Tabla **candidate_skills**

![image](https://user-images.githubusercontent.com/23094588/221357011-5f2ffcce-7ad0-48b1-ad11-6d18c99e941a.png)



