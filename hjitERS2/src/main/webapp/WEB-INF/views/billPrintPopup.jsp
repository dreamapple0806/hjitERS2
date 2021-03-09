<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.google.gson.JsonArray"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="kr.co.hjitERS.vo.*" %>
<%@ page import="kr.co.hjitERS.util.*" %>

<%	
	JsonArray holdContDataArray =  (JsonArray) request.getAttribute("holdContDataArray");
	ArrayList<CompanyVO> comInfo = (ArrayList<CompanyVO>) request.getAttribute("companyInfo");
	CustVO vo = (CustVO) request.getAttribute("userInfo");
	
	String ship_rate = "";
	String ship_amount = "";
	String ship_vat = "";
	int ship_total_amount = 0;
	int ship_total_vat = 0;
%>

<!DOCTYPE html>
<html lang="ko">
<!-- head 태그에는 css 링크를 걸어준다. -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>HJIT 정산서비스 시스템</title>
<link rel="shortcut icon" href="resources/image/favicon.ico" type="image/x-icon">
</head>
<body>
	<table width="100%" height="20" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td>
				<span style="float:left">
				<img name="btn_print" id="btn_print" src="resources/image/print.gif" 
				alt="출력" align="AbsMiddle" border="0" 
				style="border-style:None;cursor:hand;" 
				onclick="javascript:printit2()"></span>
			</td>
		</tr>
	</table>
		
	<div id="printDiv">
		<table border=0 cellpadding=0 cellpadding=0>
			<tr>
				<td width=20>&nbsp;</td>
				<td>
					<table width="700" border="0" cellspacing="0" cellpadding="0" style="FONT-SIZE: 18pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue;" id="Table11">
						<tr>
							<td height=15 align=center style="font-size: 16pt;">&nbsp;</td>
						</tr>
						<tr>
							<td height=20 align=center style="font-size: 21pt;"><h4>거 래 명 세 표</h4></td>
						</tr>
						<tr>
							<td height=10 align=right style="font-size: 8pt;">${vo.cu_code}</td>
						</tr>
						<tr>
							<td height=20 align=left style="font-size: 8pt;">BL No. ${vos.ship_blno}</td>
						</tr>
						<tr>
							<td height=20 align=left style="font-size: 8pt;">MRN/MSN/HSN : ${vos.ship_mrn}</td>
						</tr>
						<tr>
							<td height=20 align=left style="font-size: 8pt;">Invoice No. ${vos.ship_invoiceno}</td>
						</tr>
						<tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed; FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table2">
						<colgroup>
							<col width="100">
							<col width="300">
							<col width="100">
							<col width="">
						</colgroup>
						<tr>
							<td height="20" align="center" colspan="2">[공급받는자]</td>
							<td height="20" align="center" colspan="2">[공급자]</td>
						</tr>
						<tr>
							<td height="20" align="left" colspan="2">등록번호 : <%=FormatUtil.formatStr(vo.getCu_adcode(), "sano", false) %></td>
							<td height="20" align="left" colspan="2">등록번호 :<%=FormatUtil.formatStr(comInfo.get(0).getCo_sano(), "sano", false) %></td>
						</tr>
						<tr>
							<td height="20" align="left" colspan="2">상&nbsp;&nbsp;&nbsp;&nbsp;호 : <%=vo.getCu_sangho() %></td>
							<td height="20" align="left" colspan="2">상&nbsp;&nbsp;&nbsp;&nbsp;호 : <%=comInfo.get(0).getCo_saname() %></td>
						</tr>
						<tr>
							<td height="20" align="left" colspan="2">대&nbsp;표&nbsp;자 : <%=vo.getCu_master() %></td>
							<td height="20" align="left" colspan="2">대&nbsp;표&nbsp;자 : <%=comInfo.get(0).getCo_master() %></td>
						</tr>
						<tr>
							<td height="20" align="left" colspan="2">소&nbsp;재&nbsp;지 : <%=vo.getCu_juso() %></td>
							<td height="20" align="left" colspan="2">소&nbsp;재&nbsp;지 : <%=comInfo.get(0).getCo_juso() %></td>
						</tr>
						<tr>
							<td height="20" align="left"colspan="2">업&nbsp;&nbsp;&nbsp;&nbsp;태 : &nbsp;<%=vo.getCu_uptae() %>&nbsp;</td>
							<td height="20" align="left"colspan="2">종&nbsp;&nbsp;&nbsp;&nbsp;목 : &nbsp;<%=comInfo.get(0).getCo_uptae() %>&nbsp;</td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed; FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table2">
						<tr>
							<td height="20" align="center" width="65%" style="border-left: 1px black solid; border-top: 1px black solid; border-bottom: 1px black solid;">선명&nbsp;</td>
							<td height="20" align="center" width="35%" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">입항일&nbsp;</td>
						</tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" id="Table2">
						<tr>
							<td height=5 align=center></td>
						</tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="2" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue; Table-Layout: fixed;" id="Table5">
						<colgroup>
							<col width="110">
							<col width="110">
							<col width="90">
							<col width="80">
							<col width="80">
							<col width="60">
							<col width="">
							<col width="90">
						</colgroup>
						<tr align="center">
							<td style="border-top: 1px black solid; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">Container</td>
							<td height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">작업구분</td>
							<td height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">타입</td>
							<td height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">내역</td>
							<td height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">기준일</td>
							<td height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">수량</td>
							<td height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">단가</td>
							<td height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">금액</td>
						</tr>
						<%
						for(int i=0; i<holdContDataArray.size(); i++) {
							JsonObject object = (JsonObject) holdContDataArray.get(i);
							String ship_contno = object.get("bie_ship_contno").getAsString();
							String ship_holddesc = object.get("bie_ship_holddesc").getAsString();
							String ship_type = object.get("bie_ship_type").getAsString();
							String ship_count = object.get("bie_ship_count").getAsString();
							String ship_basedate = object.get("bie_ship_basedate").getAsString();
							String ship_qty = object.get("bie_ship_qty").getAsString();
							ship_rate = object.get("bie_ship_rate").getAsString();
							ship_amount = object.get("bie_ship_amount").getAsString();
							ship_vat = object.get("bie_ship_vat").getAsString();
							
							ship_total_amount += Integer.parseInt(ship_amount);
							ship_total_vat += Integer.parseInt(ship_vat);
						%>
						<tr align="center">
							<td height=31 style="border-left: 1px black solid; border-right: 1px black solid;"><%=ship_contno %>  &nbsp;</td>
							<td style="border-right: 1px black solid;"><%=ship_holddesc %>  &nbsp;</td>
							<td style="border-right: 1px black solid;"><%=ship_type %>  &nbsp;</td>
							<td style="border-right: 1px black solid;"><%=ship_count %> Day &nbsp;</td>
							<td style="border-right: 1px black solid;"><%=FormatUtil.formatStr(ship_basedate, "yyyy-mm-dd", false) %>  &nbsp;</td>
							<td style="border-right: 1px black solid;"><%=ship_qty %>  &nbsp;</td>
							<td style="border-right: 1px black solid;"><%=FormatUtil.insertComma(ship_rate) %>  &nbsp;</td>
							<td style="border-right: 1px black solid;"><%=FormatUtil.insertComma(ship_amount) %>  &nbsp;</td>
						</tr>
						<%
						} 
						%>
						<tr>
							<td align="center" colspan=8 style="border-top: 1px black solid;">&nbsp;</td>
						</tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="2" style="table-layout: fixed; FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table2">
						<colgroup>
							<col width="400">
							<col width="100">
							<col width="">
						</colgroup>
						<tr>
							<td height="20" align="left">*송금 계좌번호 (KDB 산업은행)</td>
							<td height="20" align="center" style="border-left: 1px black solid; border-top: 1px black solid; border-right: 1px black solid;">공급가액</td>
							<td height="20" align=center style="border-top: 1px black solid; border-right: 1px black solid;"><%=FormatUtil.insertComma(String.valueOf(ship_total_amount)) %></td>
						</tr>
						<tr>
							<td height="20" align="left">가상계좌번호 : <%=vo.getCma_account() %></td>
							<td height="20" align="center" style="border-left: 1px black solid; border-top: 1px black solid; border-right: 1px black solid;">부가가치세</td>
							<td height="20" align="center" style="border-top: 1px black solid; border-right: 1px black solid;"><%=FormatUtil.insertComma(String.valueOf(ship_total_vat)) %></td>
						</tr>
						<tr>
							<td height="20" align="left">예금주 : <%=comInfo.get(0).getCo_saname() %></td>
							<td height="20" align="center" style="border-left: 1px black solid; border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;"><strong>청구금액</strong></td>
							<td height="20" align="center" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;"><%=FormatUtil.insertComma(String.valueOf(ship_total_amount + ship_total_vat)) %></td>
						</tr>
						<tr>
							<td colspan="3" align="left">
								<strong>상기 가상계좌는 동 공급받는자의 지정 계좌이므로, 타 계좌 송금시 입금내역이 확인되지 않습니다.
								<br>가상계좌를 꼭 확인하시고 입금하여 주시기 바라며, 본 입금계좌 이외의 입금은 무효합니다.</strong>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="left">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" align="left">○  기본 검사 및 X-Ray(관리대상화물) 청구항목</td>
						</tr>
						<tr>
							<td colspan="3" align="left">
								<table width="600" border="0" cellspacing="0" cellpadding="2" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue; Table-Layout: fixed;" ID="Table9">
									<colgroup>
										<col width="100">
										<col width="100">
										<col width="100">
										<col width="100">
										<col width="100">
										<col width="100">
										<col width="100">
									</colgroup>
									<tr>
										<td align="center" style="border-top: 1px black solid; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">항목</td>
										<td align="center" height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">구분</td>
										<td align="center" height="22" style="border-top: 1px black solid; border-bottom: 1px black solid;">상하차료</td>										
										<td align="center" style="border-top: 1px black solid; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">셔틀료</td>
										<td align="center" height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">검사료</td>
										<td align="center" height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">적출료</td>
										<td align="center" height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">합계</td>
									</tr>
									<tr>
										<td align="center" style="border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;" rowspan=2>기본검사료</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">20 FT</td>
										<td align="center" style="border-bottom: 1px black solid;">40,000</td>
										<td align="center" style="border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">30,000</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">10,000</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">65,000</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">145,000</td>
									</tr>
									<tr>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">40 FT</td>
										<td align="center" style="border-bottom: 1px black solid;">40,000</td>
										<td align="center" style="border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">30,000</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">10,000</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">95,000</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">175,000</td>
									</tr>
									<tr>
										<td align="center" style="border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;" rowspan=2>X-Ray</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">20 FT</td>
										<td align="center" style="border-bottom: 1px black solid;">20,000</td>
										<td align="center" style="border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">30,000</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">-</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">-</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">50,000</td>
									</tr>
									<tr>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">40 FT</td>
										<td align="center" style="border-bottom: 1px black solid;">20,000</td>
										<td align="center" style="border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">40,000</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">-</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">-</td>
										<td align="center" style="border-right: 1px black solid; border-bottom: 1px black solid;">60,000</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="left">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" align="left">○ 전자세금계산서 발행 문의</td>
						</tr>
						<tr>
							<td colspan="3" align="left">
								<table width="600" border="0" cellspacing="0" cellpadding="2" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue; Table-Layout: fixed;" ID="Table9">
									<colgroup>
										<col width="150">
										<col width="250">
										<col width="200">
									</colgroup>
									<tr>
										<td align="center" style="border-top: 1px black solid; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">구분</td>
										<td align="center" height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">관련 항목</td>
										<td align="center" height="22" style="border-top: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">담당자 연락처</td>
									</tr>
									<tr>
										<td align="center" style="border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">터미널 부대</td>
										<td align="center" height="55" style="border-right: 1px black solid; border-bottom: 1px black solid;">보관료, 냉동료, 상하차, 반송화물</td>
										<td align="center" height="55" style="border-right: 1px black solid; border-bottom: 1px black solid;">TEL : 032-202-4936~7<br />FAX : 032-821-9071
										</td>
									</tr>
									<tr>
										<td align="center" style="border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">터미널 통관 화물</td>
										<td align="center" height="55" style="border-right: 1px black solid; border-bottom: 1px black solid;">세관 및 검역 검사료, 방역료<br />X-RAY, 물품 확인 및 샘플채취료
										</td>
										<td align="center" height="55" style="border-right: 1px black solid; border-bottom: 1px black solid;">TEL : 032-202-4982<br />FAX : 032-821-9076
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="left"><font color=red>⇒ 전자세금계산서 “공급받는자” 정보 변경은 입금 전 각 업무담당자로 확인, 변경 후 입금하여 주시기 바랍니다.</font></td>
						</tr>
						<tr>
							<td colspan="3" align="left">⇒ 전자세금계산서 발행 시, 정보 미변경으로 인한 재발행은 불가합니다.</td>
						</tr>
						<tr>
							<td colspan="3" align="left"><font color=red>⇒ 전자세금계산서 수취자 정보 변경은 입금 전, ERS ◎고객정보 “E-MAIL”란에서 수정 후 저장하여 주시기 바랍니다.</font></td>
						</tr>
						<tr>
							<td colspan="3" align="left"><font color=red>⇒ 사전 납부(선납) 입금 후, 선반출 차액분에 대해서는 환불되지 않습니다.</font></td>
						</tr>
						<tr>
							<td colspan="3" align="left">⇒ 사전 납부(선납) 및 당일 정산의 전자세금계산서 발행일자는 입금일자와 동일합니다.</td>
						</tr>
					</table>
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
	<script>
	//출력
	function printit2() {
		//alert("프린터 설정에서 페이지 방향을 세로로 변경해주세요.");
		var initBody;
		var css = '@page { size: portrait; margin: 0; }',
	    head = document.head || document.getElementsByTagName('head')[0],
	    style = document.createElement('style');

		style.type = 'text/css';
		style.media = 'print';

		if (style.styleSheet){
	 	 style.styleSheet.cssText = css;
		} else {
		  style.appendChild(document.createTextNode(css));
		}

		head.appendChild(style);

	    document.body.innerHTML = printDiv.innerHTML;
	    
		window.print();
	}
	</script>
</body>
</html>
