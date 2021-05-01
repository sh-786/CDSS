package com.SpringBoot.Logindemo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.SpringBoot.Logindemo.Modal.Viewer;

@Repository
public interface ViewersRepository extends JpaRepository<Viewer, Integer> {

	public Viewer findByEmailAndPassword(String email, String password);

	public Viewer findByEmail(String email);
}
