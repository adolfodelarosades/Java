use hibernate;

CREATE TABLE AUTOR
(
	id				bigint(15),
    nombre			varchar(200),
    anio_nac		smallint,
    nacionalidad	varchar(100),
    constraint PK_AUTOR primary key (id)
);

CREATE TABLE LIBRO
(
	id				bigint(20),
    titulo			varchar(255),
    isbn			varchar(20),
    categoria		varchar(100),
    anio_public		smallint,
    constraint PK_LIBRO primary key (id)
);

CREATE TABLE AUTOR_LIBRO
(
	id_autor		bigint(15),
    id_libro		bigint(20),
    constraint PK_AUTOR_LIBRO primary key (id_autor, id_libro),
    constraint FK_AL_AUTOR foreign key (id_autor) references AUTOR (id),
    constraint FK_AL_LIBRO foreign key (id_libro) references LIBRO (id)
);
    

    