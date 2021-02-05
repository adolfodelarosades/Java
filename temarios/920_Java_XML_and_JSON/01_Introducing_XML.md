# Capítulo 1: Introducing XML

* What Is XML?
* Language Features Tour
   * XML Declaration
   * Elements and Attributes
   * Character References and CDATA Sections
   * Namespaces
   * Comments and Processing Instructions
* Well-Formed Documents
* Valid Documents
   * Document Type Definition
   * XML Schema
* Summary


Las aplicaciones suelen utilizar documentos XML para almacenar e intercambiar datos. XML define reglas para codificar documentos en un formato que es legible por humanos y legible por máquina. El Capítulo 1 presenta XML, recorre las características del lenguaje XML y analiza los documentos válidos y bien formados.

## ¿Qué es XML?

***XML*** (eXtensible Markup Language) es un *meta-language* (un lenguaje utilizado para describir otros lenguajes) para definir *vocabularios* (custom markup languages), que es la clave de la importancia y popularidad de XML. Los vocabularios basados en XML (como XHTML) le permiten describir documentos de manera significativa.

Los documentos de vocabulario XML son como documentos HTML (consulte http://en.wikipedia.org/wiki/HTML) en el sentido de que están basados en texto y constan de *markup* (descripciones codificadas de la estructura lógica de un documento) y *contenido* (el texto del documento no se interpreta como marcado). El marcado se evidencia mediante tags (etiquetas) (construcciones sintácticas delimitadas por corchetes angulares), y cada etiqueta tiene un nombre. Además, algunas etiquetas tienen *atributos* (pares de name/value).

> **NOTA** XML y HTML son descendientes del lenguaje de marcado estándar generalizado (SGML), que es el metalenguaje original para crear vocabularios; XML es esencialmente una forma restringida de SGML, mientras que HTML es una aplicación de SGML. La diferencia clave entre XML y HTML es que XML lo invita a crear sus propios vocabularios con sus propias etiquetas y reglas, mientras que HTML le brinda un vocabulario creado previamente con su propio conjunto fijo de etiquetas y reglas. XHTML y otros vocabularios basados en XML son aplicaciones XML. XHTML fue creado para ser una implementación más limpia de HTML.

Si no se ha encontrado previamente con XML, es posible que se sorprenda por su simplicidad y lo mucho que sus vocabularios se parecen a HTML. No es necesario ser un científico espacial para aprender a crear un documento XML. Para demostrárselo a usted mismo, consulte el Listado 1-1.

```xml
<recipe>
   <title>
      Grilled Cheese Sandwich
   </title>
   <ingredients>
      <ingredient qty="2">
         bread slice
      </ingredient>
      <ingredient>
         cheese slice
      </ingredient>
      <ingredient qty="2">
         margarine pat
      </ingredient>
   </ingredients>
   <instructions>
      Place frying pan on element and select medium heat.
      For each bread slice, smear one pat of margarine on
      one side of bread slice. Place cheese slice between
      bread slices with margarine-smeared sides away from
      the cheese. Place sandwich in frying pan with one
      margarine-smeared side in contact with pan. Fry for
      a couple of minutes and flip. Fry other side for a
      minute and serve.
   </instructions>
</recipe>
```
***Listado 1-1*** Receta basada en XML para un sándwich de queso a la parrilla

El Listado 1-1 presenta un documento XML que describe una receta para hacer un sándwich de queso a la parrilla. Este documento recuerda a un documento HTML en el sentido de que consta de etiquetas, atributos y contenido. Sin embargo, ahí es donde termina la similitud. En lugar de presentar etiquetas HTML como `<html>`, `<head>`, `<img>` y `<p>`, este lenguaje de recetas informal presenta sus propias etiquetas `<recipe>`, `<ingredients>` y otras etiquetas.

> **NOTA** Aunque las etiquetas `<title>` y `</title>` del Listado 1-1 también se encuentran en HTML, difieren de sus equivalentes HTML. Los navegadores web suelen mostrar el contenido entre estas etiquetas en sus barras de título o encabezados de pestaña. Por el contrario, el contenido entre las etiquetas `<title>` y `</title>` del Listado 1-1 puede mostrarse como un encabezado de receta, hablado en voz alta o presentado de alguna otra manera, según la aplicación que analice este documento.

<hr>

## Tour de Características Lingüísticas

XML proporciona varias características de lenguaje para su uso en la definición de lenguajes de marcado personalizados: declaración XML, elementos y atributos, referencias de caracteres y secciones CDATA, namespaces (espacios de nombres) y comentarios e instrucciones de procesamiento. Aprenderá acerca de estas características del lenguaje en esta sección.

### DECLARACIÓN XML

Un documento XML generalmente comienza con la *declaración XML*, un marcado especial que le dice a un analizador XML que el documento es XML. La ausencia de la declaración XML en el Listado 1-1 revela que este marcado especial no es obligatorio. Cuando la declaración XML está presente, no puede aparecer nada antes.

La declaración XML se parece mínimamente a `<? Xml version = "1.0"?>` En la que el atributo de versión no opcional identifica la versión de la especificación XML a la que se ajusta el documento. La versión inicial de esta especificación (1.0) se introdujo en 1998 y está ampliamente implementada.

> **NOTA**: El Consorcio World Wide Web (W3C), que mantiene XML, lanzó la versión 1.1 en 2004. Esta versión admite principalmente el uso de caracteres de final de línea utilizados en plataformas EBCDIC (consulte http://en.wikipedia.org/wiki/EBCDIC) y el uso de scripts y caracteres que están ausentes en Unicode (consulte http://en.wikipedia.org/wiki/Unicode) 3.2. A diferencia de XML 1.0, XML 1.1 no está ampliamente implementado y solo debe usarse cuando se necesitan sus características únicas.

XML es compatible con Unicode, lo que significa que los documentos XML constan en su totalidad de caracteres tomados del juego de caracteres Unicode (Unicode character set). Los caracteres del documento se codifican en bytes para su almacenamiento o transmisión, y la codificación se especifica mediante el atributo opcional `encoding` de la declaración XML. Una codificación común es *UTF-8* (consulte http://en.wikipedia.org/wiki/UTF-8), que es una codificación de longitud variable del juego de caracteres Unicode. UTF-8 es un superconjunto estricto de ASCII (consulte http://en.wikipedia.org/wiki/ASCII), lo que significa que los archivos de texto ASCII puros también son documentos UTF-8.

> **NOTA** En ausencia de la declaración XML o cuando el atributo de codificación de la declaración XML no está presente, un analizador XML normalmente busca una secuencia de caracteres especial al comienzo de un documento para determinar la codificación del documento. Esta secuencia de caracteres se conoce como *marca de orden de bytes (BOM) (byte-order-mark (BOM))* y la crea un programa editor (como el Bloc de notas de Microsoft Windows) cuando guarda el documento de acuerdo con UTF-8 o alguna otra codificación. Por ejemplo, la secuencia hexadecimal `EF BB BF` significa UTF-8 como codificación. De manera similar, `FE FF` significa UTF-16 (ver http://en.wikipedia.org/wiki/UTF-16) big endian, `FF FE` significa UTF-16 little endian, `00 00 FE FF` significa UTF-32 (ver http: //en.wikipedia.org/wiki/UTF-32) big endian, y `FF FE 00 00` significa UTF-32 little endian. Se asume UTF-8 cuando no hay una lista de materiales.

Si nunca va a utilizar caracteres aparte del conjunto de caracteres ASCII, probablemente pueda olvidarse del atributo `encoding`. Sin embargo, cuando su idioma nativo no es el inglés o cuando lo llaman para crear documentos XML que incluyen caracteres que no son ASCII, debe especificar la codificación correctamente. Por ejemplo, cuando su documento contiene caracteres ASCII más caracteres de un idioma de Europa occidental que no es inglés (como ç, la cedilla que se usa en francés, portugués y otros idiomas), es posible que desee elegir `ISO-8859-1` como el atributo `encoding` valor: el documento probablemente tendrá un tamaño más pequeño cuando se codifique de esta manera que cuando se codifique con UTF-8. El Listado 1-2 le muestra la declaración XML resultante.

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<movie>
   <name>Le Fabuleux Destin d'Amélie Poulain</name>
   <language>français</language>
</movie>
```
***Listado 1-2*** Un documento codificado que contiene caracteres no ASCII

El atributo final que puede aparecer en la declaración XML es `standalone`. Este atributo opcional, que solo es relevante con DTD (discutido más adelante), determina si hay declaraciones de marcado externas que afectan la información pasada de un *procesador XML* (un parser [analizador]) a la aplicación. Su valor predeterminado es `no`, lo que implica que existen o pueden existir tales declaraciones. Un valor de `yes` indica que no existen tales declaraciones. Para obtener más información, consulte “The standalone pseudo-attribute is only relevant if a DTD is used” (www.xmlplease.com/xml/standalone/).

### ELEMENTOS Y ATRIBUTOS


```xml
```



```xml
```


```xml
```


```xml
```


