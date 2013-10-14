create or replace PROCEDURE SP_AGREGA_ALUMNO (
p_nombre varchar2,
p_apellido varchar2,
p_ciclo varchar2,
p_universidad varchar2,
p_fech_nac date,
p_creditos number,
p_anio_ingreso number,
p_usuario varchar2
)AS 
v_msg_error varchar2(500);
v_msg varchar2(500);
v_contraseña varchar2(500);
v_codalumno char(6);
v_inicio varchar2(3);
val int;
n int;
BEGIN
   v_inicio:=substr(to_char(p_anio_ingreso),-2,2);
   select count(*)into n from alumno where codalumno like v_inicio||'%';
   n:=n+1;
   v_codalumno:=v_inicio||to_char(n,'FM0009'); 
   insert into alumno(codalumno,nombre,apellido,ciclo,universidad,fech_nac,creditos,anio_ingreso) 
   values(v_codalumno,p_nombre,p_apellido,p_ciclo,p_universidad,p_fech_nac,p_creditos,p_anio_ingreso);
   v_msg:='se inserto los datos  de un nuevo alumno ' || to_char(v_codalumno);
   select to_number(valor,99) into val from control
   where parametro='auditoria';
   insert into auditoria(CODSEGUIMIENTO,CAMBIO,VALOR_INICIO,VALOR_MODIF,USUARIO)
   values(val,v_msg,0,0,p_usuario);
   val:=val+1;
   update control
   set valor=val
   where parametro='auditoria';
   DBMS_OUTPUT.PUT_LINE('se agrego nuevo alumno');
   v_contraseña:=lower(p_nombre||p_apellido);
   insert into usuario(usuario,contrasenia,tipo)
   values(v_codalumno,v_contraseña,'S');
   commit;
EXCEPTION
  WHEN OTHERS THEN
  rollback;
  v_msg_error:=SQLERRM;
  raise_application_error(-20001,v_msg_error);
END;
/