package interfaces;

import entity.Profesor;

public interface IProfesor {
	public void agregarProfesor(String Nombre,String Apellido,String usuario);
	public void eliminarProfesor(String codprofesor,String usuario);
	public Profesor ConsultarxCodigo(String codprofesor);
}
