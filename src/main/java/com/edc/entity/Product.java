package com.edc.entity;

import org.springframework.stereotype.Component;

@Component
public class Product {
	private int p_Id;
	private String p_Name;
	private double p_Price;
	private int p_Good;
	private int p_Count;
	private int p_Mid;
	private int p_pcId;
	private String p_Info;
	private String p_ImgPath;
	private ProductType productType;

	public Product(int p_Id, String p_Name, double p_Price, int p_Good, int p_Count, int p_Mid, int p_pcId,
			String p_Info, String p_ImgPath, ProductType productType) {
		super();
		this.p_Id = p_Id;
		this.p_Name = p_Name;
		this.p_Price = p_Price;
		this.p_Good = p_Good;
		this.p_Count = p_Count;
		this.p_Mid = p_Mid;
		this.p_pcId = p_pcId;
		this.p_Info = p_Info;
		this.p_ImgPath = p_ImgPath;
		this.productType = productType;
	}

	public ProductType getProductType() {
		return productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	public int getP_Id() {
		return p_Id;
	}

	public void setP_Id(int p_Id) {
		this.p_Id = p_Id;
	}

	public String getP_Name() {
		return p_Name;
	}

	public void setP_Name(String p_Name) {
		this.p_Name = p_Name;
	}

	public double getP_Price() {
		return p_Price;
	}

	public void setP_Price(double p_Price) {
		this.p_Price = p_Price;
	}

	public int getP_Good() {
		return p_Good;
	}

	public void setP_Good(int p_Good) {
		this.p_Good = p_Good;
	}

	public int getP_Count() {
		return p_Count;
	}

	public void setP_Count(int p_Count) {
		this.p_Count = p_Count;
	}

	public int getP_Mid() {
		return p_Mid;
	}

	public void setP_Mid(int p_Mid) {
		this.p_Mid = p_Mid;
	}

	public int getP_pcId() {
		return p_pcId;
	}

	public void setP_pcId(int p_pcId) {
		this.p_pcId = p_pcId;
	}

	public String getP_Info() {
		return p_Info;
	}

	public void setP_Info(String p_Info) {
		this.p_Info = p_Info;
	}

	public String getP_ImgPath() {
		return p_ImgPath;
	}

	public void setP_ImgPath(String p_ImgPath) {
		this.p_ImgPath = p_ImgPath;
	}

	public Product(int p_Id, String p_Name, double p_Price, int p_Good, int p_Count, int p_Mid, int p_pcId,
			String p_Info, String p_ImgPath) {
		super();
		this.p_Id = p_Id;
		this.p_Name = p_Name;
		this.p_Price = p_Price;
		this.p_Good = p_Good;
		this.p_Count = p_Count;
		this.p_Mid = p_Mid;
		this.p_pcId = p_pcId;
		this.p_Info = p_Info;
		this.p_ImgPath = p_ImgPath;
	}

	public Product() {
	}

	@Override
	public String toString() {
		return "Product [p_Id=" + p_Id + ", p_Name=" + p_Name + ", p_Price=" + p_Price + ", p_Good=" + p_Good
				+ ", p_Count=" + p_Count + ", p_Mid=" + p_Mid + ", p_pcId=" + p_pcId + ", p_Info=" + p_Info
				+ ", p_ImgPath=" + p_ImgPath + ", productType=" + productType + "]";
	}

}
