package com.edc.entity;

import org.springframework.stereotype.Component;

@Component
public class ProductType {
	private int pc_Id;
	private String pc_TypeName;

	public int getPc_Id() {
		return pc_Id;
	}

	public void setPc_Id(int pc_Id) {
		this.pc_Id = pc_Id;
	}

	public String getPc_TypeName() {
		return pc_TypeName;
	}

	public void setPc_TypeName(String pc_TypeName) {
		this.pc_TypeName = pc_TypeName;
	}

	public ProductType(int pc_Id, String pc_TypeName) {
		super();
		this.pc_Id = pc_Id;
		this.pc_TypeName = pc_TypeName;
	}

	public ProductType() {
	}

	@Override
	public String toString() {
		return "ProductType [pc_Id=" + pc_Id + ", pc_TypeName=" + pc_TypeName + "]";
	}

}
