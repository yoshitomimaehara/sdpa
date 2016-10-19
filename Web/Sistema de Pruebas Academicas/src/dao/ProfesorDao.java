package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.AccesoDB;
import entity.Profesor;
import interfaces.IProfesor;

public class ProfesorDao implements IProfesor {

	@Override
	public void agregarProfesor(String Nombre, String Apellido,String usuario) {
		Connection cn=null;
		try {
			cn=AccesoDB.getConnection();
			String sql="{call sp_agrega_profesor(?,?,?)}";
			CallableStatement cstm=cn.prepareCall(sql);
			cstm.setString(1, Nombre);
			cstm.setString(2, Apellido);
			cstm.setString(3, usuario);
			cstm.executeUpdate();
			cstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

	}

	@Override
	public void eliminarProfesor(String codprofesor, String usuario) {
		Connection cn=null;
		try{
			cn=AccesoDB.getConnection();
			String sql="{call sp_elimna_profeso(?,?)}";
			CallableStatement cstm=cn.prepareCall(sql);
			cstm.setString(1, codprofesor);
			cstm.setString(2, usuario);
			cstm.executeUpdate();
			cstm.close();
		}catch(Exception e){
			throw new RuntimeException(e.getMessage());
		}
		
	}

	@Override
	public Profesor ConsultarxCodigo(String codprofesor) {
		Connection cn=null;
		Profesor pro;
		try {
			cn=AccesoDB.getConnection();
			String sql="select * from profesor where codprofesor=?";
			PreparedStatement pstm=cn.prepareStatement(sql);
			pstm.setString(1, codprofesor);
			ResultSet rs=pstm.executeQuery();
			pro=new Profesor();
			pro.setCodprofesor(rs.getString(1));
			pro.setNombre(rs.getString(2));
			pro.setApellido(rs.getString(3));
			rs.close();
			pstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

}
