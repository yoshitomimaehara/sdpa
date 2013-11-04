create or replace 
procedure sp_modifica_alumno (
p_codalumno varchar2,
p_nombre varchar2,
p_apellido varchar2,
p_ciclo varchar2,
p_universidad varchar2,
p_fech_nac date,
p_creditos number,
p_anio_ingreso number,
p_usuario varchar2
)
as
 v_msg_error varchar2(200);
 v_msg varchar2(200);
begin
if(length (p_nombre)>0) then
  UPDATE alumno SET nombre=p_nombre WHERE codalumno=p_codalumno;
 end if;
 if(length (p_apellido)>0) then
  UPDATE alumno SET apellido=p_apellido WHERE codalumno=p_codalumno;
 end if;
 if(length (p_ciclo)>0) then
  UPDATE alumno SET ciclo=p_ciclo WHERE codalumno=p_codalumno;
 end if;
 if(length (p_universidad)>0) then
  UPDATE alumno SET universidad=p_universidad WHERE codalumno=p_codalumno;
 end if;
 if(length (p_fech_nac)>0) then
  UPDATE alumno SET fech_nac=p_fech_nac WHERE codalumno=p_codalumno;
 end if;
 if(p_creditos>0) then
  UPDATE alumno SET creditos=p_creditos WHERE codalumno=p_codalumno;
 end if;
 if(p_anio_ingreso>0) then
  UPDATE alumno SET anio_ingreso=p_anio_ingreso WHERE codalumno=p_codalumno;
 end if;
commit;
EXCEPTION
  WHEN OTHERS THEN
  v_msg_error:=SQLERRM;
  raise_application_error(-20001,v_msg_error);
  rollback;
END;
/