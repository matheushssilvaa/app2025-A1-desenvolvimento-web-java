package model;

public class Produto {
	
	private long id;
	private String nome;
	private String descricao;
	private String marca;
	private double valorUnitario;
	private boolean ativo;
	
	public Produto() {}

	public Produto(long id, String nome, String descricao, String marca, double valorUnitario, boolean ativo) {
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.valorUnitario = valorUnitario;
		this.ativo = ativo;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public double getValorUnitario() {
		return valorUnitario;
	}

	public void setValorUnitario(double valorUnitario) {
		this.valorUnitario = valorUnitario;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
}
