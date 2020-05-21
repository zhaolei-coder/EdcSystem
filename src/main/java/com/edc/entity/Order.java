package com.edc.entity;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Order {
	private int o_Id;
	private int o_Pid;
	private int o_Count;
	private String o_CreatDate;
	private int o_Bid;
	private Double o_TotalPrices;
	private String o_State;
	private String o_Remark;
	private int o_ZftId;
	private String o_OrderCode;
	private Integer o_Address;

	private Buyer buyer;
	private Payment_type payment_type;
	private Product product;

	@Override
	public String toString() {
		return "Order [o_Id=" + o_Id + ", o_Pid=" + o_Pid + ", o_Count=" + o_Count + ", o_CreatDate=" + o_CreatDate
				+ ", o_Bid=" + o_Bid + ", o_TotalPrices=" + o_TotalPrices + ", o_State=" + o_State + ", o_Remark="
				+ o_Remark + ", o_ZftId=" + o_ZftId + ", o_OrderCode=" + o_OrderCode + ", o_Address=" + o_Address
				+ ", buyer=" + buyer + ", payment_type=" + payment_type + ", product=" + product + "]";
	}

	public Order() {
	}

	public Order(int o_Id, int o_Pid, int o_Count, String o_CreatDate, int o_Bid, Double o_TotalPrices, String o_State,
			String o_Remark, int o_ZftId, String o_OrderCode, Integer o_Address, Buyer buyer, Payment_type payment_type,
			Product product) {
		super();
		this.o_Id = o_Id;
		this.o_Pid = o_Pid;
		this.o_Count = o_Count;
		this.o_CreatDate = o_CreatDate;
		this.o_Bid = o_Bid;
		this.o_TotalPrices = o_TotalPrices;
		this.o_State = o_State;
		this.o_Remark = o_Remark;
		this.o_ZftId = o_ZftId;
		this.o_OrderCode = o_OrderCode;
		this.o_Address = o_Address;
		this.buyer = buyer;
		this.payment_type = payment_type;
		this.product = product;
	}

	public int getO_Id() {
		return o_Id;
	}

	public void setO_Id(int o_Id) {
		this.o_Id = o_Id;
	}

	public int getO_Pid() {
		return o_Pid;
	}

	public void setO_Pid(int o_Pid) {
		this.o_Pid = o_Pid;
	}

	public int getO_Count() {
		return o_Count;
	}

	public void setO_Count(int o_Count) {
		this.o_Count = o_Count;
	}

	public String getO_CreatDate() {
		return o_CreatDate;
	}

	public void setO_CreatDate(String o_CreatDate) {
		this.o_CreatDate = o_CreatDate;
	}

	public int getO_Bid() {
		return o_Bid;
	}

	public void setO_Bid(int o_Bid) {
		this.o_Bid = o_Bid;
	}

	public Double getO_TotalPrices() {
		return o_TotalPrices;
	}

	public void setO_TotalPrices(Double o_TotalPrices) {
		this.o_TotalPrices = o_TotalPrices;
	}

	public String getO_State() {
		return o_State;
	}

	public void setO_State(String o_State) {
		this.o_State = o_State;
	}

	public String getO_Remark() {
		return o_Remark;
	}

	public void setO_Remark(String o_Remark) {
		this.o_Remark = o_Remark;
	}

	public int getO_ZftId() {
		return o_ZftId;
	}

	public void setO_ZftId(int o_ZftId) {
		this.o_ZftId = o_ZftId;
	}

	public String getO_OrderCode() {
		return o_OrderCode;
	}

	public void setO_OrderCode(String o_OrderCode) {
		this.o_OrderCode = o_OrderCode;
	}

	public Integer getO_Address() {
		return o_Address;
	}

	public void setO_Address(Integer o_Address) {
		this.o_Address = o_Address;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public Payment_type getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(Payment_type payment_type) {
		this.payment_type = payment_type;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
