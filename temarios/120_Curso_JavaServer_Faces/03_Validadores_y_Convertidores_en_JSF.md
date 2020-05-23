# 3. Validadores y Convertidores en JSF 35m
   * Validadores y mensajes 20:04 
   * Convertidores 15:52 
   * Contenido adicional 2
   
## Validadores y mensajes 20:04 

[Validadores y mensajes](pdfs/13-validadores-y-mensajes.pdf)

Las validaciones en JSF son necesarios para verificar que los datos introducidos por los usuarios son correctos (rango de números, longitud de cadenas de texto, formato de fechas, ...).

Tenemos varios mecanismos para realizar la validación de los datos:

* Añadir al atributo el tag required=”true”.

* Utilizar un validador estándar (validateLongRange, validateDoubleRange, validateLength, …).

* Utilizar un validador personalizado, mediante el tag validator.

* Visualizar los errores sobre los componentes JSF con el tag “h:message”.

* Visualizar todos los errores de la página completa con el tag “h:messages”.

#### faces-config.xml (Definir los mensajes propios o sobrescribir los internos de JSF)

Mediante la definición, en un fichero global de idioma (messages.properties, messages.properties_en, ...), de todos los mensajes a utilizar en nuestra la aplicación podemos implementar fácilmente la compatibilidad multidioma (Internacionalización I18n). Se especifica la localización del fichero messages pero omitiendo la extensión .properties.

El tag <message-bundle> se utilizará siempre que deseemos reemplazar los mensajes de advertencia/error predeterminados de JSF para los mecanismos de validación/conversión.

Siguiendo la estrategia de internacionalización, definimos el fichero “com.corejsf.messages.properties” para definir los mensajes.

El tag <resource-bundle> se utiliza para registrar un recurso localizado (msgs → “com.corejsf.messages.properties”) y que esté disponible en toda la aplicación JSF sin necesidad de especificar <f: loadBundle> en cada vista.

```xml
<?xml version="1.0"?>
<faces-config xmlns="http://java.sun.com/xml/ns/javaee" 
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://java.sun.com/xml/ns/javaee 
      http://java.sun.com/xml/ns/javaee/web-facesconfig_2_0.xsd"
   version="2.0">
   <application>
      <message-bundle>com.corejsf.messages</message-bundle>
      <resource-bundle>
         <base-name>com.corejsf.messages</base-name>
         <var>msgs</var>
      </resource-bundle>
   </application>
</faces-config>
```

Definir los mensajes propios a utilizar en la aplicación, en el idioma deseado.

Sobrescribir los mensajes internos de JSF.

```xml
title=An Application to Test Validation
enterPayment=Please enter the payment information 
amount=Amount
creditCard=Credit Card
expirationDate=Expiration date (Month/Year)
paymentInformation=Payment information
canceled=The transaction has been canceled.
process=Process
cancel=Cancel
back=Back
cardRequired=A credit card number is required.

javax.faces.component.UIInput.REQUIRED=Valor obligatorio (mensaje desde messages.properties)
```

#### Proyecto “validator” → index.xhtml

Recurso (msgs) disponible mediante su definición previa en “faces-config.xml”.

Atributo “required”, así validaremos que el campo “amount” contenga datos antes de poder enviar el formulario (Info: mensaje personalizado en messages.properties).

Convertidores (ver punto “Convertidores”)

Validadores estándar: validación de rango.

Mensajes de error asociados a los errores sobre los componentes JSF, especificados por el campo “for”, utilizando el tag “h:message”.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:f="http://java.sun.com/jsf/core" 
      xmlns:h="http://java.sun.com/jsf/html">
   <h:head>
      <h:outputStylesheet library="css" name="styles.css"/>
      <title>#{msgs.title}</title>
   </h:head>
   <h:body>
      <h:form>
         <h1>#{msgs.enterPayment}</h1>
         <h:panelGrid columns="3">
            #{msgs.amount}
            <h:inputText id="amount" label="#{msgs.amount}"
                         value="#{payment.amount}" required="true">
               <f:convertNumber minFractionDigits="2"/>
               <f:validateDoubleRange minimum="10" maximum="10000"/>
            </h:inputText>
            <h:message for="amount" styleClass="errorMessage"/>

            #{msgs.creditCard}
            <h:inputText id="card" label="#{msgs.creditCard}"
                         value="#{payment.card}" required="true"
                         requiredMessage="#{msgs.cardRequired}">
               <f:validateLength minimum="13"/>
            </h:inputText>
            <h:message for="card" styleClass="errorMessage"/>

            #{msgs.expirationDate}
            <h:inputText id="date" label="#{msgs.expirationDate}"
                         value="#{payment.date}" required="true">
               <f:convertDateTime pattern="MM/yyyy"/>
            </h:inputText>
            <h:message for="date" styleClass="errorMessage"/>
         </h:panelGrid>
         <h:commandButton value="#{msgs.process}" action="result"/>
         <h:commandButton value="#{msgs.cancel}" action="canceled" 
                          immediate="true"/>
      </h:form>
   </h:body>
</html>
```

#### Proyecto “validator2” → index.xhtml

Recurso (msgs) disponible mediante su definición previa en “faces-config.xml”.

Convertidores (ver punto “Convertidores”)

Validador personalizado: utilizando el tag ”…/> (ver “CreditCardValidator.java”). El nombre del validador debe estar definido en faces-config.xml o en el propio Bean utilizando: @FacesValidator("com.corejsf.Card") e implementar el método validate dentro de este Bean.

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:f="http://java.sun.com/jsf/core" 
      xmlns:h="http://java.sun.com/jsf/html">
   <h:head>
      <h:outputStylesheet library="css" name="styles.css"/>
      <title>#{msgs.title}</title>
   </h:head>
   <h:body>
      <h:form>
         <h1>#{msgs.enterPayment}</h1>
         <h:panelGrid columns="3">
            #{msgs.amount}
            <h:inputText id="amount" label="#{msgs.amount}"
                         value="#{payment.amount}">
               <f:convertNumber minFractionDigits="2"/>
            </h:inputText>
            <h:message for="amount" styleClass="errorMessage"/>

            #{msgs.creditCard}
            <h:inputText id="card" label="#{msgs.creditCard}"
                         value="#{payment.card}" required="true">
               <f:converter converterId="com.corejsf.Card"/>
               <f:validator validatorId="com.corejsf.Card"/>
            </h:inputText>
            <h:message for="card" styleClass="errorMessage"/>

            #{msgs.expirationDate}
            <h:inputText id="date" label="#{msgs.expirationDate}"
                         value="#{payment.date}">
               <f:convertDateTime pattern="MM/yyyy"/>
            </h:inputText>
            <h:message for="date" styleClass="errorMessage"/>
         </h:panelGrid>
         <h:commandButton value="#{msgs.process}" action="result"/>
      </h:form>
   </h:body>
</html>
```

#### Proyecto “validator2” → CreditCardValidator.java

Requisitos para utilizar un validador personalizado:

* Tag @FacesValidator()

* Método validate

```java
package com.corejsf;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

@FacesValidator("com.corejsf.Card")
public class CreditCardValidator implements Validator {
   public void validate(FacesContext context, UIComponent component, Object value) {
      if(value == null) return;
      String cardNumber;
      if (value instanceof CreditCard)
         cardNumber = value.toString();
      else 
         cardNumber = value.toString().replaceAll("\\D", ""); // remove non-digits
      if(!luhnCheck(cardNumber)) {
         FacesMessage message 
            = com.corejsf.util.Messages.getMessage(
               "com.corejsf.messages", "badLuhnCheck", null);
         message.setSeverity(FacesMessage.SEVERITY_ERROR);
         throw new ValidatorException(message);
      }
   }

   private static boolean luhnCheck(String cardNumber) {
      int sum = 0;

      for(int i = cardNumber.length() - 1; i >= 0; i -= 2) {
         sum += Integer.parseInt(cardNumber.substring(i, i + 1));
         if(i > 0) {
            int d = 2 * Integer.parseInt(cardNumber.substring(i - 1, i));
            if(d > 9) d -= 9;
            sum += d;
         }
      }
      
      return sum % 10 == 0;
   }
}
```

#### Proyecto “messages” → index.xhtml

Mensajes de error asociados todos los errores de la página completa con el tag “h:messages”.

Mensajes de error asociados a los errores sobre los componentes JSF, especificados por el campo “for”, utilizando el tag “h:message”.

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
   <h:head>
      <title>#{msgs.windowTitle}</title>
      <h:outputStylesheet library="css" name="styles.css"/>
   </h:head>
   <h:body>
      <h:form>
         <h:outputText value="#{msgs.greeting}" styleClass="emphasis"/>
         <br/>
         <h:messages errorClass="errors" layout="table"/>
         <h:panelGrid columns="3">
            #{msgs.namePrompt}:
            <h:inputText id="name" value="#{user.name}" required="true"
                         label="#{msgs.namePrompt}"/>
            <h:message for="name" errorClass="errors"/>
            #{msgs.agePrompt}:
            <h:inputText id="age" value="#{user.age}" required="true"
                         size="3" label="#{msgs.agePrompt}"/>
            <h:message for="age" errorClass="errors"/>
         </h:panelGrid>
         <h:commandButton value="#{msgs.submitPrompt}"/>
      </h:form>
   </h:body>
</html>
```

## Convertidores 15:52 

[Convertidores](pdfs/14-convertidores.pdf)

Los convertidores en JSF son necesarios para realizar funciones de conversión ente la Vista y el Modelo y viceversa.

Conversión entre Vista y Modelo, p.e. convertir un cadena (String) en una fecha (Date) y asignarla a un atributo de tipo Date de las clases del modelo.

Conversión entre Modelo y Vista, p.e. mostrar solo 1 decimal de un atributo tipo double del objeto del modelo que estamos representando.

Podemos utilizar 3 tipos de convertidores:

* Convertidores implícitos (tipos primitivos Integer o String, …), son conversiones que se realizan de forma automática al pasar datos entre la vista y el modelo.

* Convertidores explícitos, mediante el tag de componente JSF converter llamando a una clase de un tipo primitivo (`<f:converter converterId=”javax.faces.Integer” />`), o bien, utilizando tags predefinidos (convertNumber, convertDateTime, ...)

* Convertidores personalizados, utilizando una clase personalizada de tipo Converter mediante el uso de:

   * Atributo convert especificando la clase que va a realizar la conversión (<h:inputText id=”fecha” value=”#{usuario.nacimiento}” convert=”com.corefs.FechaConverter” />).
   
   * Clase de tipo Converter (implementa la interfaz javax.faces.convert.Converter) que contenga el código de la conversión. Esta clase se debe registrar en faces-config.xml o agregar la anotación @FacesConverter en dicha clase. Esta clase Converter deberá sobrescribir estos 2 métodos dependiendo del tipo de conversión requerida:
   
      * getAsObject (), convierte el String que se pasa como parámetro en un Objeto. Durante la fase “Apply Request Values”, cuando se procesan los métodos de decodificación de los componentes, la implementación de JavaServer Faces busca el valor local del componente en la solicitud y llama al método getAsObject.
      
      * getAsString (), convierte el Objeto que se pasa como parámetro en un String. Durante la fase “Render Response”, en la que se llaman los métodos de codificación de los componentes, la implementación de JavaServer Faces llama al método getAsString para generar la salida apropiada.

#### Proyecto “converter” → index.xhtml

Recurso (msgs) disponible mediante su definición previa en “faces-config.xml”.

Convertidor implícito, el valor introducido (número de la tarjeta) se tratará como un String (ver Bean “PaymentBean.java”).

Convertidores explícitos:

* Mínimo 2 decimales

* Formato de fecha MM/yyyy

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:f="http://java.sun.com/jsf/core" 
      xmlns:h="http://java.sun.com/jsf/html">
   <h:head>
      <h:outputStylesheet library="css" name="styles.css"/>
      <title>#{msgs.title}</title>
   </h:head>
   <h:body>
      <h:form>
         <h1>#{msgs.enterPayment}</h1>
         <h:panelGrid columns="3">
            #{msgs.amount}
            <h:inputText id="amount" label="#{msgs.amount}"
                         value="#{payment.amount}">
               <f:convertNumber minFractionDigits="2"/>
            </h:inputText>
            <h:message for="amount" styleClass="errorMessage"/>

            #{msgs.creditCard}
            <h:inputText id="card" label="#{msgs.creditCard}"
                         value="#{payment.card}"/>
            <h:message for="card" styleClass="errorMessage" />

            #{msgs.expirationDate}
            <h:inputText id="date" label="#{msgs.expirationDate}"
                         value="#{payment.date}">
               <f:convertDateTime pattern="MM/yyyy"/>
            </h:inputText>
            <h:message for="date" styleClass="errorMessage"/>
         </h:panelGrid>
         <h:commandButton value="#{msgs.process}" action="result"/>
      </h:form>
   </h:body>
</html>
```

#### Proyecto “converter” → PaymentBean.java

“card” es un atributo tipo String.

```html
package com.corejsf;

import java.io.Serializable;
import java.util.Date;

import javax.faces.bean.ManagedBean; 
   // or import javax.inject.Named;
import javax.faces.bean.SessionScoped; 
   // or import javax.enterprise.context.SessionScoped;

@ManagedBean(name="payment") // or @Named("payment")
@SessionScoped
public class PaymentBean implements Serializable {
   private double amount;
   private String card = "";
   private Date date = new Date();

   public void setAmount(double newValue) { amount = newValue; }
   public double getAmount() { return amount; }

   public void setCard(String newValue) { card = newValue; }
   public String getCard() { return card; }

   public void setDate(Date newValue) { date = newValue; }
   public Date getDate() { return date; }
}
```

#### Proyecto “converter2” → index.xhtml

Recurso (msgs) disponible mediante su definición previa en “faces-config.xml”.

Convertidor personalizado, ya que sobre cualquier instancia del objeto de la clase “CreditCard”, como es el atributo “card” de la clase “PaymentBean” (payment.card), se aplica el convertidor “CreditCardConverter” al especificar en su definición la anotación “@FacesConverter(forClass=CreditCard.class)”

Convertidores explícitos

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:f="http://java.sun.com/jsf/core" 
      xmlns:h="http://java.sun.com/jsf/html">
   <h:head>
      <h:outputStylesheet library="css" name="styles.css"/>
      <title>#{msgs.title}</title>
   </h:head>
   <h:body>
      <h:form>
         <h1>#{msgs.enterPayment}</h1>
         <h:panelGrid columns="3">
            #{msgs.amount}
            <h:inputText id="amount" label="#{msgs.amount}"
                         value="#{payment.amount}">
               <f:convertNumber minFractionDigits="2"/>
            </h:inputText>
            <h:message for="amount" styleClass="errorMessage"/>
            
            #{msgs.creditCard}
            <h:inputText id="card" label="#{msgs.creditCard}"
                         value="#{payment.card}">
            </h:inputText>
            <h:message for="card" styleClass="errorMessage"/>
            
            #{msgs.expirationDate}
            <h:inputText id="date" label="#{msgs.expirationDate}"
                         value="#{payment.date}">
               <f:convertDateTime pattern="MM/yyyy"/>
            </h:inputText>
            <h:message for="date" styleClass="errorMessage"/>
         </h:panelGrid>
         <h:commandButton value="#{msgs.process}" action="result"/>
      </h:form>
   </h:body>
</html>
```

#### Proyecto “converter2” → PaymentBean.java

“card” es un objeto de la clase “CreditCard”.

```java
package com.corejsf;

import java.io.Serializable;
import java.util.Date;

import javax.faces.bean.ManagedBean; 
   // or import javax.inject.Named;
import javax.faces.bean.SessionScoped; 
   // or import javax.enterprise.context.SessionScoped;

@ManagedBean(name="payment") // or @Named("payment")
@SessionScoped
public class PaymentBean implements Serializable {
   private double amount;
   private CreditCard card = new CreditCard("");
   private Date date = new Date();

   public void setAmount(double newValue) { amount = newValue; }
   public double getAmount() { return amount; }

   public void setCard(CreditCard newValue) { card = newValue; }
   public CreditCard getCard() { return card; }

   public void setDate(Date newValue) { date = newValue; }
   public Date getDate() { return date; }
}
```

#### Proyecto “converter2” → CreditCardConverter.java

Convertidor personalizado:

@FacesConverter(forClass=CreditCard.class)

implements Converter

Sobrescribe 2 métodos: Object getAsObject, String getAsString

```java
package com.corejsf;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;

@FacesConverter(forClass=CreditCard.class)
public class CreditCardConverter implements Converter {
   public Object getAsObject(FacesContext context, UIComponent component,
         String newValue) throws ConverterException {
      StringBuilder builder = new StringBuilder(newValue);
      boolean foundInvalidCharacter = false;
      char invalidCharacter = '\0';
      int i = 0;
      while (i < builder.length() && !foundInvalidCharacter) {
         char ch = builder.charAt(i);
         if (Character.isDigit(ch))
            i++;
         else if (Character.isWhitespace(ch))
            builder.deleteCharAt(i);
         else {
            foundInvalidCharacter = true;
            invalidCharacter = ch;
         }
      }

      if (foundInvalidCharacter) {
         FacesMessage message = com.corejsf.util.Messages.getMessage(
               "com.corejsf.messages", "badCreditCardCharacter",
               new Object[]{ new Character(invalidCharacter) });
         message.setSeverity(FacesMessage.SEVERITY_ERROR);
         throw new ConverterException(message);
      }

      return new CreditCard(builder.toString());
   }

   public String getAsString(FacesContext context, UIComponent component,
         Object value) throws ConverterException {
      // length 13: xxxx xxx xxx xxx
      // length 14: xxxxx xxxx xxxxx
      // length 15: xxxx xxxxxx xxxxx
      // length 16: xxxx xxxx xxxx xxxx
      // length 22: xxxxxx xxxxxxxx xxxxxxxx
      String v = value.toString();
      int[] boundaries = null;
      int length = v.length();
      if (length == 13)
         boundaries = new int[]{ 4, 7, 10 };
      else if (length == 14)
         boundaries = new int[]{ 5, 9 };
      else if (length == 15)
         boundaries = new int[]{ 4, 10 };
      else if (length == 16)
         boundaries = new int[]{ 4, 8, 12 };
      else if (length == 22)
         boundaries = new int[]{ 6, 14 };
      else
         return v;
      StringBuilder result = new StringBuilder();
      int start = 0;
      for (int i = 0; i < boundaries.length; i++) {
         int end = boundaries[i];
         result.append(v.substring(start, end));
         result.append(" ");
         start = end;
      }
      result.append(v.substring(start));
      return result.toString();
   }
}
```

#### Proyecto “validator2” → index.xhtml

Recurso (msgs) disponible mediante su definición previa en “faces-config.xml”.

Convertidor personalizado, otra forma de hacer lo mismo es mediante la llamada desde el componente JSF a la clase del convertidor.

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:f="http://java.sun.com/jsf/core" 
      xmlns:h="http://java.sun.com/jsf/html">
   <h:head>
      <h:outputStylesheet library="css" name="styles.css"/>
      <title>#{msgs.title}</title>
   </h:head>
   <h:body>
      <h:form>
         <h1>#{msgs.enterPayment}</h1>
         <h:panelGrid columns="3">
            #{msgs.amount}
            <h:inputText id="amount" label="#{msgs.amount}"
                         value="#{payment.amount}">
               <f:convertNumber minFractionDigits="2"/>
            </h:inputText>
            <h:message for="amount" styleClass="errorMessage"/>

            #{msgs.creditCard}
            <h:inputText id="card" label="#{msgs.creditCard}"
                         value="#{payment.card}" required="true">
               <f:converter converterId="com.corejsf.Card"/>
               <f:validator validatorId="com.corejsf.Card"/>
            </h:inputText>
            <h:message for="card" styleClass="errorMessage"/>

            #{msgs.expirationDate}
            <h:inputText id="date" label="#{msgs.expirationDate}"
                         value="#{payment.date}">
               <f:convertDateTime pattern="MM/yyyy"/>
            </h:inputText>
            <h:message for="date" styleClass="errorMessage"/>
         </h:panelGrid>
         <h:commandButton value="#{msgs.process}" action="result"/>
      </h:form>
   </h:body>
</html>
```

#### Proyecto “validator2” → CreditCardConverter.java

Convertidor personalizado:

* @FacesConverter(“com.corejsf.Card”)

* implements Converter

* Sobrescribe 2 métodos: Object getAsObject, String getAsString

```java
package com.corejsf;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;

@FacesConverter("com.corejsf.Card")
public class CreditCardConverter implements Converter {
   public Object getAsObject(
      FacesContext context,
      UIComponent component,
      String newValue)
      throws ConverterException {
      StringBuilder builder = new StringBuilder(newValue);
      boolean foundInvalidCharacter = false;
      char invalidCharacter = '\0';
      int i = 0;
      while (i < builder.length() && !foundInvalidCharacter) {
         char ch = builder.charAt(i);
         if (Character.isDigit(ch))
            i++;
         else if (Character.isWhitespace(ch))
            builder.deleteCharAt(i);
         else {
            foundInvalidCharacter = true;
            invalidCharacter = ch;
         }
      }

      if (foundInvalidCharacter) {
         FacesMessage message 
            = com.corejsf.util.Messages.getMessage(
               "com.corejsf.messages", "badCreditCardCharacter", 
               new Object[] { new Character(invalidCharacter) } );
         message.setSeverity(FacesMessage.SEVERITY_ERROR);
         throw new ConverterException(message);
      }

      return new CreditCard(builder.toString());
   }

   public String getAsString(
      FacesContext context,
      UIComponent component,
      Object value)
      throws ConverterException {
      // length 13: xxxx xxx xxx xxx
      // length 14: xxxxx xxxx xxxxx
      // length 15: xxxx xxxxxx xxxxx
      // length 16: xxxx xxxx xxxx xxxx
      // length 22: xxxxxx xxxxxxxx xxxxxxxx
      String v = value.toString();
      int[] boundaries = null;
      int length = v.length();
      if (length == 13)
         boundaries = new int[] { 4, 7, 10 };
      else if (length == 14)
         boundaries = new int[] { 5, 9 };
      else if (length == 15)
         boundaries = new int[] { 4, 10 };
      else if (length == 16)
         boundaries = new int[] { 4, 8, 12 };
      else if (length == 22)
         boundaries = new int[] { 6, 14 };
      else
         return v;
      StringBuilder result = new StringBuilder();
      int start = 0;
      for (int i = 0; i < boundaries.length; i++) {
         int end = boundaries[i];
         result.append(v.substring(start, end));
         result.append(" ");
         start = end;
      }
      result.append(v.substring(start));
      return result.toString();
   }
}
```

## Contenido adicional 2   

[Validadores y mensajes](pdfs/13-validadores-y-mensajes.pdf)
 
[Convertidores](pdfs/14-convertidores.pdf)
