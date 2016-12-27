package com.firstfurious.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class User implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long uId;	
	private String uName;
	private String uEmail;
	private String uPassword;
	@Transient
	private String uCPassword;
	private String uAddress;
	private String uPhone;
	
	private int role = 1;
	private boolean Active = true;
	
	
	public long getuId() {
		return uId;
	}
	public void setuId(long uId) {
		this.uId = uId;
	}
	
	@NotEmpty(message="Username Field is Mandatory")
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	
	@NotEmpty(message="Email Field is Mandatory")
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	
	@NotEmpty(message="Password Field is Mandatory")
	@Column(length = 60)
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}
	public String getuCPassword() {
		return uCPassword;
	}
	public void setuCPassword(String uCPassword) {
		this.uCPassword = uCPassword;
	}
	
	@NotEmpty(message="Address field is Mandatory")
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	
	@NotEmpty(message="Phone Number Field is Mandatory")
	@Length(max= 10, min=10, message="Phone number is not valid. Should be lenght 10")
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	public boolean isActive() {
		return Active;
	}
	public void setActive(boolean active) {
		Active = active;
	}

}
