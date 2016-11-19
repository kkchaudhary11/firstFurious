package com.firstfurious.category;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Category {
	
	@javax.persistence.Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int cId;
	private String cName;
	
	
	//getters and setters
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	@Override
	public String toString() {
		return "Category [cId=" + cId + ", cName=" + cName + "]";
	}
	
	

}
