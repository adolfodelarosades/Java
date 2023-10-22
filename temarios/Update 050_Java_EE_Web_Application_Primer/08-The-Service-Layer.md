# 8. La capa de servicio

Su aplicación interactuará con la **DAO** a través de la ***capa de servicio***.

## Crear una clase `DbUtilities`

Cada vez que su aplicación se conecte a la base de datos, ejecutará el mismo código. Puede hacer que su aplicación sea más eficiente creando una clase de métodos reutilizables a los que puede llamar según sea necesario. Crea una clase llamada DbUtilities. Esto le permitirá simplificar las llamadas al Entity Manager cuando necesite leer o escribir en la base de datos. Esta clase será estática (no se requiere creación de instancias). Tendrá un método, getFactory(). Devolverá una instancia de EntityManagerFactory como se identifica en persistence.xml. Consulte el Listado 8-1.

**Listado 8-1 El listado de códigos para la clase `DbUtilities`**

```java
//DbUtil.java
package service;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class DbUtil {
        public static EntityManager getEntityManager(String s) {
                return Persistence.createEntityManagerFactory(s).createEntityManager();
        }
}
//End of DbUtil.java  
```

## Crear la clase DbUser
La clase DbUser contiene métodos para trabajar con el usuario. DbPost contiene métodos para trabajar con las publicaciones. Ambas clases son muy similares, por lo que aquí solo se muestran los métodos seleccionados de DbUser.
