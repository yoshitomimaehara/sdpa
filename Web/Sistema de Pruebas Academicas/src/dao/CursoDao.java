package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.AccesoDB;
import entity.Curso;
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
				
			}
		}

	}

	@Override
	public void eliminarCurso(String idcurso, String usuario) {
		Connection cn=null;
		try {
			cn=AccesoDB.getConnection();
			cn.setAutoCommit(false);
			String sql="{call sp_eliminar_curso(?,?)}";
			CallableStatement cstm = cn.prepareCall(sql);
			cstm.setString(1, idcurso);
			cstm.setString(2, usuario);
			cstm.executeUpdate();
			cstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally{
			try {
				cn.close();
			} catch (Exception e2) {
				
			}
		}
		
	}

	@Override
	public Curso consultarxcodigo(String codcurso) {
		Connection cn=null;
		Curso cur=null;
		try {
			cn=AccesoDB.getConnection();
			String sql="select * from curso where codcurso=?";
			PreparedStatement pstm=cn.prepareStatement(sql);
			pstm.setString(1, codcurso);
			ResultSet rs=pstm.executeQuery();
			rs.next();
			cur= new Curso();
			cur.setCodcurso(rs.getString(1));
			cur.setNombre(rs.getString(2));
			cur.setCiclo(rs.getString(3));
			cur.setCreditos(rs.getFloat(4));
			rs.close();
			pstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally{
			try {
				cn.close();
			} catch (Exception e2) {
			}
		}
		return cur;
	}
	
}
