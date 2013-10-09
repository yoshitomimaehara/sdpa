create or replace procedure sp_eliminar_profesor
(
  p_codprofesor IN VARCHAR2,
  p_usuario in varchar2
)as
val number;
v_cont number;
v_msg varchar(500);
begin
 select count(*) into v_cont 
 from profesor where codprofesor=p_codprofesor;
 if (v_cont<>1) then
   raise_application_error(-20001,'no existe el profesor');
 end if;
 delete from profesor where codprofesor=p_codprofesor;
 v_msg:='se elimino al profesor '||p_codprofesor;
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