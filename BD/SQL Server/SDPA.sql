/**
 *
 * DBMS           :  SQLSERVER
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
create database sdpa
go
-- ========================
--    Usar Base de Datos
-- ========================
use sdpa
go

-- ========================================
-- -------TABLA: Mensaje-------------------
-- ========================================
create table dbo.mensaje(
 codmen char(6) not null,
 mensaje varchar(100) not null,
 constraint pk_mensajes
	primary key(codmen)
)
go

insert into dbo.mensaje(codmen,mensaje) values
('000001','el usuario no existe'),
('000002','La Contraseña es Incorrecta'),
('000003','El Curso no Existe'),
('000004','El Alumno no Existe'),
('000005','El Curso ya Existe'),
('000006','El Alumno ya Existe')

-- ========================================
-- -------TABLA: Alumno--------------------
-- ========================================
create table dbo.alumno(
  codalumno char(6) not null,
  nombre varchar(20) not null,
  apellido varchar(20) not null,
  ciclo char(2) not null,
  universidad varchar(50) not null,
  fech_nac date not null,
  creditos integer not null,
  constraint pk_alumno 
		primary key(codalumno)
)
go

insert into dbo.alumno(codalumno,nombre,apellido,ciclo,universidad,fech_nac,creditos) values
('000001','felix','parinigua','V','univerdidad del norte','1980/01/09',20),
('000002','Alex','falcon','V','universidad de piura','1990/06/11',28)
go

-- ========================================
-- -------TABLA: Profesor------------------
-- ========================================

create table dbo.profesor(
  codprofesor char(6) not null,
  nombre varchar(20) not null,
  apellido varchar(20) not null,
  constraint pk_profesor
	primary key(codprofesor)
)
go

-- ========================================
-- -------TABLA: Curso---------------------
-- ========================================
create table dbo.curso(
  codcurso char(6) not null,
  nombre varchar(20) not null,
  ciclo varchar(20) not null,
  creditos integer not null,
  constraint pk_curso
  primary key(codcurso)
)
go

insert into dbo.curso(codcurso,nombre,ciclo,creditos)values
('c00001','Matematica Basica I','I',4),
('c00002','Matematica Basica II','II',3),
('c00003','Traductores','IV',4),
('c00004','Informatica','I',3)
go

-- ========================================
-- -------TABLA: Nota----------------------
-- ========================================
create table dbo.nota(
  codcur char(6) not null,
  codalumno char(6) not null,
  nota1 integer not null,
  nota2 integer not null,
  nota3 integer not null,
  nota4 integer not null,
  constraint fk_curso
  foreign key (codcur)
  references curso,
  constraint fk_alumno
  foreign key (codalumno)
  references alumno
)
go

-- ========================================
-- -------TABLA: Usuario-------------------
-- ========================================
create table dbo.usuario(
usuario varchar(6) not null,
contraseña varchar(20) not null,
tipo char not null,
constraint pk_usuario
primary key(usuario)
)
go

insert into dbo.usuario(usuario,contraseña,tipo)
values('PRO001','jaureguialan','T')
go

-- ========================================
-- -------TABLA: Control-------------------
-- ========================================

create table dbo.control(
  parametro varchar(20) not null,
  valor varchar(6) not null
)
go

insert into dbo.control values
('curso','C00001'),
('auditoria','1')
go


-- ========================================
-- -------TABLA: Auditoria-----------------
-- ========================================
create table dbo.auditoria(
 codseguimiento integer not null,
 cambio varchar(500) not null,
 valor_inicio varchar(50)not null,
 valor_modif varchar(50)not null,
 usuario varchar(6)not null,
 constraint pk_auditoria
 primary key(codseguimiento),
 constraint fk_usuario
 foreign key(usuario)
 references usuario
)
go