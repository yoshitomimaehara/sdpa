create or replace PROCEDURE SP_AGREGA_NOTAS(
  p_codcur varchar2,
  p_codalumno varchar2,
  p_nota1 number,
  P_nota2 number,
  p_nota3 number,
  p_nota4 number,
  p_usuario varchar2
) 
AS
v_msg_error varchar(500);
v_msg varchar(500);
val number;
BEGIN
   insert into nota(CODCUR,CODALUMNO,NOTA1,NOTA2,NOTA3,NOTA4) 
   values(p_codcur,p_codalumno,p_nota1,p_nota2,p_nota3,p_nota4);
   v_msg:='se inserto las notas de ' || to_char(p_codalumno) || ' del curso ' || to_char(p_codcur);
   select to_number(valor,99) into val from control
   where parametro='auditoria';
   insert into auditoria(CODSEGUIMIENTO,CAMBIO,VALOR_INICIO,VALOR_MODIF,USUARIO)
   values(val,v_msg,0,0,p_usuario);
   val:=val+1;
   update control
   set valor=val
   where parametro='auditoria';
   DBMS_OUTPUT.PUT_LINE('se registraron las notas');
   commit;
EXCEPTION
  WHEN OTHERS THEN
  rollback;
  v_msg_error:=SQLERRM;
  raise_application_error(-20001,v_msg_error);
END;
/