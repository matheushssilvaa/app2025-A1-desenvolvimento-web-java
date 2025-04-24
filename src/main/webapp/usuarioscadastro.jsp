<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.UsuarioDAO"%>
<%@ page import="model.Usuario"%>

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
<title>Cadastro de usuários</title>
<script>
	function editarUsuario(id, nome, email, senha, telefone, status) {
		document.getElementById("id").value = id;
		document.getElementById("nome").value = nome;
		document.getElementById("email").value = email;
		document.getElementById("senha").value = senha;
		document.getElementById("telefone").value = telefone;
		document.getElementById("status").value = status;
	}
</script>
</head>
<body>
	<header> <nav> <a href="home.jsp">Inicio</a> <a
		href="HomeController?action=produtoscadastro">Cadastro de Produtos</a>
	<a href="HomeController?action=usuarioscadastro">Cadastro de
		Usuários</a> </nav> </header>
	<div class="container">
		<div class="form-login">
			<h2>Cadastro de usuários</h2>
			<form action="UsuarioControl" method="POST" id="form">
				<input id="id" type="hidden" name="id" /> <label for="email">Nome
					completo</label> <input type="text" id="nome" name="nome" required /> <label
					for="email">Email</label> <input type="email" id="email"
					name="email" required /> <label for="senha">Senha</label> <input
					type="password" id="senha" name="senha" required /> <label for="">Telefone</label>
				<input type="text" id="telefone" name="telefone" required />

				<div style="display: flex; align-items: center; margin-top: 10px;">
					<input type="checkbox" id="status" name="status" /> <label
						for="status" style="margin-left: 5px; margin-top: 0">Ativo?</label>
				</div>

				<button type="submit" name="entrar" id="submit">Cadastre-se</button>
			</form>

			<div class="stroke"></div>
			<div class="login-details">
				<p>Não tem uma conta?</p>
				<a href="http://localhost:8081/app2025-A1/index.jsp"
					class="cadastro">Fazer login</a>
			</div>
		</div>

		<div class="tabela-produtos">
			<h2>Usuários cadastrados</h2>
			<table>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Email</th>
					<th>Telefone</th>
					<th>Status</th>
					<th>Ações</th>
				</tr>
				<%
				UsuarioDAO usuarioDAO = new UsuarioDAO();
				List<Usuario> usuarios = usuarioDAO.selectAllUsuarios();
				for (Usuario usuario : usuarios) {
				%>
				<tr>
					<td><%=usuario.getId()%></td>
					<td><%=usuario.getNome()%></td>
					<td><%=usuario.getEmail()%></td>
					<td><%=usuario.getTelefone()%></td>
					<td><%=usuario.isStatus() ? "Ativo" : "Inativo"%></td>
					<td>
						<button
							onClick="editarUsuario('<%=usuario.getId()%>', '<%=usuario.getNome()%>','<%=usuario.getEmail()%>','<%=usuario.getSenha()%>','<%=usuario.getTelefone()%>','<%=usuario.isStatus()%>')">Editar</button>
						<button
							onClick="window.location.href='UsuarioControl?action=delete&id=<%=usuario.getId()%>'">Excluir</button>
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>

</body>
</html>