package com.SpringBoot.Logindemo.Services;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SpringBoot.Logindemo.Modal.Admin;
import com.SpringBoot.Logindemo.Modal.AesSymmetric;
import com.SpringBoot.Logindemo.Modal.Viewer;
import com.SpringBoot.Logindemo.Repository.AdminRepository;

@Service
@Transactional
public class AdminService {
	@Autowired
	private final AdminRepository adminRepository;

	public AdminService(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}

	public Admin saveMyAdmin(Admin user) {
		return adminRepository.save(user);
	}

	public List<Admin> showAllUsers()
	{
		List<Admin>users=new ArrayList<Admin>();
		for(Admin user:adminRepository.findAll()) 
		{
			users.add(user);
		}
		return users;
		
	}

	public void deleteMyUser(int id) {
		adminRepository.deleteById(id);
	}

	public Admin findByemailAndPassword(String email, String password) {
		return adminRepository.findByEmailAndPassword(email, password);
	}

	public Admin getAllUsers(int admin_id) {
		Admin user = adminRepository.getOne(admin_id);
		return user;
	}

	public void saveMyViewer(Viewer user) {
		// TODO Auto-generated method stub

	}
	
	public Admin getAllAdmin(int admin_id) {
		Admin admin=adminRepository.getOne(admin_id);
		return admin;
	}

	public void fileencrypter(String filepath,String filename) {

		File file = new File(filepath);

		AesSymmetric ske;

		try {
			ske = new AesSymmetric(filename, 16, "AES");

			ske.encryptFile(file);
		
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return;

	}
	
	
	public void filedecrpyt(String filepath,String filename) {

		File file = new File(filepath);

		AesSymmetric ske;

		try {
			ske = new AesSymmetric(filename, 16, "AES");

		
			ske.decryptFile(file);
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return;

	}

}
