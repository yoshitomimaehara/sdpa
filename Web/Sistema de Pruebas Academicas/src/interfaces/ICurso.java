package interfaces;

import entity.Curso;

public interface ICurso {
	public void agregarCurso(String nombre,String ciclo,float creditos,String usuario);
	public void eliminarCurso(String idcurso,String usuario);
	public Curso consultarxcodigo(String codcurso);
}
