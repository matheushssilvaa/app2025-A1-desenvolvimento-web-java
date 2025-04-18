<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.ProdutoDAO"%>
<%@ page import="model.Produto"%>

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
<title>Cadastro de produtos</title>
<script>
	function editarProduto(id, nome, descricao, marca, valorUnitario, ativo) {
		document.getElementById("id").value = id;
		document.getElementById("nome").value = nome;
		document.getElementById("descricao").value = descricao;
		document.getElementById("marca").value = marca;
		document.getElementById("valorUnitario").value = valorUnitario;
		document.getElementById("ativo").value = ativo;
	}
</script>
</head>
<body>
	<div class="container">
		<h2>Cadastro de produtos</h2>
		<div class="form-login">
			<!-- Formulario com a ação para o servlet -->
			<form action="ProdutoControl" method="POST" id="form">

				<input id="id" type="hidden" name="id" /> <label for="email">Nome
					do produto</label> <input type="text" id="nome" name="nome" required /> <label
					for="email">Descrição</label>
				<textarea type="text" id="descricao" name="descricao" required></textarea>

				<label for="senha">Marca</label> <input type="text" id="marca"
					name="marca"
					style="padding: 10px; border-radius: 5px; outline: 0; border: 1px solid #000;"
					required /> <label for="">Valor Unitário</label> <input
					type="text" id="valorUnitario" name="valorUnitario"
					style="padding: 10px; border-radius: 5px; outline: 0; border: 1px solid #000;"
					required />

				<div style="display: flex; align-itens: center; margin-top: 10px;">
					<input type="checkbox" id="ativo" name="ativo" /> <label
						for="status" style="margin-left: 5px; margin-top: 0">Ativo?</label>
				</div>

				<button type="submit" name="entrar" id="submit">Salvar</button>
			</form>

			<h2>Produtos cadastrados</h2>
			<table border="1">
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Descrição</th>
					<th>Marca</th>
					<th>Valor Unitario</th>
					<th>Ativo</th>
					<th>Ações</th>
				</tr>
				<%
				ProdutoDAO produtoDAO = new ProdutoDAO();
				List<Produto> produtos = produtoDAO.selectAllProdutos();
				for (Produto produto : produtos) {
				%>
				<tr>
					<td><%=produto.getId()%></td>
					<td><%=produto.getNome()%></td>
					<td><%=produto.getDescricao()%></td>
					<td><%=produto.getMarca()%></td>
					<td><%=produto.getValorUnitario()%></td>
					<td><%=produto.isAtivo()%></td>
					<td>
						<button
							onClick="editarProduto('<%=produto.getId()%>', '<%=produto.getNome()%>','<%=produto.getDescricao()%>','<%=produto.getMarca()%>','<%=produto.getValorUnitario()%>','<%=produto.isAtivo()%>')">Editar</button>
						<button
							onClick="window.location.href='ProdutoControl?action=delete&id=<%=produto.getId()%>'">Excluir</button>
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