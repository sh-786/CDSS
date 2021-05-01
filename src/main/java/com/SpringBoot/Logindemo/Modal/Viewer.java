package com.SpringBoot.Logindemo.Modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="viewer")
public class Viewer
{
	public Viewer() {
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int viewer_id;
	private String first_name;
	private String last_name;
	private String email;
	private String phone_no;
	private String company_name;
	private String department;
	private String password;
	
	public Viewer(String first_name, String last_name, String email, String phone_no,String company_name, String department, String password) {
		super();
		//this.viewer_id = viewer_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.phone_no = phone_no;
		this.company_name = company_name;
		this.department = department;
		this.password = password;
	}
	public int getviewer_id() {
		return viewer_id;
	}
	public void setviewer_id(int viewer_id) {
		this.viewer_id = viewer_id;
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
	public String getcompany_name() {
		return company_name;
	}
	public void setcompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getdepartment() {
		return department;
	}
	public void setdepartment(String department) {
		this.department = department;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "viewer [viewer_id=" + viewer_id + ", first_name=" + first_name + ", last_name=" + last_name + ", email="
				+ email + ", phone_no=" + phone_no + ", company_name=" + company_name + ", department=" + department + ", password=" + password + "]";
	}
	
}