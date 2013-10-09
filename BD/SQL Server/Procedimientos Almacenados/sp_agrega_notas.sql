/**
 *
 * DBMS           :  SQLSERVER
 * Base de Datos  :  SDPA
 * Descripción    :  Base de Datos de pruebas Academicas
 * Script         :  Procedimientos Almacenado de Insercion de Notas
 * Creado por     :  Yoshitomi Maehara Aliaga/Liliana Gonzales Chavez
 * Email          :  yoshitomimaehara@gmail.com/liligh14@gmail.com
 *
**/
create procedure sp_agrega_notas(
  @p_codcur varchar(6),
  @p_codalumno varchar(6),
  @p_nota1 int,
  @P_nota2 int,
  @p_nota3 int,
  @p_nota4 int,
  @p_usuario varchar(6)
)
as
declare
	@v_msg varchar(500),
	@val int
begin try
	begin transaction
		insert into dbo.nota(CODCUR,CODALUMNO,NOTA1,NOTA2,NOTA3,NOTA4) 
		values(@p_codcur,@p_codalumno,@p_nota1,@p_nota2,@p_nota3,@p_nota4);
		set @v_msg ='se inserto las notas de ' + @p_codalumno + ' del curso ' + @p_codcur;
		select @val=convert(int,valor) from control
		where parametro='auditoria';
		insert into auditoria(CODSEGUIMIENTO,CAMBIO,VALOR_INICIO,VALOR_MODIF,USUARIO)
		values(@val,@v_msg,0,0,@p_usuario);
		set @val = @val+1;
		update control
		set valor=@val
		where parametro='auditoria';
	commit transaction
end try
begin catch
	rollback transaction
end catch