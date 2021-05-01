package com.SpringBoot.Logindemo.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.SpringBoot.Logindemo.Modal.Admin;
import com.SpringBoot.Logindemo.Modal.Documents;
import com.SpringBoot.Logindemo.Modal.Viewer;
import com.SpringBoot.Logindemo.Services.AdminService;
import com.SpringBoot.Logindemo.Services.DocumentService;
import com.SpringBoot.Logindemo.Services.ViewerService;



@Controller
public class ApplicationController {
	
	
	@Autowired
	AdminService adminservice;

	@Autowired
	private ViewerService viewerService;
	
	@Autowired
	DocumentService Dservice;
	
	
	
	@RequestMapping("/welcome")
	public String Welcome(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}

	
	
	
	

	

	@Autowired
	private AdminService adminService;

	@RequestMapping("/register_Admin")
	public String registrationAdmin(HttpServletRequest request) {
		
		return "addadmin";
	}
	
	
	@GetMapping("/admindashboard")
	public String admindashboard(Model m) {
		
		List<Admin> adminlist= adminService.showAllUsers();
		m.addAttribute("userlist", adminlist);
		return "admin_dashboard";
	}
	
	@GetMapping("/deleteadmin{adminid}")
	public String deleteadmin(@RequestParam ("adminid") int adminid) {
		
		 adminService.deleteMyUser(adminid);
		
		return "redirect:/admindashboard";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}

	@RequestMapping("/login_Admin")
	public String loginAdmin(@ModelAttribute Admin user, HttpServletRequest request,HttpSession session) {
		session=request.getSession();
		if (adminService.findByemailAndPassword(user.getemail(), user.getPassword()) != null) {
			
			session.setAttribute("user", user.getemail());
			session.setAttribute("role", "admin");
			
			
			return "redirect:/admindashboard";
		} else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";

		}
	}

	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute Admin user, BindingResult bindingResult, HttpServletRequest request) {
		adminService.saveMyAdmin(user);
		request.setAttribute("mode", "MODE_HOME");
		return "redirect:/admindashboard";
	}

	@GetMapping("/show-user")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("admin", adminService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}
	
	@GetMapping("/logout")
	public String logout () {
		
		return "logout";
	
	}

	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request) {
		adminService.deleteMyUser(id);
		request.setAttribute("admin", adminService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}

	@RequestMapping("/admin-dashboard")
	public String loginUser(@ModelAttribute Admin user, HttpServletRequest request) {
		if (adminService.findByemailAndPassword(user.getemail(), user.getPassword()) != null) {
			return "admin_dashboard";
		} else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";

		}
	}



	@GetMapping("/adminviewuser")
	public ModelAndView adminviewuser() {

		ModelAndView mv = new ModelAndView("admin_viewuser");
		List<Viewer> v = viewerService.showAllUsers();

		mv.addObject("viwerlist", v);
		return mv;

	}

	@PostMapping("/uploaddocument")
	public String uploadFile(@RequestParam("file") MultipartFile file,HttpServletRequest req, HttpSession session, Model m) {
		
		String filePath = session.getServletContext().getRealPath("/") + "static" + File.separator  + file.getOriginalFilename();
          String DocName = req.getParameter("docname");
          String CompName = req.getParameter("compname");
          String UploadBy = req.getParameter("uploadby");
          String dept = req.getParameter("department");
          String fileName= file.getOriginalFilename();
          
          List<Documents> DocList = Dservice.findfile();
          for (Documents documents : DocList) {
			
		
        	  
        	  if(documents.getFilePath().equals(fileName)) {
        		  
        		  m.addAttribute("mgs", "Already exits");
        		  return "admin_addproject";
        	  }
        	  
          }
          
          
          System.out.println(DocName);
         Documents doc = new Documents( DocName, CompName, UploadBy, dept, fileName);
         Dservice.savedoc(doc);
	     
		try {
			byte barr[] = file.getBytes();

			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath));
			bout.write(barr);
			bout.flush();
			bout.close();
			
			adminservice.fileencrypter(filePath,fileName);
			return "redirect:/adddocument";

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "redirect:/adddocument";

	}

	
	
	@GetMapping("/adddocument")
	public ModelAndView adddocument() {

		ModelAndView mv = new ModelAndView("admin_addproject");

		return mv;

	}

	@GetMapping("/deletefile{fileid}")
	public ModelAndView deletefile(@RequestParam("fileid") int id) {

		System.out.println(id);
		ModelAndView mv = new ModelAndView("redirect:/viewdocument");

		Dservice.deletedoc(id);

		return mv;

	}
	
	
	@GetMapping("/deleteviewer{viewerid}")
	public ModelAndView deleteviewer(@RequestParam("viewerid") int id) {

		System.out.println(id);
		ModelAndView mv = new ModelAndView("redirect:/adminviewuser");

		viewerService.deleteMyUser(id);

		return mv;

	}
	
	@GetMapping("/fileviewer{filepath}")
	public ModelAndView fileviewer(@RequestParam("filepath") String fileName,HttpSession session) {

		String filePath = session.getServletContext().getRealPath("/") +"static" + File.separator  + fileName;
		ModelAndView mv = new ModelAndView("FileViewer");
		System.out.println(fileName);
	     
	    
		String filePathviewer =  File.separator+ "static" + File.separator  + fileName;	    
	    try {
	    	  adminservice.filedecrpyt(filePath,fileName);	 
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         mv.addObject("fpath",filePathviewer);
         mv.addObject("fname",fileName);
		return mv;

	

	}
	
	
	@GetMapping("/pleasework")
	public String f1()
	{
		return "new_page";
	}
	
	
	
	@GetMapping("/closefile{filename}")
	public ModelAndView closeFile(@RequestParam("filename") String fileName,HttpSession session) {

		String filePath = session.getServletContext().getRealPath("/") +"static" + File.separator  + fileName;
		ModelAndView mv = new ModelAndView("redirect:/viewdocument");
		System.out.println(fileName);
		adminservice.fileencrypter(filePath,fileName);
         mv.addObject("fpath",fileName);
	

		return mv;

	}
	
	
	@GetMapping("/viewdocument")
	public ModelAndView viewdocument() {

		ModelAndView mv = new ModelAndView("admin_viewproject");
		 List<Documents> DocList = Dservice.findfile();
		 mv.addObject("doclist", DocList);
		return mv;

	}

}
