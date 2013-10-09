package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MensajeDao;
import model.AlumnoModel;
import entity.Alumno;

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
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
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
