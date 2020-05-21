package com.edc.entity;

public class ShoppingCart {
	private int id;
	private int buyerId;
	private int productId;
	private int shopCont;
	private double money;
	private Product product;
	private Seller seller;
	
	

	public ShoppingCart(int id, int buyerId, int productId, int shopCont, double money, Product product,
			Seller seller) {
		super();
		this.id = id;
		this.buyerId = buyerId;
		this.productId = productId;
		this.shopCont = shopCont;
		this.money = money;
		this.product = product;
		this.seller = seller;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public ShoppingCart(int id, int buyerId, int productId, int shopCont, double money, Product product) {
		super();
		this.id = id;
		this.buyerId = buyerId;
		this.productId = productId;
		this.shopCont = shopCont;
		this.money = money;
		this.product = product;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getShopCont() {
		return shopCont;
	}

	public void setShopCont(int shopCont) {
		this.shopCont = shopCont;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public ShoppingCart() {
	}

	public ShoppingCart(int id, int buyerId, int productId, int shopCont, double money) {
		super();
		this.id = id;
		this.buyerId = buyerId;
		this.productId = productId;
		this.shopCont = shopCont;
		this.money = money;
	}

	@Override
	public String toString() {
		return "ShoppingCart [id=" + id + ", buyerId=" + buyerId + ", productId=" + productId + ", shopCont=" + shopCont
				+ ", money=" + money + ", product=" + product + ", seller=" + seller + "]";
	}

}
