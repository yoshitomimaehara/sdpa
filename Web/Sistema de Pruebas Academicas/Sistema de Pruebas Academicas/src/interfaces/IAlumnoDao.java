package interfaces;

import entity.Alumno;

public interface IAlumnoDao {
	public void agregaralumno(String nombre,String apellido,String ciclo,
			String universidad,String fech_nac,float creditos,int a�o_ingreso,String usuario);
			public Alumno getAlumnoxuser(String user);		
}
