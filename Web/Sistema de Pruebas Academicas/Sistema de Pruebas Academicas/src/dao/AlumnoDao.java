package dao;

import interfaces.IAlumnoDao;
import entity.Alumno;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import database.AccesoDB;

public class AlumnoDao implements IAlumnoDao{
	public void agregaralumno(String nombre,String apellido,String ciclo,
	String universidad,String fech_nac,int creditos,int a�o_ingreso){
		Connection cn=null;
		try{
			cn=AccesoDB.getConnection();
			String sql="{call sp_agregar_alumno(?,?,?,?,?,?,?)}";
			CallableStatement cstm = cn.prepareCall(sql);
			cstm.setString(1, nombre);
			cstm.setString(2, apellido);
			cstm.setString(3, ciclo);
			cstm.setString(4,universidad);
			cstm.setString(5, universidad);
			cstm.setString(6, fech_nac);
			cstm.setInt(7, creditos);
			cstm.setInt(8, a�o_ingreso);
			cstm.executeUpdate();
			cstm.close();
		}catch(Exception e){
			throw new RuntimeException(e.getMessage());
		}finally{
			try {
				cn.close();
			} catch (Exception e) {

			}
		}
	}

	@Override
	public Alumno getAlumnoxuser(String user) {
		Connection cn=null;
		Alumno al=new Alumno();
		try {
			cn=AccesoDB.getConnection();
			String sql="select count(*) from alumno where codalumno=?";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setString(1, user);
			ResultSet rs = pstm.executeQuery();
			rs.next();
			int cont=rs.getInt(1);
			if(cont!=1){
				throw new Exception("El Alumno no Existe");
			}
			sql="select * from alumno where codalumno=?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, user);
			rs = pstm.executeQuery();
			rs.next();
			al.setCodalumno(rs.getString(1));
			al.setNombre(rs.getString(2));
			al.setApellido(rs.getString(3));
			al.setCiclo(rs.getString(4));
			al.setUniversidad(rs.getString(5));
			al.setFech_nac(rs.getString(6));
			al.setCreditos(rs.getInt(7));
			al.setA�o_ingreso(rs.getInt(8));
			rs.close();
			pstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally{
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return al;
	}
	
	
}