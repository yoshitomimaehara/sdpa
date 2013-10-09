package model;

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
			String universidad,String fech_nac,float creditos,int a�o_ingreso,String usuario){
		IAlumnoDao dao=new AlumnoDao();
		dao.agregaralumno(nombre, apellido, ciclo, universidad, fech_nac, creditos, a�o_ingreso,usuario);	
	}
}
