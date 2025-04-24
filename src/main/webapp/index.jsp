<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/style.css" />
</head>
<body>
	<div class="container">
		<div class="form-login">
		   <h2>Login</h2>
			<form action="LoginServlet" method="POST" id="form">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" required /> <label for="senha">Senha</label> <input
					type="password" id="senha" name="senha" required />

				<button type="submit" name="entrar" id="submit">Entrar</button>
			</form>

			<%
				String erro = request.getParameter("erro");
				   if (erro != null) {
			%>
				<p style="color: red; margin-top: 10px;">Email ou senha inválidos.</p>
			<%
			}
			%>

			<div class="login-details" style="margin-top: 15px;">
				<a href="HomeController?action=usuarioscadastro" class="cadastro">Cadastre-se</a>
			</div>
		</div>
	</div>
</body>
</html>
