<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<!-- head 태그에는 css 링크를 걸어준다. -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>HJIT 정산서비스 시스템</title>
<!-- 부트스트랩, 커스텀 css 파일 링크 설정 -->
<link rel="stylesheet" href="resources/lib/css/bootstrap.min.css">
<link rel="shortcut icon" href="resources/image/favicon.ico" type="image/x-icon">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		Date d = new Date();
	       
        String s = d.toString();
        System.out.println("현재날짜 : "+ s);
       
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String eymd = sdf.format(d);
        System.out.println("eymd : "+ eymd);
       
	%>
	<form method="post" name="Form" method="post">
	<div class="card bg-light mt-3 container">		
		<input type="hidden" name="MaxRows" value="1">
		<input type="hidden" name="MaxRows_fore" value="2">	
	
		<div class="card-header bg-light show-grid" style="padding:.75rem .10rem;">
			<input type="hidden" name="holdContNo" value="1">
			<input type="hidden" name="holdBlno" value="2">
			<input type="hidden" name="demurrage" value="3">
			<input type="hidden" name="option" value="4">
			
			<table style="width:100%;" >
				<tbody>
					<tr>
						<td style="border-top: 0px">
							<h5 class="card-title">
								<span class='font-weight-bold'>계산서 상세 정보</span>
							</h5>	
						</td>
						<td class="text-right" style="border-top: 0px">
						</td>
					</tr>						
				</tbody>
			</table>
		</div>
		<div class="card-header bg-light show-grid">
			<div class="row">
				<table class="table table-bordered table-condensed" style="font-size:9pt;">
	    			<thead>
      					<tr class="text-center">
	        				<th>고객코드</th>
        					<th>고객명</th>
        					<th>사업자번호</th>
        					<th>발행일자</th>
        					<th>관세사</th>
      					</tr>
    				</thead>
    				<tbody>
	      				<tr>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" id="cu_code" name="cu_code" value="${userInfo.cu_code}" placeholder="" aria-label="cu_code" readonly></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="cu_sangho" value="${userInfo.cu_sangho}" placeholder="" aria-label="cu_sangho" readonly></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" id="cu_adcode" name="cu_adcode" value="${userInfo.cu_adcode}" placeholder="" aria-label="cu_adcode" readonly></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="issue_date" value="${vom.issue_date}" placeholder="" aria-label="issue_date" readonly></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="ship_customs" value="" placeholder="" aria-label="ship_customs" readonly></td>
      					</tr>
    				</tbody>
  				</table>
			</div>
			<div class="row">
				<table class="table table-bordered table-condensed " style="font-size:9pt">
    				<thead>
      					<tr class="text-center">
        					<th>담당자</th>
        					<th>E-Mail</th>
        					<th>가상계좌</th>
        					<th>-</th>
        					<th>-</th>
      					</tr>
    				</thead>
    				<tbody>
	      				<tr class="text-center">
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="take_user" value="${userInfo.cu_takeuser}" placeholder="" aria-label="take_user" disabled></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="take_usermail" value="${userInfo.cu_takeusermail}" placeholder="" aria-label="take_usermail" disabled></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="cma_account" value="${userInfo.cma_account}" placeholder="" aria-label="cma_account" disabled></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="" value="" placeholder="" aria-label="" disabled></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="" value="" placeholder="" aria-label="" disabled></td>
      					</tr>
    				</tbody>
  				</table>
			</div>		
		</div>
	</div>
	<div class="card bg-light mt-3 container">
		<div class="card-header bg-light show-grid">
			<div class="row">
				<table class="table table-bordered table-condensed " style="font-size:9pt">
    				<thead>
      					<tr class="text-center">
        					<th>공급가액</th>
        					<th>세액</th>
        					<th>입금액합계</th>
        					<th>합계금액</th>
      					</tr>
    				</thead>
    				<tbody>
      					<tr class="text-center">
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="ship_amt" placeholder="" aria-label="ship_amt" value="<fmt:formatNumber value="${vom.ship_amt}" pattern="#,###" />" readonly></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="ship_vat" placeholder="" aria-label="ship_vat" value="<fmt:formatNumber value="${vom.ship_vat}" pattern="#,###" />" readonly></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="ship_dep" placeholder="" aria-label="ship_dep" value="" readonly></td>
        					<td><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" name="ship_tot" placeholder="" aria-label="ship_tot" value="<fmt:formatNumber value="${vom.ship_tot}" pattern="#,###" />" readonly></td>
      					</tr>
    				</tbody>
  				</table>
			</div>
		</div>
	</div>
	<div class="card bg-light mt-3 container" id="applyHoldListHead">
		<div class="card-header bg-light show-grid" style="padding:.75rem .10rem;">
			<h5 class="card-title">
				<span class='font-weight-bold'>Holding List</span>
			</h5>
		</div>
	</div>
	<div class="card bg-light mt-3 container" id="applyHoldListTable" style="height:310px; overflow-x: scroll; overflow-y: scroll; display">
		<div class="card-header bg-light show-grid" style="padding:.75rem .10rem;">
			<table class="table table-bordered" style="font-size:8pt; margin:auto; table-layout:fixed;">
    			<thead>
      				<tr class="text-center text-truncate">
        				<th style="width:60px;">기준일</th>
        				<th style="width:60px;">반출기한</th>
        				<th style="width:80px;">컨테이너 번호</th>
        				<th style="width:100px;">B/L 번호</th>				
        				<th style="width:80px;">홀드명</th>
        				
        				<th style="width:50px;">모선코드</th>
        				<th style="width:50px;">타입</th>
        				<th style="width:50px;">COUNT</th>
        				<th style="width:50px;">총금액</th>				
        				<th style="width:50px;">공급가액</th>
        				<th style="width:50px;">부가세</th>
      				</tr>
    			</thead>
    		</table>
    		<table id="holdingListTable" class="table table-bordered table-condensed table-hover" style="font-size:8pt; margin:auto; table-layout:fixed;">
    			<tbody>
      				<c:forEach var="item" items="${vos}" varStatus="vs">
	      			<tr class="text-center" style="height:45px; padding-top: 0px; padding-bottom: 0px">
        				<td class="align-middle" style="font-size:9pt;width:60px;">${vos[vs.index].ship_basedate}</td>
        				<td class="align-middle" style="font-size:9pt;width:60px;">${vos[vs.index].ship_limitdate}</td>
        				<td class="align-middle" style="font-size:9pt;width:80px;">${vos[vs.index].ship_contno}</td>
        				<td class="align-middle" style="font-size:9pt;width:100px;">${vos[vs.index].ship_blno}</td>        					        					
        				<td class="align-middle" style="font-size:9pt;width:80px;">${vos[vs.index].ship_holddesc}</td>
	        			
        				<td class="align-middle" style="font-size:9pt;width:50px;">${vos[vs.index].ship_vessel}</td>
        				<td class="align-middle" style="font-size:9pt;width:50px;">${vos[vs.index].ship_type}</td>
        				<td class="align-middle" style="font-size:9pt;width:50px;">${vos[vs.index].ship_count}</td>
        				<td class="align-middle" style="font-size:9pt;width:50px;"><fmt:formatNumber value="${vos[vs.index].ship_total}" pattern="#,###" /></td>        					        					
        				<td class="align-middle" style="font-size:9pt;width:50px;"><fmt:formatNumber value="${vos[vs.index].ship_amount}" pattern="#,###" /></td>
        				<td class="align-middle" style="font-size:9pt;width:50px;"><fmt:formatNumber value="${vos[vs.index].ship_vat_amt}" pattern="#,###" /></td>
      				</tr>
      				</c:forEach>
      				
      				<%
      				for(int i=0; i<4; i++){
      				%>
      				<tr class="text-center" style="height:45px;">
        				<td class="align-middle" style="font-size:9pt;width:60px;"></td>
        				<td class="align-middle" style="font-size:9pt;width:60px;"></td>
        				<td class="align-middle" style="font-size:9pt;width:80px;"></td>
        				<td class="align-middle" style="font-size:9pt;width:100px;"></td>        					        					
        				<td class="align-middle" style="font-size:9pt;width:80px;"></td>
		        		
        				<td class="align-middle" style="font-size:9pt;width:50px;"></td>
        				<td class="align-middle" style="font-size:9pt;width:50px;"></td>
        				<td class="align-middle" style="font-size:9pt;width:50px;"></td>
        				<td class="align-middle" style="font-size:9pt;width:50px;"></td>        					        					
        				<td class="align-middle" style="font-size:9pt;width:50px;"></td>
        				<td class="align-middle" style="font-size:9pt;width:50px;"></td>
	      			</tr>
					<%
      				}
					%>
    			</tbody>
  			</table>
		</div>
	</div>
	<div class="card bg-light mt-3 container" id="virAcctListHead">
		<div class="card-header bg-light show-grid" style="padding:.75rem .10rem;">
			<h5 class="card-title">
				<span class='font-weight-bold'>입금내역</span>
			</h5>
		</div>
	</div>
	<div class="card bg-light mt-3 container" id="virAcctList" style="height:310px; overflow-x: scroll; overflow-y: scroll; display">
		<div class="card-header bg-light show-grid" style="padding:.75rem .10rem;">
			<table class="table table-bordered table-condensed" style="font-size:9pt; margin:auto; table-layout:fixed;">
    			<tbody>
      				<tr class="text-center">
        				<td class="align-middle" style="width:620px">입금일자</td>
        				<td class="text-center align-middle">
        					<input class="text-center" type="date" id="myDate" style="width:120px;" value="<%=eymd %>" disabled>
        				</td>
      				</tr>
    			</tbody>
  			</table>
			<table class="table table-bordered table-condensed table-hover" style="font-size:9pt; margin:auto; table-layout:fixed;">
    			<thead>
      				<tr class="text-center text-truncate">
        				<th style="width:30px;">No</th>
        				<th style="width:100px;">입금일자</th>
        				<th style="width:100px;">입금시간</th>
        				<th style="width:100px;">입금액</th>				
        				<th style="width:100px;">계좌번호</th>
        				<th style="width:100px;">모계좌</th>				
        				<th style="width:100px;">입금인성명</th>
      				</tr>
    			</thead>
    		</table>
    		<table class="table table-bordered table-condensed table-hover" style="font-size:9pt; margin:auto; table-layout:fixed;">
    			<tbody>
      			<c:forEach var="item" items="${listMain}" varStatus="vs">
	      			<tr class="text-center text-truncate">
        				<td style="width:30px;">${(vs.index)+1}</td>
        				<td style="width:100px;">${listMain[vs.index].tran_dd}</td>
        				<td style="width:100px;">${listMain[vs.index].tran_hh}</td>
        				<td style="width:100px;"><fmt:formatNumber value="${listMain[vs.index].incom_amount}" pattern="#,###" /></td>        					        					
        				<td style="width:100px;">${listMain[vs.index].vir_acctno}</td>        					
        				<td style="width:100px;"></td>
        				<td style="width:100px;">${listMain[vs.index].rndclrnm}</td>
      				</tr>
      			</c:forEach>
      			<%
      			for(int i=0; i<3; i++){
      			%>
      				<tr class="text-center text-truncate" style="height:45px;">
        				<td style="width:30px;"></td>
        				<td style="width:100px;"></td>
        				<td style="width:100px;"></td>
        				<td style="width:100px;"></td>        					        					
        				<td style="width:100px;"></td>        					
        				<td style="width:100px;"></td>
        				<td style="width:100px;"></td>
      				</tr>
				<%
      			}
				%>
    			</tbody>
  			</table>
		</div>
	</div>
	</form><footer class="bg-dark mt-4 p-4 text-center" style="color: #FFFFFF;">Copyright (c) 2020 HANJIN INCHEON CONTAINER TERMINAL CO., LTD. All rights reserved.</footer>
	<!-- Jquery, popper, bootstrap 자바스크립트 추가 -->
	<script src="resources/lib/js/jquery-3.4.1.min.js"></script>
	<script src="resources/lib/js/popper.js"></script>
	<script src="resources/lib/js/bootstrap.min.js"></script>
</body>
</html>
