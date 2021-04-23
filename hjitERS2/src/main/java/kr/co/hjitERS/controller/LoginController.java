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
import kr.co.hjitERS.util.FormatUtil;
import kr.co.hjitERS.vo.CustVO;
import kr.co.hjitERS.vo.LoginVO;

@Controller
@Transactional
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name = "loginService")
	private LoginDAO loginService;
	 
	@RequestMapping(value = "/loginProcess.do") 
	public String login(HttpServletRequest request, HttpServletResponse response, LoginVO lvo, ModelAndView mav) throws Exception {

		try {
		    logger.info("+++++ loginProcess Start +++++");
		    HttpSession session = request.getSession();
		    String message = "";
		    
	        if(session.getAttribute("userInfo") != null){
	            session.removeAttribute("userInfo");
	        }
	        
		    String userId = (String) request.getParameter("userId");
		    String cu_password = (String) request.getParameter("userPassword");

		    logger.info("userId : " + userId + " / cu_password : " + cu_password);
		    lvo.setCu_adcode(FormatUtil.nvl3(userId, ""));
	         
	        CustVO vo = loginService.loginCustInfo(lvo);
	         
	        if(vo == null) {
				logger.info("사용자 정보가 없습니다.");
		    	mav.addObject("message", "사용자 정보가 없습니다.");
				mav.setViewName("index");
				
	    		message = "사용자 정보가 없습니다.";
	    		FormatUtil.alertFunction(response, message);
			}       
			else {
				if(!cu_password.equals(vo.getCu_adcode())) {
					logger.info("로그인 비밀번호가 맞지 않습니다.");
			    	mav.addObject("message", "로그인 비밀번호가 맞지 않습니다.");
					mav.setViewName("index");
					
		    		message = "로그인 비밀번호가 맞지 않습니다.";
		    		FormatUtil.alertFunction(response, message);
				}   
				else {
					logger.info("로그인 성공");
					session.setAttribute("userInfo", vo);
					mav.addObject("userInfo", vo);
					mav.setViewName("home");
				}
		    }
		    logger.info("+++++ loginProcess End +++++");
			return "home";
			
		} catch (Exception e) {
			logger.info("세션이 끊어졌습니다.");
			e.printStackTrace();

			return "index";
		}
	}

	@RequestMapping(value = "/logoutProcess.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
		httpSession.invalidate();
		
		return "userLogout";
	}
}
