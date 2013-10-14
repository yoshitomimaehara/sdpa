create or replace 
PROCEDURE SP_AGREGA_PROFESOR 
 (p_nombre varchar2,
 p_apellido varchar2,
 p_usuario varchar2
  )
AS
v_contraseña varchar2(500);
v_msg varchar2(500);
v_msg_error varchar2(500);
v_codprofesor varchar2(6);
v_temporal varchar2(6);
v_inicio varchar2(3);
val int;
n int;
BEGIN

   select valor into v_codprofesor 
   from control 
   where parametro='profesor';

   insert into profesor(codprofesor,nombre,apellido) 
   values(v_codprofesor,p_nombre,p_apellido);
   v_msg:='se inserto los datos  de un nuevo profesor ' || to_char(v_codprofesor);
   DBMS_OUTPUT.PUT_LINE('se agrego nuevo profesor');
   select to_number(valor,99) into val from control
   where parametro='auditoria';
   
   insert into auditoria(CODSEGUIMIENTO,CAMBIO,VALOR_INICIO,VALOR_MODIF,USUARIO)
   values(val,v_msg,0,0,p_usuario);
   val:=val+1;
   update control
   set valor=val
   where parametro='auditoria';
   
   DBMS_OUTPUT.PUT_LINE('se agrego nueva auditoria');
   v_inicio:=substr(v_codprofesor,4,3);
   n:=to_number(v_inicio);
   n:=n+1;
   v_temporal:='PRO'||to_char(n,'FM009');
   
   update control
   set valor=v_temporal
   where parametro='profesor';
   DBMS_OUTPUT.PUT_LINE('actualizo control');
   
   v_contraseña:=lower(p_nombre||p_apellido);
   insert into usuario(usuario,contrasenia,tipo)
   values(v_temporal,v_contraseña,'P');
   DBMS_OUTPUT.PUT_LINE('agrego usuario');
   
   commit;
EXCEPTION
  WHEN OTHERS THEN
  rollback;
  v_msg_error:=SQLERRM;
  raise_application_error(-20001,v_msg_error);
END;
/