# 6. Uso de herencia 64m
   * Qué es la herencia y los beneficios que aporta 15:52 
   * Polimorfismo 9:43 
   * Uso de super para acceder a un objeto y sus constructores 8:42 
   * Clases abstractas e interfaces I 20:52 
   * Clases abstractas e interfaces II 9:48 
   * Contenido adicional 5
   
## 22. Qué es la herencia y los beneficios que aporta 15:52 

[Herencia](pdfs/22_Herencia.pdf)

![22_Herencia-1](images/22_Herencia-1.png)

### 22.1 Herencia

![22_Herencia-2](images/22_Herencia-2.png)

![22_Herencia-3](images/22_Herencia-3.png)

![22_Herencia-4](images/22_Herencia-4.png)

![22_Herencia-5](images/22_Herencia-5.png)

![22_Herencia-6](images/22_Herencia-6.png)

Es un mecanismo fundamental de la Programación Orientada a Objetos, que nos permite que una clase pueda extender el comportamiento o la funcionalidad de otra. De esta forma podemos formar una jerarquía de clases.

En Java, a diferencia de otros lenguajes, solo está permitida la **herencia simple**, de forma que cada clase tiene, como mucho, una clase base. Solo hay una clase especial, `Object`, que no tiene clase base. El resto de clases ya creadas, o por crear, tienen en esta el nivel más básico de su jerarquía (es decir, una clase que no heredia de nadie, realmente está heredando de `Object`).

<img src="images/Jerarquia_de_clases.gif">

La sintaxis para indicar que una clase hereda de otra es:

```java
public class Hija extends Padre {


}
```

Una clase que extiende a otra hereda sus atributos y sus métodos (no los constructores), y puede añadir métodos y atributos nuevos. La clase extendida podrá acceder a aquellos atributos/métodos de la clase base marcados como `public`, `protected` o por defecto.

`protected` está poco recomendado para los atributos, ya que en una jerarquía de herencia con varios niveles, una clase *tataranieta* de otra podría seguir accediendo a los atributos, sin poder predecir bien el control sobre ellos. Es más recomendable marcar los atributos como `private`, y acceder a ellos desde métodos `public`.

Si no queremos que nadie pueda heredar de nuestra clase, la marcamos como `final`:

```java
public final class ClaseFinal {

}
```

### 22.2 Código

#### Primer Programa

*Trabajador.java*

```java
package herencia;

public class Trabajador {
	
	private String nombre;
	private String puesto;
	private String direccion;
	private String telefono;
	private String nSS; //Número Seguridad Social
	
	public Trabajador(String nombre, String puesto, String direccion, String telefono, String nSS) {
		this.nombre = nombre;
		this.puesto = puesto;
		this.direccion = direccion;
		this.telefono = telefono;
		this.nSS = nSS;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getPuesto() {
		return puesto;
	}

	public void setPuesto(String puesto) {
		this.puesto = puesto;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getnSS() {
		return nSS;
	}

	public void setnSS(String nSS) {
		this.nSS = nSS;
	}

	@Override
	public String toString() {
		return "Trabajador [nombre=" + nombre + ", puesto=" + this.puesto + ", direccion=" + direccion + ", telefono="
				+ telefono + ", nSS=" + nSS + "]";
	}
}
```

*Consultor.java*

```java
package herencia;

public class Consultor extends Trabajador {
	
	private int horas;
	private double tarifa;
	
	public Consultor(String nombre, String puesto, String direccion, String telefono, String nSS, int horas, double tarifa) {
		super(nombre, puesto, direccion, telefono, nSS);
		this.horas = horas;
		this.tarifa = tarifa;
	}

	public int getHoras() {
		return horas;
	}

	public void setHoras(int horas) {
		this.horas = horas;
	}

	public double getTarifa() {
		return tarifa;
	}

	public void setTarifa(double tarifa) {
		this.tarifa = tarifa;
	}
	
	public double calcularPaga() {
		return horas*tarifa;
	}

	@Override
	public String toString() {
		return "Consultor [horas=" + horas + ", tarifa=" + tarifa + ", getNombre()=" + getNombre() + ", getPuesto()="
				+ getPuesto() + ", getDireccion()=" + getDireccion() + ", getTelefono()=" + getTelefono()
				+ ", getnSS()=" + getnSS() + "]";
	}
}
```

*Empleado.java*

```java
package herencia;

public class Empleado extends Trabajador {
	
	private double sueldo;
	private double impuestos;
	
	private final int PAGAS = 14;
	
	public Empleado(String nombre, String puesto, String direccion, String telefono, String nSS, double sueldo, double impuestos) {
		//Profundizamos en "super" en las próximas lecciones
		super(nombre, puesto, direccion, telefono, nSS);
		this.sueldo = sueldo;
		this.impuestos = impuestos;
	}

	public double getSueldo() {
		return sueldo;
	}

	public void setSueldo(double sueldo) {
		this.sueldo = sueldo;
	}

	public double getImpuestos() {
		return impuestos;
	}

	public void setImpuestos(double impuestos) {
		this.impuestos = impuestos;
	}
	
	public double calcularPaga() {
		return (sueldo-impuestos) / PAGAS;
	}

	@Override
	public String toString() {
		return "Empleado [sueldo=" + sueldo + ", impuestos=" + impuestos + ", getNombre()=" + getNombre()
				+ ", getPuesto()=" + getPuesto() + ", getDireccion()=" + getDireccion() + ", getTelefono()="
				+ getTelefono() + ", getnSS()=" + getnSS() + "]";
	}
}
```

*Herencia.java*

```java
package herencia;

public class Herencia {

	public static void main(String[] args) {
		
		Trabajador trabajador;
		Empleado empleado;
		Consultor consultor;
		
		trabajador = new Trabajador("Bill Gates", "Presidente", "Redmond", "", "");
		empleado = new Empleado("Larry Ellison", "Presidente", "Redwood", "", "", 100000.0, 1000.0);
		consultor = new Consultor("Steve Jobs", "Consultor Jefe", "Cupertino", "", "", 20, 1000.0);
		
		System.out.println(trabajador);
		System.out.println(empleado);
		System.out.println(empleado.calcularPaga());
		System.out.println(consultor);
		System.out.println(consultor.calcularPaga());
	}

}


SALIDA:

Trabajador [nombre=Bill Gates, puesto=Presidente, direccion=Redmond, telefono=, nSS=]
Empleado [sueldo=100000.0, impuestos=1000.0, getNombre()=Larry Ellison, getPuesto()=Presidente, getDireccion()=Redwood, getTelefono()=, getnSS()=]
7071.428571428572
Consultor [horas=20, tarifa=1000.0, getNombre()=Steve Jobs, getPuesto()=Consultor Jefe, getDireccion()=Cupertino, getTelefono()=, getnSS()=]
20000.0
```
#### Segundo Programa

*ClaseFinal.java*

```java
package herencia;

public final class ClaseFinal {

}
```

*ClaseExtendida.java*

```java
package herencia;

/*public class ClaseExtendida extends ClaseFinal {

}*/
```

Lo anterior no es posible nos marcaría : `The type ClaseExtendida cannot subclass the final class ClaseFinal`

## 23. Polimorfismo 9:43 

[Polimorfismo](pdfs/23_Polimorfismo.pdf)

![23_Polimorfismo-1](images/23_Polimorfismo-1.png)

### 23.1 Referencias y subclases

![23_Polimorfismo-2](images/23_Polimorfismo-2.png)

Una subclase puede ser accedida a través de una referencia de su superclase. Esto es muy útil si pensamos pasar parámetros a un método, para que sea más versátil.

```java
public static void saludar(Trabajador t) {
    System.out.println("Hola, " + t.getNombre());
}
```

### 23.2 Ocultación de métodos y polimorfismo

![23_Polimorfismo-3](images/23_Polimorfismo-3.png)

![23_Polimorfismo-4](images/23_Polimorfismo-4.png)

Ya hemos visto que una clase extendida puede *ocultar* métodos o atributos de la clase base, creando uno igual con el mismo nombre. ¿Qué sucede si tenemos un método ocultado, pero accedemos desde una referencia de la superclase?

```java
Trabajador empleado;
empleado = new Empleado("Larry Ellison", "Presidente", "Redwood", "", "", 100000.0, 1000.0);
empleado.calcularPaga();
```

La máquina virtual de java es capaz de detectar el tipo del objeto, siendo este quien tenga prioridad sobre el tipo de la referencia usada. A esto lo llamamos polimorfismo.

### 23.3 Código

*Trabajador.java*

```java
package polimorfismo;

public class Trabajador {
	
	private String nombre;
	private String Puesto;
	private String direccion;
	private String telefono;
	private String nSS; //Número Seguridad Social
	
	private static final double SALARIO_BASE = 30000.0;
	
	
	public Trabajador(String nombre, String puesto, String direccion, String telefono, String nSS) {
		this.nombre = nombre;
		Puesto = puesto;
		this.direccion = direccion;
		this.telefono = telefono;
		this.nSS = nSS;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getPuesto() {
		return Puesto;
	}


	public void setPuesto(String puesto) {
		Puesto = puesto;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getnSS() {
		return nSS;
	}


	public void setnSS(String nSS) {
		this.nSS = nSS;
	}
	
	public double calcularPaga() {
		return SALARIO_BASE;
	}


	@Override
	public String toString() {
		return "Trabajador [nombre=" + nombre + ", Puesto=" + Puesto + ", direccion=" + direccion + ", telefono="
				+ telefono + ", nSS=" + nSS + "]";
	}
}
```

*Consultor.java*

```java
package polimorfismo;

public class Consultor extends Trabajador {
	
	private int horas;
	private double tarifa;
	
	
	public Consultor(String nombre, String puesto, String direccion, String telefono, String nSS, int horas, double tarifa) {
		super(nombre, puesto, direccion, telefono, nSS);
		this.horas = horas;
		this.tarifa = tarifa;
	}


	public int getHoras() {
		return horas;
	}


	public void setHoras(int horas) {
		this.horas = horas;
	}


	public double getTarifa() {
		return tarifa;
	}


	public void setTarifa(double tarifa) {
		this.tarifa = tarifa;
	}
	
	public double calcularPaga() {
		return horas*tarifa;
	}


	@Override
	public String toString() {
		return "Consultor [horas=" + horas + ", tarifa=" + tarifa + ", getNombre()=" + getNombre() + ", getPuesto()="
				+ getPuesto() + ", getDireccion()=" + getDireccion() + ", getTelefono()=" + getTelefono()
				+ ", getnSS()=" + getnSS() + "]";
	}
}
```

*Empleado.java*

```java
package polimorfismo;

public class Empleado extends Trabajador {
	
	private double sueldo;
	private double impuestos;
	
	private final int PAGAS = 14;
	
	public Empleado(String nombre, String puesto, String direccion, String telefono, String nSS, double sueldo, double impuestos) {
		//Profundizamos en "super" en las próximas lecciones
		super(nombre, puesto, direccion, telefono, nSS);
		this.sueldo = sueldo;
		this.impuestos = impuestos;
	}

	public double getSueldo() {
		return sueldo;
	}

	public void setSueldo(double sueldo) {
		this.sueldo = sueldo;
	}

	public double getImpuestos() {
		return impuestos;
	}

	public void setImpuestos(double impuestos) {
		this.impuestos = impuestos;
	}
	
	public double calcularPaga() {
		return (sueldo-impuestos) / PAGAS;
	}

	@Override
	public String toString() {
		return "Empleado [sueldo=" + sueldo + ", impuestos=" + impuestos + ", PAGAS=" + PAGAS + ", getNombre()="
				+ getNombre() + ", getPuesto()=" + getPuesto() + ", getDireccion()=" + getDireccion()
				+ ", getTelefono()=" + getTelefono() + ", getnSS()=" + getnSS() + "]";
	}
}
```

*Polimorfismo.java*

```java
package polimorfismo;

public class Polimorfismo {

	public static void main(String[] args) {
		
		Trabajador trabajador;
		Trabajador empleado;
		Trabajador consultor;
		
		trabajador = new Trabajador("Bill Gates", "Presidente", "Redmond", "", "");
		empleado = new Empleado("Larry Ellison", "Presidente", "Redwood", "", "", 100000.0, 1000.0);
		consultor = new Consultor("Steve Jobs", "Consultor Jefe", "Cupertino", "", "", 20, 1000.0);
		
		saludar(trabajador);
		saludar(empleado);
		saludar(consultor);
		
		imprimirNombreYPaga(trabajador);
		imprimirNombreYPaga(empleado);
		imprimirNombreYPaga(consultor);
	}
	
	public static void saludar(Trabajador t) {
		System.out.println("Hola, " + t.getNombre());
	}
	
	public static void imprimirNombreYPaga(Trabajador t) {
		System.out.printf("El trabajador %s tiene una paga de %.2f€ %n", t.getNombre(), t.calcularPaga());
	}
}


SALIDA:

Hola, Bill Gates
Hola, Larry Ellison
Hola, Steve Jobs
El trabajador Bill Gates tiene una paga de 30000,00€ 
El trabajador Larry Ellison tiene una paga de 7071,43€ 
El trabajador Steve Jobs tiene una paga de 20000,00€
```

## 24. Uso de super para acceder a un objeto y sus constructores 8:42 

[Uso de super para acceder a un objeto y sus constructores](pdfs/24_Super.pdf)

![24_Super-1](images/24_Super-1.png)

### 24.1 Acceso a la superclase

![24_Super-2](images/24_Super-2.png)

Podemos acceder a los elementos de nuestra clase base a través de la palabra `super`. En particular, podemos acceder a los métodos, aunque estos hayan sido sobrescritos:

```java
// overrides printMethod in Superclass
public void printMethod() {
   super.printMethod();
   System.out.println("Printed in Subclass");
}
```

### 24.2 Constructores y `super`

![24_Super-3](images/24_Super-3.png)

Cuando construimos una instancia de una clase derivada, tenemos que construir también la parte correspondiente a su clase base. Por defecto, Java espera que hayamos incluido un constructor sin parámetros en la clase base, y él se encargará de todo.

También podemos invocar, explícitamente, al constructor:

```java
public Empleado(…) {
     super(nombre, puesto, direccion, telefono, nSS);
     this.sueldo = sueldo;
     this.impuestos = impuestos;
}
```

### 24.2 Código

*ClaseBase.java*

```java
package usodesuper;

public class ClaseBase {
	
	private String mensaje;
	
	public ClaseBase() {
		this.mensaje = "Saludo desde la clase base";
	}
	
	public ClaseBase(String s) {
		this.mensaje = s;
	}
	
	public void imprimir() {
		//System.out.println("Saludo desde la clase base");
		System.out.println(mensaje);
	}

}
```

*ClaseDerivada.java*

```java
package usodesuper;


public class ClaseDerivada extends ClaseBase {
	
	private String otroMensaje;
	
	public ClaseDerivada() {
		super("Desde la clase derivada");
	}
	
	public ClaseDerivada(String mensaje, String otro) {
		super(mensaje);
		this.otroMensaje = otro;
	}
	
	
	public void imprimir() {
		super.imprimir();
		//System.out.println("Saludo desde la clase derivada");
		System.out.println(otroMensaje);
	}
}
```

*UsoDeSuper.java*

```java
package usodesuper;

/**
 * @author 
 *
 */
public class UsoDeSuper {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		ClaseBase base = new ClaseBase();
//		ClaseDerivada derivada = new ClaseDerivada();
		ClaseDerivada derivada = new ClaseDerivada("Hola Mundo!"," desde una clase derivada");
		
		base.imprimir();
		System.out.println("");
		derivada.imprimir();
	}
}


SALIDA:

Saludo desde la clase base

Hola Mundo!
 desde una clase derivada
```

## 25. Clases abstractas e interfaces I 20:52 

[Clases abstractas e interfaces](pdfs/25_Interfaces_y_clases_abstractas.pdf)

25_Interfaces_y_clases_abstractas-

![25_Interfaces_y_clases_abstractas-1](images/25_Interfaces_y_clases_abstractas-1.png)

### 25.1 Interfaces

![25_Interfaces_y_clases_abstractas-2](images/25_Interfaces_y_clases_abstractas-2.png)

![25_Interfaces_y_clases_abstractas-3](images/25_Interfaces_y_clases_abstractas-3.png)

Una interfaz es un contrato de comportamiento que adquiere una clase, es decir, un conjunto de operaciones que se compromete a implementar. Hasta Java 7, las interfaces definían solamente la firma de estos métodos, pero con Java 8, también pueden incluir implementaciones por defecto.

#### 25.1.1 Definición

![25_Interfaces_y_clases_abstractas-4](images/25_Interfaces_y_clases_abstractas-4.png)

Las interfaces siguen las mismas normas de nomenclatura y modificadores de acceso que las clases:

```java
public interface GroupedInterface extends Interface1, Interface2  {
     // constant declarations
     // base of natural logarithms
     double E = 2.718282;
     // method signatures
     void doSomething (int i, double x);
     int doSomethingElse(String s);
}
```

Las interfaces también pueden heredar de otra. En este caso, sí que se permite la herencia múltiple.

#### 25.1.2 Implementación

![25_Interfaces_y_clases_abstractas-5](images/25_Interfaces_y_clases_abstractas-5.png)

Una clase puede implementar una o varias interfaces:

```java
public class RectanglePlus implements Relatable {
//...
    public int isLargerThan(Relatable other) {
        RectanglePlus otherRect = (RectanglePlus)other;
        if (this.getArea() < otherRect.getArea())
            return -1;
        else if (this.getArea() > otherRect.getArea())
            return 1;
        else
            return 0;               
    }
}
```

#### 25.1.3 Interfaces como tipos de referencias

![25_Interfaces_y_clases_abstractas-6](images/25_Interfaces_y_clases_abstractas-6.png)

Podemos utilizar una interfaz para almacenar una referencia a un objeto de una clase que implemente dicha interfaz:

```java
RectanglePlus rectangleOne = new RectanglePlus(10, 20);
Relatable rectangleTwo = new RectanglePlus(20, 10);
```

#### 25.1.4 Métodos por defecto y estáticos

![25_Interfaces_y_clases_abstractas-7](images/25_Interfaces_y_clases_abstractas-7.png)

![25_Interfaces_y_clases_abstractas-8](images/25_Interfaces_y_clases_abstractas-8.png)

Java 8 incluye la posibilidad de que las interfaces proporcionen el cuerpo de un método, siempre y cuando este esté marcado como `default` o `static`:

```java
public interface Interfaz {

     default public void metodoPorDefecto() {
          System.out.println("Este es uno de los nuevos métodos por defecto");
     }

}
```

Las clases que implementen esta interfaz no tienen porqué dar una nueva implementación si no la necesitan.

#### 25.1.5 Código

##### Primer Programa

*MyInterface.java*

```java
package interfaces;

public interface MyInterface {
	
	void print();

}
```

*Relatable.java*

```java
package interfaces;


public interface Relatable {
	
	/*
	 * Método que nos va a permitir si un objeto
	 * de este tipo es más grande que otro
	 * 
	 */
	public int isLargerThan(Relatable other);

}
```

*RectanglePlus.java*

```java
package interfaces;

import java.awt.Point;

public class RectanglePlus implements Relatable, MyInterface {
	
    public int width = 0;
    public int height = 0;
    public Point origin;

    // four constructors
    public RectanglePlus() {
        origin = new Point(0, 0);
    }
    public RectanglePlus(Point p) {
        origin = p;
    }
    public RectanglePlus(int w, int h) {
        origin = new Point(0, 0);
        width = w;
        height = h;
    }
    public RectanglePlus(Point p, int w, int h) {
        origin = p;
        width = w;
        height = h;
    }

    // a method for moving the rectangle
    public void move(int x, int y) {
        origin.x = x;
        origin.y = y;
    }

    // a method for computing
    // the area of the rectangle
    public int getArea() {
        return width * height;
    }
    
    @Override
	public String toString() {
		return "RectanglePlus [width=" + width + ", height=" + height + ", origin=" + origin + "]";
	}
	// a method required to implement
    // the Relatable interface
    public int isLargerThan(Relatable other) {
        RectanglePlus otherRect = (RectanglePlus) other;
        if (this.getArea() < otherRect.getArea())
            return -1;
        else if (this.getArea() > otherRect.getArea())
            return 1;
        else
            return 0;               
    }
	@Override
	public void print() {
		System.out.println(this.toString());		
	}
}
```

*ComparadorRectangulos.java*

```java
package interfaces;

public class ComparadorRectangulos {

	public static void main(String[] args) {

		RectanglePlus rectangleOne = new RectanglePlus(10, 20);
		Relatable rectangleTwo = new RectanglePlus(20, 10);
		
		rectangleOne.print();
		MyInterface rectangle2 = (MyInterface) rectangleTwo;
		rectangle2.print();
		
		switch (rectangleOne.isLargerThan(rectangleTwo)) {
		case -1:
			System.out.println("Es menor");
			break;
		case 0:
			System.out.println("Son iguales");
			break;
		case 1:
			System.out.println("Es mayor");
			break;
		}
	}
}


SALIDA:

RectanglePlus [width=10, height=20, origin=java.awt.Point[x=0,y=0]]
RectanglePlus [width=20, height=10, origin=java.awt.Point[x=0,y=0]]
Son iguales
```

##### Segundo Programa

*Interfaz.java*

```java
package interfaces.defecto;

public interface Interfaz {
	
	public void metodo();
	
	default public void metodoPorDefecto() {
		System.out.println("Este es uno de los nuevos métodos por defecto");
	}
	
	public static void metodoEstatico() {
		System.out.println("Método estático en un interfaz");
	}
}
```

*Clase.java*

```java
package interfaces.defecto;

public class Clase implements Interfaz {

	@Override
	public void metodo() {
		System.out.println("método");
	}

}
```


*Clase2.java*

```java
package interfaces.defecto;

public class Clase2 implements Interfaz {

	@Override
	public void metodo() {
		System.out.println("Otro método");
	}

	@Override
	public void metodoPorDefecto() {
		System.out.println("Mi propia implementación del método por defecto");
	}
}
```

*InterfacesPorDefecto.java*

```java
package interfaces.defecto;

public class InterfacesPorDefecto {

	public static void main(String[] args) {
		
		Clase c1 = new Clase();
		
		c1.metodo();
		c1.metodoPorDefecto();
		
		Clase2 c2 = new Clase2();
		
		c2.metodo();
		c2.metodoPorDefecto();
		
		Interfaz.metodoEstatico();
	}
}


SALIDA:

método
Este es uno de los nuevos métodos por defecto
Otro método
Mi propia implementación del método por defecto
Método estático en un interfaz
```

## 25. Clases abstractas e interfaces II 9:48 

[Clases abstractas e interfaces](pdfs/25_Interfaces_y_clases_abstractas.pdf)

![25_Interfaces_y_clases_abstractas-9](images/25_Interfaces_y_clases_abstractas-9.png)

### 25.2 Clases abstractas

![25_Interfaces_y_clases_abstractas-10](images/25_Interfaces_y_clases_abstractas-10.png)

Son clases definidas como `abstract`. Tienen las siguientes características:

* **No se pueden instanciar**
* Pueden tener atributos y métodos con implementación.

```java
public abstract class AbstractaSencilla {

    public void saluda() {
        System.out.println("Hola mundo!!!");
    }

}
```

#### 25.2.1 Métodos `abstract`

![25_Interfaces_y_clases_abstractas-11](images/25_Interfaces_y_clases_abstractas-11.png)

Son métodos que están definidos en una clase `abstract`. Definen la firma del método, pero no su implementación. Las subclases de esta clase base deben aportar su implementación. Pueden convivir con métodos normales.

```java
public abstract class AbstractaConMetodos {

    public abstract void saludo(String s);

    public void saludar() {
        System.out.println("Hola mundo!!!");
    }
}
```

### 25.3 Clases abstractas vs Interfaces

![25_Interfaces_y_clases_abstractas-12](images/25_Interfaces_y_clases_abstractas-12.png)

![25_Interfaces_y_clases_abstractas-13](images/25_Interfaces_y_clases_abstractas-13.png)

![25_Interfaces_y_clases_abstractas-14](images/25_Interfaces_y_clases_abstractas-14.png)

¿Cuándo usar una u otra?

INTERFACES |	CLASES ABSTRACTAS
-----------|-------------------
Clases no relacionadas podrán implementar los métodos. | Compartir código con clases muy relacionadas.
Si se quiere indicar que existe un tipo de comportamiento, pero no sabemos quien lo implementa.	| Las clases derivadas usarán métodos protected o private.
Si necesitamos tener herencia múltiple.	| Queremos definir atributos que no sean estáticos o constantes.

### 25.4 Código

#### Primer Programa

*AbstractaSencilla.java*

```java
public abstract class AbstractaSencilla {
	
	public void saluda() {
		System.out.println("Hola mundo!!!");
	}

}
```

*Derivada.java*

```java
package abstractas;

public class Derivada extends AbstractaSencilla {

}
```

*EjemploAbstractas.java*

```java
package abstractas;

/**
 * @author 
 *
 */
public class EjemploAbstractas {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		//AbstractaSencilla abstracta = new AbstractaSencilla();
		
		/*
		 * NO ES POSIBLE INSTANCIAR UNA CLASE ABASTRACTA
		 * Nos marcaría los siguientes errores
		 * Multiple markers at this line
	       - Occurrence of 'AbstractaSencilla'
	       - Occurrence of 'AbstractaSencilla'
	       - This block of commented-out lines of code should be removed.
	       - Cannot instantiate the type AbstractaSencilla
	       - 1 changed line
		 */
		
		//Se instancia indirectamente
		AbstractaSencilla derivada = new Derivada();
		
		derivada.saluda();
	}
}


SALIDA:

Hola mundo!!!
```

#### Segundo Programa

*AbstractaConMetodos.java*

```java
package abstractas.conmetodos;

public abstract class AbstractaConMetodos {
	
	public abstract void saludo(String s);
	
	public void saludar() {
		System.out.println("Hola mundo!!!");
	}
}
```

*DerivadaConMetodos.java*

```java
package abstractas.conmetodos;

public class DerivadaConMetodos extends AbstractaConMetodos {

	@Override
	public void saludo(String s) {
		System.out.println("Hola " + s);		
	}
}
```

*EjemploAbstractaConMetodos.java*

```java
/**
 * 
 */
package abstractas.conmetodos;

/**
 * @author 
 *
 */
public class EjemploAbstractaConMetodos {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		DerivadaConMetodos derivada = new DerivadaConMetodos();
		derivada.saludar();
		derivada.saludo("Pepe");
	}
}


SALIDA:

Hola mundo!!!
Hola Pepe
```

## Contenido adicional 4   

[Herencia](pdfs/22_Herencia.pdf)

[Polimorfismo](pdfs/23_Polimorfismo.pdf)

[Uso de super para acceder a un objeto y sus constructores](pdfs/24_Super.pdf)

[Clases abstractas e interfaces](pdfs/25_Interfaces_y_clases_abstractas.pdf)
