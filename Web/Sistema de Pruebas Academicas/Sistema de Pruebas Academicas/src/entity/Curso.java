package entity;

public class Curso {
    String codcurso;
    String nombre;
    String ciclo;
    float creditos;
    
    public String getCodcurso() {
        return codcurso;
    }
    public void setCodcurso(String codcurso) {
        this.codcurso = codcurso;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getCiclo() {
        return ciclo;
    }
    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }
    public float getCreditos() {
        return creditos;
    }
    public void setCreditos(float creditos) {
        this.creditos = creditos;
    }
}
