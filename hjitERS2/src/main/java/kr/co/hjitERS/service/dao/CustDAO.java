package kr.co.hjitERS.service.dao;

import kr.co.hjitERS.vo.CustVO;

public interface CustDAO {
	int checkRegistedCustomer(CustVO vo) throws Exception;
}
