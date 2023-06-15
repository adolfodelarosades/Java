# Core Servlets and JavaServer Pages, Volume 2: Advanced Technologies, Second Edition

By Marty Hall, Larry Brown, Yaakov Chaikin

![image](https://github.com/adolfodelarosades/Java/assets/23094588/22167ddc-7e99-4ed7-a218-89c1c87c9a76)

* **TIME TO COMPLETE**: 16h 19m
* **TOPICS**: Jakarta EE
* **PUBLISHED BY**: Pearson
* **PUBLICATION DATE**: December 2007
* **PRINT LENGTH**: 736 pages

**Java EE** es la tecnología elegida para aplicaciones de comercio electrónico, sitios Web interactivos y servicios habilitados para la Web. La tecnología **Servlet** y **JSP** proporciona el vínculo entre los clientes web y las aplicaciones del lado del servidor en esta plataforma. ***Core Servlets and JavaServer Pages, Volume 2: Advanced Technologies, Second Edition***, es la guía definitiva de las características y capacidades avanzadas proporcionadas por **Servlet** y **JSP**.

El Volumen 2 presenta capacidades avanzadas como tag libraries, filters, declarative security, JSTL, and Struts. Al igual que el primer volumen, enseña técnicas de vanguardia y mejores prácticas ilustradas con programas completos, en funcionamiento y completamente documentados.

El Volumen 2 explica en detalle las herramientas y técnicas avanzadas necesarias para crear aplicaciones robustas de clase empresarial. Aprenderá cómo controlar el comportamiento de la aplicación a través del archivo ***deployment descriptor web.xml***, cómo mejorar la seguridad de la aplicación a través de métodos declarativos y programáticos, y cómo usar filtros Servlet y JSP para encapsular el comportamiento común. También aprenderá cómo controlar los principales eventos del ciclo de vida de la aplicación, las mejores prácticas para usar JSTL y cómo crear custom tag libraries. El Volumen 2 concluye con una introducción detallada al Jakarta Struts framework.

El código fuente completo de todos los ejemplos está disponible de forma gratuita para su uso sin restricciones en www.volume2.coreservlets.com. Para obtener información sobre la capacitación en Java de Marty Hall, visite cursos.coreservlets.com.

El Volumen 1 presenta una cobertura completa de los Servlets y las especificaciones JSP, incluidos los HTTP headers, cookies, session tracking, JSP scripting elements, file inclusion, la MVC architecture, y el JSP expression language. También cubre HTML forms, JDBC y las mejores prácticas para el diseño y la implementación.

## Contents

### INTRODUCTION

* Who Should Read This Book
* Conventions
* About the Web Site
* ACKNOWLEDGMENTS
* ABOUT THE AUTHORS

### 1. USING AND DEPLOYING WEB APPLICATIONS

#### 1.1 Purpose of Web Applications

* Organization
* Portability
* Separation

#### 1.2. Structure of Web Applications

* Locations for Various File Types

#### 1.3. Registering Web Applications with the Server

* Registering a Web Application with Tomcat
* Registering a Web Application with Other Servers

#### 1.4. Development and Deployment Strategies

* Copying to a Shortcut or Symbolic Link
* Using IDE-Specific Deployment Features
* Using Ant, Maven, or a Similar Tool
* Using an IDE in Combination with Ant

#### 1.5. The Art of WAR: Bundling Web Applications into WAR Files

#### 1.6. Building a Simple Web Application

* Download and Rename app-blank to testApp
* Download test.html, test.jsp, and TestServlet.java
* Add test.html, test.jsp to the testApp Web Application
* Place TestServlet.java into the testApp/WEB-INF/classes/coreservlets Directory
* Compile TestServlet.java
* Declare TestServlet.class and the URL That Will Invoke It in web.xml
* Copy testApp to tomcat_dir/webapps
* Start Tomcat
* Access testApp with the URL of the Form http://localhost/testApp/someResource

#### 1.7. Sharing Data Among Web Applications

### 2. CONTROLLING WEB APPLICATION BEHAVIOR WITH WEB.XML

#### 2.1. Purpose of the Deployment Descriptor

#### 2.2. Defining the Header and the Root Element

#### 2.3. The Elements of web.xml

* Version 2.4
* Version 2.3

#### 2.4. Assigning Names and Custom URLs

* Assigning Names
* Defining Custom URLs
* Naming JSP Pages

#### 2.5. Disabling the Invoker Servlet

* Remapping the /servlet/ URL Pattern
* Globally Disabling the Invoker: Tomcat

#### 2.6. Initializing and Preloading Servlets and JSP Pages

* Assigning Servlet Initialization Parameters
* Assigning JSP Initialization Parameters
* Supplying Application-Wide Initialization Parameters
* Loading Servlets When the Server Starts

#### 2.7. Declaring Filters

#### 2.8. Specifying Welcome Pages

#### 2.9. Designating Pages to Handle Errors

* The error-code Element
* The exception-type Element

#### 2.10. Providing Security

* Designating the Authentication Method
* Restricting Access to Web Resources
* Assigning Role Names

#### 2.11. Controlling Session Timeouts

#### 2.12. Documenting Web Applications

#### 2.13. Associating Files with MIME Types

#### 2.14. Configuring JSP Pages

* Locating Tag Library Descriptors
* Configuring JSP Page Properties

#### 2.15. Configuring Character Encoding

#### 2.16. Designating Application Event Listeners

#### 2.17. Developing for the Clustered Environment

#### 2.18. J2EE Elements

### 3. DECLARATIVE SECURITY

#### 3.1. Form-Based Authentication

* Setting Up Usernames, Passwords, and Roles
* Telling the Server You Are Using Form-Based Authentication; Designating Locations of Login and Login-Failure Pages
* Creating the Login Page
* Creating the Page to Report Failed Login Attempts
* Specifying URLs That Should Be Password Protected
* Listing All Possible Abstract Roles
* Specifying URLs That Should Be Available Only with SSL
* Turning Off the Invoker Servlet

#### 3.2. Example: Form-Based Authentication

* The Home Page
* The Deployment Descriptor
* The Password File
* The Login and Login-Failure Pages
* The investing Directory
* The ssl Directory
* The admin Directory
* The NoInvoker Servlet
* Unprotected Pages

#### 3.3. BASIC Authentication

* Setting Up Usernames, Passwords, and Roles
* Telling the Server You Are Using BASIC Authentication; Designating Realm
* Specifying URLs That Should Be Password Protected
* Listing All Possible Abstract Roles
* Specifying URLs That Should Be Available Only with SSL

#### 3.4. Example: BASIC Authentication

* The Home Page
* The Deployment Descriptor
* The Password File
* The Financial Plan
* The Business Plan
* The NoInvoker Servlet

#### 3.5. Configuring Tomcat to Use SSL

#### 3.6. WebClient: Talking to Web Servers Interactively

#### 3.7. Signing a Server Certificate

* Exporting the CA Certificate
* Using WebClient with Tomcat and SSL

### 4. PROGRAMMATIC SECURITY

#### 4.1. Combining Container-Managed and Programmatic Security

* Security Role References

#### 4.2. Example: Combining Container-Managed and Programmatic Security

#### 4.3. Handling All Security Programmatically

#### 4.4. Example: Handling All Security Programmatically

#### 4.5. Using Programmatic Security with SSL

* Determining If SSL Is in Use
* Redirecting Non-SSL Requests
* Discovering the Number of Bits in the Key
* Looking Up the Encryption Algorithm
* Accessing Client X.509 Certificates

#### 4.6. Example: Programmatic Security and SSL

### 5. SERVLET AND JSP FILTERS

#### 5.1. Creating Basic Filters

* Create a Class That Implements the Filter Interface
* Put the Filtering Behavior in the doFilter Method
* Call the doFilter Method of the FilterChain Object
* Register the Filter with the Appropriate Servlets and JSP Pages
* Disable the Invoker Servlet

#### 5.2. Example: A Reporting Filter

#### 5.3. Accessing the Servlet Context from Filters

#### 5.4. Example: A Logging Filter

#### 5.5. Using Filter Initialization Parameters

#### 5.6. Example: An Access Time Filter

#### 5.7. Blocking the Response

#### 5.8. Example: A Prohibited-Site Filter

#### 5.9. Modifying the Response

* A Reusable Response Wrapper

#### 5.10. Example: A Replacement Filter

* A Generic Modification Filter
* A Specific Modification Filter

#### 5.11. Example: A Compression Filter

#### 5.12. Configuring Filters to Work with RequestDispatcher

#### 5.13. Example: Plugging a Potential Security Hole

#### 5.14. The Complete Filter Deployment Descriptor

### 6. THE APPLICATION EVENTS FRAMEWORK

#### 6.1. Monitoring Creation and Destruction of the Servlet Context

#### 6.2. Example: Initializing Commonly Used Data

#### 6.3. Detecting Changes in Servlet Context Attributes

#### 6.4. Example: Monitoring Changes to Commonly Used Data

#### 6.5. Packaging Listeners with Tag Libraries

#### 6.6. Example: Packaging the Company Name Listeners

#### 6.7. Recognizing Session Creation and Destruction

#### 6.8. Example: A Listener That Counts Sessions

* Disabling Cookies

#### 6.9. Watching for Changes in Session Attributes

#### 6.10. Example: Monitoring Yacht Orders

#### 6.11. Identifying Servlet Request Initialization and Destruction

#### 6.12. Example: Calculating Server Request Load

#### 6.13. Watching Servlet Request for Attribute Changes

#### 6.14. Example: Stopping Request Frequency Collection

#### 6.15. Using Multiple Cooperating Listeners

* Tracking Orders for the Daily Special
* Resetting the Daily Special Order Count

#### 6.16. The Complete Events Deployment Descriptor

### 7. TAG LIBRARIES: THE BASICS

#### 7.1. Tag Library Components

* The Tag Handler Class
* The Tag Library Descriptor File
* The JSP File

#### 7.2. Example: Simple Prime Tag

#### 7.3. Assigning Attributes to Tags

* Tag Attributes: Tag Handler Class
* Tag Attributes: Tag Library Descriptor
* Tag Attributes: JSP File

#### 7.4. Example: Prime Tag with Variable Length

#### 7.5. Including Tag Body in the Tag Output

* Tag Bodies: Tag Handler Class
* Tag Bodies: Tag Library Descriptor
* Tag Bodies: JSP File

#### 7.6. Example: Heading Tag

#### 7.7. Example: Debug Tag

#### 7.8. Creating Tag Files

#### 7.9. Example: Simple Prime Tag Using Tag Files

#### 7.10. Example: Prime Tag with Variable Length Using Tag Files

#### 7.11. Example: Heading Tag Using Tag Files

### 8. TAG LIBRARIES: ADVANCED FEATURES

#### 8.1. Manipulating Tag Body

#### 8.2. Example: HTML-Filtering Tag

#### 8.3. Assigning Dynamic Values to Tag Attributes

* Dynamic Attribute Values: Tag Handler Class
* Dynamic Attribute Values: Tag Library Descriptor
* Dynamic Attribute Values: JSP File

#### 8.4. Example: Simple Looping Tag

#### 8.5. Assigning Complex Objects as Values to Tag Attributes

* Complex Dynamic Attribute Values: Tag Handler Class
* Complex Dynamic Attribute Values: Tag Library Descriptor
* Complex Dynamic Attribute Values: JSP File

#### 8.6. Example: Table Formatting Tag

#### 8.7. Creating Looping Tags

#### 8.8. Example: ForEach Tag

#### 8.9. Creating Expression Language Functions

#### 8.10. Example: Improved Debug Tag

#### 8.11. Handling Nested Custom Tags

#### 8.12. Example: If-Then-Else Tag

### 9. JSP STANDARD TAG LIBRARY (JSTL)

#### 9.1. Installation of JSTL

#### 9.2. `c:out` Tag

#### 9.3. `c:forEach` and `c:forTokens` Tags

#### 9.4. `c:if` Tag

#### 9.5. `c:choose` Tag

#### 9.6. `c:set` and `c:remove` Tags

#### 9.7. `c:import` Tag

#### 9.8. `c:url` and `c:param` Tags

#### 9.9. `c:redirect` Tag

#### 9.10. `c:catch` Tag

### 10. THE STRUTS FRAMEWORK: BASICS

#### 10.1. Understanding Struts

* Different Views of Struts
* Advantages of Apache Struts (Compared to MVC with RequestDispatcher and the EL)
* Disadvantages of Apache Struts (Compared to MVC with RequestDispatcher and the EL)

#### 10.2. Setting Up Struts

* Installing Struts
* Testing Struts
* Making Your Own Struts Applications
* Adding Struts to an Existing Web Application

#### 10.3. The Struts Flow of Control and the Six Steps to Implementing It

* Struts Flow of Control
* The Six Basic Steps in Using Struts

#### 10.4. Processing Requests with Action Objects

* Understanding Actions
* Example: One Result Mapping
* Example: Multiple Result Mappings
* Combining Shared Condition (Forward) Mappings

#### 10.5. Handling Request Parameters with Form Beans

* Struts Flow of Control: Updates for Bean Use
* The Six Basic Steps in Using Struts
* Understanding Form Beans
* Displaying Bean Properties
* Example: Form and Results Beans

#### 10.6. Prepopulating and Redisplaying Input Forms

* Struts Flow of Control
* The Six Basic Steps in Using Struts
* Using Struts html: Tags
* Prepopulating Forms
* Example: Prepopulating Forms
* URL Design Strategies for Actions
* Redisplaying Forms
* Example: Redisplaying Forms

### 11. THE STRUTS FRAMEWORK: DOING MORE

#### 11.1. Using Properties Files

* Advantages of Properties Files
* Struts Flow of Control—Updates for Properties Files
* Steps for Using Properties Files
* Example: Simple Messages
* Dynamic Keys
* Parameterized Messages

#### 11.2. Internationalizing Applications

* Loading Locale-Specific Properties Files
* Setting Language Preferences in Browsers
* Example: Internationalizing for English, Spanish, and French
* Results

#### 11.3. Laying Out Pages with Tiles

* Tiles Motivations
* Prerequisites for Tiles
* The Four Basic Steps in Using Tiles
* Example: Simple Tiles
* Handling Relative URLs
* Example: e-boats Application

#### 11.4. Using Tiles Definitions

* Tiles Definitions Motivations
* The Five Basic Steps in Using Tiles Definitions
* Example: e-boats Application with Tiles Definitions

### 12. THE STRUTS FRAMEWORK: VALIDATING USER INPUT

#### 12.1. Validating in the Action Class

* Struts Flow of Control
* Performing Validation in the Action
* Example: Choosing Colors and Font Sizes for Resume

#### 12.2. Validating in the Form Bean

* Struts Flow of Control
* Performing Validation in the ActionForm
* Example: Choosing Colors and Font Sizes for a Resume (Take 2)
* Using Parameterized Error Messages
* Example: Validation with Parameterized Messages

#### 12.3. Using the Automatic Validation Framework

* Manual versus Automatic Validation
* Client-Side versus Server-Side Validation
* Struts Flow of Control
* Steps in Using Automatic Validation
* Example: Automatic Validation

### APPENDIX DEVELOPING APPLICATIONS WITH APACHE ANT

#### A.1. Summarizing the Benefits of Ant

#### A.2. Installing and Setting Up Ant

#### A.3. Creating an Ant Project

* Defining the Ant Project
* Writing Targets
* Assigning Tasks to Targets
* Running an Ant Target

#### A.4. Reviewing Common Ant Tasks

* The echo Task
* The tstamp Task
* The mkdir Task
* The delete Task
* The copy Task
* The javac Task

#### A.5. Example: Writing a Simple Ant Project

#### A.6. Using Ant to Build a Web Application

* Ant Dependencies

#### A.7. Example: Building a Web Application

* The prepare Target
* The copy Target
* The build Target

#### A.8. Using Ant to Create a WAR File

* The jar Task
* The manifest Task

#### A.9. Example: Creating a Web Application WAR File

* The war Target

### INDEX
