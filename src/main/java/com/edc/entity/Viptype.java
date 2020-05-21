package com.edc.entity;

import org.springframework.stereotype.Component;

@Component
public class Viptype {
	private int v_Id;
	private String v_Type;
	private double v_Money;
	private int v_Discount;

	public int getV_Id() {
		return v_Id;
	}

	public void setV_Id(int v_Id) {
		this.v_Id = v_Id;
	}

	public String getV_Type() {
		return v_Type;
	}

	public void setV_Type(String v_Type) {
		this.v_Type = v_Type;
	}

	public double getV_Money() {
		return v_Money;
	}

	public void setV_Money(double v_Money) {
		this.v_Money = v_Money;
	}

	public int getV_Discount() {
		return v_Discount;
	}

	public void setV_Discount(int v_Discount) {
		this.v_Discount = v_Discount;
	}

	@Override
	public String toString() {
		return "Viptype [v_Id=" + v_Id + ", v_Type=" + v_Type + ", v_Money=" + v_Money + ", v_Discount=" + v_Discount
				+ "]";
	}

	public Viptype() {
	}

	public Viptype(int v_Id, String v_Type, double v_Money, int v_Discount) {
		super();
		this.v_Id = v_Id;
		this.v_Type = v_Type;
		this.v_Money = v_Money;
		this.v_Discount = v_Discount;
	}

}
