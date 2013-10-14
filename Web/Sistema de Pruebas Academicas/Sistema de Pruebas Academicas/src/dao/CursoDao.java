package dao;

import java.sql.CallableStatement;
import java.sql.Connection;

import database.AccesoDB;
import interfaces.ICurso;

public class CursoDao implements ICurso {

	@Override
	public void agregarCurso(String nombre, String ciclo, float creditos,String usuario) {
		Connection cn=null;
		try {
			cn=AccesoDB.getConnection();
			cn.setAutoCommit(false);
			String sql="{call sp_agregar_curso(?,?,?,?)}";
			CallableStatement cstm = cn.prepareCall(sql);
			cstm.setString(1, nombre);
			cstm.setString(2, ciclo);
			cstm.setFloat(3, creditos);
			cstm.setString(4, usuario);
			cstm.executeUpdate();
			cstm.close();
			
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally{
			try {
				cn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

	}

}
