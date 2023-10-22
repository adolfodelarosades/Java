# 7. El DAO/Repository

Bullhorn requiere dos tablas, para usuarios y publicaciones. Crearemos estas tablas en Oracle y las llamaremos Bhuser y Bhpost, respectivamente. La tabla de usuarios necesitará los siguientes campos: nombre de usuario, correo electrónico del usuario, contraseña, lema y fecha de inscripción. La tabla de publicaciones contendrá campos para el texto de la publicación, la fecha de la publicación y la identificación del usuario que creó la publicación. Cada tabla también contendrá un campo de ID para identificar de forma única cada registro. Podemos indicarle a SQL Developer que construya las tablas ejecutando scripts. Simplemente ingrese el texto que se ve en el Listado 7-1 en SQL Developer dentro de una nueva hoja de trabajo SQL.

Listado 7-1 Definición de datos para la tabla Bhuser
