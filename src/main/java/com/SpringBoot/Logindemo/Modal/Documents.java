package com.SpringBoot.Logindemo.Modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="documents")
public class Documents
{
	public Documents() {
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int doc_id;
	private String doc_name;
	private String company_name;
	private String upload_name;
	private String department;	
	private String FilePath;

	public int getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}

	public String getDoc_name() {
		return doc_name;
	}

	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getUpload_name() {
		return upload_name;
	}

	public void setUpload_name(String upload_name) {
		this.upload_name = upload_name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getFilePath() {
		return FilePath;
	}

	public void setFilePath(String filePath) {
		FilePath = filePath;
	}

	public Documents(int doc_id, String doc_name, String company_name, String upload_name, String department,
			String filePath) {
		super();
		this.doc_id = doc_id;
		this.doc_name = doc_name;
		this.company_name = company_name;
		this.upload_name = upload_name;
		this.department = department;
		FilePath = filePath;
	}

	public Documents(String docName, String compName, String uploadBy, String dept, String filePath) {
		
		this.doc_name = docName;
		this.company_name = compName;
		this.upload_name = uploadBy;
		this.department = dept;
		FilePath = filePath;
		
		
		// TODO Auto-generated constructor stub
	}
	

	
}