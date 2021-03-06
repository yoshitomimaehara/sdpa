<<<<<<< HEAD:Web/Sistema de Pruebas Academicas/src/dao/AlumnoDao.java
package dao;

import interfaces.IAlumnoDao;
import entity.Alumno;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import util.UtilDate;
import database.AccesoDB;

public class AlumnoDao implements IAlumnoDao{
	public void agregaralumno(String nombre,String apellido,String ciclo,
	String universidad,Date fech_nac,float creditos,int anio_ingreso,String usuario){
		Connection cn=null;
		try{
			cn=AccesoDB.getConnection();
			cn.setAutoCommit(false);
			String sql="{call sp_agrega_alumno(?,?,?,?,?,?,?,?)}";
			CallableStatement cstm = cn.prepareCall(sql);
			cstm.setString(1,nombre);
			cstm.setString(2,apellido);
			cstm.setString(3,ciclo);
			cstm.setString(4,universidad);
			cstm.setDate(5,UtilDate.javaToSQL(fech_nac));
			cstm.setFloat(6,creditos);
			cstm.setInt(7,anio_ingreso);
			cstm.setString(8,usuario);
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
			al.setFech_nac(rs.getDate(6));
			al.setCreditos(rs.getFloat(7));
			al.setAnio_ingreso(rs.getInt(8));
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

	@Override
	public void deletealumno(String idalumno,String usuario) {
		Connection cn=null;
		try {
			cn=AccesoDB.getConnection();
			String sql="{call sp_eliminar_alumno(?,?)}";
			CallableStatement cstm=cn.prepareCall(sql);
			cstm.setString(1, idalumno);
			cstm.setString(2, usuario);
			cstm.executeUpdate();
			cstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally{
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		
	}
	
	
}
=======
package dao;

import interfaces.IAlumnoDao;
import entity.Alumno;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import util.UtilDate;
import database.AccesoDB;

public class AlumnoDao implements IAlumnoDao{
	public void agregaralumno(String nombre,String apellido,String ciclo,
	String universidad,Date fech_nac,float creditos,int anio_ingreso,String usuario){
		Connection cn=null;
		try{
			cn=AccesoDB.getConnection();
			cn.setAutoCommit(false);
			String sql="{call sp_agrega_alumno(?,?,?,?,?,?,?,?)}";
			CallableStatement cstm = cn.prepareCall(sql);
			cstm.setString(1,nombre);
			cstm.setString(2,apellido);
			cstm.setString(3,ciclo);
			cstm.setString(4,universidad);
			cstm.setDate(5,UtilDate.javaToSQL(fech_nac));
			cstm.setFloat(6,creditos);
			cstm.setInt(7,anio_ingreso);
			cstm.setString(8,usuario);
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
			al.setFech_nac(rs.getDate(6));
			al.setCreditos(rs.getFloat(7));
			al.setAnio_ingreso(rs.getInt(8));
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

	@Override
	public void deletealumno(String idalumno,String usuario) {
		Connection cn=null;
		try {
			cn=AccesoDB.getConnection();
			String sql="{call sp_eliminar_alumno(?,?)}";
			CallableStatement cstm=cn.prepareCall(sql);
			cstm.setString(1, idalumno);
			cstm.setString(2, usuario);
			cstm.executeUpdate();
			cstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally{
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		
	}
	
	
}
>>>>>>> origin/master:Web/Sistema de Pruebas Academicas/Sistema de Pruebas Academicas/src/dao/AlumnoDao.java
