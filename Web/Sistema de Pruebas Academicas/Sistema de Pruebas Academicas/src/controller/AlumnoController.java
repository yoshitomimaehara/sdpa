package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MensajeDao;
import model.AlumnoModel;
import entity.Alumno;
import entity.Usuario;

/**
 * Servlet implementation class AlumnoController
 */
@WebServlet({ "/AlumnoConsultar", "/AlumnoAgregar", "/AlumnoEliminar", "/AlumnoModificar" })
public class AlumnoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String alias = request.getServletPath();
		if(alias.equals("/AlumnoConsultar")){
			consultarAlumno(request,response);
		}else if(alias.equals("/AlumnoAgregar")){
			agregarAlumno(request,response);
		}
	}
	
	
	private void agregarAlumno(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		String ciclo=request.getParameter("ciclo");
		String universidad=request.getParameter("universidad");
		String fech_nac=request.getParameter("fech_nac");
		float creditos=Float.parseFloat(request.getParameter("creditos"));
		int año_ingreso=Integer.parseInt(request.getParameter("año_ingreso"));
		try {
			AlumnoModel model = new AlumnoModel();
			model.agregarAlumno(nombre, apellido, ciclo, universidad, fech_nac, creditos, año_ingreso,"admin");
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		RequestDispatcher rd = request.getRequestDispatcher("alumno_insertar.jsp");
		rd.forward(request, response);
	}


	private void consultarAlumno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Alumno al=new Alumno();
		 String idAlumno=request.getParameter("idAlumno");
				try{
					AlumnoModel model = new AlumnoModel();
					al=model.getAlumnoxid(idAlumno);
					request.setAttribute("confirmacion", "Alumno fue creado!!!");
					request.setAttribute("al",al);
					MensajeDao men = new MensajeDao();
				}catch(Exception e){
					request.setAttribute("error", e.getMessage());
				}
		 RequestDispatcher rd = request.getRequestDispatcher("alumno_consultar.jsp");
		 rd.forward(request, response);
	}
	 

}
