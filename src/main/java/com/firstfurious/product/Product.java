package com.firstfurious.product;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {
	@javax.persistence.Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int pId;
	private String pName;
	private String pBrand;
	
	private String pCategory;
	private String pDescription;
	private String pPrice;
	private String pQuantity;
	private String pImage;
	
	@Transient
	private MultipartFile ProductFile;
	@Transient	
	private MultipartFile BrandLogo;
	
	public MultipartFile getBrandLogo() {
		return BrandLogo;
	}
	public void setBrandLogo(MultipartFile brandLogo) {
		BrandLogo = brandLogo;
	}
	//getters and setters 
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getpDescription() {
		return pDescription;
	}
	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	public String getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(String pQuantity) {
		this.pQuantity = pQuantity;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + "]";
	}
	
	
	public MultipartFile getProductFile() {
		return ProductFile;
	}

	public void setProductFile(MultipartFile productFile) {
		ProductFile = productFile;
	}
	
	public String getpBrand() {
		return pBrand;
	}
	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}
	

}
