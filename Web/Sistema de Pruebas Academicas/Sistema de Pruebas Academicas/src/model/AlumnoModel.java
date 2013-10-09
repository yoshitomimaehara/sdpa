package model;

import dao.AlumnoDao;
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
		IAlumnoDao dao =new AlumnoDao();
		Alumno al = dao.getAlumnoxuser(id);
		return al;
	}
	
	
}
