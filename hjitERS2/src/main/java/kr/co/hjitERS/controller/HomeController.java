package kr.co.hjitERS.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hjitERS.service.dao.LoginDAO;

@Controller
@Transactional
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource(name = "loginService")
	private LoginDAO loginService;
	
	@RequestMapping(value = "") 
	public String index(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
		HttpSession session = request.getSession();		
		
    	if(session.getAttribute("userInfo") == null) {
            return "index";
    	}
    	else {
            return "home";
    	}
	}	 
}
