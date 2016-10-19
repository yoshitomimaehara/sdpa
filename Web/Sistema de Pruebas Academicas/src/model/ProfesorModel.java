package model;

import dao.ProfesorDao;
import entity.Profesor;

public class ProfesorModel {
	public void agregarProfesor(String nombre,String apellido,String usuario){
		ProfesorDao dao =  new ProfesorDao();
		dao.agregarProfesor(nombre, apellido, usuario);
	}
	
	public void eliminarAlumno(String codprofesor,String usuario){
		ProfesorDao dao = new ProfesorDao();
		dao.eliminarProfesor(codprofesor, usuario);
	}
	
	public Profesor consultarxcod(String codprofesor){
		ProfesorDao dao = new ProfesorDao();
		Profesor pro=dao.ConsultarxCodigo(codprofesor);
		return pro;
	}
}
