package com.SpringBoot.Logindemo.Services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SpringBoot.Logindemo.Modal.Viewer;
import com.SpringBoot.Logindemo.Repository.ViewersRepository;

@Service
@Transactional
public class ViewerService
{
	@Autowired
	private final ViewersRepository viewersRepository;
	
	//constructure
	public ViewerService(ViewersRepository viewersRepository)
	{
		this.viewersRepository = viewersRepository;
	}
	
	public Viewer saveMyViewer(Viewer user)
	{
		return viewersRepository.save(user);
	}
	
	public List<Viewer> showAllUsers()
	{
		List<Viewer>users=new ArrayList<Viewer>();
		for(Viewer user:viewersRepository.findAll()) 
		{
			users.add(user);
		}
		return users;
		
	}
	
	public void deleteMyUser(int id)
	{
		viewersRepository.deleteById(id);
	}

	public Viewer findByemailAndPassword(String email, String password) {
		return viewersRepository.findByEmailAndPassword(email, password);
	}
	
	public Viewer findByemail(String email) {
		return viewersRepository.findByEmail(email);
	}

	public Viewer getAllUsers(int viewer_id) {
		Viewer user=viewersRepository.getOne(viewer_id);
		return user;
	}


}
