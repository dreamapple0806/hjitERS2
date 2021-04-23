package kr.co.hjitERS.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.hjitERS.vo.CustVO;

public class AuthInterceptor extends HandlerInterceptorAdapter{
    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	logger.info("+++++ AuthInterceptor Pre Controller Start +++++");

    	HttpSession session = request.getSession();
        CustVO vo = (CustVO) session.getAttribute("userInfo");
        
        String mip = "172.16.46.234";
    	String ip = request.getHeader("X-Forwarded-For");
        if (ip == null) ip = request.getRemoteAddr();
        
        // 세션이 끊긴 창에서 요청시 세션에 있는 정보와 화면에서 받아온 정보 비교해서 다르면 강제로 로그아웃 처리
        if(!request.getParameter("cu_adcode").equals(vo.getCu_adcode())) {
        	logger.info("Session Information is changed");

        	logger.info("Session's Adcode : " + request.getParameter("cu_adcode"));
        	logger.info("Request's Adcode : " + vo.getCu_adcode());
        	
        	response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter(); 
        	out.println("<script>location.href='/logoutProcess.do';</script>");
        	out.flush();
        	logger.info("+++++ AuthInterceptor Pre Controller End +++++");
        	
			return false;
        }
        
        if(session.getAttribute("userInfo") != null) {
    		logger.info("Session Information is exist");
    		logger.info("IP Information is " + ip + " / " + (ip.equals(mip)));
        	logger.info("+++++ AuthInterceptor Pre Controller End +++++");
        	
			return true;
            
        }
    	else{
    		logger.info("Session Information is not exist");
    		logger.info("IP Information is " + ip + " / " + (ip.equals(mip)));
    		response.sendError(500);
        	logger.info("+++++ AuthInterceptor Pre Controller End +++++");
        	
			return false;
    	}
    }
}