# 20200722 Miercoles

## MAVEN

[mvnrepository](https://mvnrepository.com/)

### Mavenizar un Proyecto

En Eclipse podemos *Mavenizar un Proyecto* poniendonos en la raíz del proyecto, botón derecho *Configuration-Convert to Maven Project*

<img src="images/20200722-01.png">

## JSON

[JSON Simple](https://code.google.com/archive/p/json-simple/)

[Documentación No Oficial](https://javadoc.io/doc/com.googlecode.json-simple/json-simple/latest/index.html)

Dependencia:

```html
<!-- https://mvnrepository.com/artifact/com.googlecode.json-simple/json-simple -->
<dependency>
    <groupId>com.googlecode.json-simple</groupId>
    <artifactId>json-simple</artifactId>
    <version>1.1.1</version>
</dependency>
```

JSON Simple tiene tres clases principales:

* `JSONParse`: Parsear cadena en formato JSON a Objeto JSON
* `JSONArray`: Manipular Array
* `JSONObject`: Manipular Objeto

### :computer: `000-050_manipular_json`

*`TestLecturaJSON`*

```java
package principal;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class TestLecturaJSON {

	public static void main(String[] args) {
		
		String json="[{\"numeroPedido\":200, \"producto\":\"Galletas\",\"precio\":20.5}," + 
				     "{\"numeroPedido\":100, \"producto\":\"Balón\",\"precio\":2.2}]";
		
		//Crear objeto JSONParse
		JSONParser parse = new JSONParser();
		
		//Leemos el documento y lo volcamos en una variable JSONArray
		try {
			JSONArray array = (JSONArray)parse.parse(json);
			//1. Forma de recorrer un JSONArray
			for (int i = 0; i < array.size(); i++) {
				JSONObject ob = (JSONObject)array.get(i);
				System.out.println(ob.get("producto"));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
```

<img src="images/20200722-02.png">

*`TestLecturaJSON`*

```java
package principal;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class TestLecturaJSON {

	public static void main(String[] args) {
		
		String json="[{\"numeroPedido\":200, \"producto\":\"Galletas\",\"precio\":20.5}," + 
				     "{\"numeroPedido\":100, \"producto\":\"Balón\",\"precio\":2.2}]";
		
		//Crear objeto JSONParse
		JSONParser parse = new JSONParser();
		
		//Leemos el documento y lo volcamos en una variable JSONArray
		try {
			JSONArray array = (JSONArray)parse.parse(json);
			//2. Forma de recorrer un JSONArray
			array.forEach(ob -> System.out.println(((JSONObject)ob).get("producto")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
```

<img src="images/20200722-03.png">

*`TestLecturaJSON`*

```java
package principal;

import java.util.stream.Stream;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class TestLecturaJSON {

	public static void main(String[] args) {
		
		String json="[{\"numeroPedido\":200, \"producto\":\"Galletas\",\"precio\":20.5}," + 
				     "{\"numeroPedido\":100, \"producto\":\"Balón\",\"precio\":2.2}]";
		
		//Crear objeto JSONParse
		JSONParser parse = new JSONParser();
		
		//Leemos el documento y lo volcamos en una variable JSONArray
		try {
			JSONArray array = (JSONArray)parse.parse(json);
			//3. Forma de recorrer un JSONArray Con Streams
			Stream<JSONObject> st= (Stream<JSONObject>)array.stream();
			st.forEach(ob -> System.out.println(ob.get("producto")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
```

<img src="images/20200722-04.png">

Código completo.

*`LecturaJSON`*

```java
package principal;

import java.util.stream.Stream;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class LecturaJSON {

	public static void main(String[] args) {
		
		String json="[{\"numeroPedido\":200, \"producto\":\"Galletas\",\"precio\":20.5}," + 
				     "{\"numeroPedido\":100, \"producto\":\"Balón\",\"precio\":2.2}]";
		
		//Crear objeto JSONParse
		JSONParser parse = new JSONParser();
		
		//Leemos el documento y lo volcamos en una variable JSONArray
		try {
			
			JSONArray array = (JSONArray)parse.parse(json);
			//1. Forma de recorrer un JSONArray
			/*
			for (int i = 0; i < array.size(); i++) {
				JSONObject ob = (JSONObject)array.get(i);
				System.out.println(ob.get("producto"));
			}
			*/
			//2. Forma de recorrer un JSONArray
			//array.forEach(ob -> System.out.println(((JSONObject)ob).get("producto")));
			
			//3. Forma de recorrer un JSONArray Con Streams
			Stream<JSONObject> st= (Stream<JSONObject>)array.stream();
			st.forEach(ob -> System.out.println(ob.get("producto")));
		
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
```

