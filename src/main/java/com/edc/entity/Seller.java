package com.edc.entity;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Seller {
	private int m_Id;
	private String m_Name;
	private String m_ShopName;
	private String createDate;
	private String mdifyDate;
	private String m_Code;
	private String m_Pwd;
	private String m_Phone;
	private String m_imgPath;
	private String m_Address;
	private String m_BusinessHours;// 营业时间
	private List<Product> products;
	private List<Order> orders;

	public Seller(int m_Id, String m_Name, String m_ShopName, String createDate, String mdifyDate, String m_Code,
			String m_Pwd, String m_Phone, String m_imgPath, String m_Address, String m_BusinessHours,
			List<Product> products, List<Order> orders) {
		super();
		this.m_Id = m_Id;
		this.m_Name = m_Name;
		this.m_ShopName = m_ShopName;
		this.createDate = createDate;
		this.mdifyDate = mdifyDate;
		this.m_Code = m_Code;
		this.m_Pwd = m_Pwd;
		this.m_Phone = m_Phone;
		this.m_imgPath = m_imgPath;
		this.m_Address = m_Address;
		this.m_BusinessHours = m_BusinessHours;
		this.products = products;
		this.orders = orders;
	}

	public String getM_Address() {
		return m_Address;
	}

	public void setM_Address(String m_Address) {
		this.m_Address = m_Address;
	}

	public String getM_BusinessHours() {
		return m_BusinessHours;
	}

	public void setM_BusinessHours(String m_BusinessHours) {
		this.m_BusinessHours = m_BusinessHours;
	}

	public int getM_Id() {
		return m_Id;
	}

	public void setM_Id(int m_Id) {
		this.m_Id = m_Id;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	public String getM_ShopName() {
		return m_ShopName;
	}

	public void setM_ShopName(String m_ShopName) {
		this.m_ShopName = m_ShopName;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getMdifyDate() {
		return mdifyDate;
	}

	public void setMdifyDate(String mdifyDate) {
		this.mdifyDate = mdifyDate;
	}

	public String getM_Code() {
		return m_Code;
	}

	public void setM_Code(String m_Code) {
		this.m_Code = m_Code;
	}

	public String getM_Pwd() {
		return m_Pwd;
	}

	public void setM_Pwd(String m_Pwd) {
		this.m_Pwd = m_Pwd;
	}

	public String getM_Phone() {
		return m_Phone;
	}

	public void setM_Phone(String m_Phone) {
		this.m_Phone = m_Phone;
	}

	public String getM_imgPath() {
		return m_imgPath;
	}

	public void setM_imgPath(String m_imgPath) {
		this.m_imgPath = m_imgPath;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Seller() {
	}

	@Override
	public String toString() {
		return "Seller [m_Id=" + m_Id + ", m_Name=" + m_Name + ", m_ShopName=" + m_ShopName + ", createDate="
				+ createDate + ", mdifyDate=" + mdifyDate + ", m_Code=" + m_Code + ", m_Pwd=" + m_Pwd + ", m_Phone="
				+ m_Phone + ", m_imgPath=" + m_imgPath + ", m_Address=" + m_Address + ", m_BusinessHours="
				+ m_BusinessHours + ", products=" + products + ", orders=" + orders + "]";
	}

}
