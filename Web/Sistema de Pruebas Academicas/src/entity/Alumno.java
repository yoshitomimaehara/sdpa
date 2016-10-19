package entity;

import java.util.Date;

public class Alumno {
	private String codalumno;
	private String nombre;
	private String apellido;
	private String ciclo;
	private String universidad;
	private Date fech_nac;
	private float creditos;
	private int anio_ingreso;
	
	public String getCodalumno() {
		return codalumno;
	}
	public void setCodalumno(String codalumno) {
		this.codalumno = codalumno;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getCiclo() {
		return ciclo;
	}
	public void setCiclo(String ciclo) {
		this.ciclo = ciclo;
	}
	public String getUniversidad() {
		return universidad;
	}
	public void setUniversidad(String universidad) {
		this.universidad = universidad;
	}
	public Date getFech_nac() {
		return fech_nac;
	}
	public void setFech_nac(Date fech_nac) {
		this.fech_nac = fech_nac;
	}
	public float getCreditos() {
		return creditos;
	}
	public void setCreditos(float creditos) {
		this.creditos = creditos;
	}
	public int getAnio_ingreso() {
		return anio_ingreso;
	}
	public void setAnio_ingreso(int anio_ingreso) {
		this.anio_ingreso = anio_ingreso;
	} 
	
	
}
