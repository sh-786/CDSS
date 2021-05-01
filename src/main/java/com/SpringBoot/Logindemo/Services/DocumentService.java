package com.SpringBoot.Logindemo.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.SpringBoot.Logindemo.Modal.Documents;
import com.SpringBoot.Logindemo.Repository.DocumentRepo;

@Component
public class DocumentService {
	@Autowired
	DocumentRepo DRepo;

	public void savedoc(Documents doc) {

		DRepo.save(doc);
	}

	public List<Documents> findfile() {

		return DRepo.findAll();

	}

	public List<Documents> findfilebByCompanyAndDept(String dept, String company) {

		
		
	List<Documents>doclist=	DRepo.GetByDepartmentAndCompany_name(dept, company);
		for (Documents doc : doclist) {

			System.out.println("doc" + doc.toString());
		}
		return doclist; 

	}

	public void deletedoc(int id) {

		DRepo.deleteById(id);
	}

}
