package kr.co.hjitERS.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hjitERS.controller.LoginController;
import kr.co.hjitERS.service.dao.LoginDAO;
import kr.co.hjitERS.vo.CustVO;
import kr.co.hjitERS.vo.LoginVO;

@Service("loginService")
public class LoginServiceImpl implements LoginDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginDAO loginDao;

	@Override
	public CustVO loginCustInfo(LoginVO dto) throws Exception {
		logger.info("LoginServiceImpl loginCustInfo");
		return loginDao.loginCustInfo(dto);
	}

	@Override
	public String dayProcessCount() throws Exception {
		logger.info("LoginServiceImpl dayProcessCount");
		return loginDao.dayProcessCount();
	}
	

}
