package com.edc.entity;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Buyer {
	private int b_Id;
	private String b_Name;
	private String b_Code;
	private String b_Pwd;
	private String b_Birthday;
	private String b_Sex;
	private String b_Phone;
	private String b_ImgPath;
	private List<BuyerAdd> adds;
	private List<Order> orders;
	private BuyerAdd bAdd;
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public BuyerAdd getbAdd() {
		return bAdd;
	}

	public void setbAdd(BuyerAdd bAdd) {
		this.bAdd = bAdd;
	}

	public int getB_Id() {
		return b_Id;
	}

	public void setB_Id(int b_Id) {
		this.b_Id = b_Id;
	}

	public String getB_Name() {
		return b_Name;
	}

	public void setB_Name(String b_Name) {
		this.b_Name = b_Name;
	}

	public String getB_Code() {
		return b_Code;
	}

	public void setB_Code(String b_Code) {
		this.b_Code = b_Code;
	}

	public String getB_Pwd() {
		return b_Pwd;
	}

	public void setB_Pwd(String b_Pwd) {
		this.b_Pwd = b_Pwd;
	}

	public String getB_Birthday() {
		return b_Birthday;
	}

	public void setB_Birthday(String b_Birthday) {
		this.b_Birthday = b_Birthday;
	}

	public String getB_Sex() {
		return b_Sex;
	}

	public void setB_Sex(String b_Sex) {
		this.b_Sex = b_Sex;
	}

	public String getB_Phone() {
		return b_Phone;
	}

	public void setB_Phone(String b_Phone) {
		this.b_Phone = b_Phone;
	}

	public String getB_ImgPath() {
		return b_ImgPath;
	}

	public void setB_ImgPath(String b_ImgPath) {
		this.b_ImgPath = b_ImgPath;
	}

	public List<BuyerAdd> getAdds() {
		return adds;
	}

	public void setAdds(List<BuyerAdd> adds) {
		this.adds = adds;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Buyer(int b_Id, String b_Name, String b_Code, String b_Pwd, String b_Birthday, String b_Sex, String b_Phone,
			String b_ImgPath, List<BuyerAdd> adds, List<Order> orders) {
		super();
		this.b_Id = b_Id;
		this.b_Name = b_Name;
		this.b_Code = b_Code;
		this.b_Pwd = b_Pwd;
		this.b_Birthday = b_Birthday;
		this.b_Sex = b_Sex;
		this.b_Phone = b_Phone;
		this.b_ImgPath = b_ImgPath;
		this.adds = adds;
		this.orders = orders;
	}

	public Buyer() {
	}

	@Override
	public String toString() {
		return "Buyer [b_Id=" + b_Id + ", b_Name=" + b_Name + ", b_Code=" + b_Code + ", b_Pwd=" + b_Pwd
				+ ", b_Birthday=" + b_Birthday + ", b_Sex=" + b_Sex + ", b_Phone=" + b_Phone + ", b_ImgPath="
				+ b_ImgPath + ", adds=" + adds + ", orders=" + orders + ", bAdd=" + bAdd + ", email=" + email + "]";
	}

}
