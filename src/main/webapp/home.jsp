<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css" />
<title>JSP Home</title>
</head>
<body>
	<header>
		<nav>
			<div class="menu"></div>
			<a href="home.jsp">Inicio</a> <a
				href="HomeController?action=produtoscadastro">Cadastro de
				Produtos</a> <a href="HomeController?action=usuarioscadastro">Cadastro
				de Usuários</a>

			<div class="logout-form">
				<form action="LoginServlet" method="POST">
					<input type="hidden" name="action" value="logout" />
					<button type="submit" class="btn-logout">Logout</button>
				</form>
			</div>
		</nav>
	</header>
	<div class="container-home">
		<h1>Bem-vindo ao Sistema!</h1>
	<h2>Página Home</h2>
	<br />
	<h4>Login realizado com sucesso!</h4>
	<br>
	</div>
	<footer>
		<span>Todos os direitos reservados</span>
	</footer>
</body>
</html>