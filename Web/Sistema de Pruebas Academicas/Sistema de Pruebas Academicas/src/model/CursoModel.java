package model;

import dao.CursoDao;

public class CursoModel {
	public void agregarCurso(String nombre, String ciclo, float creditos,String usuario){
		CursoDao dao = new CursoDao();
		dao.agregarCurso(nombre, ciclo, creditos,usuario);
	}
}