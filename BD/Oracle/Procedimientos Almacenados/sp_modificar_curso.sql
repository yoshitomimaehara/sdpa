create or replace 
procedure sp_modifica_curso (
p_codcurso varchar2, 
p_nombre varchar2,
p_ciclo varchar2,
p_creditos number
)
as
 v_msg_error varchar2(200);
 v_msg varchar2(200);
begin
if(length (p_nombre)>0) then
  UPDATE curso SET nombre=p_nombre WHERE codcurso=p_codcurso;
 end if;
 if(length (p_ciclo)>0) then
  UPDATE curso SET ciclo=p_ciclo WHERE codcurso=p_codcurso;
 end if;
 if(p_creditos>0) then
  UPDATE curso SET creditos=p_creditos WHERE codcurso=p_codcurso;
 end if;
commit;
EXCEPTION
  WHEN OTHERS THEN
  v_msg_error:=SQLERRM;
  raise_application_error(-20001,v_msg_error);
  rollback;
END;
/