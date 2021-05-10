package kr.co.hjitERS.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	logger.info("+++++ LoginInterceptor Pre Controller Start +++++ : " + request.getRequestURI() + " / " + handler);    	
    	
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("userInfo") != null)  {
    		logger.info("userInfo is not null");
    		session.removeAttribute("userInfo");
    	}
    	
    	logger.info("+++++ LoginInterceptor Pre Controller End +++++");
		
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	logger.info("+++++ LoginInterceptor Post Controller Start +++++" + request.getRequestURI() + " / " + handler); 
    	
    	HttpSession session = request.getSession();
    	Object userInfo = modelAndView.getModelMap().get("userInfo");
    	
    	if(userInfo != null) {
    		logger.info("userInfo is not null");
    		session.setAttribute("userInfo", userInfo);
    	}
    	else {
    		logger.info("userInfo is null");
    	}    	
    	
    	logger.info("+++++ LoginInterceptor Post Controller End +++++");
    }
}
