package kr.co.hjitERS.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

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

import kr.co.hjitERS.service.dao.TaxProcessDAO;
import kr.co.hjitERS.util.FormatUtil;
import kr.co.hjitERS.vo.CompanyVO;
import kr.co.hjitERS.vo.CustVO;
import kr.co.hjitERS.vo.LoginVO;
import kr.co.hjitERS.vo.SerialMainVO;
import kr.co.hjitERS.vo.SerialSubVO;
import kr.co.hjitERS.vo.TaxProcessVO;

@Controller
@Transactional
public class TaxProcessController {
    private static final Logger logger = LoggerFactory.getLogger(TaxProcessController.class);
    
	@Resource(name = "taxProcessService")
	private TaxProcessDAO taxProcessService;
	
	@RequestMapping(value = "/taxSearchProccess.do")
	public ModelAndView taxSearchProccess(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
	    logger.info("taxSearchProccess.do");
	    HttpSession session =  request.getSession(false);
	    String message = "";
	    
	    try {
	    	if(session.getAttribute("userInfo") == null) {
	    		message = "로그인 세션이 끊어졌습니다.";
	    		FormatUtil.alertFunction(response, message);
	    	}
	    	else{
			    String cu_code_shr = (String) request.getParameter("cu_code_shr");
			    String symd = (String) request.getParameter("symd").replaceAll("-", "");
			    String eymd = (String) request.getParameter("eymd").replaceAll("-", "");

			    logger.info("cu_code_shr : " + cu_code_shr + " / symd : " + symd + " / eymd : " + eymd);
			    ArrayList<TaxProcessVO> list = taxProcessService.getListByShipperMain(cu_code_shr, symd, eymd);
			    
			    for(int i=0; i<list.size(); i++) {
			    	TaxProcessVO vo = list.get(i);
			    	logger.info(vo.toString());
			    } 
			    
			    if(list.size() == 0) {
			    	mav.addObject("message", "조회 결과가 없습니다.");
					mav.setViewName("taxProcessList");
					
					response.setContentType("text/html; charset=UTF-8");				 
					PrintWriter out = response.getWriter();				 
					out.println("<script>alert('조회 결과가 없습니다.'); </script>");				 
					out.flush();
			    }
			    else {
			    	mav.addObject("list", list);
			    	mav.setViewName("taxProcessList");
			    }
	    	}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "/serialSearchProccess.do")
	public ModelAndView serialSearchProccess(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
	    logger.info("serialSearchProccess.do");
    	HttpSession session =  request.getSession(false);
	    String message = "";

	    try {
	    	if(session.getAttribute("userInfo") == null) {
	    		message = "로그인 세션이 끊어졌습니다.";
	    		FormatUtil.alertFunction(response, message);
	    	}
	    	else {
		    	String serial = (String) request.getParameter("serial");   
			    String type = (String) request.getParameter("type");
			    
			    logger.info(serial + " / " + type);

			    ArrayList<SerialMainVO> listMain = taxProcessService.getSerialMain(serial);
				ArrayList<SerialSubVO> listSub = taxProcessService.getSerialSub(serial);	
				
				SerialMainVO vom = new SerialMainVO();
				
				for(int i=0; i<listMain.size(); i++) {
				 	vom = listMain.get(i);
				}

				mav.addObject("vom", vom);
				mav.addObject("listMain", listMain);
				mav.addObject("vos", listSub);
				mav.setViewName("serialSearchPopup");
				
				request.setAttribute("listMain", listMain);
				request.setAttribute("listSub", listSub);
	    	}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "/taxPrintProccess.do")
	public ModelAndView taxPrintProccess(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
	    logger.info("taxPrintProccess.do");
    	HttpSession session =  request.getSession(false);
	    String message = "";

	    try {
	    	if(session.getAttribute("userInfo") == null) {
	    		message = "로그인 세션이 끊어졌습니다.";
	    		FormatUtil.alertFunction(response, message);
	    	}
	    	else {
			    String serial = (String) request.getParameter("serial");   
			    String cu_adcode = (String) request.getParameter("cu_adcode");
			    
			    LoginVO dto = new LoginVO();
			    dto.setCu_adcode(cu_adcode);

			    ArrayList<SerialMainVO> listMain = taxProcessService.getSerialMain(serial);
				ArrayList<SerialSubVO> listSub = taxProcessService.getSerialSub(serial);
				ArrayList<CompanyVO> companyInfo = taxProcessService.getCompanyInfo();
				CustVO vo = taxProcessService.loginCustInfo(dto.getCu_adcode());
				 
				SerialMainVO vom = new SerialMainVO();
				SerialSubVO vos = new SerialSubVO();
				CompanyVO comInfo = new CompanyVO();
				
				for(int i=0; i<listMain.size(); i++) {
				 	vom = listMain.get(i);
				  	logger.info(vom.toString());
				}

				for(int i=0; i<listSub.size(); i++) {
				   	vos = listSub.get(i);
				   	logger.info(vos.toString());
				}

				for(int i=0; i<companyInfo.size(); i++) {
				  	comInfo = companyInfo.get(i);
				   	logger.info(comInfo.toString());
				}

				mav.addObject("vom", vom);
				mav.addObject("vos", vos);
				mav.addObject("comInfo", comInfo);
				mav.addObject("vo", vo);
				mav.addObject("vo", vo);
				mav.addObject("vo", vo);
				mav.setViewName("taxPrintPopup");
				
				request.setAttribute("listMain", vom);
				request.setAttribute("listSub", listSub);
				request.setAttribute("comInfo", comInfo);
				request.setAttribute("vo", vo);	    		
	    	}
		} catch (Exception e) {
			e.printStackTrace();
		}	    
	    
		return mav;
	}

	@RequestMapping(value = "/taxBillPrintProccess.do")
	public ModelAndView taxBillPrintProccess(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
	    logger.info("taxBillPrintProccess.do");
    	HttpSession session =  request.getSession();
	    String message = "";
    	
	    try {
	    	if(session.getAttribute("userInfo") == null) {
	    		message = "로그인 세션이 끊어졌습니다.";
	    		FormatUtil.alertFunction(response, message);
	    	}
	    	else {
			    String serial = (String) request.getParameter("serial");   
			    String cu_adcode = (String) request.getParameter("cu_adcode");
			    
			    LoginVO dto = new LoginVO();
			    dto.setCu_adcode(cu_adcode);

			    ArrayList<SerialMainVO> listMain = taxProcessService.getSerialMain(serial);
				ArrayList<SerialSubVO> listSub = taxProcessService.getSerialSub(serial);
				ArrayList<CompanyVO> companyInfo = taxProcessService.getCompanyInfo();
				CustVO vo = taxProcessService.loginCustInfo(dto.getCu_adcode());
				 
				SerialMainVO vom = new SerialMainVO();
				SerialSubVO vos = new SerialSubVO();
				CompanyVO comInfo = new CompanyVO();
				
				for(int i=0; i<listMain.size(); i++) {
				 	vom = listMain.get(i);
				  	logger.info(vom.toString());
				}

				for(int i=0; i<listSub.size(); i++) {
				   	vos = listSub.get(i);
				   	logger.info(vos.toString());
				}

				for(int i=0; i<companyInfo.size(); i++) {
				  	comInfo = companyInfo.get(i);
				   	logger.info(comInfo.toString());
				}

				mav.addObject("vom", vom);
				mav.addObject("vos", vos);
				mav.addObject("comInfo", comInfo);
				mav.addObject("vo", vo);
				mav.setViewName("taxBillPrintPopup");
				
				request.setAttribute("listMain", vom);
				request.setAttribute("listSub", listSub);
				//request.setAttribute("comInfo", comInfo);
				//request.setAttribute("vo", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
		return mav;
	}
}
