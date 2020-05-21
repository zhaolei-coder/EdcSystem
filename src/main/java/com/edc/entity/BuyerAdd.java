package com.edc.entity;

import org.springframework.stereotype.Component;

@Component
public class BuyerAdd {
	private int addr_Id;
	private String address;
	private int addr_Bid;

	public int getAddr_Id() {
		return addr_Id;
	}

	public void setAddr_Id(int addr_Id) {
		this.addr_Id = addr_Id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAddr_Bid() {
		return addr_Bid;
	}

	public void setAddr_Bid(int addr_Bid) {
		this.addr_Bid = addr_Bid;
	}

	public BuyerAdd(int addr_Id, String address, int addr_Bid) {
		super();
		this.addr_Id = addr_Id;
		this.address = address;
		this.addr_Bid = addr_Bid;
	}

	public BuyerAdd() {
	}

	@Override
	public String toString() {
		return "BuyerAdd [addr_Id=" + addr_Id + ", address=" + address + ", addr_Bid=" + addr_Bid + "]";
	}

}
