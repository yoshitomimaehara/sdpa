set autocommit=0;
drop procedure if exists sp_agrega_notas;

delimiter //
create procedure sp_agrega_notas(
  p_codcur char(6),
  p_codalumno char(6),
  p_nota1 integer,
  P_nota2 integer,
  p_nota3 integer,
  p_nota4 integer,
  p_usuario varchar(6),
  out p_estado varchar(500)
)
begin
declare val int;
declare v_msg varchar(500);
declare exit handler for sqlexception,sqlwarning,not found
begin
	rollback;
	set p_estado := 'Error en el proceso de actualización.';
end;
set p_estado = null;
start transaction;
insert into nota(CODCUR,CODALUMNO,NOTA1,NOTA2,NOTA3,NOTA4) 
   values(p_codcur,p_codalumno,p_nota1,p_nota2,p_nota3,p_nota4);
   set v_msg ='se inserto las notas de ' || to_char(p_codalumno) || ' del curso ' || to_char(p_codcur);
   select to_number(valor,99) into val from control
   where parametro='auditoria';
   insert into auditoria(CODSEGUIMIENTO,CAMBIO,VALOR_INICIO,VALOR_MODIF,USUARIO)
   values(val,v_msg,0,0,p_usuario);
   set val =val+1;
   update control
   set valor=val
   where parametro='auditoria';
   set p_estado = 'ok';sp_agrega_notas
commit;

end //

delimiter ;