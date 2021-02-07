
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="kr.co.hjitERS.vo.*" %>
<%@ page import="kr.co.hjitERS.util.*" %>
<%	
	SerialMainVO vom = (SerialMainVO) request.getAttribute("listMain");
	ArrayList<SerialSubVO> vos = (ArrayList<SerialSubVO>) request.getAttribute("listSub");
	CompanyVO comInfo = (CompanyVO) request.getAttribute("comInfo");
	CustVO vo = (CustVO) request.getAttribute("vo");

	DecimalFormat format = new DecimalFormat("###,###");
	
	String tot = vom.getShip_tot();
	String vat = vom.getShip_vat();
	String amount = vom.getShip_amt();

	
%>

<!DOCTYPE html>
<html lang="ko">
<!-- head 태그에는 css 링크를 걸어준다. -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>HJIT 정산서비스 시스템</title>
<!-- 부트스트랩, 커스텀 css 파일 링크 설정 -->
<link rel="stylesheet" href="resources/lib/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/lib/css/sub.css">
<link rel="shortcut icon" href="resources/image/favicon.ico" type="image/x-icon">
</head>
<body>
	<div id="printDiv">
		<table border=0 cellpadding=0 cellpadding=0>
			<tr>
				<td width=15>&nbsp;</td>
				<td>
					<font size=1 color="red">[별지 제11호 서식]</font>
					<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table1" >
						<tr>
							<td rowspan="2" align="center" style="font-size:22pt; font-family:바탕;border-top:1px red solid; border-left:1px red solid;" >
							<font color=red><strong>세 금 계 산 서</strong></font></td>
							<td width="60" height="20" align="right" class="red_t"><font color=red>공 급 자</font></td>
							<td width="70" class="red_t">&nbsp;</td>
							<td width="60" class="red_t"><font color=red>책 &nbsp; 번호</font></td>
							<td width="70" align=center class="red_tl"></td>
							<td width="20" align="center" class="red_t"><font color=red>권</font></td>
							<td width="70" align=center class="red_t"></td>
							<td width="20" align="center" class="red_tr"><font color=red>호</font></td>
						</tr>
						<tr>
							<td height="20" align="right"><font color=red>보 관 용</font></td>
							<td>&nbsp;</td>
							<td><font color=red>보관용</font></td>
							<td align=center class="red_tl"></td>
							<td align="center" class="red_t"><font color=red>-</font></td>
							<td colspan="2" align=center class="red_tr"></td>
						</tr>
						</table>
						<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table2">
							<tr>
							<td width="18" rowspan="2" align="center" valign="bottom" class="red_tl">
							<font color=red>공<br><br><br>급</font></td>
							<td width="55" height="45" align="center" style="border-top:3px red solid; border-left:3px red solid;"><font color=red>등록번호</font></td>
							<td colspan="3" align=center style="border-top:3px red solid; border-left:1px red solid; border-right:2px red solid;"><%=FormatUtil.formatStr(FormatUtil.nvl(comInfo.getCo_sano(), ""), "sano", false)%></td>
							<td width="18" rowspan="2" align="center" valign="bottom" class="red_tl">
							<font color=red>공<br><br>급<br><br>받</font></td>
							<td width="55" align="center" style="border-top:3px red solid; border-left:3px red solid; border-bottom:1px red solid;"><font color=red>등록번호</font></td>
							<td colspan="3" align=center style="border-top:3px red solid; border-left:1px red solid; border-right:3px red solid;  border-bottom:1px red solid;"><%=FormatUtil.formatStr(FormatUtil.nvl(vo.getCu_adcode(), ""), "sano", false) %></td>
						</tr>
						<tr>
							<td height="45" align="center" style="border-top:1px red solid;border-bottom:2px red solid; border-left:3px red solid;">
							<font color=red>상 &nbsp;&nbsp;&nbsp; 호<br>(법인명)</font></td>
							<td style="align:center; border-top:1px red solid; border-left:1px red solid;border-bottom:2px red solid; ">${comInfo.co_saname}</td>
							<td width="18" align="center" style="border-top:1px red solid; border-left:1px red solid;border-bottom:2px red solid; ">
							<font color=red>성<br>명</font></td>
							<td width="100" style="align:center; border-top:1px red solid; border-left:1px red solid;border-bottom:2px red solid; border-right:2px red solid;">
								${comInfo.co_master}&nbsp;&nbsp;
							</td>
							<td align="center" class="red_tl" style="border-left:2px red solid;border-bottom:2px red solid;">
							<font color=red>상 &nbsp;&nbsp;&nbsp; 호<br>(법인명)</font></td>
							<td width="122" align=center class="red_tl" style="border-top:1px red solid; border-left:1px red solid;border-bottom:2px red solid;">${vo.cu_sangho}</td>
							<td width="18" align="center" class="red_tl" style="border-top:1px red solid; border-left:1px red solid;border-bottom:2px red solid;"><font color=red>성<br>명</font></td>
							<td width="100" style="align:center; border-top:1px red solid; border-left:1px red solid;border-bottom:2px red solid; border-right:3px red solid;">${vo.cu_master}</td>
						</tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table3">
						<tr>
							<td width="18" rowspan="3" align="center" valign="top" style="border-bottom:1px red solid; border-left:1px red solid;"><font color=red><br>
							<br>
							자</font></td>
							<td width="57" height="45" align="center" class="red_tl">
							<font color=red>사 업 장<br>주 &nbsp;&nbsp; &nbsp; 소 </font></td>
							<td colspan="3" class="red_tl">${comInfo.co_juso}</td>
							<td width="18" rowspan="3" align="center" valign="top" style="border-left:1px red solid;"><font color=red><br>
							는<br><br>자</font></td>
							<td width="57" align="center" class="red_tl">
							<font color=red>사 업 장<br>주 &nbsp;&nbsp; &nbsp; 소</font></td>
							<td colspan="3" style="border-top:1px red solid; border-left:1px red solid; border-right:1px red solid;">${vo.cu_juso}</td>
						</tr>
						<tr>
							<td height="45" align="center" class="red_tl"><font color=red>업 &nbsp;&nbsp; &nbsp; 태 </font></td>
							<td width=122 class="red_tl">&nbsp;${comInfo.co_uptae}</td>
							<td width="18" align="center" class="red_tl"><font color=red>종<br>목</font></td>
							<td width="100" class="red_tl">&nbsp;${comInfo.co_upjong}</td>
							<td align="center" class="red_tl"><font color=red>업 &nbsp;&nbsp; &nbsp; 태</font></td>
							<td width="122" align=center class="red_tl">${vo.cu_uptae}</td>
							<td width="18" align="center" class="red_tl"><font color=red>종<br>목</font></td>
							<td width="100" align=center style="border-top:1px red solid; border-left:1px red solid; border-right:1px red solid;">${vo.cu_upjong}</td>
						</tr>
						<tr>
							<td height="45" align="center" class="red_tl" style="border-bottom:1px red solid;"></td>
							<td width="240" class="red_tl"  style="border-bottom:1px red solid;" colspan="3"></td>
							<td align="center" class="red_tl" style="border-bottom:1px red solid;"><font color=red>입금계좌</font></td>
							<td width="240" align=center class="red_tl" style="border-top:1px red solid; border-bottom:1px red solid; border-left:1px red solid; border-right:1px red solid;" colspan="3">${vo.cma_account}</td>
						</tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0" ID="Table4">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table5">
									<tr>
										<td height="20" colspan="3" align="center" style="border-top:3px red solid; border-left:3px red solid;"><font color=red>작 성</font></td>
										<td colspan="12" align="center" style="border-top:3px red solid; border-left:1px red solid;"><font color=red>공 급 가 액</font></td>
										<td colspan="10" align="center" style="border-top:3px red solid; border-left:1px red solid; border-right:3px red solid;"><font color=red>세 액</font></td>
									</tr>
									<tr align="center">
										<td height="20" width="40" style="border-top:1px red solid; border-left:3px red solid;"><font color=red>년</font></td>
										<td width="18" class="red_tl"><font color=red>월</font></td>
										<td width="18" class="red_tl"><font color=red>일</font></td>
										<td width="40" style="font-size:8pt; border-top:1px red solid; border-left:1px red solid;"><font color=red>공란수</font></td>
										<td width="18" class="red_tl"><font color=red>백</font></td>
										<td width="18" class="red_tl"><font color=red>십</font></td>
										<td width="18" class="red_tl"><font color=red>억</font></td>
										<td width="18" class="red_tl"><font color=red>천</font></td>
										<td width="18" class="red_tl"><font color=red>백</font></td>
										<td width="18" class="red_tl"><font color=red>십</font></td>
										<td width="18" class="red_tl"><font color=red>만</font></td>
										<td width="18" class="red_tl"><font color=red>천</font></td>
										<td width="18" class="red_tl"><font color=red>백</font></td>
										<td width="18" class="red_tl"><font color=red>십</font></td>
										<td width="18" class="red_tl"><font color=red>일</font></td>
										<td width="18" class="red_tl"><font color=red>십</font></td>
										<td width="18" class="red_tl"><font color=red>억</font></td>
										<td width="18" class="red_tl"><font color=red>천</font></td>
										<td width="18" class="red_tl"><font color=red>백</font></td>
										<td width="18" class="red_tl"><font color=red>십</font></td>
										<td width="18" class="red_tl"><font color=red>만</font></td>
										<td width="18" class="red_tl"><font color=red>천</font></td>
										<td width="18" class="red_tl"><font color=red>백</font></td>
										<td width="18" class="red_tl"><font color=red>십</font></td>
										<td width="17" style="border-top:1px red solid; border-left:1px red solid; border-right:3px red solid;"><font color=red>일</font></td>
									</tr>
									<tr align="center">
										<td height="40" style="border-top:1px red solid; border-left:3px red solid; border-bottom:2px red solid;"><%=FormatUtil.nvl3(vom.getIssue_date().subSequence(0, 4).toString(), "") %></td>
										<td class="red_tlb2"><%=FormatUtil.nvl3(vom.getIssue_date().subSequence(4, 6).toString(), "") %></td>
										<td class="red_tlb2"><%=FormatUtil.nvl3(vom.getIssue_date().subSequence(6, 8).toString(), "") %></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"><%if(amount.length() > 10){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 11),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 9){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 10),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 8){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 9),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 7){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 8),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 6){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 7),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 5){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 6),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 4){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 5),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 3){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 4),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 2){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 3),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 1){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 2),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(amount.length() > 0){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 1),1) %><%} else{ out.write("");}%></td>
										
								<%
								if(vat.length() == 0){
								%>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
										<td class="red_tlb2"></td>
								<%
								}
								else{
								%>
										<td class="red_tlb2"><%if(vat.length() > 9){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 10),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(vat.length() > 8){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 9),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(vat.length() > 7){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 8),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(vat.length() > 6){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 7),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(vat.length() > 5){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 6),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(vat.length() > 4){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 5),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(vat.length() > 3){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 4),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(vat.length() > 2){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 3),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2"><%if(vat.length() > 1){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 2),1) %><%} else{ out.write("");}%></td>
										<td class="red_tlb2" style="border-right:3px red solid;"><%if(vat.length() > 0){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 1),1) %><%} else{ out.write("");}%></td>
								<%
								}
								%>						
									</tr>
								</table>
							</td>
						<td width="70" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" style="FONT-SIZE: 8pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table6">
								<tr>
									<td width="286" height="20" align="center" style="border-bottom:1px red solid;border-right:1px red solid;"><font color=red>비 고</font></td>
								</tr>
							</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" style="FONT-SIZE: 8pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table7">
								<tr>
									<td rowspan="2" style="border-right:1px red solid;">&nbsp;</td>
								</tr>
							</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="2" style="FONT-SIZE: 8pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table8">
								<tr>
									<td height=43 width="286" align="center" style="border-right:1px red solid;">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table9">
					<tr align="center">
						<td width="20" height="25" class="red_tl"><font color=red>월</font></td>
						<td width="20" class="red_tl"><font color=red>일</font></td>
						<td class="red_tl"><font color=red>품 목</font></td>
						<td width="50" class="red_tl"><font color=red>규 격</font></td>
						<td width="60" class="red_tl"><font color=red>수 량</font></td>
						<td width="80" class="red_tl"><font color=red>단 가</font></td>
						<td width="100" class="red_tl"><font color=red>공급가액</font></td>
						<td width="100" class="red_tl"><font color=red>세액</font></td>
						<td width="60" style="border-top:1px red solid; border-left:1px red solid; border-right:1px red solid;"><font color=red>비 고</font></td>
					</tr>
					<%
					for(int i=0; i<vos.size(); i++){
						SerialSubVO temp = vos.get(i);
					%>
					<tr>
						<td height="25" align="center" class="red_tl"><%=FormatUtil.nvl3(temp.getIndate().subSequence(4, 6).toString(), "") %></td>
						<td align="center" class="red_tl"><%=FormatUtil.nvl3(temp.getIndate().subSequence(6, 8).toString(), "") %></td>
						<td class="red_tl">${vos.ship_holddesc}</td>
						<td class="red_tl" align="center">${vos.ship_type}</td>
						<td  align="center" class="red_tl">${vos.ship_qty}</td>
						<td align="right" class="red_tl"></td>
						<td align="right" class="red_tl"><%=format.format(Integer.parseInt(FormatUtil.nvl3(temp.getShip_amount(), ""))) %></td>
						<td align="right" class="red_tl"><%=format.format(Integer.parseInt(FormatUtil.nvl3(temp.getShip_vat_amt(), ""))) %></td>
						<td style="border-top:1px red solid; border-left:1px red solid; border-right:1px red solid;"></td>
					</tr>
					<%
					}
					%>
					<tr>
						<td height="25" align="center" class="red_tl"></td>
						<td align="center" class="red_tl"></td>
						<td class="red_tl"></td>
						<td align="center" class="red_tl"></td>
						<td  align="center" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td style="border-top:1px red solid; border-left:1px red solid; border-right:1px red solid;"></td>
					</tr>
				
					<tr>
						<td height="25" align="center" class="red_tl"></td>
						<td align="center" class="red_tl"></td>
						<td class="red_tl"></td>
						<td align="center" class="red_tl"></td>
						<td  align="center" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td style="border-top:1px red solid; border-left:1px red solid; border-right:1px red solid;"></td>
					</tr>
					<tr>
						<td height="25" align="center" class="red_tl"></td>
						<td align="center" class="red_tl"></td>
						<td class="red_tl"></td>
						<td align="center" class="red_tl"></td>
						<td align="center" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td align="right" class="red_tl"></td>
						<td style="border-top:1px red solid; border-left:1px red solid; border-right:1px red solid;"></td>
					</tr>
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table10">
					<tr>
						<td width="110" height="25" align="center" class="red_tl"><font color=red>합 계 금 액</font></td>
						<td width="95" align="center" class="red_tl"><font color=red>현 금</font></td>
						<td width="95" align="center" class="red_tl"><font color=red>수 표</font></td>
						<td width="95" align="center" class="red_tl"><font color=red>어 음</font></td>
						<td width="95" align="center" class="red_tl"><font color=red>외상미수금</font></td>
						<td width="80" rowspan="2" align="center" style="border-top:1px red solid; border-bottom:1px red solid; border-left:1px red solid;"><font color=red>이 금액을</font></td>
						<td class="red_t"><font color=red>영수</font></td>
						<td rowspan="2" style="border-top:1px red solid; border-bottom:1px red solid; border-right:1px red solid;"><font color=red>함</font></td>
					</tr>
					<tr>
						<td height="27" align=right style="border-top:1px red solid; border-bottom:1px red solid; border-left:1px red solid;"><%=format.format(Integer.parseInt(FormatUtil.nvl3(vom.getShip_tot(), ""))) %></td>
						<td align=right style="border-top:1px red solid; border-bottom:1px red solid; border-left:1px red solid;"><%=format.format(Integer.parseInt(FormatUtil.nvl3(vom.getShip_tot(), ""))) %></td>
						<td align=right style="border-top:1px red solid; border-bottom:1px red solid; border-left:1px red solid;"></td>
						<td align=right style="border-top:1px red solid; border-bottom:1px red solid; border-left:1px red solid;"></td>
						<td align=right style="border-top:1px red solid; border-bottom:1px red solid; border-left:1px red solid;"></td>
						<td style="border-bottom:1px red solid;"><font color=red><strike>청구</strike></font></td>
					</tr>
					<tr>
						<td style="border-top:1px red solid; border-bottom:1px red solid; border-left:1px red solid; border-right:1px red solid; align:absmiddle" colspan="8">			
							※ KDB 산업은행 - ${vo.cma_account} 본 입금계좌 이외의 입금은 무효합니다.
						</td>
					</tr>
				</table>	
				<table width="700" border="0" cellspacing="0" cellpadding="0" ID="Table11">
					<tr>
						<td height="10" style="font-size:7pt"><font color=red>22226-28131일 '96.3.27 승인</font></td>
					</tr>
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table12">
					<tr>
						<td height=2></td></tr>
					<tr>
						<td><font size=1 color=blue>[별지 제11호 서식]</font></td></tr>
					<tr>
						<td rowspan="2" align="center" style="font-size:22pt; font-family:바탕;border-top:1px blue solid; border-left:1px blue solid;">
						<font color=blue><strong>세 금 계 산 서</strong></font></td>
						<td width="60" height="20" align="right" style="border-top:1px blue solid;"><font color=blue>공급받는자</font></td>
						<td width="70" style="border-top:1px blue solid;">&nbsp;</td>
						<td width="60" style="border-top:1px blue solid;"><font color=blue>책 &nbsp; 번호</font></td>
						<td width="70" align=center style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td width="20" align="center" style="border-top:1px blue solid;"><font color=blue>권</font></td>
						<td width="70" align=center style="border-top:1px blue solid;"></td>
						<td width="20" align="center" style="border-top:1px blue solid; border-right:1px blue solid;"><font color=blue>호</font></td>
					</tr>
					<tr>
						<td height="20" align="right"><font color=blue>보 관 용</font></td>
						<td>&nbsp;</td>
						<td><font color=blue>일련번호</font></td>
						<td align=center style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid;"><font color=blue>-</font></td>
						<td colspan="2" align=center style="border-top:1px blue solid; border-right:1px blue solid;"></td>
					</tr>
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table13">
					<tr>
						<td width="18" rowspan="2" align="center" valign="bottom" style="border-top:1px blue solid; border-left:1px blue solid;">
						<font color=blue>공<br><br><br>급</font></td>
						<td width="55" height="45" align="center" style="border-top:3px blue solid; border-left:3px blue solid;"><font color=blue>등록번호</font></td>
						<td colspan="3" align=center style="border-top:3px blue solid; border-left:1px blue solid; border-right:2px blue solid;">&nbsp;${comInfo.co_sano}</td></td>
						<td width="18" rowspan="3" align="center" valign="bottom" style="border-top:1px blue solid; border-left:1px blue solid;">
						<font color=blue>공<br><br>급<br><br>받</font></td>
						<td width="55" align="center" style="border-top:3px blue solid; border-left:3px blue solid; border-bottom:2px blue solid;"><font color=blue>등록번호</font></td>
						<td colspan="3" align=center style="border-top:3px blue solid; border-left:1px blue solid; border-right:3px blue solid;  border-bottom:2px blue solid;">&nbsp;${vo.cu_adcode}</td>
					</tr>
					<tr>
						<td height="45" align="center" style="border-top:1px blue solid;border-bottom:2px blue solid; border-left:3px blue solid;">
						<font color=blue>상 &nbsp;&nbsp;&nbsp; 호<br>(법인명)</font></td>
						<td style="border-top:1px blue solid; border-left:1px blue solid;border-bottom:2px blue solid; ">${comInfo.co_saname}</td>
						<td width="18" align="center" style="border-top:1px blue solid; border-left:1px blue solid;border-bottom:2px blue solid; ">
						<font color=blue>성<br>명</font></td>
						<td width="100" style="border-top:1px blue solid; border-left:1px blue solid;border-bottom:2px blue solid;
								border-right:2px blue solid;">${comInfo.co_master}</td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;">
						<font color=blue>상 &nbsp;&nbsp;&nbsp; 호<br>(법인명)</font></td>
						<td width="122" align=center style="border-top:1px blue solid; border-left:1px blue solid;">${vo.cu_sangho}</td>
						<td width="18" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>성<br>명</font></td>
						<td width="100" align=center style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;">${vo.cu_master}</td>
					</tr>	
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table14">
					<tr>
						<td width="18" rowspan="3" align="center" valign="top" style="border-left:1px blue solid;">
							<font color=blue><br><br>자</font>
						</td>
						<td width="57" height="45" align="center" style="border-top:1px blue solid; border-left:1px blue solid;">
						<font color=blue>사 업 장<br>주 &nbsp;&nbsp; &nbsp; 소</font> </td>
						<td colspan="3" style="border-top:1px blue solid; border-left:1px blue solid;">${comInfo.co_juso}</td>
						<td width="18" rowspan="3" align="center" valign="top" style="border-left:1px blue solid;"><br>
						<font color=blue>는<br><br>자</font></td>
						<td width="57" align="center" style="border-top:1px blue solid; border-left:1px blue solid;">
						<font color=blue>사 업 장<br>주 &nbsp;&nbsp; &nbsp; 소</font></td>
						<td colspan="3" style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;">${vo.cu_juso}</td>
					</tr>
					<tr>
						<td height="45" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>업 &nbsp;&nbsp; &nbsp; 태</font> </td>
						<td width=122 style="border-top:1px blue solid; border-left:1px blue solid;">&nbsp;${comInfo.co_uptae}</td></td>
						<td width="18" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>종<br>목</font></td>
						<td width="100" style="border-top:1px blue solid; border-left:1px blue solid;">&nbsp;${comInfo.co_upjong}</td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>업 &nbsp;&nbsp; &nbsp; 태</font></td>
						<td width="122" align=center style="border-top:1px blue solid; border-left:1px blue solid;">${vo.cu_uptae}</td>
						<td width="18" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>종<br>목</font></td>
						<td width="100" align=center style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;">${vo.cu_upjong}</td>
					</tr>
					<tr>
						<td height="45" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td width="240" style="border-top:1px blue solid; border-left:1px blue solid;" colspan="3"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>입금계좌</font></td>
						<td width="240" align=center style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;" colspan="3">
						${vo.cma_account}
					</td>
					</tr>
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="0" ID="Table15">
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table16">
								<tr>
									<td height="20" colspan="3" align="center" style="border-top:3px blue solid; border-left:3px blue solid;"><font color=blue>작 성</font></td>
									<td colspan="12" align="center" style="border-top:3px blue solid; border-left:1px blue solid;"><font color=blue>공 급 가 액</font></td>
									<td colspan="10" align="center" style="border-top:3px blue solid; border-left:1px blue solid; border-right:3px blue solid;"><font color=blue>세 액</font></td>
								</tr>
								<tr align="center">
									<td height="20" width=40 style="border-top:1px blue solid; border-left:3px blue solid;"><font color=blue>년</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>월</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>일</font></td>
									<td width="40" style="font-size:8pt; border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>공란수</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>백</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>십</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>억</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>천</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>백</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>십</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>만</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>천</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>백</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>십</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>일</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>십</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>억</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>천</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>백</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>십</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>만</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>천</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>백</font></td>
									<td width="18" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>십</font></td>
									<td width="17" style="border-top:1px blue solid; border-left:1px blue solid; border-right:3px blue solid;"><font color=blue>일</font></td>
								</tr>
								<tr align="center">
									<td height="40" style="border-top:1px blue solid; border-left:3px blue solid; border-bottom:2px blue solid;"><%=FormatUtil.nvl3(vom.getIssue_date().subSequence(0, 4).toString(), "") %></td>
									<td class="blue_tlb2"><%=FormatUtil.nvl3(vom.getIssue_date().subSequence(4, 6).toString(), "") %></td>
									<td class="blue_tlb2"><%=FormatUtil.nvl3(vom.getIssue_date().subSequence(6, 8).toString(), "") %></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"><%if(amount.length() > 10){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 11),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 9){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 10),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 8){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 9),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 7){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 8),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 6){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 7),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 5){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 6),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 4){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 5),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 3){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 4),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 2){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 3),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 1){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 2),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(amount.length() > 0){ %><%=FormatUtil.Left(FormatUtil.Right(amount, 1),1) %><%} else{ out.write("");}%></td>
									
									<%
									if(vat.length() == 0){
									%>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<td class="blue_tlb2"></td>
									<%
									}
									else{
									%>
									<td class="blue_tlb2"><%if(vat.length() > 9){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 10),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(vat.length() > 8){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 9),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(vat.length() > 7){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 8),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(vat.length() > 6){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 7),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(vat.length() > 5){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 6),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(vat.length() > 4){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 5),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(vat.length() > 3){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 4),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(vat.length() > 2){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 3),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2"><%if(vat.length() > 1){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 2),1) %><%} else{ out.write("");}%></td>
									<td class="blue_tlb2" style="border-right:3px blue solid;"><%if(vat.length() > 0){ %><%=FormatUtil.Left(FormatUtil.Right(vat, 1),1) %><%} else{ out.write("");}%></td>
									<%
									}
									%>							
								</tr>
							</table>
						</td>
						<td width="70" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="2" style="FONT-SIZE: 8pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table17">
								<tr>
									<td width="286" height="20" align="center" style="border-top:1px blue solid;border-bottom:1px blue solid;border-right:1px blue solid;"><center>비 고</center></td>
								</tr>
							</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="2" style="FONT-SIZE: 8pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table18">
								<tr>
									<td rowspan="2" style="border-right:1px blue solid;">&nbsp;</td>
								</tr>	
							</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="2" style="FONT-SIZE: 8pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table19">
								<tr>
								<td width="286" height="43" align="center" style="border-right:1px blue solid;">	&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table20">
					<tr align="center">
						<td width="20" height="25" class="blue_tl"><font color=blue>월</font></td>
						<td width="20" class="blue_tl"><font color=blue>일</font></td>
						<td class="blue_tl"><font color=blue>품 목</font></td>
						<td width="50" class="blue_tl"><font color=blue>규 격</font></td>
						<td width="60" class="blue_tl"><font color=blue>수 량</font></td>
						<td width="80" class="blue_tl"><font color=blue>단 가</font></td>
						<td width="100" class="blue_tl"><font color=blue>공급가액</font></td>
						<td width="100" class="blue_tl"><font color=blue>세액</font></td>
						<td width="60" style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;"><font color=blue>비 고</font></td>
					</tr>
					<%
					for(int i=0; i<vos.size(); i++){
						SerialSubVO temp = vos.get(i);
					%>
					<tr>
						<td height="25" align="center" class="blue_tl"><%=FormatUtil.nvl3(temp.getIndate().subSequence(4, 6).toString(), "") %></td>
						<td align="center" class="blue_tl"><%=FormatUtil.nvl3(temp.getIndate().subSequence(6, 8).toString(), "") %></td>
						<td class="blue_tl">${vos.ship_holddesc}</td>
						<td class="blue_tl" align="center">${vos.ship_type}</td>
						<td  align="center" class="blue_tl">${vos.ship_qty}</td>
						<td align="right" class="blue_tl"></td>
						<td align="right" class="blue_tl"><%=format.format(Integer.parseInt(FormatUtil.nvl3(temp.getShip_amount(), ""))) %></td>
						<td align="right" class="blue_tl"><%=format.format(Integer.parseInt(FormatUtil.nvl3(temp.getShip_vat_amt(), ""))) %></td>
						<td style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;"></td>
					</tr>
					<%
					}
					%>
					<tr>
						<td height="25" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;"></td>
					</tr>
					<tr>
						<td height="25" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;"></td>
					</tr>
					<tr>
						<td height="25" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="center" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td align="right" style="border-top:1px blue solid; border-left:1px blue solid;"></td>
						<td style="border-top:1px blue solid; border-left:1px blue solid; border-right:1px blue solid;"></td>
					</tr>
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="3" style="FONT-SIZE: 9pt; FONT-FAMILY: 굴림; Design_Time_Lock: TRue" ID="Table21">
					<tr>
						<td width="110" height="25" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>합 계 금 액</font></td>
						<td width="95" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>현 금</font></td>
						<td width="95" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>수 표</font></td>
						<td width="95" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>어 음</font></td>
						<td width="95" align="center" style="border-top:1px blue solid; border-left:1px blue solid;"><font color=blue>외상미수금</font></td>
						<td width="80" rowspan="2" align="center" style="border-top:1px blue solid; border-bottom:1px blue solid; border-left:1px blue solid;"><font color=blue>이 금액을</font></td>
						<td style="border-top:1px blue solid;"><font color=blue>영수</font></td>
						<td rowspan="2" style="border-top:1px blue solid; border-bottom:1px blue solid; border-right:1px blue solid;"><font color=blue>함</font></td>
					</tr>
					<tr>
						<td height="27" align=right style="border-top:1px blue solid; border-bottom:1px blue solid; border-left:1px blue solid;"><%=format.format(Integer.parseInt(FormatUtil.nvl3(vom.getShip_tot(), ""))) %></td>
						<td align=right style="border-top:1px blue solid; border-bottom:1px blue solid; border-left:1px blue solid;"><%=format.format(Integer.parseInt(FormatUtil.nvl3(vom.getShip_tot(), ""))) %></td>
						<td align=right style="border-top:1px blue solid; border-bottom:1px blue solid; border-left:1px blue solid;"></td>
						<td align=right style="border-top:1px blue solid; border-bottom:1px blue solid; border-left:1px blue solid;"></td>
						<td align=right style="border-top:1px blue solid; border-bottom:1px blue solid; border-left:1px blue solid;"></td>
						<td style="border-bottom:1px blue solid;"><font color=blue><strike>청구</strike></font></td>
					</tr>
					<tr>
						<td style="border-top:1px blue solid; border-bottom:1px blue solid; border-left:1px blue solid; border-right:1px blue solid; align:absmiddle" colspan="8">			
							※ KDB 산업은행 - ${vo.cma_account} 본 입금계좌 이외의 입금은 무효합니다.
						</td>
					</tr>
				</table>	
				<table width="700" border="0" cellspacing="0" cellpadding="0" ID="Table11">
					<tr>
						<td height="10" style="font-size:7pt"><font color=blue>22226-28131일 '96.3.27 승인</font></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
	<!-- Jquery, popper, bootstrap 자바스크립트 추가 -->
	<script src="resources/lib/js/jquery-3.4.1.min.js"></script>
	<script src="resources/lib/js/popper.js"></script>
	<script src="resources/lib/js/bootstrap.min.js"></script>
</body>
</html>
