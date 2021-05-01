package com.SpringBoot.Logindemo.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.SpringBoot.Logindemo.Modal.Admin;
import com.SpringBoot.Logindemo.Modal.Viewer;
import com.SpringBoot.Logindemo.Services.AdminService;
import com.SpringBoot.Logindemo.Services.ViewerService;



@org.springframework.web.bind.annotation.RestController
public class RestController
{
	
	
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/save_registration")
	public String saveAdmin(@RequestParam String first_name, @RequestParam String last_name, @RequestParam String email, @RequestParam String phone_no, @RequestParam String company_name, @RequestParam String password )
	{

		Admin admin = new Admin(first_name,last_name,email,phone_no,password );
		adminService.saveMyAdmin(admin);
		return "Admin Saved";
	}
	
	@Autowired
	private ViewerService viewerService;
	
	@GetMapping("/save_viewer")
	public String saveViewer(@RequestParam String first_name,@RequestParam String last_name,@RequestParam String email,@RequestParam String phone_no, @RequestParam String department,@RequestParam String password,@RequestParam String company_name)
	{
		
		Viewer viewer = new Viewer(first_name,last_name,email,phone_no,company_name,department,password);
		viewerService.saveMyViewer(viewer);
		return "Viewer Saved";
	
	}
	
}











