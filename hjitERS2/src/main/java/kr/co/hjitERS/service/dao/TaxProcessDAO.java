package kr.co.hjitERS.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.hjitERS.vo.CompanyVO;
import kr.co.hjitERS.vo.CustVO;
import kr.co.hjitERS.vo.SerialMainVO;
import kr.co.hjitERS.vo.SerialSubVO;
import kr.co.hjitERS.vo.SerialTaxVO;
import kr.co.hjitERS.vo.TaxProcessVO;

public interface TaxProcessDAO {
	ArrayList<TaxProcessVO> getListByShipperMain(@Param("cu_code_shr")String cu_code_shr, @Param("symd")String symd, @Param("eymd")String eymd) throws Exception;

	ArrayList<SerialMainVO> getSerialMain(@Param("serial")String serial) throws Exception;

	ArrayList<SerialSubVO> getSerialSub(@Param("serial")String serial) throws Exception;
	
	ArrayList<SerialTaxVO> getSerialTax(@Param("serial")String serial) throws Exception;

	ArrayList<CompanyVO> getCompanyInfo() throws Exception;
	
	CustVO loginCustInfo(@Param("cu_adcode")String cu_adcode) throws Exception;
}
