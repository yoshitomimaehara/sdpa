package model;

import java.util.Date;

import dao.AlumnoDao;
import dao.MensajeDao;
import entity.Alumno;
import interfaces.IAlumnoDao;

public class AlumnoModel {
	public String ExtraerNombre(String user){
		String men=null;
		IAlumnoDao dao =new AlumnoDao();
		Alumno al = dao.getAlumnoxuser(user);
		men = al.getNombre() + " " + al.getApellido();
		return men;
	}
	
	public Alumno getAlumnoxid(String id){
		IAlumnoDao dao = new AlumnoDao();
		Alumno al = dao.getAlumnoxuser(id);
		return al;
	}
	
	public void agregarAlumno(String nombre,String apellido,String ciclo,
			String universidad,Date fech_nac,float creditos,int anio_ingreso,String usuario){
		IAlumnoDao dao=new AlumnoDao();
		dao.agregaralumno(nombre, apellido, ciclo, universidad, fech_nac, creditos, anio_ingreso,usuario);	
	}
	
	public void eliminarAlumno(String idalumno,String usuario){
		IAlumnoDao dao=new AlumnoDao();
		dao.deletealumno(idalumno, usuario);
	}
}
