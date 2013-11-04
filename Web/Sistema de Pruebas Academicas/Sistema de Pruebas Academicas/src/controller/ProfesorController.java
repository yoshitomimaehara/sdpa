package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProfesorController
 */
@WebServlet({ "/AgregarProfesor", "/EliminarProfesor", "/ConsultarProfesor", "/ModificarProfesor" })
public class ProfesorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfesorController() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String alias=request.getServletPath();
		if(alias.equals("AgregaProfesor")){
			AgregaProfesor(request,response);
		}else if(alias.equals("EliminarProfesor")){
			EliminarProfesor(request,response);
		}else if(alias.equals("ModificarProfesor")){
			
		}else if(alias.equals("ConsultarProfesor")){
			ConsultarProfesor(request,response);
		}
	}

	private void ConsultarProfesor(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void EliminarProfesor(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void AgregaProfesor(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
