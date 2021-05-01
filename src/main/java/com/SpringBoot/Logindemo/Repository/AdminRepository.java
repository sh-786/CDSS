package com.SpringBoot.Logindemo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.SpringBoot.Logindemo.Modal.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {

	public Admin findByEmailAndPassword(String email, String password);


}
