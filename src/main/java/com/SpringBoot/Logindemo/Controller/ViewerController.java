package com.SpringBoot.Logindemo.Controller;

import java.io.File;
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
import org.springframework.web.servlet.ModelAndView;

import com.SpringBoot.Logindemo.Modal.Documents;
import com.SpringBoot.Logindemo.Modal.Viewer;
import com.SpringBoot.Logindemo.Services.AdminService;
import com.SpringBoot.Logindemo.Services.DocumentService;
import com.SpringBoot.Logindemo.Services.ViewerService;

@Controller
public class ViewerController {
	@Autowired
	private ViewerService viewerService;
	@Autowired
	private DocumentService docService;
	@Autowired
	AdminService adminservice;
	
	@RequestMapping("/viewerdashboard")
	public String viewerdashboard(HttpSession session , Model m) {
		
		String user = (String) session.getAttribute("user");
		String dept = (String) session.getAttribute("dept");
		String comp = (String) session.getAttribute("company");
		System.out.println(user+ dept+comp);
		List<Documents> doclist =docService.findfilebByCompanyAndDept(dept, comp);
		for(Documents doc : doclist) {
			
			System.out.println("doc"+doc.toString());
		}
		m.addAttribute("doclist", doclist);
		return "viewer_dashboard";
	}
	
	@RequestMapping("/loginV")
	public String loginV(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN_VIEWER");
		return "welcomepage";
	}

	
	@RequestMapping("/register_viewer")
	public String registrationViewer(HttpServletRequest request) {
		
		return "adduser";
	}

	
	@RequestMapping("/login-viewer")
	public String loginViewer(@ModelAttribute Viewer viewer, HttpServletRequest request,HttpSession session) {
		
		
		session=request.getSession();
		if (viewerService.findByemailAndPassword(viewer.getemail(), viewer.getPassword()) != null) {
			Viewer viewer2=viewerService.findByemail(viewer.getemail());
			session.setAttribute("user", viewer2.getemail());
			session.setAttribute("role", "viewer");
			session.setAttribute("dept", viewer2.getdepartment());
			session.setAttribute("company",viewer2.getcompany_name() );
			return "redirect:/viewerdashboard";
		} else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN_VIEWER");
			return "welcomepage";
		}
	}

	@PostMapping("/save-viewer")
	public String registerViewer(@ModelAttribute Viewer viewer, BindingResult bindingResult,
			HttpServletRequest request) {
		viewerService.saveMyViewer(viewer);
		request.setAttribute("mode", "MODE_HOME");
		return "redirect:/adminviewuser";
	}

	


	@GetMapping("/userfileviewer{filepath}")
	public ModelAndView fileviewer(@RequestParam("filepath") String fileName,HttpSession session) {

		String filePath = session.getServletContext().getRealPath("/") +"static" + File.separator  + fileName;
		ModelAndView mv = new ModelAndView("userFileView");
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
	
	
	
	@GetMapping("/closefileuser{filename}")
	public ModelAndView closeFile(@RequestParam("filename") String fileName,HttpSession session) {

		String filePath = session.getServletContext().getRealPath("/") +"static" + File.separator  + fileName;
		ModelAndView mv = new ModelAndView("redirect:/viewerdashboard");
		System.out.println(fileName);
		adminservice.fileencrypter(filePath,fileName);
         mv.addObject("fpath",fileName);
	

		return mv;

	}
	
	
	
	
	
}
