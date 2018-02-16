CREATE TABLE articulos (
  cod_art CHAR(7),
  nombre VARCHAR2(40)
   CONSTRAINT articulos_nn1 NOT NULL,
  marca VARCHAR2(20)
   CONSTRAINT articulos_nn2 NOT NULL,
  modelo VARCHAR2(15)
  CONSTRAINT articulos_nn3 NOT NULL ,
  CONSTRAINT articulos_pk PRIMARY KEY (cod_art)
);

CREATE TABLE precios (
  fecha_inicio DATE,
  fecha_fin DATE,
  cod_art CHAR(7),
  precio NUMBER(7,2),
  CONSTRAINT precios_pk PRIMARY KEY (fecha_inicio,cod_art),
  CONSTRAINT precios_fk FOREIGN KEY (cod_art) REFERENCES articulos (cod_art) ON DELETE CASCADE
);