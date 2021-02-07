package kr.co.hjitERS.service.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.hjitERS.vo.SerialMainVO;
import kr.co.hjitERS.vo.SerialSubVO;
import kr.co.hjitERS.vo.VirAcctVO;

public interface SerialDAO {
	int getDataBySerial(String strSerial);
	String getNewSerial(@Param("strDate") String strDate);
	ArrayList<SerialSubVO>  getNewSerialSub(@Param("serial") String serial);
	String save(SerialMainVO beanMain, List<SerialSubVO> lstDataSub, List<VirAcctVO> lstDatainaccount) throws Exception;
	
	int insertShipperMain(SerialMainVO beanMain) throws Exception;
	int infupdate(SerialSubVO beanSub) throws Exception;
	int delete(String serial) throws Exception;
	int insertShipperSub(SerialSubVO beanSub) throws Exception;

	int updateProgress(@Param("istcd") String istcd, @Param("vir_acctno") String vir_acctno, @Param("tran_dd") String tran_dd
	, @Param("tran_hh") String tran_hh, @Param("vatrsno") String vatrsno, @Param("serial") String serial
	, @Param("vatramt") String vatramt) throws Exception;
	
	
}
