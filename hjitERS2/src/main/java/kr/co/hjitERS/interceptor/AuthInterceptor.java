package kr.co.hjitERS.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	logger.info("+++++ AuthInterceptor Pre Controller Start +++++");

        HttpSession session = request.getSession();

    	String ip = request.getHeader("X-Forwarded-For");
        if (ip == null) ip = request.getRemoteAddr();
        
        if(session.getAttribute("userInfo") != null) {
    		logger.info("Session Information is exist : " + session.getAttribute("userInfo"));
    		logger.info("IP Information is " + ip);
        	logger.info("+++++ AuthInterceptor Pre Controller End +++++");	
            
            return true; 
        }
    	else{
    		logger.info("Session Information is not exist");
    		logger.info("IP Information is " + ip);
    		response.sendError(500);
        	logger.info("+++++ AuthInterceptor Pre Controller End +++++");
			return false;
    	}
        
    }
}
