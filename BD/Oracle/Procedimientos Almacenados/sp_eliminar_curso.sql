create or replace procedure sp_eliminar_curso
(
  p_codcurso IN VARCHAR2,
  p_usuario in varchar2
)as
val number;
v_cont number;
v_msg varchar(500);
v_msg_error varchar(500); 
begin
 select count(*) into v_cont 
 from curso where codcurso=p_codcurso;
 if (v_cont<>1) then
   raise_application_error(-20001,'no existe el curso');
 end if;
 delete from curso where codcurso=p_codcurso;
 v_msg:='se elimino el curso '||p_codcurso;
 select to_number(valor,99) into val from control
   where parametro='auditoria';
   insert into auditoria(CODSEGUIMIENTO,CAMBIO,VALOR_INICIO,VALOR_MODIF,USUARIO)
   values(val,v_msg,0,0,p_usuario);
   val:=val+1;
   update control
   set valor=val
   where parametro='auditoria';
   
commit;
exception 
when others then
rollback;
  v_msg_error:=SQLERRM;
  raise_application_error(-20001,v_msg_error);
end;
/