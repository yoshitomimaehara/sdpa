create or replace 
 procedure sp_modificar_profesor(
 p_codprofesor varchar2,
 p_nombre varchar2,
 p_apellido varchar2
 --p_fecha date
 )
 as 
 v_msg_error varchar2(200);
 v_msg varchar2(200);
 begin
  if(length(p_nombre)>0) then 
   update profesor set nombre=p_nombre where codprofesor=p_codprofesor; 
   end if;
  if(length(p_apellido)>0) then
  update profesor set apellido=p_apellido where codprofesor=p_codprofesor;
  end if;
commit;
EXCEPTION
  WHEN OTHERS THEN
  v_msg_error:=SQLERRM;
  raise_application_error(-20001,v_msg_error);
  rollback;
END;
/
  