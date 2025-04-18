package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class HomeController
 */

@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		System.out.println("----#" + action);

		if ("usuarioscadastro".equals(action)) {
			request.getRequestDispatcher("usuarioscadastro.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtém o parâmetro 'action' para verificar se é cadastro de usuario
		String action = request.getParameter("action");

		if ("usuarioscadastro".equals(action)) {
			System.out.println("redirecionado para o cadastro de usuarios");
			response.sendRedirect("usuarioscadastro.jsp");
		}
	}
}
