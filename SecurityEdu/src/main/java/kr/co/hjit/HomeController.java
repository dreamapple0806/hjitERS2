package kr.co.hjit;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource(name = "eduService")
	private EduDAO eduService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/eduUserSave.do")
	@ResponseBody
	public ModelAndView eduUserSave(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

	    String edu_name = (String) request.getParameter("edu_name");
	    String edu_birth = (String) request.getParameter("edu_birth");
	    String edu_phone = (String) request.getParameter("edu_phone");
	    String edu_mail = (String) request.getParameter("edu_mail");
	    String edu_infoChk = (String) request.getParameter("edu_infoChk");
	    int strErrMessage = 0;
	    
		logger.info("edu_name : " + edu_name + " / edu_birth : " + edu_birth + " / edu_phone : " + edu_phone 
				+ " / edu_mail : " + edu_mail + " / edu_infoChk : " + edu_infoChk);
		
		try {
    		strErrMessage = eduService.eduInfoRegister(edu_name, edu_birth, edu_phone, edu_mail, edu_infoChk);
    		logger.info("eduInfoRegister Result : " + strErrMessage);

			if ( strErrMessage != 1 ) {
				response.setContentType("text/html; charset=UTF-8");				 
				PrintWriter out = response.getWriter();				 
				out.println("<script>alert('" + strErrMessage + "');</script>");
				mav.setViewName("home");
			}
			else {
				response.setContentType("text/html; charset=UTF-8");				 
				PrintWriter out = response.getWriter();				 
				out.println("<script>alert('저장이 완료되었습니다.');</script>");	
				mav.setViewName("home");
			}
			return mav;	
		}
		catch (Exception e) {
			mav.setViewName("home");
			e.printStackTrace();
			return mav;	
		}
	} 
	
	@RequestMapping(value = "/eduListSearch.do")
	@ResponseBody
	public ModelAndView eduListSearch(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	    try {
			 //String name = (String) request.getParameter("name");
			 String name = (String) request.getParameter("name");
			 String symd = (String) request.getParameter("symd").replaceAll("-", "");
			 String eymd = (String) request.getParameter("eymd").replaceAll("-", "");

			 logger.info("name : " + name + " / symd : " + symd + " / eymd : " + eymd);
			 ArrayList<VisitVO> list = eduService.getList(name, symd, eymd);
			 
			 for(int i=0; i<list.size(); i++) {
				 VisitVO vo = list.get(i);
			 	logger.info(vo.toString());
			 } 
			 
			 if(list.size() == 0) {
			 	mav.addObject("message", "조회 결과가 없습니다.");
			 	mav.setViewName("securityEduList");
					
				response.setContentType("text/html; charset=UTF-8");				 
				PrintWriter out = response.getWriter();				 
				out.println("<script>alert('조회 결과가 없습니다.'); </script>");				 
				out.flush();
			 }
			 else {
			  	mav.addObject("list", list);
			   	mav.setViewName("securityEduList");
			 }
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			return mav;
		}
	} 
	
	//방문자 등록 현황 메뉴 이동
	@RequestMapping(value = "/securityEduList.do")
	public ModelAndView taxProcessList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
	    logger.info("securityEduList");

		HttpSession session =  request.getSession();
	    String message = "";	
	    mav.setViewName("securityEduList");
		
		return mav;
	}
	
	//방문자 등록 현황 메뉴 이동
	@RequestMapping(value = "/excelDown.do")
	public void excelDown(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
	    logger.info("excelDown");

		HttpSession session =  request.getSession();
	    String message = "";	
	    boolean rtn = false;
		
		try {
		    logger.info("excelDown11111");
		    rtn = writeExcel(request, response);
		    logger.info("excelDown22222");
			
			if(rtn == false){
				logger.error("저장실패 : " + rtn);
			}
			else{
				logger.error("저장성공 : " + rtn);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean writeExcel(HttpServletRequest request, HttpServletResponse response){
		logger.info("writeExcel");
		boolean rtn = false;
		
		ExcelFunction tsef = new ExcelFunction();	

		String name = "aa";
		String symd = (String) request.getParameter("symd").replaceAll("-", "");
		String eymd = (String) request.getParameter("eymd").replaceAll("-", "");

		logger.info("name : " + name + " / symd : " + symd + " / eymd : " + eymd);
		ArrayList<VisitVO> list = eduService.getList(name, symd, eymd);
		
		try{
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFCellStyle cellStyle1 = workbook.createCellStyle();
			HSSFCell cell;
			
			cellStyle1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			cellStyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			cellStyle1.setBorderLeft(HSSFCellStyle.BORDER_THICK);
			cellStyle1.setBorderRight(HSSFCellStyle.BORDER_THIN);
			cellStyle1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			cellStyle1.setBorderTop(HSSFCellStyle.BORDER_THIN);
			cellStyle1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			cellStyle1.setFillBackgroundColor(HSSFColor.WHITE.index);
			cellStyle1.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
			cellStyle1.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			
			cell = tsef.workingStatus(sheet, list);
			
			response.setHeader("Set-Cookie", "fileDownload=true; path=/"); 
			response.setHeader("Content-Disposition", String.format("attachment; filename=\"SecurityEduList.xls\"")); 
			workbook.write(response.getOutputStream());
			workbook.close();
			rtn = true;
			
		} catch(Exception e){
			response.setHeader("Set-Cookie", "fileDownload=false; path=/"); 
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
			response.setHeader("Content-Type","text/html; charset=utf-8"); 
			OutputStream out = null; 
			
			try { 
				
				out = response.getOutputStream(); 
				byte[] data = new String("fail..").getBytes(); 
				out.write(data, 0, data.length);
				
			} catch(Exception ignore) { 
				
				ignore.printStackTrace(); 
				
			} finally { 
				
				if(out != null) {
					try { 
						out.close(); 
					} catch(Exception ignore) {
						
					} 
				}
			}

		}

		return rtn;		
	}
}
