# 05 Cómo saber qué Tipo de Colección Escoger

<img src="images/01-60.png">

<img src="images/01-61.png">

Cómo saber qué tipo de colecciones escoger, les propongo que utilicen este diagrama de flujo para tomar la decisión. A la hora de escoger una colección nos deberemos plantear si los elementos son solamente elementos sueltos, del tipo que sean, aunque sea una clase compleja o son pares clave-valor. Si son elementos tendremos que preguntar si la colección debería permitir duplicados o no,  en caso de que no permita duplicados lo que nos tenemos que preguntar es si importa el orden y si el orden no importara la colección que deberíamos usar es `HashSet`. Si importa el orden, tenemos que preguntar qué orden importa, importa el orden de inserción entonces sería `LinkedHashSet` o si importa el orden de elemento entonces sería `TreeSet`. 

Si la colección debe permitir elementos duplicado lo que tenemos que preguntarnos si es que tiene alguna estructura especial, porque si no tiene ninguna estructura especial esa colección,  podríamos utilizar siempre `ArrayList` y si tiene alguna estructura especial posiblemente sea una `Pila` una `Cola` o incluso una `ColaDoble` con lo cual podríamos usar alguna de las implementaciones de `Queue` o `Deque` si por contra nuestra colección en lugar de elementos tiene que almacenar pares clave-valor nos tendremos que preguntar si importa el orden, sino importa el orden utilizaríamos `HashMap`, si el orden importa nos preguntaríamos importa el orden de inserción lo que sería `LinkedHashMap` y si el orden de elementos sería `TreeMap`.
