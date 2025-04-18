package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuario;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Obtém o parâmetro 'action' para verificar se é login ou logout
		String action = request.getParameter("action");

		if ("logout".equals(action)) {
			
			// Realiza o logout
			System.out.println("--->Logout efetuado!");
			HttpSession session = request.getSession(false); // Obtéma sessão, se existir

			if (session != null) {
				session.invalidate(); // Invalida a sessão, efetivamente fazendo o logout
			}
			response.sendRedirect("index.jsp"); // Redireciona de volta para a página de login (index.jsp)
		} else {
			// Processa o login
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");

			// Cria o objeto Usuario
			Usuario usuario = new Usuario();

			// Valida o email e a senha
			if (email.equals(usuario.getEmail()) && senha.equals(usuario.getSenha())) {

				// Login bem-sucedido: cria a sessão e redireciona para a home.jsp
				HttpSession session = request.getSession();

				session.setAttribute("usuario", usuario); // Armazena o usuário na sessão

				response.sendRedirect("home.jsp"); // Redireciona para a página home.jsp

				System.out.println("--->Login efetuado!");
			} else {
				// Login falhou: redireciona de volta para o index.jsp com erro
				response.sendRedirect("index.jsp?erro=true");
			}
		}
	}
}