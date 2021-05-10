// 사용안내 동의
	function onAgreement(){
		var ck = document.getElementById("agreeChk");
		
		var tableObject1 = document.getElementById("searchTable");
		var tableObject2 = document.getElementById("searchHoldList");
		var tableObject3 = document.getElementById("applyHoldList");
		var tableObject4 = document.getElementById("virAcctList");
		var tableObject5 = document.getElementById("applyHoldListTable");
		var tableObject6 = document.getElementById("virAcctTable");
		var tableObject7 = document.getElementById("amountTable");
		 			
		if(tableObject1.style.display == 'none' && tableObject2.style.display == 'none' 
				&& tableObject3.style.display == 'none' && tableObject4.style.display == 'none'
				&& tableObject5.style.display == 'none' && tableObject6.style.display == 'none' && tableObject7.style.display == 'none'){
			tableObject1.style.display = "";
			tableObject2.style.display = "";
			tableObject3.style.display = "";
			tableObject4.style.display = "";
			tableObject5.style.display = "";
			tableObject6.style.display = "";
			tableObject7.style.display = "";
			ck.value = 1;
		}
		else{
			tableObject1.style.display = "none";
			tableObject2.style.display = "none";
			tableObject3.style.display = "none";
			tableObject4.style.display = "none";
			tableObject5.style.display = "none";
			tableObject6.style.display = "none";
			tableObject7.style.display = "none";
			ck.value = 0;
		}
		
		if(ck.value == 1){
			Swal.fire({ 
			title: '환불 및 주의사항에 동의 하셨습니다' // Alert 제목                         
	        }).then(function(){
			$("#agreeChk").text('취소');
			var offset = $("#space").offset();            
	            $('html, body').animate({scrollTop : offset.top}, 400);
		});
		}
		else{
		Swal.fire('환불 및 주의사항 동의에 취소하셨습니다.');
		$("#agreeChk").text('동의');
		}
	}
	
	$().ready(function () { 
		Swal.fire({ 
			icon: 'success', // Alert 타입 
			title: '익스플로러에서는 호환성 보기 메뉴에서\n[hjit.co.kr] 항목을 제거하세요.', // Alert 제목 
			text: '사이트의 모든 기능은 크롬 브라우저를 권장합니다.'
			// text: '사용 문의 : 032 - 202 - 4922' // Alert 내용 
		}); 
	});
	
	// 모달 버튼에 이벤트를 건다.
	$('#helpExplorer').on('click', function(){
		$('#helpExplorerDetail').modal('show');
	});
	
	// 모달 안의 취소 버튼에 이벤트를 건다.
	$('#helpExplorer').on('click', function(){
		$('#helpExplorerDetail').modal('hide');
	});		
	
	function betaAlert(){
		alert("해당 사이트는 크롬 브라우저를 위한 테스트 사이트 입니다. \n정산처리 후, 오류발생시 연락바랍니다. (TEL. 032-202-4922)");
	}


	// 홀드해제 컨테이너 조회 1
	function SearchContActionJson(){
		var today = getTodate();
    	var afterTen = getAfterDay();
		var selectedDate = document.getElementById("bie_ship_symd_shr").value.replace(/-/gi, '');
		var bie_ship_contno_shr = document.getElementById("bie_ship_contno_shr").value;
		var bie_ship_blno_shr = document.getElementById("bie_ship_blno_shr").value;	
		var f = document.forms[0];
		
		if($("input:radio[name=prePaidY]:checked").val() == "Y"){
			if(today > selectedDate){
        		Swal.fire('반출일자가 현재일자보다 오래되었습니다. 반출일자를 확인해주세요.');
        		return false;
        	}
			
			if(today == selectedDate){
        		Swal.fire('반출일자와 현재일자가 동일합니다. 반출일자를 확인해주세요.');
        		return false;
        	}
			
			if(afterTen < selectedDate){
        		Swal.fire('사전납부 반출일자는 최대 10일 입니다.\n10일 이내로 선택해주세요');
        		return false;
        	}
			
        	if(bie_ship_contno_shr == "" && bie_ship_blno_shr == "") {
				Swal.fire('컨테이너 번호 또는 BL 번호를 입력하세요.');
				return false;
			}
        	
    		ReleaseContProcess("SearchPreContActionJson.do");	
            return false;	
		}
		else{
        	if(bie_ship_contno_shr == "" && bie_ship_blno_shr == "") {
				Swal.fire('[컨테이너 번호] 또는 [BL 번호]를 입력하세요.');
				f.bie_ship_contno_shr.focus();
				return false;
			}
        	else{
        		ReleaseContProcess("SearchContActionJson.do");	
	            return false;	    			
        	}
		}
	}

	// 홀드해제 컨테이너 조회 2
	function ReleaseContProcess(opt){
		$.ajax({
	        type:'POST',
	        url : opt,
	        data:$("#Form").serialize(),
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        success : function(data){
	        	var html = "";
	        	
	            if(data.length > 0)
	            {
	            	for(i=0; i<data.length; i++){
	            		html += "<tr class='text-center text-truncate'";
						html += "	chk = '0'";
						html += "	bie_ship_contno = '" + data[i].bie_ship_contno + "'";
	            		html += "	bie_ship_point = '" + data[i].bie_ship_point + "'";     
	            		html += "	bie_ship_hold = '" + data[i].bie_ship_hold + "'";            			
	            		html += "	bie_ship_seq = '" + data[i].bie_ship_seq + "'";
	            		html += "	bie_ship_blno = '" + data[i].bie_ship_blno + "'";
	            		html += "	bie_ship_refno = '" + data[i].bie_ship_refno + "'";
	            		html += "	bie_ship_refno2 = '" + data[i].bie_ship_refno2 + "'";
	            		html += "	bie_ship_personal = '" + data[i].bie_ship_personal + "'";
	            		html += "	bie_ship_holddesc = '" + data[i].bie_ship_holddesc + "'";
	            		html += "	bie_ship_vessel = '" + data[i].bie_ship_vessel + "'";
	            		html += "	bie_ship_voyage = '" + data[i].bie_ship_voyage + "'";
	            		html += "	bie_ship_operator = '" + data[i].bie_ship_operator + "'";
	            		html += "	bie_ship_type = '" + data[i].bie_ship_type + "'";
	            		html += "	bie_ship_count = '" + data[i].bie_ship_count + "'";
	            		html += "	bie_ship_unit = '" + data[i].bie_ship_unit + "'";
	            		html += "	bie_ship_qty = '" + data[i].bie_ship_qty + "'";
	            		html += "	bie_ship_rate = '" + data[i].bie_ship_rate + "'";
	            		html += "	bie_ship_total = '" + data[i].bie_ship_total + "'";
	            		html += "	bie_ship_amount = '" + data[i].bie_ship_amount + "'";
	            		html += "	bie_ship_vat = '" + data[i].bie_ship_vat + "'";
	            		html += "	bie_ship_payment = '" + data[i].bie_ship_payment + "'";
	            		html += "	bie_ship_driver_name = '" + data[i].bie_ship_driver_name + "'";
	            		html += "	bie_ship_driver_hp = '" + data[i].bie_ship_driver_hp + "'";
	            		html += "	bie_ship_truckno = '" + data[i].bie_ship_truckno + "'";
	            		html += "	bie_ship_basedate = '" + data[i].bie_ship_basedate + "'";
	            		html += "	bie_ship_limitdate = '" + data[i].bie_ship_limitdate + "'";
	            		html += "	bie_ship_tran_date = '" + data[i].bie_ship_tran_date + "'";
	            		html += "	bie_ship_tran_time = '" + data[i].bie_ship_tran_time + "'";
	            		html += "	bie_ship_user = '" + data[i].bie_ship_user + "'";
	            		html += "	bie_ship_erpconfirm = '" + data[i].bie_ship_erpconfirm + "'";
	            		html += "	bie_ship_taxdate = '" + data[i].bie_ship_taxdate + "'";
	            		html += "	bie_ship_mrn = '" + data[i].bie_ship_mrn + "'";
	            		html += "	bie_ship_invoiceno = '" + data[i].bie_ship_invoiceno + "'";
	            		html += "	bie_ship_vesselname = '" + data[i].bie_ship_vesselname + "'";
	            		html += "	bie_ship_arrive = '" + data[i].bie_ship_arrive + "'";
	            		html += "	bie_ship_remark = '" + data[i].bie_ship_remark + "'";
	            		html += "	bie_ship_flag = '" + data[i].bie_ship_flag + "'";
	            		html += "	bie_ship_countdate = '" + data[i].bie_ship_countdate + "'";
	            		html += "	bie_ship_oldamount = '" + data[i].bie_ship_oldamount + "'";
	            		html += "	bie_ship_order = '" + data[i].bie_ship_order + "'>";
	            		
	            		html += "	<td style='width:45px; height:35px;'>" + (i+1) + "</td>";
	            		html += "	<td style='width:45px; height:35px;'><input type='checkbox' id='chk' name='chk' value='' /></td>";
	            		html += "	<td style='width:95px; height:35px;'>" + data[i].bie_ship_contno + "</td>";
	            		html += "	<td style='width:115px; height:35px;'>" + data[i].bie_ship_blno + "</td>";
	            		html += "	<td style='width:75px; height:35px;'>" + data[i].bie_ship_hold + "</td>";
	            		
	            		html += "	<td style='width:95px; height:35px;'>" + data[i].bie_ship_holddesc + "</td>";
	            		html += "	<td style='width:65px; height:35px;'>" + numberFormat(data[i].bie_ship_total) + "</td>";
	            		html += "	<td style='width:75px; height:35px;'>" + numberFormat(data[i].bie_ship_amount) + "</td>";
	            		html += "	<td style='width:65px; height:35px;'>" + numberFormat(data[i].bie_ship_vat) + "</td>";
	            		html += "	<td style='width:55px; height:35px;'>" + data[i].bie_ship_seq + " </td>";
	            		
	            		html += "	<td style='width:135px; height:35px;'>" + data[i].bie_ship_invoiceno + " </td>";
	            		html += "	<td style='width:65px; height:35px;'>" + data[i].bie_ship_vessel + " </td>";
	            		html += "	<td style='width:75px; height:35px;'>" + data[i].bie_ship_voyage + " </td>";
	            		html += "	<td style='width:75px; height:35px;'>" + data[i].bie_ship_operator + " </td>";
	            		html += "</tr>";
	            		
	                }
					
	            	for(i=0; i<8; i++){
	            		html += "<tr class='text-center text-truncate'>";
	            		html += "<td style='width:45px; height:35px;'></td>";
	            		html += "<td style='width:45px; height:35px;'></td>";
	            		html += "<td style='width:95px; height:35px;'></td>";
	            		html += "<td style='width:115px; height:35px;'></td>";
	            		html += "<td style='width:75px; height:35px;'></td>";
	            		
	            		html += "<td style='width:95px; height:35px;'></td>";
	            		html += "<td style='width:65px; height:35px;'></td>";
	            		html += "<td style='width:75px; height:35px;'></td>";
	            		html += "<td style='width:65px; height:35px;'></td>";
	            		html += "<td style='width:55px; height:35px;'></td>";
	            		
	            		html += "<td style='width:135px; height:35px;'></td>";
	            		html += "<td style='width:65px; height:35px;'></td>";
	            		html += "<td style='width:75px; height:35px;'></td>";
	            		html += "<td style='width:75px; height:35px;'></td>";
	            		html += "</tr>";
	                }

	            	$("#unProcHoldingListTable > tbody").html(html);
	            	
	            }
	            else{
		        	Swal.fire('조회 결과가 없습니다.');
	            }
	        },error:function(request,status,error){
	        	Swal.fire(
	        			  '로그인 세션이 끊어졌습니다.',
	        			  '다시 로그인 해주세요.',
	        			  'question'
	        	);
				location.href='logoutProcess.do';
	        }
	    });
	}
	
		//사전납부 YN 변경시 미처리홀딩리스트 테이블 초기화
    function onprePaymentYN(useCk){				
		if(useCk < 1){
			document.getElementById('bie_ship_symd_shr').disabled=false;            		
			resetTable();
		} else if(useCk > 1){
			document.getElementById('bie_ship_symd_shr').disabled=true;          		
			resetTable();
		} 
    }

	function getAfterDay(){
		var date = new Date();
		date.setDate(date.getDate()+10);
	    var year = date.getFullYear();
	    var month = date.getMonth()+1;
	    var day = date.getDate();
	    if(month < 10){
	        month = "0"+month;
	    }
	    if(day < 10){
	        day = "0"+day;
	    }
	 
	    var today = year+""+month+""+day;
	    
	    return today;
	}
		
  	//적용버튼 선택시 선택된 미처리홀딩리스트를 홀딩리스트 테이블에 복사
    function onApply(){	
  		var count = 0;
  		var totalAmt = Number($('#ship_amt').val().replace(/,/gi,''));
  		var totalVat = Number($('#ship_vat').val().replace(/,/gi,''));
  		var total = Number($('#ship_tot').val().replace(/,/gi,''));
    	var afterTen = getAfterDay();
  		
		for (var i = 1; i < $('#unProcHoldingListTable tbody tr').length; i++) {
			var unProcContno = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_contno');
			var unProcPoint = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_point');
		    var unProcHold = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_hold');
		    var unProcSeq = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_seq');
		    var unProcLimit = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_limitdate');
			
		    // table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면
			var chk = $('#unProcHoldingListTable tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
			var sel = $('#unProcHoldingListTable tr').eq(i).attr('chk');
			
			if (chk == true && sel == 0) {

			    var equalChk = procHoldingListChk(unProcContno, unProcPoint, unProcHold, unProcSeq, unProcLimit);
			    
			    if(equalChk == false){
			    	break;
			    }
			    
			    if(unProcLimit.replace(/-/gi, '') >= afterTen){
			    	Swal.fire("최대 사전납부 기한은 10일 입니다. \n10일 이내로 선택해주세요.");
			    	break;
			    }
			    
				count += 1;
				// 그 i 번째 input text의 값을 가져온다.		
				var ship_basedate = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_basedate');
				var ship_limitdate = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_limitdate');
				var ship_contno = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_contno');
				var ship_blno = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_blno');
				var ship_holddesc = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_holddesc');
				
				var ship_vessel = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_vessel');
				var ship_type = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_type');
				var ship_count = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_count');
				var ship_total = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_total');
				var ship_amount = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_amount');
				
				var ship_vat = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_vat');
				var ship_point = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_point');
				var ship_hold = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_hold');
				var ship_seq = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_seq');
				var ship_qty = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_qty');
				var ship_rate = $('#unProcHoldingListTable tr').eq(i).attr('bie_ship_rate');
				
				totalAmt += Number($('#unProcHoldingListTable tr').eq(i).attr('bie_ship_amount'));
				totalVat += Number($('#unProcHoldingListTable tr').eq(i).attr('bie_ship_vat'));
				total += Number($('#unProcHoldingListTable tr').eq(i).attr('bie_ship_total'));
				
				$('#holdingListTable > tbody:first').prepend('<tr class="text-center text-truncate" style="height:25px;"'
						+ 'bie_ship_basedate="'+ isEmpty(ship_basedate) +'" bie_ship_limitdate="' + isEmpty(ship_limitdate)
						+ '" bie_ship_contno="'+ isEmpty(ship_contno) +'" bie_ship_blno="' + isEmpty(ship_blno)
						+ '" bie_ship_holddesc="'+ isEmpty(ship_holddesc) +'" bie_ship_vessel="' + isEmpty(ship_vessel)
						+ '" bie_ship_type="'+ isEmpty(ship_type) +'" bie_ship_count="' + isEmpty(ship_count)
						+ '" bie_ship_total="'+ isEmpty(ship_total) +'" bie_ship_amount="' + isEmpty(ship_amount)
						+ '" bie_ship_point="'+ isEmpty(ship_point) +'" bie_ship_hold="' + isEmpty(ship_hold)
						+ '" bie_ship_seq="'+ isEmpty(ship_seq) + '" bie_ship_vat="'+ isEmpty(ship_vat) 
						+ '" bie_ship_qty="'+ isEmpty(ship_qty) +'" bie_ship_rate="' + isEmpty(ship_rate) +'" prePayment="' + $("input:radio[name=prePaidY]:checked").val()
						+ '">'
						+ '<td style="width:30px; height:35px;"><input type="checkbox" id="SavedChk" name="SavedChk""  /></td>'
						+ '<td style="width:60px; height:35px;">' + ship_basedate + '</td>'
					 	+ '<td style="width:60px; height:35px;">' + ship_limitdate + '</td>'
					 	+ '<td style="width:80px; height:35px;">' + ship_contno + '</td>'
					 	+ '<td style="width:100px; height:35px;">' + ship_blno + '</td>'
					 	+ '<td style="width:80px; height:35px;">' + ship_holddesc + '</td>'
						 
					 	+ '<td style="width:50px; height:35px;">' + ship_vessel + '</td>'							 	        				
					 	+ '<td style="width:50px; height:35px;">' + ship_type + '</td>'
					 	+ '<td style="width:50px; height:35px;">' + ship_count + '</td>'
					 	+ '<td style="width:50px; height:35px;">' + numberFormat(ship_total) + '</td>'
					 	+ '<td style="width:50px; height:35px;">' + numberFormat(ship_amount) + '</td>'      					        					
					 	+ '<td style="width:50px; height:35px;">' + numberFormat(ship_vat) + '</td>'
					 	+ '</tr>'
				);
				
				$('#ship_amt').val(numberFormat(totalAmt)); 
				$('#ship_vat').val(numberFormat(totalVat));
				$('#ship_tot').val(numberFormat(total));
	      		
				$('#unProcHoldingListTable tr').eq(i).children().find('input[type="checkbox"]').attr( 'disabled', true );
				$('#unProcHoldingListTable tr').eq(i).attr('chk', '1');
			}
		}
		Swal.fire(count + "개의 컨테이너를 적용하였습니다.");
    }

  	//전체선택 체크박스 클릭		
  	function SavedChk(){
  		alert($("#SavedChk").is(":checked"));
  	}
  	
  	function procHoldingListChk(unProcContno, unProcPoint, unProcHold, unProcSeq, unProcLimit){

  		for (var j = 1; j <= $('#holdingListTable tbody tr').length; j++) {
			var procContno = $('#holdingListTable tr').eq(j).attr('bie_ship_contno');
			var procPoint = $('#holdingListTable tr').eq(j).attr('bie_ship_point');
	    	var procHold = $('#holdingListTable tr').eq(j).attr('bie_ship_hold');
	    	var procSeq = $('#holdingListTable tr').eq(j).attr('bie_ship_seq');
	    	var procLimit = $('#holdingListTable tr').eq(j).attr('bie_ship_limitdate');
	    	
			if(
				(unProcContno == procContno)
				&& (unProcPoint == procPoint)
				&& (unProcHold == procHold) 
				&& (unProcSeq == procSeq) 
				&& (unProcLimit == procLimit)
			){				
				Swal.fire('[' + unProcContno + '] ' + j + '번째 라인에 이미 적용된 컨테이너 입니다.');
				return false;
			}
		}
		
  	}
  	
  	
  	//전체선택 체크박스 클릭
    $(function(){  
    	$("#allCheck").click(function(){ 
    		//만약 전체 선택 체크박스가 체크된상태일경우 
    		if($("#allCheck").prop("checked")) { 
    			//해당화면에 전체 checkbox들을 체크해준다 
    			$("#unProcHoldingListTable input[type=checkbox]").prop("checked",true);
    		} 
    		else { 
    			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
    			$("#unProcHoldingListTable input[type=checkbox]").prop("checked",false);
    			/* $("#unProcHoldingListTable input[type=checkbox]").prop("disabled",false); */
    		} 
    	})
    });
  	
    $(function(){  
    	$("#allCheck2").click(function(){ 
    		//만약 전체 선택 체크박스가 체크된상태일경우 
    		if($("#allCheck2").prop("checked")) { 
    			//해당화면에 전체 checkbox들을 체크해준다 
    			$("#holdingListTable input[type=checkbox]").prop("checked",true);
    			// 전체선택 체크박스가 해제된 경우 
    		} 
    		else { 
    			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
    			$("#holdingListTable input[type=checkbox]").prop("checked",false);
    		} 
    	})
    });
            
  	//Holding List 테이블 삭제 버튼 누르면 체크되어있는 행 삭제
    $(function(){  
    	$("#holdingListDelete").click(function(){
    		var ckCnt = 0;
    		var amt = 0;
			var vat = 0;
			var tot = 0;
			
    		for(var i=$('#holdingListTable tbody tr').length; i>=0; i--){
				if($('#holdingListTable tbody tr').eq(i).children().find('input[type="checkbox"]').is(':checked')){
    				var holdingListContNo = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_contno');
    				var holdingListPoint = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_point');
    				var holdingListSeq = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_seq');
    				var holdingListHold = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_hold');
    				
    				var length = Number($('#unProcHoldingListTable tbody tr').length);
    				        				
    				for(var j=0; j<=length; j++){   
						if(($('#unProcHoldingListTable tr').eq(j).attr('bie_ship_contno') == holdingListContNo 
							&& $('#unProcHoldingListTable tr').eq(j).attr('bie_ship_point') == holdingListPoint
							&& $('#unProcHoldingListTable tr').eq(j).attr('bie_ship_seq') == holdingListSeq
							&& $('#unProcHoldingListTable tr').eq(j).attr('bie_ship_hold') == holdingListHold)
						){        					
							$('#unProcHoldingListTable tbody tr').eq(j-1).children().find('input[type="checkbox"]').prop("checked",false);
		        			$('#unProcHoldingListTable tbody tr').eq(j-1).children().find('input[type="checkbox"]').prop("disabled","");
		        			$('#unProcHoldingListTable tbody tr').eq(j-1).attr('chk', 0);

						}
					}
    				$('#holdingListTable tbody tr').eq(i).remove();
    				ckCnt += 1;
    			}
    			else{
    				amt += Number(isEmpty($('#holdingListTable tbody tr').eq(i).attr('bie_ship_amount')));
    				vat += Number(isEmpty($('#holdingListTable tbody tr').eq(i).attr('bie_ship_vat')));
    				tot += Number(isEmpty($('#holdingListTable tbody tr').eq(i).attr('bie_ship_total')));
    				
    			}
    		}
    		
			$('#ship_amt').val(numberFormat(amt)); 
			$('#ship_vat').val(numberFormat(vat));
			$('#ship_tot').val(numberFormat(tot));
			
    		if(ckCnt == 0){
    			Swal.fire('삭제할 컨테이너를 선택하세요.');
    		}
        	
    	})
    });
	
	// 가상계좌 입금내역 조회
	function SearchVirAccountJson(){			
		$.ajax({
			type:'POST',
	        url : "/SearchVirAccountJson.do",
	        cache : false,
	        data : $("#Form").serialize(),
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType: 'JSON',
	        success : function(data){
	        	var html = "";
	        	
	            if(data.length > 0)
	            {
	            	for(i=0; i<data.length; i++){
	            		html += "<tr class='text-center text-truncate' style='height:35px;' ";
		                html += "vir_acctno = '" + data[i].vir_acctno + "'"; 
			            html += "tran_dd = '" + data[i].tran_dd +  "'"; 
				        html += "tran_hh = '" + data[i].tran_hh +  "'";
					    html += "incom_amount = '" + data[i].incom_amount +  "'"; 
						html += "rndclrnm = '" + data[i].rndclrnm +  "'";
						html += "except = '" + data[i].except +  "'"; 
						html += "remark = '" + data[i].remark +  "'"; 
						html += "serial = '" + data[i].serial +  "'";
						
						html += "vatrsno = '" + data[i].vatrsno +  "'";
						html += "istcd = '" + data[i].istcd +  "'";
						
						html += "outcom_amount = '" + data[i].outcom_amount +  "'>";
						
		            	html += "<td style='width:60px; height:35px;'>" + (i+1) + "</td>";
		            	html += "<td style='width:60px; height:35px;'><input type='checkbox' id='virAcctChk' onclick='javascript:selectVirAcct();' /></td>";
		            	html += "<td style='width:160px; height:35px;'>" + dateFormat(data[i].tran_dd) + "</td>";
		            	html += "<td style='width:160px; height:35px;'>" + timeFormat(data[i].tran_hh) + "</td>";
		            	html += "<td style='width:160px; height:35px;'>" + numberFormat(data[i].incom_amount) + "</td>";
		            	html += "<td style='width:160px; height:35px;'>" + data[i].vir_acctno + "</td>";
		            	html += "<td style='width:160px; height:35px;'>-</td>";
		            	html += "<td style='width:160px; height:35px;'>" + data[i].rndclrnm + "</td>";
		            	html += "</tr>";
	            		
	                }
					
	            	for(i=0; i<9; i++){
	            		html += "<tr class='text-center text-truncate' style='height:35px;'>";
		            	html += "<td style='width:60px; height:35px;'></td>";
		            	html += "<td style='width:60px; height:35px;'></td>";
		            	html += "<td style='width:160px; height:35px;'></td>";
		            	html += "<td style='width:160px; height:35px;'></td>";
		            	html += "<td style='width:160px; height:35px;'></td>";
		            	html += "<td style='width:160px; height:35px;'></td>";
		            	html += "<td style='width:160px; height:35px;'></td>";
		            	html += "<td style='width:160px; height:35px;'></td>";
		            	html += "</tr>";
	                }

	            	$("#virAcctListTable > tbody").html(html);
	            }
	            else{
		        	Swal.fire('조회 결과가 없습니다. : ' + data.length);
	            }
	        },
	        error:function(request,status,error){
	        	swal({
					title : '로그인 세션이 끊어졌습니다.',
					text : '다시 로그인 해주세요.',
					icon : 'error',
					closeOnClickOutside: false,
					
					buttons : {
						confirm : {
							text : '로그인 창으로',
							value : true,
							className : 'btn btn-primary'
						}
					}
				}).then((result) => {
					if(result){
						swal('페이지 이동', '로그인 창으로 이동합니다.', 'success', {
							closeOnClickOutside: false,
							closeOnEsc: false,
							buttons : {
								confirm : {
									text : '확인',
									value : true,
									className : 'btn btn-primary'
								}
							}
						}).then((result) => {
							if(result){
								location.href='logoutProcess.do';
							}
						});
					}
				});
	        }
	    });
	}
	
	//입금내역 선택하면 입금액합계에 값 저장
    function selectVirAcct(){
		var incom = 0;
    	for(var i=0; i<$('#virAcctListTable tbody tr').length; i++){
			if($('#virAcctListTable tbody tr').eq(i).children().find('input[type="checkbox"]').is(':checked')){
				incom += Number(isEmpty($('#virAcctListTable tbody tr').eq(i).attr('incom_amount')));
			}
		}
		$('#ship_dep').val(numberFormat(incom)); 
    }
  	
	function functionBtn(opt) {
		var option = opt;
		var holdContArray = new Array();
		var virAcctArray = new Array();
		
		if(option == "save"){				
			var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
 			
			if($('#cu_code').val() == ""){
                Swal.fire("거래처를 입력해 주세요.");
                return false;
			}
			if($('#cu_adcode').val() == ""){
                Swal.fire("사업자번호를 입력해 주세요.");
				return false;
			}
			if($('#ship_dep').val() != $('#ship_tot').val()){
				Swal.fire("입금액합계와 합계금액이 다릅니다.");
				return false;
			}
			if(regex.test($('#take_usermail').val()) == false){
 				Swal.fire("거래처 E-MAIL을 입력해 주세요.");
				return false;
			}

        	for(var i=0; i<$('#holdingListTable tbody tr').length; i++){
        		if($('#holdingListTable tbody tr').eq(i).attr('bie_ship_contno') != null){
        			var holdContObject = new Object();
					holdContObject.bie_ship_contno = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_contno');
					holdContObject.bie_ship_point = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_point');
					holdContObject.bie_ship_hold = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_hold');
					holdContObject.bie_ship_seq = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_seq');
					holdContObject.bie_ship_blno = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_blno');
					holdContObject.prePayment = $('#holdingListTable tbody tr').eq(i).attr('prePayment');
					holdContArray.push(holdContObject);
        		}
        	}
        			
        	for(var i=0; i<$('#virAcctListTable tbody tr').length; i++){
        		if($('#virAcctListTable tbody tr').eq(i).children().find('input[type="checkbox"]').is(':checked')){
        			var virAcctObject = new Object();	
        			virAcctObject.vir_acctno = $('#virAcctListTable tbody tr').eq(i).attr('vir_acctno');
        			virAcctObject.tran_dd = $('#virAcctListTable tbody tr').eq(i).attr('tran_dd'); 
        			virAcctObject.tran_hh = $('#virAcctListTable tbody tr').eq(i).attr('tran_hh');  
        			virAcctObject.incom_amount = $('#virAcctListTable tbody tr').eq(i).attr('incom_amount'); 
        			virAcctObject.vatrsno = $('#virAcctListTable tbody tr').eq(i).attr('vatrsno'); 
        			virAcctArray.push(virAcctObject);
				}
        	}

        	if(holdContArray.length == 0 || virAcctArray.length == 0){
				Swal.fire("입금내역과 Holding List에 선택된 정보 없음.");
				return false;
			}
        	else{
	        	var jsonHoldContData = JSON.stringify(holdContArray);
	        	var jsonVirAcctData = JSON.stringify(virAcctArray);
	        	var demurrage = $('#bie_ship_symd_shr').val();
	        	
	        	$('#holdContData').val(jsonHoldContData);
	        	$('#virAcctData').val(jsonVirAcctData);
	        	$('#demurrage').val(demurrage);
	        	
	        	var f = document.forms[0];
	        	f.action = "contHoldRelease.do";
	        	f.target = "home";
	        	f.submit();
        	}
		}
		
		if(option == "printBill"){
			var ckCount = 0;
			for (var i = 0; i < $('#holdingListTable tbody tr').length; i++) {
				if($('#holdingListTable tr').eq(i).children().find('input[type="checkbox"]').is(':checked')){
					ckCount += 1;
				}
			}
			
			if(ckCount == 0){
				Swal.fire('[Holding List]에서 컨테이너를 선택해주세요.');
			}
			else{					
				for(var i=0; i<$('#holdingListTable tbody tr').length; i++){
	        		if($('#holdingListTable tbody tr').eq(i).children().find('input[type="checkbox"]').is(':checked')){
	        			var contObject = new Object();
	        			contObject.bie_ship_contno = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_contno');
	        			contObject.bie_ship_hold = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_hold');
	        			contObject.bie_ship_holddesc = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_holddesc');
	        			contObject.bie_ship_type = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_type');
	        			contObject.bie_ship_count = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_count');
	        			
	        			contObject.bie_ship_basedate = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_basedate');
	        			contObject.bie_ship_qty = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_qty');
	        			contObject.bie_ship_rate = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_rate');
	        			contObject.bie_ship_amount = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_amount');
	        			contObject.bie_ship_vat = $('#holdingListTable tbody tr').eq(i).attr('bie_ship_vat');
						holdContArray.push(contObject);
	    			}
	        	}

	        	var jsonHoldContData = JSON.stringify(holdContArray);
	        	$('#holdContData').val(jsonHoldContData);
					
				var url = "billPrintPopup.do";
				window.open("", "billPrintPopup", "location=no,status=no,toolbar=no,menubar=yes,scrollbars=yes,width=750,height=820,left=10,top=100");
				document.Form.action = url;
				document.Form.method = "post";
				document.Form.target = "billPrintPopup";
				document.Form.submit();
			}
		}
	}
	
	function resetTable(){
		$('#unProcHoldingListTable > tbody').empty();
        
		for(var a=0; a<11; a++){
			$('#unProcHoldingListTable > tbody:last').append('<tr class="text-center text-truncate">' + 
				'<td style="width:45px; height:35px;"></td>' +
				'<td style="width:45px; height:35px;"></td>' +
				'<td style="width:95px; height:35px;"></td>' +
				'<td style="width:115px; height:35px;"></td>' +
				'<td style="width:75px; height:35px;"></td>' +
			        							
				'<td style="width:95px; height:35px;"></td>' +
				'<td style="width:65px; height:35px;"></td>' +
				'<td style="width:75px; height:35px;"></td>' +
				'<td style="width:65px; height:35px;"></td>' +
				'<td style="width:55px; height:35px;"></td>' +
			        							
				'<td style="width:135px; height:35px;"></td>' +
				'<td style="width:65px; height:35px;"></td>' +
				'<td style="width:75px; height:35px;"></td>' +
				'<td style="width:75px; height:35px;"></td>' +
				'</tr>');	
       }                            		
		$('#holdingListTable > tbody').empty(); 
        
        for(var a=0; a<11; a++){
        	$('#holdingListTable > tbody:last').append(
        			'<tr class="text-center text-truncate" style="height:35px;">' + 
    				'<td style="width:40px; height:35px;"></td>' + 
    				'<td style="width:100px; height:35px;"></td>' + 
    				'<td style="width:100px; height:35px;"></td>' + 
    				'<td style="width:100px; height:35px;"></td>' + 
    				'<td style="width:120px; height:35px;"></td>' +     					        					
    				'<td style="width:120px; height:35px;"></td>' + 
    				
    				'<td style="width:80px; height:35px;"></td>' + 
    				'<td style="width:80px; height:35px;"></td>' + 
    				'<td style="width:80px; height:35px;"></td>' + 
    				'<td style="width:90px; height:35px;"></td>' +     					        					
    				'<td style="width:90px; height:35px;"></td>' + 
    				'<td style="width:90px; height:35px;"></td>' + 
  				'</tr>');	
       }   
        
        $('#virAcctListTable > tbody').empty();
        for(var a=0; a<10; a++){
        	$('#virAcctListTable > tbody:last').append(
        			'<tr class="text-center text-truncate" style="height:35px;">' +
    				'<td style="width:60px; height:35px;"></td>' +
    				'<td style="width:60px; height:35px;"></td>' +
    				'<td style="width:160px; height:35px;"></td>' +
    				'<td style="width:160px; height:35px;"></td>' +
    				'<td style="width:160px; height:35px;"></td>' +        					        					
    				'<td style="width:160px; height:35px;"></td>' +        					
    				'<td style="width:160px; height:35px;"></td>' +
    				'<td style="width:160px; height:35px;"></td>' +
  				'</tr>');	
       }      

		$('#ship_amt').val(numberFormat(0)); 
		$('#ship_vat').val(numberFormat(0));
		$('#ship_dep').val(numberFormat(0)); 
		$('#ship_tot').val(numberFormat(0)); 
        
	}
	
	function logout() {
		document.Form.action="logoutProcess.do";
		document.Form.submit();
	} 