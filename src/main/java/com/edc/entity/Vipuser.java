package com.edc.entity;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Vipuser {
	private int vu_Id;
	private int vu_Vid;
	private int vu_Bid;
	private String vu_BuyDate;

	public int getVu_Id() {
		return vu_Id;
	}

	public void setVu_Id(int vu_Id) {
		this.vu_Id = vu_Id;
	}

	public int getVu_Vid() {
		return vu_Vid;
	}

	public void setVu_Vid(int vu_Vid) {
		this.vu_Vid = vu_Vid;
	}

	public int getVu_Bid() {
		return vu_Bid;
	}

	public void setVu_Bid(int vu_Bid) {
		this.vu_Bid = vu_Bid;
	}


	public String getVu_BuyDate() {
		return vu_BuyDate;
	}

	public void setVu_BuyDate(String vu_BuyDate) {
		this.vu_BuyDate = vu_BuyDate;
	}

	public Vipuser() {
	}


	public Vipuser(int vu_Id, int vu_Vid, int vu_Bid, String vu_BuyDate) {
		super();
		this.vu_Id = vu_Id;
		this.vu_Vid = vu_Vid;
		this.vu_Bid = vu_Bid;
		this.vu_BuyDate = vu_BuyDate;
	}

	@Override
	public String toString() {
		return "Vipuser [vu_Id=" + vu_Id + ", vu_Vid=" + vu_Vid + ", vu_Bid=" + vu_Bid + ", vu_BuyDate=" + vu_BuyDate
				+ "]";
	}

}
