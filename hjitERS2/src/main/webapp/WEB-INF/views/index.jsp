<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<!-- head 태그에는 css 링크를 걸어준다. -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>HJIT 정산서비스 시스템</title>
	<!-- 부트스트랩, 커스텀 css 파일 링크 설정 -->
	<link rel="stylesheet" href="resources/lib/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/lib/css/custom.css">
	<link rel="shortcut icon" href="resources/image/favicon.ico" type="image/x-icon">
</head>
<!-- Jquery, popper, bootstrap 자바스크립트 추가 -->
<script src="resources/lib/js/jquery-3.4.1.min.js"></script>
<script src="resources/lib/js/popper.js"></script>
<script src="resources/lib/js/bootstrap.min.js"></script>
<script src="resources/lib/js/util.js"></script>
<style type="text/css">
@font-face{
	font-family: 'nexon2gothic';
	src:url(resources/lib/fonts/NEXON Lv2 Gothic.eot);
	src:url(resources/lib/fonts/NEXON Lv2 Gothic.woff);
}
.form-control::placeholder {
  color: red;
  font-weight: bold;
  opacity: 1; /* Firefox */
}

.form-control::-ms-input-placeholder { /* Internet Explorer 10-11 */
 color: red;
  font-weight: bold;
}

.form-control::-ms-input-placeholder { /* Microsoft Edge */
 color: red;
  font-weight: bold;
}
</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="./">
			<img alt="한진인천컨테이너터미널" src="http://www.hjit.co.kr/homepage/kor/_Img/Common/logo.png" />&nbsp;
			<font style="font-style: normal; font-weight: bold; vertical-align:middle;">정산서비스 시스템</font>
		</a>
		<button class="navbar-toggler" type="button" data-toggler="collapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown" style="font-style: normal; font-weight: bold; "><font color="red">사용안내</font></a>
				<div class="dropdown-menu" aria-labelledby="dropdown" style="vertical-align:middle;">
					<a class="dropdown-item" id="helpExplorer">Internet Explorer 설정 안내</a>
					<a class="dropdown-item" href="http://www.hjit.co.kr/admin/FileManager/download.do?qcode=Qk9BUkQsMzI2LFk=">ERS 사용메뉴얼 링크</a>
					<a class="dropdown-item" href="http://www.hjit.co.kr/homepage/kor/Popup/ers_help.html" rel="noopener noreferrer" target="_blank">정산업무관련 연락처 및 팩스 정보</a>
				</div> 
			</li>
		</ul>
		
		<div class="collapse navbar-collapse float-right"></div>
		<div id="navbar" class="float-right">
			<form class="form-inline my-2 my-lg-0 text-right" name="applyCheckForm" method="post">
				사업자번호 등록여부 확인&nbsp;&nbsp;
				<input class="form-control mr-sm-2" type="search" placeholder="숫자만 입력하세요." aria-label="search" type="text" id="cu_adcode" name="cu_adcode" value="" onkeypress="inNumber();">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit" onClick="applyCheck()">검색</button>
			</form>
		</div>
	</nav>
	<div style="position: relative; width:100%; height:740px; background-repeat:no-repeat; background-position:center; background-image: URL(resources/image/login.jpg);">
		<div style="position: absolute; top:51%; left:59.5%">
			<form name="loginForm" action="loginProcess.do" method="post" style="width:230px;height:150px">
				<label style="font-style: normal; font-size:15px; font-weight:bolder; color:#0064CD; margin-bottom:3px;">아이디</label>
				<input type="text" name="userId" value="" class="form-control" style="width:230px; font-size:10px; " placeholder="ID : 계산서발행 사업자번호(공급받는자)">
				<label style="font-style: normal; font-size:15px; font-weight:bolder; color:#0064CD; margin-bottom:3px;">비밀번호</label>
				<input type="text" name="userPassword" value="" class="form-control" style="width:230px; font-size:10px" placeholder="PW : 계산서발행 사업자번호(공급받는자)">
				<input type="checkbox" name="idsave" value="saveOk">
				<label style="font-style: normal; font-size:15px; font-weight:bolder; color:#0064CD; margin-bottom:3px;">아이디 저장</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-sm btn-primary" type="submit" style="margin-top:5px;" onClick="login();">로그인</button>				
			</form>			
		</div>
	</div>
	
	<!-- 모달 영역 -->
	<div id="helpExplorerDetail" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="helpExplorerDetail">
		<div class="modal-dialog modal-lg" style="max-width: 100%; width: auto; display: table;" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Internet Explorer 접속시 설정 안내</h4>
				</div>
				<div class="modal-body">
				<h3>1. 도구 메뉴에서 호환성 보기 선택</h3><br>
				<img src="http://www.hjit.co.kr/admin/FileManager/download.do?qcode=Qk9BUkQsMzMyLFk=" alt="My Image">
				<br><br>
				<h3>2. 호환성 보기 목록에서 [hjit.co.kr] 제거</h3><br>
				<img src="http://www.hjit.co.kr/admin/FileManager/download.do?qcode=Qk9BUkQsMzM2LFk=" alt="My Image">
				<br><br>
				<h3>3. 페이지 정상표시 확인</h3><br>
				<img src="http://www.hjit.co.kr/admin/FileManager/download.do?qcode=Qk9BUkQsMzM0LFk=" alt="My Image">
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-primary">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- <footer class="bg-dark mt-4 p-4 text-center" style="color: #FFFFFF;">Copyright 2020 Hanjin Incheon Container Terminal All Rights Reserved.</footer> -->
	<script>
		window.onload = function() {
			if (getCookie("id")) { 
            	document.loginForm.userId.value = getCookie("id"); 
            	document.loginForm.idsave.checked = true;
        	}
		}
		
		// 모달 버튼에 이벤트를 건다.
		$('#helpExplorer').on('click', function(){
			$('#helpExplorerDetail').modal('show');
		});
		
		// 모달 안의 취소 버튼에 이벤트를 건다.
		$('#helpExplorer').on('click', function(){
			$('#helpExplorerDetail').modal('hide');
		});
    	
		function setCookie(name, value, expiredays)
    	{
	        var todayDate = new Date();
        	todayDate.setDate(todayDate.getDate() + expiredays);
        	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    	}
	 
	    function getCookie(Name) {
        	var search = Name + "=";
        	if (document.cookie.length > 0) { 
	            offset = document.cookie.indexOf(search);
    
        		if (offset != -1) {
	                offset += search.length;
	                end = document.cookie.indexOf(";", offset);
                	if (end == -1) {
                        end = document.cookie.length;
                	}
                
	            	return unescape(document.cookie.substring(offset, end));
            	}
        	}
    	}
	
		function applyCheck() {
		    if (document.applyCheckForm.cu_adcode.value =="") {
	        	alert("사업자 번호를 입력하세요");
	    	} 
		    else {
		        document.applyCheckForm.action="userRegisterAction.do";
	        	document.applyCheckForm.submit();
	    	}
		}
		
		function login() {
			// 아이디 기억하기 체크박스 관련
	        if (document.loginForm.idsave.checked == true) { 
	            setCookie("id", document.loginForm.userId.value, 7);
	        } 
	        else { 
	            setCookie("id", document.loginForm.userId.value, 0); 
	        }
			
			// 아이디 / 비밀번호 입력여부 체크
			if (document.loginForm.userId.value =="") {
		        alert("아이디를 입력하세요");
 				return false;
				
		    } 
			if (document.loginForm.userPassword.value =="") {
		        alert("비밀번호를 입력하세요");
 				return false;				
		    } 
			if (document.loginForm.userId.value =="" && document.loginForm.userPassword.value =="") {
		        alert("비밀번호를 입력하세요");
 				return false;				
		    } 
			document.loginForm.submit();
		}
	</script>
</body>
</html>