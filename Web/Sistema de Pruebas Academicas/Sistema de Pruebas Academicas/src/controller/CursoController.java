package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CursoModel;
import model.MensajeModel;
import entity.Usuario;

/**
 * Servlet implementation class CursoController
 */
@WebServlet({ "/CursoAgregar", "/CursoEliminar", "/CursoModificar", "/CursoConsultar" })
public class CursoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CursoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String alias = request.getServletPath();
		if(alias.equals("/CursoAgregar")){
			cursoAgregar(request,response);
		}
	}
	
	private void cursoAgregar(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String nombre=request.getParameter("nombre");
		String ciclo=request.getParameter("ciclo");
		float creditos=Float.parseFloat(request.getParameter("creditos"));
		
		try {
			HttpSession session = request.getSession();
			Usuario usu = (Usuario) session.getAttribute("usuario");
			String usuario=usu.getUsuario();
			System.out.println(usuario);
			CursoModel model = new CursoModel();
			model.agregarCurso(nombre, ciclo, creditos,usuario);
			
			request.setAttribute("confirmacion", MensajeModel.getMensaje("000006"));
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		RequestDispatcher rd = request.getRequestDispatcher("curso_insertar.jsp");
		rd.forward(request, response);
	}	
	

}
