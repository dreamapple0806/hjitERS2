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

<style>
	@font-face{
		font-family: 'Noto_Sans_KR';
	src:url(resources/lib/fonts/Noto_Sans_KR/NotoSansKR-Regular.otf);
	}
	
	body { 
		font-family: 'Noto_Sans_KR', gothic; 
	}
	label { 
		font-family: 'Noto_Sans_KR', gothic; 
	}	
</style>

</head>
<body>
	<%
		Date d = new Date();
	       
        String s = d.toString();
        System.out.println("현재날짜 : "+ s);
       
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-01");
        SimpleDateFormat edf = new SimpleDateFormat("yyyy-MM-dd");
        
        String symd = sdf.format(d);
        String eymd = edf.format(d);
        		
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="./taxProcess.do">
			<img alt="한진인천컨테이너터미널" src="http://www.hjit.co.kr/homepage/kor/_Img/Common/logo.png" />&nbsp;
			<font style="font-style: normal; font-weight: bold; vertical-align:middle;">정산서비스시스템</font>
		</a>
		<button class="navbar-toggler" type="button" data-toggler="collapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse float-right">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="./taxProcess.do">컨테이너 비용처리</a></li>
				<li class="nav-item active"><a class="nav-link" href="./taxProcessList.do">세금계산서 발급내역 조회</a></li>
			</ul>
		</div>
		<form method="post" name="logoutForm" method="post">
			<div class="float-right" style="padding-right:5px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn btn-danger" onclick="logout()">로그아웃</button>
			</div>
		</form>
	</nav>
	<div class="card bg-light mt-4">
		<div class="card-header bg-light show-grid ">
			<h5 class="card-title">
				<strong>세금계산서 요청 및 현황</strong>
			</h5>	
			<div class="row">
				<form class="form-inline" action="./taxSearchProccess.do" method="post" style="width:100%;">
		     		<table class="table table-bordered table-condensed" style="font-size:9pt; ">
		    			<thead>
      						<tr class="text-center" style="height:35px;">
			       				<th style="width:432px;">발행일자</th>
        						<th style="width:400px;">고객코드</th>
        						<th style="width:370px;">고객명</th>
        						<th style="width:100px;">조회</th>
      						</tr>
    					</thead>
    					<tbody>
							<tr class="text-center" style="height:35px;">
	    	    				<td class="align-middle">
    	    						<input class="text-center" type="date" name="symd" style="width:150px" value="<%=symd %>">
    	    				 		~ <input class="text-center" type="date" name="eymd" style="width:150px" value="<%=eymd %>">
    	    					</td>
        						<td class="align-middle">
	        						<input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px" type="text" name="cu_code_shr" value="${userInfo.cu_code}" placeholder="고객코드" aria-label="cu_code_shr" readonly>
        						</td>
        						<td class="align-middle">
	        						<input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px" type="text" name="cu_sangho" value="${userInfo.cu_sangho}" placeholder="고객명" aria-label="cu_sangho" readonly>
        						</td>
        						<td class="align-middle">
	        						<button class="btn btn-sm btn-primary my-2 my-sm-0" name="taxSearchBtn" type="submit">조회</button>
        						</td>
      						</tr>
    					</tbody>
  					</table>
      			</form>
			</div>	
		</div>
		<div class="card-header bg-light show-grid ">
			<div class="row" style="height:100%; overflow-y: auto">
				<form  id="Form" name="Form" class="form-inline" id="taxPrintProccess" method="get" style="width:100%;">
					<input type="hidden" id="serial" name="serial" value="">
					<input type="hidden" id="opt" name="opt"  value="" >
					<input type="hidden" id="cu_adcode" name="cu_adcode"  value="${userInfo.cu_adcode}" >
					<input type="hidden" id="cu_code" name="cu_code"  value="${userInfo.cu_code}" >
  				</form>
		     	<table class="table table-bordered table-condensed" style="margin:auto;table-layout:fixed;">
    				<thead>
	      				<tr class="text-center" style="height:35px;">
        					<th class="align-middle" style="font-size:9pt; width:50px">No</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">계산서번호</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">발행일자</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">담당자</th>
        					<th class="align-middle" style="font-size:9pt; width:80px">거래처코드</th>
        					
        					<th class="align-middle" style="font-size:9pt; width:100px">거래처명</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">사업자번호</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">공급가액</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">부가세</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">합계금액</th>
        					
        					<th class="align-middle" style="font-size:9pt; width:100px">전표번호</th>
        					<th class="align-middle" style="font-size:9pt; width:70px">처리구분</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">명세서</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">계산서</th>
      					</tr>
    				</thead>
    				<tbody>
    				<c:if test="${not empty list}">
      					<c:set var="totalAmt" value="0" />
      					<c:set var="totalTot" value="0" />
      					<c:set var="totalVat" value="0" />      						
      					
      					<c:forEach var="item" items="${list}" varStatus="vs">
      					
      						<c:set var="tempAmt" value="${list[vs.index].ship_tot}" />
      						<c:set var="tempTot" value="${list[vs.index].ship_amt}" />
      						<c:set var="tempVat" value="${list[vs.index].ship_vat}" />
      						
      						<c:set var="totalAmt" value="${totalAmt +  list[vs.index].ship_tot}" />
      						<c:set var="totalTot" value="${totalTot +  list[vs.index].ship_amt}" />
      						<c:set var="totalVat" value="${totalVat +  list[vs.index].ship_vat}" />
      						
      					
	      				<tr class="text-center" style="height:40px; padding-top: 0px; padding-bottom: 0px">
	      					<td class="align-middle" style="font-size:9pt; width:50px;">${(vs.index)+1}</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;">
        						<a href="#" onclick="serialSearch('${list[vs.index].serial}', '${list[vs.index].proc_type}');"><font color="red"><strong>${list[vs.index].serial}</strong></font></a>
        					</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;" nowrap>${list[vs.index].issue_date}</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;">${list[vs.index].take_user}</td>
        					<td class="align-middle" style="font-size:9pt; width:80px;" nowrap>${list[vs.index].cu_code}</td>
        					
        					<td class="align-middle" style="font-size:9pt; width:100px;">${list[vs.index].cu_sangho}</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;">${list[vs.index].cu_adcode}</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;"><fmt:formatNumber value="${list[vs.index].ship_amt}" pattern="#,###" /></td>
    	    				<td class="align-middle" style="font-size:9pt; width:100px;"><fmt:formatNumber value="${list[vs.index].ship_vat}" pattern="#,###" /></td>
	        				<td class="align-middle" style="font-size:9pt; width:100px;"><fmt:formatNumber value="${list[vs.index].ship_tot}" pattern="#,###" /></td>
        					
        					<td class="align-middle" style="font-size:9pt; width:100px;">${list[vs.index].jun_no}</td>
        					<td class="align-middle" style="font-size:9pt; width:70px;">${list[vs.index].report_stat}</td>  
        					<td class="align-middle" style="font-size:9pt; width:100px;">
	        					<button class="btn btn-sm btn-danger my-2 my-sm-0" name="taxShipperListBtn" onClick="taxPrintProccess(${list[vs.index].serial}, 'taxShipper');">조회</button>
        					</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;">
	        					<button class="btn btn-sm btn-primary my-2 my-sm-0" name="TaxBill_PrintBtn" onClick="taxPrintProccess(${list[vs.index].serial}, 'taxBill');">조회</button>
							</td>	
      					</tr>
      					</c:forEach>
      					<tr class="text-center" style="height:40px; padding-top: 0px; padding-bottom: 0px">
      						<td class="align-middle" style="font-size:9pt;" colspan="7"><strong>합&nbsp;&nbsp;&nbsp;&nbsp;계</strong></td>
        					<td class="align-middle" style="font-size:9pt; width:100px;"><fmt:formatNumber value="${totalTot}" pattern="#,###" /></td>
    	    				<td class="align-middle" style="font-size:9pt; width:100px;"><fmt:formatNumber value="${totalVat}" pattern="#,###" /></td>
	        				<td class="align-middle" style="font-size:9pt; width:100px;"><fmt:formatNumber value="${totalAmt}" pattern="#,###" /></td>
        					<td class="align-middle" style="font-size:9pt; width:100px;"></td>
        					<td class="align-middle" style="font-size:9pt; width:70px;"></td>  
        					<td class="align-middle" style="font-size:9pt; width:100px;"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px;"></td>
      					</tr>
      				</c:if>
      				
      				<%
      				for(int i=0; i<12; i++){
      				%>
      					<tr class="text-center" style="height:40px;">
		        			<td class="align-middle" style="font-size:9pt; width:50px;"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:80px"></td>
        					
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:70px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
	      				</tr>
					<%
      				}
					%>
    				</tbody>
  				</table>
			</div>	
		</div>
	</div>
	<footer class="mt-3 p-3 text-center font-weight-normal" style="background-color: #f8f9fa">
		Copyright 2020 Hanjin Incheon Container Terminal All Rights Reserved.
		<address>인천광역시 연수구 인천신항대로 777 한진인천컨테이너터미널&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		사업자번호 : 131-86-66125 TEL : 032) 202 - 4900 FAX : 032) 821 - 9072</address>
	</footer>
	<!-- Jquery, popper, bootstrap 자바스크립트 추가 -->
	<script src="resources/lib/js/jquery-3.4.1.min.js"></script>
	<script src="resources/lib/js/popper.js"></script>
	<script src="resources/lib/js/bootstrap.min.js"></script>
	<script src="resources/lib/js/util.js"></script>
	
	<script>
	function logout() {
		document.logoutForm.action="logoutProcess.do";
		document.logoutForm.submit();
	}
	
	function serialSearch(serial, type) {
		var cu_adcode = document.getElementById("cu_adcode").value;
		var url = "serialSearchProccess.do?link=serialSearchPopup&serial=" + serial + "&type="+ type + "&cu_adcode=" + cu_adcode;
		var PrintWindow = window.open(url, "serialSearchPopup", "location=no,status=no,toolbar=no,menubar=yes,scrollbars=yes,width=1080,height=820,left=300,top=100");
		
		PrintWindow.focus();
	}

	function taxPrintProccess(param1, param2) {
		var serial = document.getElementById("serial");
		var opt = document.getElementById("opt");
		
		document.getElementById("serial").value = param1;
		document.getElementById("opt").value = param2;
		
		if(document.getElementById("opt").value == 'taxShipper'){
			var url = "taxPrintProccess.do";
			window.open("", "taxPrintPopup", "location=no,status=no,toolbar=no,menubar=yes,scrollbars=yes,width=750,height=820,left=10,top=100");
			document.Form.action = url;
			document.Form.method = "post";
			document.Form.target = "taxPrintPopup";
			document.Form.submit();
		}
		if(document.getElementById("opt").value == 'taxBill'){
			var url = "taxBillPrintProccess.do";
			window.open("", "taxBillPrintPopup", "location=no,status=no,toolbar=no,menubar=yes,scrollbars=yes,width=750,height=820,left=10,top=100");
			document.Form.action = url;
			document.Form.method = "post";
			document.Form.target = "taxBillPrintPopup";
			document.Form.submit();
		}
        
        return false;
		
	}
	</script>
</body>
</html>
