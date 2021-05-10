package kr.co.hjitERS.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hjitERS.service.dao.TaxProcessDAO;
import kr.co.hjitERS.vo.CompanyVO;
import kr.co.hjitERS.vo.CustVO;
import kr.co.hjitERS.vo.SerialMainVO;
import kr.co.hjitERS.vo.SerialSubVO;
import kr.co.hjitERS.vo.SerialTaxVO;
import kr.co.hjitERS.vo.TaxProcessVO;

@Service("taxProcessService")
public class TaxProcessServiceImpl implements TaxProcessDAO{
	
	@Autowired
	private TaxProcessDAO taxProcessDAO;

	@Override
	public ArrayList<TaxProcessVO> getListByShipperMain(String cu_code_shr, String symd, String eymd) throws Exception {
		return taxProcessDAO.getListByShipperMain(cu_code_shr, symd, eymd);
	}

	@Override
	public ArrayList<SerialMainVO> getSerialMain(String serial) throws Exception {
		return taxProcessDAO.getSerialMain(serial);
	}

	@Override
	public ArrayList<SerialSubVO> getSerialSub(String serial) throws Exception {
		return taxProcessDAO.getSerialSub(serial);
	}

	@Override
	public ArrayList<CompanyVO> getCompanyInfo() throws Exception {
		return taxProcessDAO.getCompanyInfo();
	}

	@Override
	public CustVO loginCustInfo(String cu_adcode) throws Exception {
		return taxProcessDAO.loginCustInfo(cu_adcode);
	}

	@Override
	public ArrayList<SerialTaxVO> getSerialTax(String serial) throws Exception {
		return taxProcessDAO.getSerialTax(serial);
		
	}
}