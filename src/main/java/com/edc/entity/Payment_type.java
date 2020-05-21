package com.edc.entity;

import org.springframework.stereotype.Component;

@Component
public class Payment_type {
	private int zft_id;
	private String zft_type;

	public int getZft_id() {
		return zft_id;
	}

	public void setZft_id(int zft_id) {
		this.zft_id = zft_id;
	}

	public String getZft_type() {
		return zft_type;
	}

	public void setZft_type(String zft_type) {
		this.zft_type = zft_type;
	}

	public Payment_type(int zft_id, String zft_type) {
		super();
		this.zft_id = zft_id;
		this.zft_type = zft_type;
	}

	public Payment_type() {
	}

	@Override
	public String toString() {
		return "Payment_type [zft_id=" + zft_id + ", zft_type=" + zft_type + "]";
	}

}
