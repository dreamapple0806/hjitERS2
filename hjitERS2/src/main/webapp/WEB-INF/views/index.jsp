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
	<script src="resources/lib/jsDelivr/sweetalert2.all.min.js"></script>
	<script src="resources/lib/jsDelivr/promise.min.js"></script>
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
@font-face{
	font-family: 'Noto_Sans_KR';
	src:url(resources/lib/fonts/Noto_Sans_KR/NotoSansKR-Regular.otf);
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
body { 
	font-family: 'Noto_Sans_KR', gothic; 
}
label { 
	font-family: 'Noto_Sans_KR', gothic; 
}

</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="./">
			<img alt="한진인천컨테이너터미널" src="http://www.hjit.co.kr/homepage/kor/_Img/Common/logo.png" />&nbsp;
			<font style="font-style: normal; font-weight: bold; vertical-align:middle;">정산서비스시스템</font>
		</a>
		<button class="navbar-toggler" type="button" data-toggler="collapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown" style="font-style: normal; font-weight: bold; "><font color="red">업무연락처 및 사용안내</font></a>
				<div class="dropdown-menu" aria-labelledby="dropdown" style="vertical-align:middle;">
					<a class="dropdown-item" href="http://www.hjit.co.kr" target="_blank"><img src="resources/image/home-2x.png">&nbsp;&nbsp;HJIT 홈페이지</a>
					<a class="dropdown-item" href="http://www.hjit.co.kr/homepage/kor/Popup/ers_help.html" rel="noopener noreferrer" target="_blank"><img src="resources/image/phone-2x.png">&nbsp;&nbsp;업무연락처 정보</a>
					<a class="dropdown-item" href="http://www.hjit.co.kr/admin/FileManager/download.do?qcode=Qk9BUkQsMzI2LFk="><img src="resources/image/file-2x.png">&nbsp;&nbsp;사용 메뉴얼</a>
					<a class="dropdown-item" id="helpExplorer"><img src="resources/image/browser-2x.png">&nbsp;&nbsp;익스플로러 설정 안내</a>
					<a class="dropdown-item" href="https://www.google.com/intl/ko/chrome/" rel="noopener noreferrer" target="_blank"><img src="resources/image/data-transfer-download-2x.png">&nbsp;&nbsp;크롬 다운로드</a>
				</div> 
			</li>
		</ul>
		<div class="collapse navbar-collapse "></div>
		<div id="navbar" class="float-right">
			<form class="form-inline my-2 my-lg-0 text-right" name="applyCheckForm" method="post">
				<strong>사업자번호 등록 확인&nbsp;&nbsp;</strong>
				<input class="form-control mr-sm-2" type="search" style="width:160px;" placeholder="숫자만 입력하세요." aria-label="search" type="text" id="cu_adcode" name="cu_adcode" value="" onkeypress="inNumber();">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit" onkeypress="inNumber();" onClick="applyCheck()">검색</button>
			</form>
		</div>
	</nav>
	<form name="loginForm" action="loginProcess.do" method="post">
		<div style="position: relative; width:100%; height:740px; background-repeat:no-repeat; background-position:center; background-image: URL(resources/image/login.jpg);">
			<div style="margin:0 auto; padding:370px 0px 0px 550px; height:730px; width:800px;">
			  	<div>
					<table style="width:230px;">
						<tr>
							<td colspan="2"><label style="font-style: normal; font-size:15px; font-weight:bolder; color:#0064CD; margin-bottom:3px;">아이디</label></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="userId" value="" class="form-control" style="width:100%; font-size:10px;" onkeypress="inNumber();" placeholder="ID : 계산서발행 사업자번호(공급받는자)"></td>
						</tr>
						<tr>
							<td colspan="2"><label style="font-style: normal; font-size:15px; font-weight:bolder; color:#0064CD; margin-bottom:3px;">비밀번호</label></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="userPassword" value="" class="form-control" style="width:100%; font-size:10px" onkeypress="inNumber();" placeholder="PW : 계산서발행 사업자번호(공급받는자)"></td>
						</tr>
						<tr>
							<td style="width:170px">
								<input type="checkbox" name="idsave" value="saveOk">
								<label style="font-style: normal; font-size:15px; font-weight:bolder; color:#0064CD; margin-bottom:3px;">아이디 저장</label>
							</td>
							<td>
								<button class="btn btn-sm btn-primary" type="button" style="margin-top:5px;" onClick="login();">로그인</button>
							</td>
						</tr>
					</table>	
				</div>
			</div>
		</div>
	</form>	
	
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
	<script>
		window.onload = function() {
			if (getCookie("id")) { 
            	document.loginForm.userId.value = getCookie("id"); 
            	document.loginForm.idsave.checked = true;
        	}
		}
		
		// Input 박스에 숫자만 입력 체크
		function inNumber(){
	        if(event.keyCode<48 || event.keyCode>57){
				event.returnValue=false;
				Swal.fire("숫자만 입력가능합니다.");
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
			
			if (document.loginForm.userId.value =="") {
		        alert("아이디를 입력하세요");
 				return false;
		    } 
			else if (document.loginForm.userPassword.value =="") {
		        alert("비밀번호를 입력하세요");
 				return false;				
		    } 
			else if (document.loginForm.userId.value =="" && document.loginForm.userPassword.value =="") {
		        alert("비밀번호를 입력하세요");
 				return false;				
		    } 
			else{
				document.loginForm.submit();	
			}
		}
	</script>
</body>
</html>