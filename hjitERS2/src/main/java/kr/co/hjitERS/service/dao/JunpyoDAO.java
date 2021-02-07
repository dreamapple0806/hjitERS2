package kr.co.hjitERS.service.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import kr.co.hjitERS.vo.BillTransItemVO;
import kr.co.hjitERS.vo.BillTransVO;
import kr.co.hjitERS.vo.DepoVO;
import kr.co.hjitERS.vo.JunpyoVO;
import kr.co.hjitERS.vo.SerialMainVO;
import kr.co.hjitERS.vo.SerialSubVO;
import kr.co.hjitERS.vo.VirAcctVO;

public interface JunpyoDAO {	
	String save(HttpServletRequest request, SerialMainVO beanMain, List<SerialSubVO> lstDataSub, List<VirAcctVO> lstDatainaccount, String prePayment) throws Exception;
	String save_junpyo(SerialMainVO beanMain);
	String saveJunpyoMain(SerialMainVO beanMain);
	int To_greenBillTB(SerialMainVO beanMain);
	int vat_Resseq(@Param("resseq") String resseq, @Param("gubun") String gubun
			, @Param("junno") String junno, @Param("sbvt_gno") String sbvt_gno);
	
	String make_injunpyo(SerialMainVO beanMain);
	String make_junpyo(SerialMainVO beanMain);
	String make_sangJunpyo(SerialMainVO beanMain);
	String make_inJun_wno(SerialMainVO beanMain);
	DepoVO make_depoData(@Param("issue_date") String issue_date, @Param("deposit_class") String deposit_class);

	int insertInJunpyo(JunpyoVO junpyoVO);
	int insertInJunpyo2(JunpyoVO junpyoVO);
	int insertMibul(JunpyoVO junpyoVO);
	int insertSInJunpyo(JunpyoVO junpyoVO);
	
	HashMap<String, String> searchSerialJunno(@Param("serial") String serial);
	HashMap<String, String> searchBillClass(@Param("serial") String serial);
	HashMap<String, String> searchVatInfo(@Param("junno") String junno);
	String createSequence(@Param("seq") String seq);
	List<BillTransItemVO> searchBillTransInfo(@Param("junno") String junno, @Param("sbvt_gno") String sbvt_gno);
	int saveBillTrans(BillTransVO billTransVO);
	int saveBillTransItem(BillTransItemVO billTransItemVO);
}
