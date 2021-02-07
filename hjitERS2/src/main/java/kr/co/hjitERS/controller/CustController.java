package kr.co.hjitERS.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hjitERS.service.dao.CustDAO;
import kr.co.hjitERS.util.FormatUtil;
import kr.co.hjitERS.vo.CustVO;

@Controller
@Transactional
public class CustController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name = "custService")
	private CustDAO custService;	
		
	@RequestMapping(value = "/userRegisterAction.do")
	public ModelAndView checkRegistedCustomer(HttpServletRequest request, HttpServletResponse response, CustVO vo, ModelAndView mav) throws Exception {

	    logger.info("checkRegistedCustomer");
	    String cu_adcode = (String) request.getParameter("cu_adcode");
	    vo.setCu_adcode(FormatUtil.nvl(cu_adcode, " ") );
		int result = custService.checkRegistedCustomer(vo);

	    if(result == 1){
	    	mav.addObject("message", "이미 등록된 사업자번호 입니다.");
			mav.setViewName("index");
			
			response.setContentType("text/html; charset=UTF-8");				 
			PrintWriter out = response.getWriter();				 
			out.println("<script>alert('이미 등록된 사업자번호 입니다.'); </script>");				 
			out.flush();
			
		}else{
	    	mav.addObject("message", "등록되지 않은 사업자번호 입니다.");
			mav.setViewName("index");
			
			response.setContentType("text/html; charset=UTF-8");				 
			PrintWriter out = response.getWriter();				 
			out.println("<script>alert('등록되지 않은 사업자번호 입니다.\\n등록을 원하시면 담당자에게 연락바랍니다. (032 - 202 - 4982)'); </script>");				 
			out.flush();
		}
		return mav;
	}
}
