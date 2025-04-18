<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--<link rel="stylesheet" href="./css/style.css" />!-->
<title>JSP Home</title>
</head>
<body>
	<h2>Bem-vindo ao Sistema!</h2>
	<h2>Página Home</h2>
	<br />
	<h4>Login realizado com sucesso!</h4>
	<br>
	<a href="HomeController?action=usuarioscadastro">Cadastro de
		usuários</a>
	<!-- Botão de Logout -->
	<form action="LoginServlet" method="POST">
		<input type="hidden" name="action" value="logout">
		<button type="submit">Logout</button>
	</form>
</body>
</html>