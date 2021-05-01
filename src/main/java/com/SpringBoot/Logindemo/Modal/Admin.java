package com.SpringBoot.Logindemo.Modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admin")
public class Admin
{
	public Admin() {
		// TODO Auto-generated constructor stub
	}

	@Id
	private int admin_id;
	private String first_name;
	private String last_name;
	private String email;
	private String phone_no;
	private String password;
	
	public Admin(String first_name, String last_name, String email, String phone_no, String password) {
		super();
		//this.admin_id = admin_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.phone_no = phone_no;
		this.password = password;
	}
	public int getadmin_id() {
		return admin_id;
	}
	public void setadmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getfirst_name() {
		return first_name;
	}
	public void setfirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getlast_name() {
		return last_name;
	}
	public void setlast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public String getphone_no() {
		return phone_no;
	}
	public void setphone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "admin [admin_id=" + admin_id + ", first_name=" + first_name + ", last_name=" + last_name + ", email="
				+ email + ", phone_no=" + phone_no + ", password=" + password + "]";
	}
	
}