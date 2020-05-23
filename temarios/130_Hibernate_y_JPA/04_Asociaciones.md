# 4. Asociaciones 48m
   * ManyToOne 10:34 
   * OneToMany: Unidireccional y bidireccional 12:54 
   * OneToOne: Unidireccional y bidireccional 7:18 
   * ManyToMany: 18:06 
   * Contenido adicional 4
   
## ManyToOne 10:34 

[ManyToOne](pdfs/08_Asociaciones_ManyToOne.pdf)

### 8.1 Asociaciones entre entidades

Normalmente, en todos los sistemas de información, las entidades del modelo de dominio suelen estar asociadas entre ellas, de forma que suele ser tan importante (o más) registrar la información asociada a la asociación como a la entidad.

<img src="images/4-asociacion.png">

*Diagrama de clases completo*

A nivel de base de datos, estas asociaciones suelen implementarse mediante claves externas. Una *foreign key* no es más que la presencia de la clave primaria de una tabla en otra tabla (puede ser reflexiva, y estar en la misma tabla), a la cual *apunta*.

JPA nos permite modelar estas asociaciones, tanto de forma *unidireccional* como de forma *bidireccional*. Veamos poco a poco todas ellas.

### 8.2. Asociaciones Many-To-One (Muchos a uno)

Se trata de la asociación más sencilla y común de todas. Este tipo de asociaciones a conocida en algunos contextos como una relación padre/hijo, donde el lado muchos es el *hijo* y el lado uno es el *padre*.
La versión más sencilla de esta asociación es la **unidireccional**, en la que solo representamos la asociación en el lado muchos.

<img src="images/4-asociacion-2.png">

*Diagrama de clases*

El código fuente sería el siguiente:

```java
@Entity
public class Person {

    @Id
    @GeneratedValue
    private long id;

    private String name;

    public Person() { }

    public Person(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    //resto de métodos...

}


@Entity
public class Phone {

    @Id
    @GeneratedValue
    private long id;

    private String number;

    @ManyToOne
    @JoinColumn(name = "person_id",
                    foreignKey = @ForeignKey(name="PERSON_ID_FK"))
    private Person person;


    public Phone() { }

    public Phone(String number) {
        this.number = number;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public long getId() {
        return id;
    }


}
```

La anotación `@ManyToOne` nos permite indicar que una columna representa una asociación muchos-a-uno con otra entidad. El tipo de dato será el de la clase del lado uno. Complementariamente, podemos añadir las anotaciones `@JoinColumn`, que nos permite indicar el nombre de la columna que hará las funciones de clave externa, así como `@ForeignKey`, con la que podemos indicar el nombre de la restricción que se creará a nivel de base de datos (muy útil para depurar errores).

```java
@ManyToOne
@JoinColumn(name = "person_id",
        foreignKey = @ForeignKey(name="PERSON_ID_FK"))
private Person person;
```

Cada entidad tiene su ciclo de vida propio. Una vez que añadimos la asociación `@ManyToOne`, Hibernate establece el valor de la clave externa.

```java
Person person = new Person("Pepe");
em.persist( person );

Phone phone = new Phone("954000000");
phone.setPerson(person);
em.persist(phone);

em.flush();
phone.setPerson(null);
```

## OneToMany: Unidireccional y bidireccional 12:54 

[OneToMany: Unidireccional y bidireccional](pdfs/09_Asociaciones_OneToMany.pdf)

La asociación Uno-a-muchos nos permite enlazar, en una asociación padre/hijo, el lado *padre* con todos sus hijos. Para ello, en la clase debemos colocar una colección de elementos hijos.

Si la asociación `@OneToMany` no tiene la correspondiente asociación `@ManyToOne`, decimos que es unidireccional. En caso de que sí exista, decimos que es **bidireccional**.

#### 9.1.1 One-To-Many unidireccional

Para representar esta asociación, añadimos en la clase padre un listado de elementos del tipo hijo.

```java
@Entity
public class Person {


    @Id
    @GeneratedValue
    private long id;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
  private List<Phone> phones = new ArrayList<>();

    private String name;

    public Person() { }

    public Person(String name) {
        this.name = name;
    }

    //Resto de métodos


    public List<Phone> getPhones() {
        return phones;
    }


}


@Entity
public class Phone {

    @Id
    @GeneratedValue
    private long id;

    private String number;

    public Phone() { }

    //Resto de métodos


}
```

Hibernate creará una tabla para cada entidad, y otra tabla para asociar ambas, añadiendo una restricción de unicidad al identificador del lado muchos. La anotación que define la asociación es `@OneToMany`. Vamos a repasar algunos elementos del código:

```java
@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
private List<Phone> phones = new ArrayList<>();
```

* La lista es inicializada al instanciar el objeto, para poder almacenar los elementos hijos.

* La opción `cascade = CascadeType.ALL` indica que las operaciones (formalmente llamadas *transiciones entre estados*) sobre el elemento padre se actualizarán hacia los hijos.

* La opción `orphanRemoval = true` indica que una entidad `Phone` será borrada cuando se elimine su asociación con la instancia de `Person`.

Para gestionar esta asociación *unidireccional*, debemos trabajar siempre con la lista de elementos que posea la entidad padre.

```java
        Person person = new Person("Pepe");
        Phone phone1 = new Phone("954000000");
        Phone phone2 = new Phone("600000000");

        person.getPhones().add(phone1);
        person.getPhones().add(phone2);
        em.persist(person);
        em.flush();

        person.getPhones().remove(phone1);
```        

#### 9.1.2 One-To-Many bidireccional

La asociación `@OneToMany` bidireccional necesita de una asociación `@ManyToOne` en el lado hijo. Aunque en los modelos estas asociaciones se representan bidireccionalmente, esta está representada solamente por una clave externa.

Toda asociación bidireccional debe tener un lado **propietario** (lado hijo). El otro lado vendrá referenciado mediante el atributo `mappedBy`.

```java
@Entity
public class Phone {

    @Id
    @GeneratedValue
    private long id;

    private String number;

    @ManyToOne
    private Person person;

    public Phone() { }

    //Resto de métodos

    @Override
    public int hashCode() {
        return Objects.hash(number);
    }

    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
            return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
            return false;
        }
        Phone phone = (Phone) o;
        return Objects.equals( number, phone.number );
    }


}


@Entity
public class Person {

    @Id
    @GeneratedValue
    private long id;

    @OneToMany(mappedBy = "person", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Phone> phones = new ArrayList<>();

    private String name;

    public Person() {
    }

    public Person(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Phone> getPhones() {
        return phones;
    }

    public void addPhone(Phone phone) {
        phones.add(phone);
        phone.setPerson(this);
    }

    public void removePhone(Phone phone) {
        phones.remove(phone);
        phone.setPerson(null);
    }

}
```

*`@NaturalId` es una anotación propia de Hibernate. Representa un identificador único que, si bien no es el mejor candidato para clave primaria, es conveniente indicárselo a Hibernate, ya que lo puede usar para hacer más eficiente.*

Como la clase `Phone` hace uso de una columna `@NaturalId` (haciendo el número de teléfono único), los métodos `equals()` y `hashCode()` pueden hacer uso de esta propiedad, y reducir la lógica de `removePhone()` a llamar al método `remove` de Java Collection.


Podemos destacar aquí la lógica de estos métodos:

```java
public void addPhone(Phone phone) {
    phones.add(phone);
    phone.setPerson(this);
}

public void removePhone(Phone phone) {
    phones.remove(phone);
    phone.setPerson(null);
}
```

El primero, realiza la asociación de un teléfono una persona: se añade el teléfono a la lista de teléfonos de la persona, y se asigna la persona como propietaria del teléfono.

El segundo, realiza la operación inversa, sacando el teléfono de la lista de teléfonos de la persona, y asignando como nulo la persona que es *dueña* del teléfono.

```java
        Person person = new Person("Pepe");
        Phone phone1 = new Phone("954000000");
        Phone phone2 = new Phone("600000000");

        person.addPhone(phone1);
        person.addPhone(phone2);
        em.persist(person);
        em.flush();

        person.removePhone(phone1);
```        

La asociación bidireccional es más eficiente gestionando el estado de persistencia de la asociación. La eliminación de un elemento solo requiere de una sentencia UPDATE (poniendo a `NULL` la clave externa); además, si el ciclo de vida de la clase *hija* está enmarcado dentro del de su clase padre (es decir, que no puede existir sin ella) podemos anotar la asociación con el atributo `orphanRemoval`, de forma que al desasociar un hijo, automáticamente se eliminará la fila asociada.

## OneToOne: Unidireccional y bidireccional 7:18 

[OneToOne: Unidireccional y bidireccional](pdfs/10_Asociaciones_OneToOne.pdf)

Las asociaciones Uno-a-Uno también pueden ser unidireccionales o bidireccionales.

<img src="images/4-unoauno.jpg">

*Asociación uno-a-uno*

### 10.1.1 `@OneToOne` unidireccional

En una asociación uno-a-uno, solamente una instancia de una clase se asocia con una instancia de otra. Al usar el esquema *unidireccional*, tenemos que decidir un lado como **propietario**.

```java
@Entity
public class Phone {

    @Id
    @GeneratedValue
    private long id;

    private String number;

    @OneToOne
    @JoinColumn(name = "details_id")
    private PhoneDetails details;

    public Phone() {
    }

    //Resto de métodos

    public PhoneDetails getDetails() {
        return details;
    }

    public void setDetails(PhoneDetails details) {
        this.details = details;
    }

    public long getId() {
        return id;
    }

}

@Entity
public class PhoneDetails {

    @Id
    @GeneratedValue
    private Long id;

    private String provider;

    private String technology;

    public PhoneDetails() {
    }

    public PhoneDetails(String provider, String technology) {
        this.provider = provider;
        this.technology = technology;
    }

    public String getProvider() {
        return provider;
    }

    public String getTechnology() {
        return technology;
    }

    public void setTechnology(String technology) {
        this.technology = technology;
    }

}
```

En apariencia, el tratamiento de esta asociación es como una `@ManyToOne` (desde el punto de vista relacional, estamos usando una clave externa). Sin embargo, no tendría sentido que entender la entidad `PhoneDetails` como padre, y `Phone` como hija (no podemos tener unos detalles de teléfono sin un teléfono). Para solucionar esto, podemos usar una asociación bidireccional.

#### 10.1.2 @OneToOne bidireccional

Para añadir el tratamiento bidireccional, añadimos un reflejo de la asociación en la clase `PhoneDetails`.

```java
@Entity
public class Phone {

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "`number`")
    private String number;

    @OneToOne(mappedBy = "phone", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private PhoneDetails details;

    public Phone() {
    }

    //Resto de métodos

    public PhoneDetails getDetails() {
        return details;
    }

    public void addDetails(PhoneDetails details) {
        details.setPhone(this);
        this.details = details;
    }

    public void removeDetails() {
        if (details != null) {
            details.setPhone(null);
            this.details = null;
        }
    }
}


@Entity
public class PhoneDetails {

        @Id
        @GeneratedValue
        private Long id;

        private String provider;

        private String technology;

        @OneToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "phone_id")
        private Phone phone;

        public PhoneDetails() {
        }

            //Resto de métodos
}
```

En este caso, los métodos:

```java
public void addDetails(PhoneDetails details) {
    details.setPhone(this);
    this.details = details;
}

public void removeDetails() {
    if (details != null) {
        details.setPhone(null);
        this.details = null;
    }
}
```

gestionan la lógica de la asociación. De esa forma, el ciclo de vida de uso sería como siguie:

```java
Phone phone = new Phone("954000000");
PhoneDetails details = new PhoneDetails("Movistar", "Fijo");
phone.addDetails(details);
em.persist(phone);
```

## ManyToMany: 18:06 

[ManyToMany](pdfs/11_Asociaciones_ManyToMany.pdf)

Todas las asociaciones muchos a muchos necesitan una tabla que realice de enlace entre ambas entidades asociadas. Veamos el tratamiento unidireccional y bidireccional.

<img src="images/4-muchosamuchos.jpg">

*Asociación muchos a muchos*

### 11.2 `@ManyToMany` unidireccional

Tendremos que definir qué lado es el propietario de la asociación. En esa clase, incluimos una lista de elementos de la clase opuesta.

```java
@Entity
public class Person {


    @Id
    @GeneratedValue
    private Long id;
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<Address> addresses = new ArrayList<>();

    public Person() {
    }

    public List<Address> getAddresses() {
        return addresses;
    }

}

@Entity
public class Address {

    @Id
    @GeneratedValue
    private Long id;

    private String street;

    private String number;

    public Address() {
    }

    public Address(String street, String number) {
        this.street = street;
        this.number = number;
    }

    public Long getId() {
        return id;
    }

    public String getStreet() {
        return street;
    }

    public String getNumber() {
        return number;
    }

}
```

Cuando una entidad se elimina de la colección `@ManyToMany`, Hibernate simplemente elimina la fila correspondiente de la tabla de enlace. Desafortunadamente, esta operación requiere eliminar todas las entradas asociadas para el padre seleccionado, y recrear aquellas que actualmente están en el contexto de persistencia.

Con un esquema unidireccional, un posible manejo de estas entidades sería el siguiente:

```java
Person person1 = new Person();
Person person2 = new Person();

Address address1 = new Address( "Rue del Percebe", "13" );
Address address2 = new Address( "Av. de la Constitución", "1" );

person1.getAddresses().add(address1);
person1.getAddresses().add(address2);

person2.getAddresses().add(address1);

em.persist(person1);
em.persist(person2);

em.flush();
```

### 11.3 `@ManyToMany` bidireccional

Una asociación bidireccional `@ManyToMany` tiene un lado *propietario* y un lado `mappedBy`. Para preservar la sincronización entre ambos, es buena práctica añadir métodos *helper* para manejar las asociaciones (como en ocasiones anteriores).

```java
@Entity
public class Person {


    @Id
    @GeneratedValue
    private Long id;

    @NaturalId
    private String registrationNumber;
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<Address> addresses = new ArrayList<>();

    public Person() {
    }

    public Person(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void addAddress(Address address) {
        addresses.add( address );
        address.getOwners().add( this );
    }

    public void removeAddress(Address address) {
        addresses.remove( address );
        address.getOwners().remove( this );
    }

    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
            return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
            return false;
        }
        Person person = (Person) o;
        return Objects.equals( registrationNumber, person.registrationNumber );
    }

    @Override
    public int hashCode() {
        return Objects.hash( registrationNumber );
    }

}

@Entity
public class Address {

    @Id
    @GeneratedValue
    private Long id;

    private String street;

    private String number;

    private String postalCode;

    @ManyToMany(mappedBy = "addresses")
    private List<Person> owners = new ArrayList<>();

    public Address() {
    }

    public Address(String street, String number, String postalCode) {
        this.street = street;
        this.number = number;
        this.postalCode = postalCode;
    }

    public Long getId() {
        return id;
    }

    //Resto de métodos

    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
            return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
            return false;
        }
        Address address = (Address) o;
        return Objects.equals( street, address.street ) &&
                Objects.equals( number, address.number ) &&
                Objects.equals( postalCode, address.postalCode );
    }

    @Override
    public int hashCode() {
        return Objects.hash( street, number, postalCode );
    }

}
```

Cabe destacar la lógica de los métodos helper, que nos permiten establecer las referencias (o eliminarlas) entre ambas clases.

```java
public void addAddress(Address address) {
        addresses.add( address );
        address.getOwners().add( this );
}

public void removeAddress(Address address) {
        addresses.remove( address );
        address.getOwners().remove( this );
}
```

### 11.4 `@ManyToMany` con atributos extra

Un caso que suele presentarse en muchas ocasiones con las asociaciones muchos a muchos es que necesitamos añadir un atributo que no es de ninguna de las dos entidades, sino de la asociación en sí.

<img src="images/4-muchosamuchos-2.png">

*Asociación muchos a muchos con clase de asociación*

Algunos autores llaman a este tipo de asociación con atributos **clase de asociación**.

Como este nuevo atributo no es ni de la dirección, ni de la persona, no lo podemos colocar en ninguna de las dos entidades, por lo que tenemos que seguir los siguientes pasos:

1. Generar una nueva entidad `PersonAddress`

2. Romper la asociación `@ManyToMany` en ambos extremos en dos asociaciones que den el mismo resultado: `@ManyToOne` + `@OneToMany`.

3. Manejar de forma conveniente la clave primaria de esta nueva entidad. Al ser una clave primaria compuesta, necesitaremos de una clase extra, `PersonAddressId`, y de la anotación `@IdClass`, para poder manejarla.

```java
@Entity
public class Address {

    @Id
    @GeneratedValue
    private Long id;

    private String street;

    private String number;

    private String postalCode;

    @OneToMany(mappedBy = "address", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PersonAddress> owners = new ArrayList<>();

    //Resto de métodos


    public List<PersonAddress> getOwners() {
        return owners;
    }

    //Resto de métodos
}

@Entity
public class Person {


    @Id
    @GeneratedValue
    private Long id;

    @NaturalId
    private String registrationNumber;

    @OneToMany(mappedBy = "person", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PersonAddress> addresses = new ArrayList<>();

    //Resto de métodos

    public List<PersonAddress> getAddresses() {
        return addresses;
    }

    //Resto de métodos
}
```

Como podemos ver, las entidades `Person` y `Address` tienen ahora una asociación `@OneToMany` en lugar de una `@ManyToMany`. ¿Dónde está el resto de esa asociación? Veamos la entidad `PersonsAddress`.

```java
@Entity
@IdClass(PersonAddressId.class)
public class PersonAddress {


    @Id
    @ManyToOne
    @JoinColumn(
            name="person_id",
            insertable = false, updatable = false
    )
    private Person person;

    @Id
    @ManyToOne
    @JoinColumn(
            name="address_id",
            insertable = false, updatable = false
    )
    private Address address;

    private String nameOfAddress;


    public PersonAddress() { }


    public PersonAddress(Person person, Address address) {
        this.person = person;
        this.address = address;

    }

    public PersonAddress(Person person, Address address, String name) {
        this(person, address);
        this.nameOfAddress = name;
    }

    //Resto de métodos

}


public class PersonAddressId implements Serializable {

    private Long person;
    private Long address;

    public PersonAddressId() {

    }

    //Getters, setters, equals y hashCode

}
```

La anotación `@Id` solo está permitida, en primera instancia, para claves primarias simples, por lo que una entidad, por norma, no puede tener dos atributos anotados con `@Id`. Para poder manejar una clave primaria **compuesta**, JPA nos obliga a utilizar alguna estrategia diferente, como `@IdClass` o `@EmbeddId`. Nosotros optamos por la primera. Para ello, creamos una clase que tendrá los campos que conforman la clave primaria y que cumplirá con las siguientes características:

* Debe ser una clase pública

* Debe tener un constructor sin argumentos

* Debe implementar `Serializable`

* No debe tener ***clave primaria propia***

* Debe implementar los métodos `equals` y `hashCode`.

Para poder manejar ahora el ciclo de vida de esta nueva entidad, podemos modificar los métodos *helper* que estábamos usando:

```java
    public void addAddress(Address address, String name) {
        PersonAddress personAddress = new PersonAddress( this, address, name );
        addresses.add( personAddress );
        address.getOwners().add(personAddress);
    }

    public void removeAddress(Address address) {
        PersonAddress personAddress = new PersonAddress( this, address);
        address.getOwners().remove( personAddress );
        addresses.remove( personAddress );
    }
```

## Contenido adicional 4  

[ManyToOne](pdfs/08_Asociaciones_ManyToOne.pdf)

[OneToMany: Unidireccional y bidireccional](pdfs/09_Asociaciones_OneToMany.pdf)

[OneToOne: Unidireccional y bidireccional](pdfs/10_Asociaciones_OneToOne.pdf)

[ManyToMany](pdfs/11_Asociaciones_ManyToMany.pdf)
