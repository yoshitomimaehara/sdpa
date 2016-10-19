package model;

import dao.CursoDao;
import entity.Curso;

public class CursoModel {
	public void agregarCurso(String nombre, String ciclo, float creditos,String usuario){
		CursoDao dao = new CursoDao();
		dao.agregarCurso(nombre, ciclo, creditos,usuario);
	}
	
	public void eliminarCurso(String codcurso,String usuario){
		CursoDao dao=new CursoDao();
		dao.eliminarCurso(codcurso, usuario);
	}
	
	public Curso consultarxcod(String codcurso){
		CursoDao dao = new CursoDao();
		Curso cur=dao.consultarxcodigo(codcurso);
		return cur;
	}
}
