CREATE TABLE empresas (
  cif CHAR (9),
  nombre VARCHAR2(25)
       CONSTRAINT empresas_nn NOT NULL,
  telefono CHAR(9),
  direccion VARCHAR2(50),
  CONSTRAINT empresas_pk PRIMARY KEY (cif),
  CONSTRAINT empresas_uk UNIQUE (nombre)
);


CREATE TABLE alumnos (
 dni CHAR (9),
  nombre VARCHAR2(50)
  CONSTRAINT alumnos_nn1 NOT NULL,
  apellido1 VARCHAR2(50)
  CONSTRAINT alumnos_nn2 NOT NULL,
  apellido2 VARCHAR2(50)
  CONSTRAINT alumnos_nn3 NOT NULL,
  direccion VARCHAR2(50),
  telefono CHAR(9),
  edad NUMBER(2),
  cif CHAR(9),
  CONSTRAINT alumnos_pk PRIMARY KEY (dni),
  CONSTRAINT alumnos_fk FOREIGN KEY (cif) REFERENCES empresas(cif)
);



CREATE TABLE tipos_curso (
  cod_curso CHAR(8),
  titulo VARCHAR2(50),
  duracion NUMBER (3),
  temario CLOB,
  CONSTRAINT tipos_curso_pk PRIMARY KEY (cod_curso),
  CONSTRAINT tipos_curso_uk UNIQUE (titulo)
);

CREATE TABLE asistir (
  dni CHAR (9),
  n_curso NUMBER(3),
  nota NUMBER(4,2),
  CONSTRAINT asistir_pk PRIMARY KEY (dni,n_curso),
  CONSTRAINT asistir_fk1 FOREIGN KEY (n_curso) REFERENCES  cursos,
  CONSTRAINT asistir_fk2 FOREIGN KEY (dni) REFERENCES alumnos
);

CREATE TABLE cursos (
  n_curso NUMBER(3),
  fecha_inicio TIMESTAMP,
  fecha_fon TIMESTAMP,
  cod_curso CHAR(8),
  dni_profesor CHAR(9),
  CONSTRAINT cursos_pk PRIMARY KEY (n_curso),
  CONSTRAINT cursos_fk1 FOREIGN KEY (cod_curso) REFERENCES tipos_curso,
  CONSTRAINT cursos_fk2 FOREIGN KEY (dni_profesor) REFERENCES profesores (dni)
);

CREATE TABLE profesores (
  dni CHAR(9),
  nombre VARCHAR2(50)
  CONSTRAINT profesores_nn1 NOT NULL,
  apellido1 VARCHAR2(50)
  CONSTRAINT profesores_nn2 NOT NULL,
  apellido2 VARCHAR2(50)
  CONSTRAINT profesores_nn3 NOT NULL,
  direccion VARCHAR2(50),
  telefono CHAR(9),
  CONSTRAINT profesores_pk PRIMARY KEY (dni)
);

SELECT FROM MIGUELDL.
