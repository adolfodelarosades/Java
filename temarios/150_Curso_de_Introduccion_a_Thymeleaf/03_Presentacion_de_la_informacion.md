# 3. Presentación de la información 1:00
   * 14 Listados básicos 9:52 
   * 15 Listados complejos 16:16 
   * 16 Construcción de URLs 10:33 
   * 17 Controladores para URLs con variables en el path 5:07 
   * 18 Construcción de URLs junto a JavaScript 10:55 
   * 19 Manejo de CSS 7:45 
   * Contenido adicional 6
   
# 14 Listados básicos 9:52

[PDF 09_Listados_basicos.pdf](pdfs/09_Listados_basicos.pdf)

## Resumen Profesor

### Código fuente

El código fuente del listado de productos (el de categrías es prácticamente análogo) sería el siguiente:

```html
<table class="table">
   <thead>
      <tr>
         <th>Imagen</th>
         <th>Nombre</th>
         <th>Pvp</th>
         <th>Operaciones</th>
      </tr>
   </thead>
   <tbody>
      <tr th:each="producto : ${productos}">
         <td><img 
                  th:src="${not (#strings.isEmpty(producto.imagen))}
                  ? ${producto.imagen} : 'http://placehold.it/48x48'"
                  class="img-responsive icono-categoria" alt="imagen" /></td>
         <td th:text="${producto.nombre}"></td>
         <td th:text="${#numbers.formatCurrency(producto.pvp)}"></td>
         <td class="operaciones">
            <a href="#" class="btn btn-primary">Editar</a>
            <button type="button" class="btn btn-danger" data-toggle="modal"
                    data-target="#delete-modal">Borrar</button>
         </td>
      </tr>
   </tbody>
</table>
```

Como decíamos en el vídeo, la expresión para dibujar la imagen, la podríamos haber resumido más:

```html
<td>
   <img th:src="${producto.imagen} ?: 'http://placehold.it/48x48'"
           class="img-responsive icono-categoria" alt="imagen" />
</td>
```

Como siempre, podéis encontrar los ejemplos completos en el repositorio del curso.

## Transcripción

# 15 Listados complejos 16:16 

[PDF 10_Listados_avanzados.pdf](pdfs/10_Listados_avanzados.pdf)

## Resumen Profesor

### Código fuente

El código fuente del listado de categorías es muy sencillo. Para el listado de productos, este sería el código fuente:

```html
<div class="col-sm-3" th:each="producto : ${productos}">
  <div class="col-item">
    <div class="photo">
      <img src="http://placehold.it/350x260"
        th:src="${#strings.isEmpty(producto.imagen)} ? 'http://placehold.it/350x260' : ${producto.imagen}"
        class="img-responsive" alt="a" />
    </div>
    <div class="info">
      <div class="row">
        <div class="price col-md-12">
          <h5 th:text="${#strings.abbreviate(producto.nombre,65)}">Nombre</h5>
          <div class="price-text-color">
            <span
              th:text="${producto.descuento == 0}
                    ? ${#numbers.formatCurrency(producto.pvp)}
                    : ${#numbers.formatCurrency(producto.pvp * (1 - producto.descuento))}">10</span>

            <th:block th:if="${producto.descuento > 0}">
              <span class="price-original"
                th:text="${#numbers.formatCurrency(producto.pvp)}"></span>
              <span class="label label-danger"
                th:text=${#numbers.formatPercent(producto.descuento,1,0)}></span>
            </th:block>
          </div>
        </div>
        <div class="row">
          <div class="rating col-md-4">
            <p>
              <span
                th:text="${#numbers.formatDecimal(producto.getPuntuacionMedia(),1,1)}">4</span>/5
            </p>
          </div>
          <div class="rating col-md-8">
            <span class="glyphicon glyphicon-star"></span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
```

Como siempre, podéis encontrar los ejemplos completos en el repositorio del curso.

## Transcripción

# 16 Construcción de URLs 10:33 

[PDF 11_Construccion_de_URLs.pdf](pdfs/11_Construccion_de_URLs.pdf)

## Resumen Profesor

### Tipos de URLs

* Absolutas: `https://openwebinars.net`
* Relativas
   * A la página (`admin/categoria/`)
   * Al contexto (`/index?categoria=3`)
   * Al servidor (`~/usuario/factura/`)
   * Al protocolo (`//code.jquery.com/jquery-3.3.1.min.js`)

### Construcción de URLs con Thymeleaf

De forma general, una URL en Thymeleaf será una expresión del tipo `@{...}`.

### URLs con parámetros

Cuando queremos construir URLs que contengan parámetros, y obtener estos en base a una expresión, la notación será:

`@{/../path?(p1=v1, p2=v2, p3=v3, ...)}`

Por ejemplo:

```html
<a th:href="/(idCategoria=${categoria.id})" th:text="${categoria.nombre}">Categoría</a>
```

Daría como resultado:

```html
<a href="/?idCategoria=7" >Categoría 7</a>
```

## Transcripción

# 17 Controladores para URLs con variables en el path 5:07 

## Resumen Profesor

Las URLs con variables en el path son del estilo a www.mitienda.com/productos/detalle/17

Cuando queramos que una URL tenga variables en el path, la notación será:

`@{/.../path/{var1}/{var2}(var1=v1, var2=v2)}`

Por ejemplo:

```html
<a href="#"
     th:href="@{/product/{id}(id=${producto.id})}">
     <div class="col-item">
     …
     </div>
</a>
```

Daría como resultado:

```html
<a th:href="@{/product/6}">
     <div class="col-item">
     …
     </div>
</a>
```

## Transcripción

# 18 Construcción de URLs junto a JavaScript 10:55 

[PDF 11-2_Construccion_de_URLs_junto_a_Javascript.pdf](pdfs/11-2_Construccion_de_URLs_junto_a_Javascript.pdf)

## Resumen Profesor

### Construcción de URLs junto a JS

Realmente, la tarea que necesitamos realizar para que un botón en un diálogo modal nos redirija a una ruta en base a Thymeleaf tenemos varias opciones, si bien podemos aprovechar el uso conjunto de varios elementos, entre ellos Javascript (o jQuery) para realizarlo.

Partimos de un diálogo modal con el siguiente código, que será visualizado al pulsar el botón **Borrar**:

```html
<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title">Borrar categoria</h4>
         </div>
         <div class="modal-body">
            <p>¿Está usted seguro de borrar esta categoría?</p>
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            <a href="/admin/categoria/borrar/" class="btn btn-danger">Sí</a>
         </div>
      </div>
   </div>
</div>
```

Necesitamos proporcionar el valor necesario a este modal para que el enlace:

```html
<a href="/admin/categoria/borrar/" class="btn btn-danger">Sí</a>
```

Se le concatene el valor del ID del producto correspondiente.

### Los atributos `data-*`

Los atributos `data-*`, introducidos por HTML5, nos permiten extender los atributos básicos de cualquier etiqueta, aportando así más información que puede ser utilizada, por ejemplo, desde CSS o Javascript (jQuery).

Podemos, por tanto, añadir un nuevo atributo, llamado por ejemplo `data-id` al botón que lanza el modal, y a través de jQuery, rescatar ese valor para concatenarlo a la ruta.

```html
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete-modal" th:data-id="${producto.id}">Borrar</button>
```

El código Javascript podría ser el siguiente:

```js
$(document).ready(function() {
    $('#delete-modal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget);
        var data = button.data('id');
        var modal = $(this);
        var a = modal.find('.modal-body a')[0];
        a.href = a.href + data;

    });
});
```

## Transcripción

# 19 Manejo de CSS 7:45 

[PDF 12_CSS.pdf](pdfs/12_CSS.pdf)

## Resumen Profesor

### Manejo de CSS

Thymeleaf nos ofrece algunas posibilidades para manejar el CSS a aplicar:

* `th:class`: Permite definir, mediante thymeleaf, las clases de un elemento. Dentro podemos usar literales, variables o expresiones (por ejemplo, condiciones)

* `th:classappend` y `th:styleappend`: Permiten añadir (bien al conjunto de clases, bien al conjunto de estilos en línea) una nueva clase o estilo. Dentro podemos usar literales, variables o expresiones (por ejemplo, condiciones)

## Transcripción

# Contenido adicional 5   

* [PDF 09_Listados_basicos.pdf](pdfs/09_Listados_basicos.pdf)
* [PDF 10_Listados_avanzados.pdf](pdfs/10_Listados_avanzados.pdf)
* [PDF 11_Construccion_de_URLs.pdf](pdfs/11_Construccion_de_URLs.pdf)
* [PDF 11-2_Construccion_de_URLs_junto_a_Javascript.pdf](pdfs/11-2_Construccion_de_URLs_junto_a_Javascript.pdf)
* [PDF 12_CSS.pdf](pdfs/12_CSS.pdf)

