

CREATE TABLE EQUIPOS (
  ID_EQUIPO     NUMBER(2),
  NOMBRE        VARCHAR2(50) CONSTRAINT EQUIPOS_NN1 NOT NULL,
  ESTADIO       VARCHAR2(50),
  AFORO         NUMBER(6),
  ANO_FUNDACION NUMBER(4),
  CIUDAD        VARCHAR2(50) CONSTRAINT EQUIPOS_NN2 NOT NULL,
  CONSTRAINT EQUIPOS_PK PRIMARY KEY (ID_EQUIPO),
  CONSTRAINT EQUIPOS_UK1 UNIQUE (NOMBRE),
  CONSTRAINT EQUIPOS_UK2 UNIQUE (ESTADIO)
);


CREATE TABLE PARTIDOS (
  ID_EQUIPO_CASA NUMBER(2),
  ID_EQUIPO_FUERA NUMBER(2),
  FECHA TIMESTAMP,
  GOLES_CASA NUMBER (2),
  GOLES_FUERA NUMBER(2),
  OBSERVACIONES VARCHAR2(1000),
  CONSTRAINT PARTIDOS_PK PRIMARY KEY (ID_EQUIPO_CASA,ID_EQUIPO_FUERA),
  CONSTRAINT PARTIDOS_FK1 FOREIGN KEY (ID_EQUIPO_FUERA) REFERENCES EQUIPOS (ID_EQUIPO) ON DELETE CASCADE ,
  CONSTRAINT PARTIDOS_FK2 FOREIGN KEY (ID_EQUIPO_CASA) REFERENCES EQUIPOS (ID_EQUIPO) ON DELETE CASCADE,
    CONSTRAINT PARTIDOS_CK CHECK (ID_EQUIPO_FUERA!=ID_EQUIPO_CASA)

);

CREATE TABLE JUGADORES (
  ID_JUGADOR NUMBER (3),
  NOMBRE VARCHAR2(50) CONSTRAINT JUGADORES_NN NOT NULL,
  FECHA_NAC DATE,
  ID_EQUIPO NUMBER (2),
  CONSTRAINT JUGADORES_PK PRIMARY KEY (ID_JUGADOR),
  CONSTRAINT JUGADORES_FK FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS (ID_EQUIPO) ON DELETE SET NULL

);

CREATE TABLE GOLES (
  ID_EQUIPO_CASA NUMBER (2),
  ID_EQUIPO_FUERA NUMBER (2),
  MINUTO INTERVAL DAY TO SECOND,
  DESCRIPCION VARCHAR2(2000),
  ID_JUGADOR NUMBER (3),
  CONSTRAINT GOLES_PK PRIMARY KEY  (ID_EQUIPO_CASA,ID_EQUIPO_FUERA,MINUTO),
  CONSTRAINT GOLES_FK1 FOREIGN KEY (ID_EQUIPO_CASA,ID_EQUIPO_FUERA) REFERENCES PARTIDOS ON DELETE CASCADE ,
  CONSTRAINT GOLES_FK2 FOREIGN KEY (ID_JUGADOR) REFERENCES JUGADORES (ID_JUGADOR) ON DELETE CASCADE ,
  CONSTRAINT GOLES_CK CHECK (ID_EQUIPO_FUERA!=ID_EQUIPO_CASA)
);


ALTER TABLE EQUIPOS MODIFY (
  AFORO CONSTRAINT EQUIPOS_NN3 NOT NULL,
  ESTADIO CONSTRAINT EQUIPOS_NN4 NOT NULL
);
-- ALTER TABLE EQUIPOS MODIFY AFORO CONSTRAINT  EQUIPOS_NN3 NOT NULL;
-- ALTER TABLE EQUIPOS MODIFY ESTADIO CONSTRAINT EQUIPOS_NN4 NOT NULL;


ALTER TABLE EQUIPOS MODIFY (ANO_FUNDACION DATE);
ALTER TABLE JUGADORES DROP CONSTRAINT JUGADORES_NN;

INSERT INTO EQUIPOS VALUES (1,'Cascorro F.C','Arenera',4000,TO_DATE ('1/1/1961','dd/mm/yyyy'),'Cascorro de arriba');
INSERT INTO EQUIPOS VALUES (2,'Athletico Matalasleñas','Cerro Gálvez',1200,TO_DATE ('12/3/1970','dd/mm/yyyy'),'Matalasleñas');
INSERT INTO PARTIDOS VALUES (1,2,TO_DATE ('5/11/2016','dd/mm/yyyy'),2,1,NULL);
INSERT INTO JUGADORES VALUES (1,'Amoribia',TO_DATE ('20/1/1990','dd/mm/yyyy'),1);
INSERT INTO JUGADORES VALUES (2,'García',NULL,2);
INSERT INTO JUGADORES VALUES (3,'Pedrosa',TO_DATE ('12/9/1993','dd/mm/yyyy'),1);
INSERT INTO GOLES VALUES (1,2,INTERVAL '23' MINUTE ,'Gol marcado de falta directa',1);
INSERT INTO GOLES VALUES (1,2,INTERVAL '40' MINUTE ,'Gol de penalti',2);
INSERT INTO GOLES VALUES (1,2,INTERVAL '70' MINUTE ,'Gol magistral de una gran jugada personal',3);
