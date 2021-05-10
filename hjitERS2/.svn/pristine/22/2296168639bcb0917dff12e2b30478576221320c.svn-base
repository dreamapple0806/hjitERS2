package kr.co.hjitERS.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hjitERS.service.dao.CustDAO;
import kr.co.hjitERS.vo.CustVO;

@Service("custService")
public class CustServiceImpl implements CustDAO{
	@Autowired
	private CustDAO custDAO;

	@Override
	public int checkRegistedCustomer(CustVO vo) throws Exception {

		return custDAO.checkRegistedCustomer(vo);
	}


}
