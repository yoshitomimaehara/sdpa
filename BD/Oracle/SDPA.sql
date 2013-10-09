/**
 *
 * DBMS           :  ORACLE
 * Base de Datos  :  SDPA
 * Descripción    :  Base de Datos de pruebas Academicas
 * Script         :  Crea la esquema y Agrega Registros
 * Creado por     :  Yoshitomi Maehara Aliaga/Liliana Gonzales Chavez
 * Email          :  yoshitomimaehara@gmail.com/liligh14@gmail.com
 *
**/
-- ==========================================================
-- Inicio de Proceso
-- ==========================================================
SET TERMOUT ON
SET ECHO OFF
SET SERVEROUTPUT ON
BEGIN
	DBMS_OUTPUT.PUT_LINE('Inicio del proceso...');
END;
/
SET TERMOUT OFF
SET SERVEROUTPUT OFF
--================================
-- Creando el Esquema
--================================

-- Verificar Cuenta

declare
  n number(3);
begin
  select count(*) into n from dba_users where username = 'sdpa';
  if(n = 1) then
    execute immediate 'drop user sdpa cascade';
  end if;
  execute immediate 'create user sdpa identified by lilyo';  
end;
/

-- Asignar Privilegios
grant connect,resource to sdpa;

-- Conexión con la base de datos
connect sdpa/lilyo


-- ========================================
-- -------TABLA: Mensaje-------------------
-- ========================================
create table mensaje(
	codmensaje char(6) not null,
	mensaje varchar2(100) not null,
	constraint pk_cliente 
		primary key(codmensaje)
  );

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
values('000006','El Alumno ya Existe');

-- ========================================
-- -------TABLA: Alumno--------------------
-- ========================================
create table alumno(
	codalumno char(6) not null,
	nombre varchar2(20) not null,
  apellido varchar2(20) not null,
  ciclo char(2) not null,
  universidad varchar(50) not null,
  fech_nac date not null,
	creditos integer not null,
  año_ingreso integer not null,
  constraint pk_alumno 
		primary key(codalumno)
  );

/*
insert into alumno(codalumno,nombre,apellido,ciclo,universidad,fech_nac,creditos,año_ingreso)
values('000001','felix','perez','V','universidad del norte',to_date('1980/01/09', 'yyyy/mm/dd'),20,2011);
insert into alumno(codalumno,nombre,apellido,ciclo,universidad,fech_nac,creditos,año_ingreso)
values('000002','Alex','falcon','V','universidad de piura',to_date('1990/06/11', 'yyyy/mm/dd'),28,2012);
*/
-- ========================================
-- -------TABLA: Profesor------------------
-- ========================================
create table profesor(
  codprofesor char(6) not null,
  nombre varchar2(20) not nrull,
  apellido varchar2(20) not null,
  constraint pk_profesor
  primary key(codprofesor)
);

-- ========================================
-- -------TABLA: Curso---------------------
-- ========================================
create table curso(
  codcurso char(6) not null,
  nombre varchar2(20) not null,
  ciclo varchar2(20) not null,
  creditos integer not null,
  constraint pk_curso
  primary key(codcurso)
);
/*
insert into curso(codcurso,nombre,ciclo,creditos)values
('c00001','Matematica Basica','I',4);
insert into curso(codcurso,nombre,ciclo,creditos)values
('c00002','Matematica Basica','II',3);
insert into curso(codcurso,nombre,ciclo,creditos)values
('c00003','Traductores','IV',4);
insert into curso(codcurso,nombre,ciclo,creditos)values
('c00004','Informatica','I',3);
*/
-- ========================================
-- -------TABLA: Nota--------------------
-- ========================================
create table nota(
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
); 

-- ========================================
-- -------TABLA: Usuario-------------------
-- ========================================
create table usuario(
usuario varchar2(6) not null,
contrasenia varchar2(20) not null,
tipo char not null,
constraint pk_usuario
primary key(usuario)
);

/*insert into usuario(usuario,contrasenia,tipo)
values('PRO001','jaureguialan','P');*/
insert into usuario(usuario,contrasenia,tipo)
values('admin','superusuario','S');

-- ========================================
-- -------TABLA: Control-------------------
-- ========================================
create table control(
  parametro varchar2(20) not null,
  valor varchar2(6) not null
);

insert into control values
('curso','C00001');
insert into control values
('auditoria','1');
insert into control values
('profesor','PRO001');
-- ========================================
-- -------TABLA: Auditoria-----------------
-- ========================================
create table auditoria(
 codseguimiento integer not null,
 cambio varchar2(500) not null,
 valor_inicio varchar2(50)not null,
 valor_modif varchar2(50)not null,
 usuario varchar2(6)not null,
 constraint pk_auditoria
 primary key(codseguimiento),
 constraint fk_usuario
 foreign key(usuario)
 references usuario
);

-- drop table auditoria;

-- ===================================================
-- -------TABLA: Evaluacion---------------------------
-- ===================================================
create table evaluacion(
 codevaluacion char(6) not null,
 nrodepreguntas integer not null,
 tipo char(2) not null,
 fecha_inicio date not null,
 fecha_final date not null,
 cant_horas int not null,
 constraint pk_evaluacion
 primary key(codevaluacion)
);

-- ===================================================
-- -------TABLA: Evaluacion_Preguntas-----------------
-- ===================================================
create table evaluacion_preguntas(
 codevaluacion char(6) not null,
 nropregunta integer not null,
 alternativa char(2) not null,
 descripcion_alternativa varchar2(500) not null,
 correcta number(1) not null,
 puntaje integer not null,
 constraint fk_evaluacion_preguntas
 foreign key(codevaluacion)
 references evaluacion
);

-- ====================================================
-- -------TABLA: Evaluacion_Respuestas-----------------
-- ====================================================
create table evaluacion_respuestas(
 codevaluacion char(6) not null,
 codalumno char(6) not null,
 nropregunta integer not null,
 alternativa char(2) not null,
 constraint fk_evaluacion
 foreign key(codevaluacion)
 references evaluacion_preguntas,
 constraint fk_alumno
 foreign key(codalumno)
 references alumno
);

commit;
SET SERVEROUTPUT ON
SET TERMOUT ON
SET ECHO OFF
BEGIN
	DBMS_OUTPUT.PUT_LINE('Fin de Proceso...');
END;
/
SET TERMOUT OFF
SET SERVEROUTPUT OFF
