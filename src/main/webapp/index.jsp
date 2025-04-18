<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/style.css" />
<title>Login</title>
</head>
<body>
	<div class="container">
		<h2>Login</h2>
		<div class="form-login">
			<!-- Formulario com a ação para o servlet -->
			<form action="LoginServlet" method="POST" id="form">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" required> <label for="senha">Senha</label> <input
					type="password" id="senha" name="senha" required>
				<button type="submit" name="entrar" id="submit">Entrar</button>
			</form>

			<%
			String erro = request.getParameter("erro");
			if (erro != null) {
			%>
			<p style="color: red;">Email ou senha inválidos.</p>
			<%
			}
			%>

			<!--<c:if test="${param.erro != null}">
			<p style="color: red;">Email ou senha invalidos</p>
			</c:if>-->

			<div class="login-details">
				<p>Não tem uma conta?</p>
				<a href="HomeController?action=usuarioscadastro"
					class="cadastro">Cadastre-se</a>
			</div>

			<div class="login-details">
				<p>Esqueceu sua senha?</p>
				<a href="#" class="resetPassword">Recuperar senha</a>
			</div>
		</div>
	</div>
</body>
</html>