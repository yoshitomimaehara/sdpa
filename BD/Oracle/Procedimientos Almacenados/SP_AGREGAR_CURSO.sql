create or replace 
PROCEDURE SP_AGREGAR_CURSO 
(
  p_nombre varchar2,
  p_ciclo varchar2,
  p_creditos integer,
  p_usuario varchar2
)
AS
v_msg varchar2(500);
v_msg_error varchar2(500);
v_codcurso varchar2(6);
v_inicio varchar2(5);
val number;
n number;
v_temporal varchar2(6);
BEGIN
  select valor into v_codcurso
  from control
  where parametro='curso';
   insert into curso(codcurso,nombre,ciclo,creditos) 
   values(v_codcurso,p_nombre,p_ciclo,p_creditos);
   v_msg:='se inserto los datos  de un nuevo curso ' || to_char(v_codcurso);

   select to_number(valor,99) into val from control
   where parametro='auditoria';
   insert into auditoria(CODSEGUIMIENTO,CAMBIO,VALOR_INICIO,VALOR_MODIF,USUARIO)
   values(val,v_msg,0,0,p_usuario);
   val:=val+1;
   update control
   set valor=val
   where parametro='auditoria';
   
   v_inicio:=substr(v_codcurso,2,5);
   n:=to_number(v_inicio);
   n:=n+1;
   v_temporal:='c'||to_char(n,'FM00009');
   update control
   set valor=v_temporal
   where parametro='curso'; 
   DBMS_OUTPUT.PUT_LINE('se agrego nuevo curso');   
   commit;
EXCEPTION
  WHEN OTHERS THEN
  v_msg_error:=SQLERRM;
  raise_application_error(-20001,v_msg_error);
  rollback;
END;
/