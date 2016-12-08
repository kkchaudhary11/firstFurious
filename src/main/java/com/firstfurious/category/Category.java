package com.firstfurious.category;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Category {
	
	@javax.persistence.Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int cId;
	private String cName;
	
	@Transient
	private MultipartFile cImage;
	
	
	
	
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
	
	public MultipartFile getImage() {
		return cImage;
	}
	public void setImage(MultipartFile cImage) {
		this.cImage = cImage;
	}
	
	@Override
	public String toString() {
		return  cName ;
	}
	
	
	
	

}
