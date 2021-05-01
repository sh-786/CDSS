package com.SpringBoot.Logindemo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.SpringBoot.Logindemo.Modal.Documents;
import com.SpringBoot.Logindemo.Modal.Viewer;
@Repository
public interface DocumentRepo extends JpaRepository<Documents, Integer> {

	@Query(value=" select * from documents where department= ?1 and company_name=?2", nativeQuery=true)
	public List<Documents> GetByDepartmentAndCompany_name(String department, String company_name);
}
