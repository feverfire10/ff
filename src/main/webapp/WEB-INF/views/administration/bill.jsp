<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <!-- 아임포트 결제용 API -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <!-- alertifyJS -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <style>
        div{box-sizing: border-box;  float: left;}
        .outer{
            width: 1200px;
            display: block;
            margin: auto;
        }
        .left{width: 62%; margin-right: 3%;}
        .right{
            width: 35%;
        }
        th{background: lightgray;}
        .bill{text-align: center; width: 100%; height: 60%; display: block; font-size: 0.9em;}
        .pays{text-align: right; width: 100%; height: 100%; table-layout: fixed; cursor: wait;}
        .pays input{width:100%; height:100%;}
        .bill td, th{border: solid 1px black;}
        .log{width: 100%; height: 40%;}
        .discount{width: 100%; height: 20%;}
        .pay{width: 100%; height: 40%; box-sizing: border-box;}
        dl{
            position: relative;
            width: 100%;
            height: 400px;
            overflow-x: auto;
            overflow-y: auto;
        }
        dt{
            height: 20px;
            float: left;
            width: 33.3%;
            z-index: 3;
            position: relative;
            text-align: center;
            background: #DCDCDC;
        }
        dd{
            position: absolute;
            padding-top: 20px;
            background-color:#BEBEBE;
            width: 100%;
            height: 100px;
            margin: 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        textarea{width:100%; height:100%;}
        dd.hidden{display: none;}
        .memos{width: 100%; height: 15%;}
        .memo{resize: none;}
        .btnDivs{width: 100%; height: 25%; text-align: center;}
        .quarter{width: 50%; height: 50%;}
        .quarter button{width: 100%;}
        fieldset input{cursor: default;}
        .upside{padding-bottom: 2%;}
        .downside{padding-top: 2%;}
        
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<fmt:formatNumber var="bonin" value="${ (bf.checkup + bf.dose + bf.operation + bf.radiation) * 0.3 }" pattern="###,###,###" type="number"/>
<fmt:formatNumber var="boheom" value="${ (bf.checkup + bf.dose + bf.operation + bf.radiation) * 0.7 }" pattern="###,###,###" type="number"/>
<fmt:formatNumber var="budam" value="${ (bf.checkup + bf.dose + bf.operation + bf.radiation) }" pattern="###,###,###" type="number"/>
    <div class="outer">
        <div class="left">
            <div class="bill">
            	<table style="width: 100%; table-layout: fixed;">
                    <tr>
                        <th>환자등록번호</th>
                        <th>환자성명</th>
                        <th colspan="2">진료기간</th>
                        <th colspan="2">야간 / 공휴일 진료여부</th>
                    </tr>
                    <tr>
                        <td>${bf.patientsNo}</td>
                        <td>${bf.patientsName}</td>
                        <td colspan="2">${ bf.pbVisitDate }</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>진료과목</th>
                        <th>질병균번호</th>
                        <th colspan="2"></th>
                        <th colspan="2">영수증번호</th>
                    </tr>
                    <tr>
                        <td>정형외과</td>
                        <td></td>
                        <td colspan="2"></td>
                        <td colspan="2">${ bf.billFormNo }</td>
                    </tr>
                    <tr>
                        <th>항목</th>
                        <th>요양급여 (1+2)</th>
                        <th>비급여 (3)</th>
                        <th colspan="3">금액 산정 내역</th>
                    </tr>
                    <tr>
                        <th>진찰료</th>
                        <c:choose>
               				<c:when test="${ classific eq 0 }">
	    	                    <td><fmt:formatNumber value="${ bf.checkup }" type="number"/></td>
		                        <td></td>
               				</c:when>
               				<c:otherwise>
               					<td></td>
		                        <td><fmt:formatNumber value="${ bf.checkup }" type="number"/></td>
               				</c:otherwise>
               			</c:choose>
                        <th rowspan="2">진료비 총액 (4)<br>(1+2+3)</th>
                        <td rowspan="2" colspan="2">
                        	<fmt:formatNumber value="${ bf.checkup + bf.dose + bf.operation + bf.radiation }" type="number"/>
                        </td>
                    </tr>
                    <tr>
                        <th>입원료</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>식대</th>
                        <td></td>
                        <td></td>
                        <th rowspan="2">환자부담금액(5)<br>(1+3)</th>
                        <td rowspan="2" colspan="2">
                        	<c:choose>
                        		<c:when test="${ classific eq 0 }">
		                        	${ bonin }
                        		</c:when>
                        		<c:otherwise>
                        			${ (bf.checkup + bf.dose + bf.operation + bf.radiation) }
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>투약 및 조제료</th>
                        <c:choose>
               				<c:when test="${ classific eq 0 }">
	    	                    <td><fmt:formatNumber value="${ bf.dose }" type="number"/></td>
		                        <td></td>
               				</c:when>
               				<c:otherwise>
               					<td></td>
		                        <td><fmt:formatNumber value="${ bf.dose }" type="number"/></td>
               				</c:otherwise>
               			</c:choose>
                    </tr>
                    <tr>
                        <th>주사료</th>
                        <td></td>
                        <td></td>
                        <th rowspan="2">이미 납부한 금액<br>(6)</th>
                        <td rowspan="2" colspan="2"></td>
                    </tr>
                    <tr>
                        <th>마취료</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>처치 및 수술료</th>
                        <c:choose>
               				<c:when test="${ classific eq 0 }">
	    	                    <td><fmt:formatNumber value="${ bf.operation }" type="number"/></td>
		                        <td></td>
               				</c:when>
               				<c:otherwise>
               					<td></td>
		                        <td><fmt:formatNumber value="${ bf.operation }" type="number"/></td>
               				</c:otherwise>
               			</c:choose>
                        <th rowspan="2">수납 금액 (7)<br>(5-6)</th>
                        <td colspan="2" rowspan="2">
                        	<c:choose>
                        		<c:when test="${ classific eq 0 }">
		                        	${ bonin }
                        		</c:when>
                        		<c:otherwise>
                        			${ (bf.checkup + bf.dose + bf.operation + bf.radiation) }
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>검사료</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>방사선료</th>
                        <c:choose>
               				<c:when test="${ classific eq 0 }">
	    	                    <td><fmt:formatNumber value="${ bf.radiation }" type="number"/></td>
		                        <td></td>
               				</c:when>
               				<c:otherwise>
               					<td></td>
		                        <td><fmt:formatNumber value="${ bf.radiation }" type="number"/></td>
               				</c:otherwise>
               			</c:choose>
                        <th rowspan="11" colspan="3"></th>
                    </tr>
                    <tr>
                        <th>치료재료대</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>전액본인부담</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>재활 및 물리치료</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>정신요법료</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>초음파진단료</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>선택진료료</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>첩약</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>기타</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>본인부담금 (1)</th>
                        <c:choose>
                        		<c:when test="${ classific eq 0 }">
		                        	<td>${ bonin }</td>
		                        	<td></td>
                        		</c:when>
                        		<c:otherwise>
                        			<td></td>
                        			<td>${ (bf.checkup + bf.dose + bf.operation + bf.radiation) }</td>
                        		</c:otherwise>
                        	</c:choose>
                    </tr>
                    <tr>
                        <th>보험자부담금(2)</th>
                        <td>
	                        <c:if test="${classific eq 0 }">
    	    	                ${ boheom }
        	                </c:if>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>사업자등록번호</th>
                        <td colspan="2">135-31-76625</td>
                        <th>상호</th>
                        <td colspan="2">KH의원</td>
                    </tr>
                    <tr>
                        <th>사업장소재지</th>
                        <td colspan="2">서울특별시 강남구 테헤란로14길 6</td>
                        <th>성명</th>
                        <td colspan="2">열불나조</td>
                    </tr>
                </table>
            </div>
            <div class="pay">
                <table class="pays">
                    <tr>
                        <td><label for="">요양비용총액</label></td>
                        <td><input type="number" value="${ (bf.checkup + bf.dose + bf.operation + bf.radiation) }" readonly></td>
                        <td><label for="">상한차액총액</label></td>
                        <td><input type="number" value="0" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="">총 진료비</label></td>
                        <td><input type="number" id="totalBill" value="${ (bf.checkup + bf.dose + bf.operation + bf.radiation) }" readonly></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><label for="">급여본인부담</label></td>
                        <td>
                        	<c:choose>
                        		<c:when test="${ classific eq 0 }">
		                        	<input type="text" value="${ bonin }" readonly>
                        		</c:when>
                        		<c:otherwise>
                        			<input type="number" value="" readonly>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><label for="">조합청구액</label></td>
                        <td>
                        	<c:choose>
                        		<c:when test="${ classific eq 0 }">
		                        	<input type="text" value="${ boheom }" readonly>
                        		</c:when>
                        		<c:otherwise>
                        			<input type="number" value="0" readonly>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><label for="">전액본인부담</label></td>
                        <td>
                        <c:choose>
                        		<c:when test="${ classific eq 1 }">
		                        	<input type="number" value="${ bf.dose + bf.radiation + bf.operation + bf.checkup }" readonly>
                        		</c:when>
                        		<c:otherwise>
                        			<input type="number" value="0" readonly>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><label for="">비급여총액</label></td>
                        <td>
                        	<c:choose>
                        		<c:when test="${ classific eq 0 }">
		                        	<input type="number" readonly>
                        		</c:when>
                        		<c:otherwise>
                        			<input type="number" value="${ bf.dose + bf.radiation + bf.operation + bf.checkup }" readonly>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                        <td><label for="">기 수납액</label></td>
                        <td><input type="number" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="">지원금</label></td>
                        <td><input type="number" readonly></td>
                        <td><label for="">기미수 금액</label></td>
                        <td><input type="number" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="">총 본인부담</label></td>
                        <td>
                        	<c:choose>
                        		<c:when test="${ classific eq 0 }">
		                        	<input type="text" value="${ bonin }" readonly>
                        		</c:when>
                        		<c:otherwise>
                        			<input type="text" value="${ bf.dose + bf.radiation + bf.operation + bf.checkup }" readonly>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="right">
            <div class="log">
                <fieldset>
                    <legend>수납 내역</legend>
                    <table>
                        <tr>
                            <td><label>총 영수액</label></td>
                            <td>
                            	<c:choose>
                            		<c:when test="${ classific eq 0 }">
		                            	<input type="text" name="total" id="total2" value="${ bonin }" readonly>
                            		</c:when>
                            		<c:otherwise>
                            			<input type="text" name="total" id="total2" value="${ budam }" readonly>
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td><label>카드</label></td>
                            <td><input type="text" name="card" id="card" value=""></td>
                        </tr>
                        <tr>
                            <td><label>할인</label></td>
                            <td><input type="text" id="discount1" name="discount1" readonly></td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div class="discount">
                <fieldset>
                    <legend>할인설정</legend>
                    <br>
                    <label>할인할 금액</label> <input type="number" id="discount2" name="discount2" value="">
                    <br>
                    <label>&nbsp;&nbsp; 현금 금액</label> <input type="number" id="cash" name="cash" value="">
                </fieldset>
            </div>
            <div class="memos">
                <dl>
                    <!-- <dt>접수메모</dt>
                    <dd><textarea name="js" id="js" class="memo"></textarea></dd>
                    <dt>내원메모</dt>
                    <dd class="hidden"><textarea name="nw" id="nw" class="memo"></textarea></dd> -->
                    <dt>영수메모</dt>
                    <dd class="hidden"><textarea name="ys" id="ys" class="memo"></textarea></dd>
                </dl>
            </div>
            <div class="btnDivs">
                <div class="quarter upside"><button class="btn btn-primary" onclick="testCharge();" id="charge">수납</button></div>
                <div class="quarter upside"><button class="btn btn-primary" id="cancel">취소</button></div>
                <div class="quarter downside"></div>
                <div class="quarter downside"></div>
            </div>
        </div>
    </div>
    <script>
    	// 메모 칸 두개 값 가져온 뒤 textarea 태그에 값 넣기
    	//var dayNote = "";
    	//var chainNote = "";
    	//$("#js").val(dayNote);
    	//$("#nw").val(chainNote);
        var $menuEle = $('dt');
        $menuEle.click(function(){
            $('dd').addClass('hidden');
            $(this).next().removeClass('hidden');
        });
        // 총 영수액에 값을 담기 위한 변수선언과 세팅
        var classific = "<c:out value='${ classific }'/>";
        var bonin = "<c:out value='${(bf.checkup + bf.dose + bf.operation + bf.radiation) * 0.3}'/>";
        if(classific == 1){
        	bonin = "<c:out value='${bf.checkup + bf.dose + bf.operation + bf.radiation}'/>";
        }
        bonin *= 1;
        bonin = Math.round(bonin);
        // 하나 입력 시 동시입력
        $("#discount2").keydown(function(){
        	$("#discount1").val($(this).val());
        	$("#card").val(bonin - $(this).val());
        });
        // 마지막에 입력 시 입력되게 함
        $("#discount2").change(function(){
        	$("#discount1").val($(this).val());
        	$("#card").val(bonin - $(this).val());
        });
        $("#cash").keydown(function(){
        	$("#card").val(bonin - $(this).val() - $("#discount1").val());
        });
        $("#cash").change(function(){
        	$("#card").val(bonin - $(this).val() - $("#discount1").val());
        });
       	
        
        // 결제 전 확인
        function testCharge(){
        	var item = bonin - $("#cash").val() - $("#discount1").val();
        	console.log(item);
        	if(item != 0){
        		inicis();
        	} else {
        		chargeSuc();
        	}
        }
        
        
        // 결제 시작
        var IMP = window.IMP; // 생략가능
		IMP.init('imp11743566'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        function inicis(){
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'KH의원 진료비',
			    amount : $("#card").val(),
			    buyer_email : 'feverfire10@gmail.com',
			    buyer_name : 'KH의원',
			    buyer_tel : '010-9235-4912',
			    buyer_addr : '서울특별시 강남구 테헤란로14길 6',
			    buyer_postcode : '123-456',
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			       	chargeSuc();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
        }
		
		var billFormNo = "<c:out value='${bf.billFormNo}'/>";
		billFormNo *= 1;
		function chargeSuc() { // 결제 성공 후 실행 할 메소드
			$.ajax({
				url:"insertPayment.r",
				type:"get",
				data:{billFormNo:billFormNo,
					  totalBill:$("#totalBill").val(),
					  discount:$("#discount2").val(),
					  cardPay:$("#card").val(),
					  memo:$("#ys").val(),
					  cashPay:$("#cash").val()},
				success:function(result){
					if(result > 0){
						alertify.alert("데이터베이스 저장 성공");
						// 수납창 자동으로 닫게하는 구문
						self.opener = self;
						self.close();
					}
				}
			});
		}
        // 결제 끝
        
        // 취소버튼 클릭 시 창 닫기
        
        $(function(){
        	$("#cancel").click(function(){
        		if(confirm("수납취소 하시겠습니까?")){
	        		window.close();
        		}
        	});
        });
        
    </script>
</body>
</html>