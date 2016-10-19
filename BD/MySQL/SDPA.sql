/**
 *
 * DBMS           :  MYSQL
 * Base de Datos  :  SDPA
 * Descripción    :  Base de Datos de pruebas Academicas
 * Script         :  Crea la esquema y Agrega Registros
 * Creado por     :  Yoshitomi Maehara Aliaga/Liliana Gonzales Chavez
 * Email          :  yoshitomimaehara@gmail.com/liligh14@gmail.com
 *
**/
-- ========================
--    Crear Base de Datos
-- ========================
create database if not exists SDPA;
-- ========================
--    Usar Base de Datos
-- ========================
use SDPA;

-- ==============================================
--     Elimina las tablas en caso que existan
-- ==============================================
drop table if exists auditoria;
drop table if exists nota;
drop table if exists mensaje;
drop table if exists alumno;
drop table if exists profesor;
drop table if exists curso;
drop table if exists usuario;
drop table if exists control;
-- ========================================
-- -------TABLA: Mensaje-------------------
-- ========================================
create table mensaje(
     codmensaje char(6) not null,
     mensaje varchar(100) not null,
     constraint pk_mensajes
         primary key(codmensaje)
) ENGINE=InnoDB;

insert into mensaje(codmensaje,mensaje)
values('000001','El Usuario no Existe');
insert into mensaje(codmensaje,mensaje)
values('000002','La Contraseña es Incorrecta');
insert into mensaje(codmensaje,mensaje)
values('000003','El Curso no Existe');
insert into mensaje(codmensaje,mensaje)
values('000004','El Alumno no Existe');
insert into mensaje(codmensaje,mensaje)
values('000005','El Curso ya Existe');
insert into mensaje(codmensaje,mensaje)
values('000006','Prueba ya Creada');

-- ========================================
-- -------TABLA: Alumno--------------------
-- ========================================
create table alumno(
  codalumno char(6) not null,
  nombre varchar(20) not null,
  apellido varchar(20) not null,
  ciclo char(2) not null,
  universidad varchar(50) not null,
  fech_nac date not null,
  creditos integer not null,
	constraint pk_alumno 
		primary key(codalumno)
  )ENGINE=InnoDB;

insert into alumno(codalumno,nombre,apellido,ciclo,universidad,fech_nac,creditos)
values('000001','felix','parinigua','V','universidad del norte','1980/01/09',20);
insert into alumno(codalumno,nombre,apellido,ciclo,universidad,fech_nac,creditos)
values('000002','Alex','falcon','V','universidad de piura','1990/06/11',28);

-- ========================================
-- -------TABLA: Profesor------------------
-- ========================================
create table profesor(
  codprofesor char(6) not null,
  nombre varchar(20) not null,
  apellido varchar(20) not null,
  constraint pk_profesor
  primary key(codprofesor)
)ENGINE=InnoDB;

-- ========================================
-- -------TABLA: Curso---------------------
-- ========================================
create table curso(
  codcurso char(6) not null,
  nombre varchar(20) not null,
  ciclo varchar(20) not null,
  creditos integer not null,
  constraint pk_curso
  primary key(codcurso)
)ENGINE=InnoDB;

insert into curso(codcurso,nombre,ciclo,creditos)values
('c00001','Matematica Basica','I',4);
insert into curso(codcurso,nombre,ciclo,creditos)values
('c00002','Matematica Basica','II',3);
insert into curso(codcurso,nombre,ciclo,creditos)values
('c00003','Traductores','IV',4);
insert into curso(codcurso,nombre,ciclo,creditos)values
('c00004','Informatica','I',3);

-- ========================================
-- -------TABLA: Nota--------------------
-- ========================================
create table nota(
  codcurso char(6) not null,
  codalumno char(6) not null,
  nota1 integer not null,
  nota2 integer not null,
  nota3 integer not null,
  nota4 integer not null,
  constraint fk_curso
  foreign key (codcurso)
  references curso(codcurso),
  key idx_nota01(codcurso),
  constraint fk_alumno
  foreign key (codalumno)
  references alumno(codalumno),
  key idx_nota02(codalumno)
)ENGINE=InnoDB;

-- ========================================
-- -------TABLA: Usuario-------------------
-- ========================================
create table usuario(
usuario varchar(6) not null,
contraseña varchar(20) not null,
tipo char not null,
constraint pk_usuario
primary key(usuario)
)ENGINE=InnoDB;

insert into usuario(usuario,contraseña,tipo)
values('PRO001','jaureguialan','T');

-- ========================================
-- -------TABLA: Control-------------------
-- ========================================
create table control(
  parametro varchar(20) not null,
  valor varchar(6) not null
)ENGINE=InnoDB;

insert into control values
('curso','C00001');
insert into control values
('auditoria','1');

-- ========================================
-- -------TABLA: Auditoria-----------------
-- ========================================
create table auditoria(
 codseguimiento integer not null,
 cambio varchar(500) not null,
 valor_inicio varchar(50) not null,
 valor_modif varchar(50) not null,
 usuario varchar(6) not null,
 constraint pk_auditoria
 primary key(codseguimiento),
 constraint fk_usuario
 foreign key(usuario)
 references usuario(usuario),
 key idx_auditoria01(usuario)
)ENGINE=InnoDB;

commit;

