package interfaces;

import java.util.Date;

import entity.Alumno;

public interface IAlumnoDao {
	public void agregaralumno(String nombre,String apellido,String ciclo,
			String universidad,Date fech_nac,float creditos,int anio_ingreso,String usuario);
			public Alumno getAlumnoxuser(String user);		
}
