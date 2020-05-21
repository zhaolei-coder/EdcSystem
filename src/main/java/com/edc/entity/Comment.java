package com.edc.entity;

import org.springframework.stereotype.Component;

@Component
public class Comment {
	private int c_Id;
	private String c_Content;
	private String c_Date;
	private int c_Bid;
	private int c_Pid;
	private Buyer buyer;
	private Product product;
	private Seller seller;
	
	

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public int getC_Id() {
		return c_Id;
	}

	public void setC_Id(int c_Id) {
		this.c_Id = c_Id;
	}

	public String getC_Content() {
		return c_Content;
	}

	public void setC_Content(String c_Content) {
		this.c_Content = c_Content;
	}

	public String getC_Date() {
		return c_Date;
	}

	public void setC_Date(String c_Date) {
		this.c_Date = c_Date;
	}

	public int getC_Bid() {
		return c_Bid;
	}

	public void setC_Bid(int c_Bid) {
		this.c_Bid = c_Bid;
	}

	public int getC_Pid() {
		return c_Pid;
	}

	public void setC_Pid(int c_Pid) {
		this.c_Pid = c_Pid;
	}

	public Comment(int c_Id, String c_Content, String c_Date, int c_Bid, int c_Pid) {
		super();
		this.c_Id = c_Id;
		this.c_Content = c_Content;
		this.c_Date = c_Date;
		this.c_Bid = c_Bid;
		this.c_Pid = c_Pid;
	}

	public Comment() {
	}

	@Override
	public String toString() {
		return "Comment [c_Id=" + c_Id + ", c_Content=" + c_Content + ", c_Date=" + c_Date + ", c_Bid=" + c_Bid
				+ ", c_Pid=" + c_Pid + "]";
	}

}
