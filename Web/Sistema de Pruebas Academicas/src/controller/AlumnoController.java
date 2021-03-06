<<<<<<< HEAD:Web/Sistema de Pruebas Academicas/src/controller/AlumnoController.java
package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MensajeDao;
import model.AlumnoModel;
import model.MensajeModel;
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
			try {
				agregarAlumno(request,response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("alumno_insertar.jsp");
				rd.forward(request, response);
			}
		}else if(alias.equals("/AlumnoEliminar")){
			EliminarAlumno(request,response);
		}
	}
	
	
	private void EliminarAlumno(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String codalumno=request.getParameter("idAlumno");
		try {
			HttpSession session = request.getSession();
			Usuario usu = (Usuario) session.getAttribute("usuario");
			String usuario=usu.getUsuario();
			AlumnoModel model = new AlumnoModel();
			model.eliminarAlumno(codalumno, usuario);
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		RequestDispatcher rd = request.getRequestDispatcher("alumno_eliminar.jsp");
		rd.forward(request, response);	
	}


	private void agregarAlumno(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		String ciclo=request.getParameter("ciclo");
		String universidad=request.getParameter("universidad");
		Date fech_nac=formato.parse(request.getParameter("fech_nac").toString());
		float creditos=Float.parseFloat(request.getParameter("creditos"));
		int anio_ingreso=Integer.parseInt(request.getParameter("anio_ingreso"));
		try {
			HttpSession session = request.getSession();
			Usuario usu = (Usuario) session.getAttribute("usuario");
			AlumnoModel model = new AlumnoModel();
			model.agregarAlumno(nombre, apellido, ciclo, universidad, fech_nac, creditos, anio_ingreso,usu.getUsuario());
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		request.setAttribute("confirmacion", "El Alumno se Agrego con Exito");
		RequestDispatcher rd = request.getRequestDispatcher("alumno_insertar.jsp");
		rd.forward(request, response);
	}
	
	
	private void consultarAlumno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Alumno al=new Alumno();
		 String idAlumno=request.getParameter("idAlumno");
				try{
					AlumnoModel model = new AlumnoModel();
					al=model.getAlumnoxid(idAlumno);
					request.setAttribute("al",al);
					HttpSession session=request.getSession();
					session.getAttribute("usuario");
					MensajeDao men = new MensajeDao();
				}catch(Exception e){
					request.setAttribute("error", e.getMessage());
				}
		 RequestDispatcher rd = request.getRequestDispatcher("alumno_consultar.jsp");
		 rd.forward(request, response);
	}
	 

}
=======
package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			try {
				agregarAlumno(request,response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("alumno_insertar.jsp");
				rd.forward(request, response);
			}
		}else if(alias.equals("/AlumnoEliminar")){
			EliminarAlumno(request,response);
		}
	}
	
	
	private void EliminarAlumno(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String codalumno=request.getParameter("idAlumno");
		try {
			HttpSession session = request.getSession();
			Usuario usu = (Usuario) session.getAttribute("usuario");
			String usuario=usu.getUsuario();
			AlumnoModel model = new AlumnoModel();
			model.eliminarAlumno(codalumno, usuario);
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		RequestDispatcher rd = request.getRequestDispatcher("alumno_eliminar.jsp");
		rd.forward(request, response);	
	}


	private void agregarAlumno(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		String ciclo=request.getParameter("ciclo");
		String universidad=request.getParameter("universidad");
		Date fech_nac=formato.parse(request.getParameter("fech_nac").toString());
		float creditos=Float.parseFloat(request.getParameter("creditos"));
		int anio_ingreso=Integer.parseInt(request.getParameter("anio_ingreso"));
		try {
			HttpSession session = request.getSession();
			Usuario usu = (Usuario) session.getAttribute("usuario");
			AlumnoModel model = new AlumnoModel();
			model.agregarAlumno(nombre, apellido, ciclo, universidad, fech_nac, creditos, anio_ingreso,usu.getUsuario());
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		request.setAttribute("confirmacion", "El Alumno se Agrego con Exito");
		RequestDispatcher rd = request.getRequestDispatcher("alumno_insertar.jsp");
		rd.forward(request, response);
	}
	
	
	private void consultarAlumno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Alumno al=new Alumno();
		 String idAlumno=request.getParameter("idAlumno");
				try{
					AlumnoModel model = new AlumnoModel();
					al=model.getAlumnoxid(idAlumno);
					request.setAttribute("al",al);
					HttpSession session=request.getSession();
					session.getAttribute("usuario");
				}catch(Exception e){
					request.setAttribute("error", e.getMessage());
				}
		 RequestDispatcher rd = request.getRequestDispatcher("alumno_consultar.jsp");
		 rd.forward(request, response);
	}
	 

}
>>>>>>> origin/master:Web/Sistema de Pruebas Academicas/Sistema de Pruebas Academicas/src/controller/AlumnoController.java
