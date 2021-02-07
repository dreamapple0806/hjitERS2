package kr.co.hjitERS.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Transactional
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/") 
	public String index(HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("HomeController");

		HttpSession session = request.getSession();
    	if(session.getAttribute("userInfo") == null) {
            return "/index";
    	}
    	else {
            return "/home";
    	}
	}	 
}
