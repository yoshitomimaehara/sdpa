create or replace 
procedure sp_eliminar_alumno
(
  p_codalumno IN VARCHAR2,
  p_usuario in varchar2
)as
val number;
v_cont number;
v_msg varchar(500);
begin
 select count(*) into v_cont 
 from alumno where codalumno=p_codalumno;
 if (v_cont<>1) then
   raise_application_error(-20001,'no existe el alumno');
 end if;
 delete from alumno where codalumno=p_codalumno;
 v_msg:='se eliminno al alumno '||p_codalumno;
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
  v_msg:=SQLERRM;
  raise_application_error(-20001,v_msg);
end;
/