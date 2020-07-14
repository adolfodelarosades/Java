# 06 Librerías de Colecciones de Terceros

<img src="images/01-62.png">

Y por último podríamos ver las librerías de colecciones de tercero.

<img src="images/01-63.png">

Se trata de librerías de otros proveedores que podemos encontrar algunas como las de Google de **Guava**, **Eclipse Collections** y **Apache Commons Collections** son implementaciones de software que se utiliza mucho en el mercado o que están disponible para que tengamos operaciones que el propio framework de colecciones de Java no ofrece y que podríamos usar.

## Guava

https://guava.dev/

<img src="images/01-64.png">

**Guava** esta implementada por Google como decíamos, la podemos utilizar tanto en Java como en Android, nos ofrece un montón de posibilidades, visitar la documentación, nos ofrece una serie de constructores bastante mejorado, se utiliza iterable allá siempre donde sea posible por hacerlo todo por un paraguas lo más común posible, tenemos más metodos factoría de los que nos ofrece Java directamente, operaciones con conjuntos, la unión, la intersección, el producto cartesiano de dos conjuntos y algunas colecciones un poco especiales como los `BiMaps`, `Multisets`, `Multimaps`, `Tables`, qué puede ser bastante útil en algunos contextos.




Tenemos por aquí un ejemplo de los tres, para poder utilizar estas librerías hemos creado un proyecto Maven en el mismo proyecto hemos hemos añadido las tres librerías, tendríamos aquí las dependencias también la documentación, para añadir la librería Guava, Eclipse Collections que necesita dos dependencias y las Apache Commons Collections que necesitaría una dependencia.

```html
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>org.example</groupId>
    <artifactId>ColeccionesTerceros</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>1.11</maven.compiler.source>
        <maven.compiler.target>1.11</maven.compiler.target>
    </properties>


    <dependencies>
        <!-- Guava -->
        <dependency>
            <groupId>com.google.guava</groupId>
            <artifactId>guava</artifactId>
            <version>28.2-jre</version>
        </dependency>

        <!-- Eclipse Collections -->
        <dependency>
            <groupId>org.eclipse.collections</groupId>
            <artifactId>eclipse-collections-api</artifactId>
            <version>10.2.0</version>
        </dependency>

        <dependency>
            <groupId>org.eclipse.collections</groupId>
            <artifactId>eclipse-collections</artifactId>
            <version>10.2.0</version>
        </dependency>

        <!-- Apache Commons Collections -->
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-collections4</artifactId>
            <version>4.4</version>
        </dependency>

    </dependencies>

</project>
```

Para Guava por ejemplo.

```java
package net.openwebinars.collections.librerias.guava;

import com.google.common.collect.BiMap;
import com.google.common.collect.HashBiMap;

/**
 * Ejemplo de uso de colecciones con Guava
 *
 * 
 */
public class GuavaTestApp {

    public static void main(String[] args) {

        // Vamos a probar un BiMap<String,String>,
        // que asegura la unicidad de clave y de valor
        BiMap<String, String> capitales = HashBiMap.create();

        capitales.put("España", "Madrid");
        capitales.put("Ecuador", "Quito");
        capitales.put("México", "Ciudad de México");
        capitales.put("USA", "Washington DC");
        capitales.put("Argentina", "Buenos Aires");

        // Capital de España
        System.out.println(capitales.get("España"));

        // ¿De qué país es capital Buenos Aires?
        System.out.println(capitales.inverse().get("Buenos Aires"));
    }
}
```

Tenemos como ejemplo de Guava un `Map` doble que asegura la unicidad de la clave y el valor y que nos permite obtener el valor a partir de la clave o la clave a partir del valor, por ejemplo nos podría servir para guardar las capitales de diferentes países, mirar como tiene metodos convenientes para la creación en lugar de usar el constructor, algún método tipo factoría y podríamos añadir con el clásico `put` los distintos países con sus capitales y podemos comprobar como podríamos consultar el valor de una clave o también podríamos trabajar a la inversa y obtener el país de cual es capital una determinada ciudad, como por ejemplo sería de qué país es capital Buenos Aires, Argentina y la capital de España que es Madrid.

<img src="images/01-107.png">

<img src="images/01-65.png">

bueno como saber que tipo de colecciones coger puedo propongo de utilice Vicente diagrama de flujo vale para tomar la decisión a la hora de comer una colección no deberíamos plantear si lo lamento son solamente elementos suelto en tipo que sea aunque sea una clase completa no son para clave baloncesto



<img src="images/01-66.png">
