package dao;

import bancoDados.DataCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Produto;

public class ProdutoDAO {

	private static final String INSERT_PRODUCT_SQL = "INSERT INTO produtos (id, nome, descricao, marca, valorUnitario, ativo) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM produtos WHERE id = ?";
	private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM produtos";
	private static final String DELETE_PRODUCTS_SQL = "DELETE FROM produtos WHERE id = ?";
	private static final String UPDATE_PRODUCT_SQL = "UPDATE produtos SET nome = ?, descricao = ?, marca = ?, valorUnitario = ?, ativo = ? WHERE id = ?";

	public void insertProduto(Produto produto) {
		try (Connection connection = DataCon.getConnection();
				PreparedStatement statement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
			
			statement.setLong(1, produto.getId());
			statement.setString(2, produto.getNome());
			statement.setString(3, produto.getDescricao());
			statement.setString(4, produto.getMarca());
			statement.setDouble(5, produto.getValorUnitario());
			statement.setBoolean(6, produto.isAtivo());

			statement.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Produto selectProduto(int id) {
		Produto produto = null;
		try (Connection connection = DataCon.getConnection();
				PreparedStatement statement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {

			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();

			if (rs.next()) {
				produto = new Produto();
				produto.setId(rs.getLong("id"));
				produto.setNome(rs.getString("nome"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setMarca(rs.getString("marca"));
				produto.setValorUnitario(rs.getDouble("valorUnitario"));
				produto.setAtivo(rs.getBoolean("ativo"));
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return produto;
	}

	public List<Produto> selectAllProdutos() {
		List<Produto> produtos = new ArrayList<>();
		try (Connection connection = DataCon.getConnection();
				PreparedStatement statement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {

			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getLong("id"));
				produto.setNome(rs.getString("nome"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setMarca(rs.getString("marca"));
				produto.setValorUnitario(rs.getDouble("valorUnitario"));
				produto.setAtivo(rs.getBoolean("ativo"));
				produtos.add(produto);
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return produtos;
	}

	public boolean deleteProduto(int id) {
		boolean rowDeleted = false;
		try (Connection connection = DataCon.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCTS_SQL)) {

			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return rowDeleted;
	}

	public boolean updateProduto(Produto produto) {
		boolean rowUpdated = false;
		try (Connection connection = DataCon.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {

			statement.setString(1, produto.getNome());
			statement.setString(2, produto.getDescricao());
			statement.setString(3, produto.getMarca());
			statement.setDouble(4, produto.getValorUnitario());
			statement.setBoolean(5, produto.isAtivo());
			statement.setLong(6, produto.getId());

			rowUpdated = statement.executeUpdate() > 0;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return rowUpdated;
	}
}