<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here123</title>
<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css" integrity="sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <!-- alertifyJS -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <!-- datepicker -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>

      /* 사이드 메뉴바 부분 */
   .move_share1 {
       POSITION: fixed;
       MARGIN-LEFT: -600px;
       TOP: 130px;
       LEFT: 39%;
       border: 1px solid #E7E7E7;
       background: #FAFAFA;
       padding: 10px;
       width: 95px;
       text-align: center;
        border-radius: 15px;
   }
   .move_share2 {
       POSITION: fixed;
       MARGIN-LEFT: -600px;
       TOP: 390px;
       LEFT: 39%;
       border: 1px solid #E7E7E7;
       background: #FAFAFA;
       padding: 10px;
       width: 95px;
       text-align: center;
        border-radius: 15px;
   }
   .sideBtn {
       width: 70px;
       height: 40px;
       background: aquamarine;
       border-radius: 10px;
       border: 0;
       outline: none;
       cursor: pointer;
       font-weight: bolder;
       font-size: 14px;
   }
   .sideBtn:hover {
       background: cadetblue;
       color: white;
   }
   .sideH{
      margin: 0;
       padding-top: 5px;
       padding-bottom: 5px;
   }



      /* 전체 감싸는 DIV*/  
      .wrap{
          width: 1300px;
          height: 1500px;
          margin: 0px auto;       
      }
      /* 작업일자, 메뉴 탭 감싸는 DIV*/
      .header{
          width: 1280px;
          height: 100px;
          border: solid 1px;
          border-color: gray;
          margin: 5px auto;
      }

    /* 항목별 상단 제목 */
    .title {
        width: 100%;
        height:60px;
        margin: 0px auto;
        margin-top: 20px;
        font-size: 30px;
        color: white;
        background-color: lightgray;
        vertical-align: middle;
        padding: 15px 0px 5px;
        font-weight: bold;
    } 

     /* 메뉴바 */
     .menubar{
        margin-top: 35px;
     }
     .date{
        float: left;
     }
     .date-work {
        width: 80px;
        height: 33px;
        font-size: 15px;
        padding-top: 5px;
        margin-left: 10px;
        text-align: center;
        float: left;
        background-color: #6c757d;
        border-color: #6c757d;
        color: #fff;
        border: 3px;
        border-radius: 5px;
     }
     .datetool {
         height: 28px;
     }

     .date-input{
        float: left;
        margin-left: 20px;
    }
    .date-input input {
        height: 35px;
    }

    .btn-wrap {
        float: left;
        margin-left: 20px;
    }
    .btn-menuTab {
        height: 35px;
        font-size: 15px;
        background:#007bff;
        color: #fff;
        border: 3px;
        border-radius: 5px;
    }

      /* 환자 조회 틀 */
      .upper{
          width: 1280px;
          height: 300px;
          border: solid 1px;
          border-color: gray;
          margin: 5px auto;
          overflow-y: auto;
      }
 
      /* 환자 조회 표 */
     
        .table {
            text-align: center;
            font-size: 13px;
            border-collapse: collapse;
        }
        
     /* 환자조회 검색창 */
     .ptsearch {
         float: right;
         margin-bottom:10px;
     }

    


      /* 환자 접수 */
      .join{
          width:330px;
          height: 990px;
          float: left;
          margin-left: 9px;
      }
      .join-info{
          width: 320px;
          height: 980px;
          border: solid 1px;
          border-color: gray;
          margin: 0px auto;
          margin-top: 10px;
      }
      
      .jd {
        border-collapse: separate;
        border-spacing: 0 4px; 
      }
     
      .join-info th{
        background-color: lightgray;
        vertical-align: middle;
        height: 5px;
        padding: 1px 2px 1px;
        border-top: 1px solid #ddd;
        font-size: 12px;
        width: 30%;
        text-align: center;
      }
      .join-info input, .join-info select{
          width: 180px;
          height: 30px;
          margin-left: 10px;
      }
      .join-info textarea {
          margin-left: 10px;
      }
      .btn-join {
        text-align: center;
      }
      .btnjoin {
        background:#23b9ff;
        color: #fff;
        width: 100px;
        height: 25px;
        font-size: 13px;
        border: 3px;
        border-radius: 5px;
      }


      /* 진료관리, 수납관리 틀 */
      .sidebar{
          width: 940px;
          height: 990px;
          float: left;
          margin-left: 10px;
          margin-top: 6px;
      }

     


      /* 진료관리 */
     .tp{
          width: 100%;
          height: 480px;
          border: solid 1px;
          border-color: gray;
          margin: 0px auto;
          margin-top: 4px;
          overflow-y: auto;
     }

     /* 수납관리 */
     .receipt{
          width: 100%;
          height: 480px;
          border: solid 1px;
          border-color: gray;
          margin: 0px auto;
          margin-top: 18px;
          overflow-y: auto;
     }


     /* 진료관리, 수납관리 - 표 CSS  */

   
        #firstmenu, #secondmenu {
            width: 100%;
        }
        
        .tab_menu_container {
            display:flex;
            margin-bottom:8px;
        }
        .tab_menu_btn, .tab_menu_btn_receipt {
          width:80px;
          height:30px;
          margin-left: 5px;
          transition:0.3s all;
        }
        .tab_menu_btn.on, .tab_menu_btn_receipt.on {
          border-bottom:2px solid #df0000;
          font-weight:700;
          color:#df0000;
        }
        .tab_menu_btn:hover, .tab_menu_btn_receipt:hover {
          color:#df0000;
        }
        
        .tab_box, .tab_box_receipt {
          display:none;
        }
        .tab_box.on, .tab_box_receipt.on {
          display:block;
        }

        
    /* 진료관리, 수납관리 버튼 */

        .btn-box {
          text-align: center;
          height: 30px;
          float: right;
          margin-top: 6px;
        }
        .btn-form {
            color: #fff;
            background-color: #17a2b8;
            font-weight: 400;
            text-align: center;
            border: 1px solid transparent;
            border-radius: .25rem;
        }


    </style>
</head>
<body>

	
	
	<!-- 사이드 메뉴바 영역 -->
   <div class="move_share1">
    <h5 class="sideH">page</h5>
    <hr>   
    <button class="sideBtn" data-toggle="modal" data-target="#intro">원무</button>
    <br><br>
    <button class="sideBtn">진료</button>
    <br><br>
    <button class="sideBtn">지원</button>
    <br>
 </div>
 <div class="move_share2">
    <h5 class="sideH">menu</h5>
    <hr>   
    <button class="sideBtn" data-toggle="modal" data-target="#patientSearch">환자조회</button>
    <br><br>
    <button class="sideBtn" data-toggle="modal" data-target="#completeList">외래내역</button>
    <br><br>
    <button class="sideBtn" data-toggle="modal" data-target="#patientSearch">대기환자</button>
    <br>
 </div>




    <!-- 본문 시작 -->



    <div class="wrap">
        <div class="header">
            <div class="menubar"> 
                <div class="date">
                        <div class="date-work">작업일자</div>
                        <div class="date-input">
                            <input type="text" id="datepicker" class= "datetool" name="workdate">
                        </div>
                </div>
                <div class="btn-wrap">
                    <button class="btn-menuTab">환자관리</button>
                    <button class="btn-menuTab">수납관리</button>
                    <button class="btn-menuTab">방문자 통계</button>
                </div>
                <br><br>
                <hr style="width: 100%" color="gray" size="3">
            </div>
        </div>
        <!-- 환자조회 -->
        <div class="upper">
            <div class="title">
                &nbsp;&nbsp;&nbsp;환자조회
            </div>
            <br>
           <form name="ptform" method="POST" onsubmit="return false">
                <div class="ptsearch">
                    <table style="vertical-align: middle;">
                    <tr>
                        <td>
                            <select name="option" id="option1" style="height: 30px;">
                                <option value="name">이름</option>
                                <option value="idnum">주민번호</option>
                            </select>
                        </td>
                        <td>
                            <input type="text" placeholder="" id="keyword1" >
                        </td>
                        <td>
                            <button type="button" id="searchBtn1">검색</button>
                        </td>
                    </tr>
                    </table>
                </div>
            </form>
              <table class="table" id="searchResult1">
                <thead class="thead-light">
                  <tr>
                    <th>순번</th>
                    <th>이름</th>
                    <th>주민번호</th>
                    <th>보험유형</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>최초내원일</th>
                    <th>전진료일</th>
                    <th>전진료실</th>
                    <th>담당의</th>
                    <th>접수메모(연속)</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
          </div> 


        

            <!-- 환자 접수 -->
            <div class="join">
                <div class="join-info">
                    <form name="join-form" method="POST">
                    <div class="title">
                        &nbsp;&nbsp;&nbsp;환자 접수
                    </div>
                    <h2 style="margin-top: 40px; margin-left: 15px;" >인적 정보</h2>
                    <hr style="width: 100%" color="gray" size="3">
                    <table class="jd" style="margin-left:10px;">
                      <tr>
                        <th>이름</th>
                        <td>
                          <input type="text" id="patientsName" name="patientsName">
                        </td>
                      </tr>
                      <tr>
                        <th>주민번호</th>
                        <td>
                          <input type="text" style="margin-bottom: 4px;" id="patientsPno" name="patientsPno"> 
                        </td>
                      </tr>
                      <tr>
                        <th>보험유형</th>
                        <td>
                            <select id="insurance" name="insurance">
                                <option value="선택" selected="selected">선택</option>
                                <option value="일반">일반</option>
                                <option value="건강보험">건강보험</option>
                                <option value="자동차보험">자동차보험</option>
                                <option value="산재">산재</option>
                                <option value="보호">보호</option>
                            </select>
                        </td>
                      </tr>
                      <tr>
                        <th>최초내원일</th>
                        <td>
                          <input type="date" id="firstVisit" name="firstVisit">
                        </td>
                      </tr>
                      <tr>
                        <th>전진료일</th>
                        <td>
                          <input type="date" id="lastVisit" name="lastVisit">
                        </td>
                      </tr>
                      <tr>
                        <th>전진료실</th>
                        <td>
                          <input type="text" id="lastDo" name="lastDo">
                        </td>
                      </tr>
                    </table>
                        
                    <h2 style="margin-top: 40px; margin-left: 15px;">기타 정보</h2>
                    <hr style="width: 100%" color="gray" size="3">
                    <table class="jd" style="margin-left:10px;">
                      <tr>
                        <th>진료실</th>
                        <td>
                            <select name="Do" id="Do">
                                <option value="진료실 선택" selected="selected">진료실 선택</option>
                                <option value="진료실1">진료실1</option>
                                <option value="진료실2">진료실2</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>담당의사</th>
                        <td>
                            <select name="mo" id="mo">
                                <option value="담당의 선택" selected="selected">담당의 선택</option>
                                <option value="홍길동">홍길동</option>
                                <option value="임꺽정">임꺽정</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>초/재진</th>
                        <td>
                            <select name="adhd" id="adhd">
                                <option value="초/재진 선택" selected="selected">초/재진 선택</option>
                                <option value="초진">초진</option>
                                <option value="재진">재진</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" id="address" name="address">
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>
                            <input type="tel" id="phone" name="phone">
                        </td>
                    </tr>
                    <tr>
                        <th>접수메모(당일)</th>
                        <td>
                            <input type="text" id="dayNote" name="dayNote">
                        </td>
                    </tr>
                    <tr>
                        <th>접수메모(연속)</th>
                        <td>
                            <textarea id="chainNote" name="chainNote" cols="24" rows="5" style="resize:none;"></textarea>
                        </td>
                    </tr>
                  </table>
                        <div class="btn-join">
                            <button type="button" class="btnjoin" id="insertBtn">접수</button>
                        </div>
                    </form>
                </div>
            </div>
            


            <!-- 진료 관리 -->
            <div class="sidebar">
                <div class="tp">
                    <div class="title">
                        &nbsp;&nbsp;&nbsp;진료 관리
                    </div>
                    <br>
                    <div id="firstmenu">
                        <form name="jb-form" method="POST">
                        <div class="tab_menu_container">
                            <button class="tab_menu_btn on" type="button" id="waitBtn" onclick="selectTreatment(0);">진료대기</button>
                            <button class="tab_menu_btn" type="button" id="boryuBtn" onclick="selectTreatment(1);">진료보류</button>
                            <button class="tab_menu_btn" type="button" id="bookBtn" onclick="selectTreatment(3);">예약대기</button>
                        </div>
                        <div class="tab_box on">
                            <table class="table" style="font-size: 11px;" id="wait">
                                <thead class="thead-light">
                                    <tr>
                                        <th>순번</th>
                                        <th>차트번호</th>
                                        <th>이름</th>
                                        <th>성별</th>
                                        <th>나이</th>
                                        <th>담당의</th>
                                        <th>진료과</th>
                                        <th>메모</th>
                                        <th>초재진</th>
                                        <th>보험</th>
                                        <th>주민번호</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <!--  <tr>
                                        <td>1</td>
                                        <td>1234</td>
                                        <td></td>
                                        <td>고요한</td>
                                        <td>남</td>
                                        <td>29</td>
                                        <td>15:29</td>
                                        <td>홍길동</td>
                                        <td>정형외과</td>
                                        <td>몸에 통증 호소</td>
                                        <td>초진</td>
                                        <td>보호</td>
                                        <td>921006-1</td>
                                    </tr>
                               -->
                                </tbody>
                              </table>
                        
                        </div>

                        <div class="tab_box">
                            <table class="table" style="font-size: 11px;" id="hold">
                                <thead class="thead-light">
                                    <tr>
                                        <th>순번</th>
                                        <th>차트번호</th>
                                        <th>이름</th>
                                        <th>성별</th>
                                        <th>나이</th>
                                        <th>담당의</th>
                                        <th>진료과</th>
                                        <th>메모</th>
                                        <th>초재진</th>
                                        <th>보험</th>
                                        <th>주민번호</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                              </table>
                        </div>

                        <div class="tab_box">    
                            <table class="table" style="font-size: 10px;" id="book">
                                <thead class="thead-light">
                                    <tr>
                                        <th>순번</th>
                                        <th>차트번호</th>
                                        <th>이름</th>
                                        <th>성별</th>
                                        <th>나이</th>
                                        <th>담당의</th>
                                        <th>진료과</th>
                                        <th>메모</th>
                                        <th>초재진</th>
                                        <th>보험</th>
                                        <th>주민번호</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                              </table>
                        </div>


                      </form>
                    </div>
                      <div class="btn-box">            
                          <button class="btn-form" type="button" onclick="btnPt(0);">대기</button>
                          <button class="btn-form" type="button" onclick="btnPt(1);">보류</button>
                          <button class="btn-form" type="button" onclick="btnPt(3);">예약</button>
                          <button class="btn-form" type="button" onclick="btnPt(5);">삭제</button>
                      </div>
            <br>
            </div>    

                <!-- 수납 관리 -->
                <div class="receipt">
                    <div class="title">
                        &nbsp;&nbsp;&nbsp;수납 관리
                    </div>
                    <br>
                    <div id="secondmenu">
                      <form name="receipt-form" method="POST">
                        <div class="tab_menu_container">
                          <button class="tab_menu_btn_receipt on" id="receiptWaitBtn" onclick="selectBillFormList(2);" type="button">수납대기</button>
                          <button class="tab_menu_btn_receipt" id="receiptCompBtn" onclick="selectBillFormList(4);" type="button">수납완료</button>
                        </div>
                        <div class="tab_box_receipt on">
                        <table class="table" style="font-size: 10px;" id="receiptWaitTab">
                            <thead class="thead-light">
                                <tr>
                                    <th>순번</th>
                                    <th>수납금액</th>
                                    <th>이름</th>
                                    <th>성별</th>
                                    <th>나이</th>
                                    <th>보험</th>
                                    <th>초재진</th>
                                    <th>진료과</th>
                                    <th>차트번호</th>
                                    <th>담당의</th>
                                    <th>미수금액</th>
                                    <th>처방전</th>
                                    <th>상병</th>
                                    <th>검사</th>
                                    <th>촬영</th>
                                    <th>PT</th>
                                    <th>메모</th>
                                  </tr>
                            </thead>
                            <tbody>
                            </tbody>
                          </table>
                        </div>
                        
                        <div class="tab_box_receipt">
                        <table class="table" style="font-size: 10px;" id="receiptCompTab">
                            <thead class="thead-light">
                                <tr>
                                    <th>순번</th>
                                    <th>총수납금액</th>
                                    <th>이름</th>
                                    <th>성별</th>
                                    <th>나이</th>
                                    <th>보험</th>
                                    <th>초재진</th>
                                    <th>진료과</th>
                                    <th>차트번호</th>
                                    <th>담당의</th>
                                    <th>처방전</th>
                                    <th>현금</th>
                                    <th>카드</th>
                                    <th>계좌</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                          </table>
                      </div>
                    </form>       
                  </div>
                      <div class="btn-box">            
                        <button class="btn-form" onclick="selectBillForm();">수납</button>
                        <button class="btn-form">삭제</button>
                      </div>

        </div>
	</div>
    </div>

    <script>
      

        // 진료 관리 버튼 이동

        $('.tab_menu_btn').on('click',function(){
          //버튼 색 제거,추가
          $('.tab_menu_btn').removeClass('on');
          $(this).addClass('on')
          
          //컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
          var idx = $('.tab_menu_btn').index(this);
          
          $('.tab_box').hide();
          $('.tab_box').eq(idx).show();
        });


        // 수납 관리 버튼 이동

        $('.tab_menu_btn_receipt').on('click',function(){
          //버튼 색 제거,추가
          $('.tab_menu_btn_receipt').removeClass('on');
          $(this).addClass('on')
          
          //컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
          var idx = $('.tab_menu_btn_receipt').index(this);
          
          $('.tab_box_receipt').hide();
          $('.tab_box_receipt').eq(idx).show();
        });

        
        
        
        
	
        $("#insertBtn").click(function(){
        	$.ajax({
        		url:"insert.p",
        		data:{patientsName:$("#patientsName").val(),
        			  patientsPno:$("#patientsPno").val(),
        			  insurance:$("#insurance").val(),
        			  address:$("#address").val(),
        			  phone:$("#phone").val(),
        			  firstVisit:$("#firstVisit").val(),
        			  lastVisit:$("#lastVisit").val(),
        			  Do:$("#Do").val(),
        			  lastDo:$("#lastDo").val(),
        			  mo:$("#mo").val(),
        			  adhd:$("#adhd").val(),
        			  dayNote:$("#dayNote").val(),
        			  chainNote:$("#chainNote").val()},
        		type:"POST",
        		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        		success:function(result){
        			alertify.alert("접수되었습니다.");
        			document.getElementById("waitBtn").click();
        		},error:function(){
        			console.log("ajax 통신 실패함");
        		}
        	});
        });
        
        $(function(){
			$("#searchBtn1").click(function(){
				var value = "";
				var indexNo = $(this).index();
				indexNo += 1;
 				$.ajax({
					url:"selectPatients.p",
					type:"POST",
					data:{option:$("#option1").val(),
						  keyword:$("#keyword1").val()},
					success:function(result){
						console.log(result);
						$.each(result, function(i, obj){
							value += "<tr>" +
										"<td>" + indexNo + "</td>" + 
										"<td>" + obj.patientsName + "</td>" + 
										"<td>" + obj.patientsPno + "</td>" + 
										"<td>" + obj.insurance + "</td>" + 
										"<td>" + obj.address + "</td>" + 
										"<td>" + obj.phone + "</td>" + 
										"<td>" + obj.firstVisit + "</td>" + 
										"<td>" + obj.lastVisit + "</td>" + 
										"<td>" + obj.lastDo + "</td>" + 
										"<td>" + obj.mo + "</td>" + 
										"<td>" + obj.chainNote + "</td>" + 
									 "</tr>";
							indexNo += 1;
 						$("#searchResult1 tbody").html(value);
						});
					},error:function(){
						console.log("ajax 통신 실패함..");
					}
				});
			});
		});

        // 진료관리 탭 3개 조회용 ajax(매개변수에 따라 조회되는 탭이 다름)
        function selectTreatment(num) {
        	var tap = "";
        	var value = "";
        	var gender = "";
        	var genNum = "";
        	var indexNo = $(this).index() + 1;
        	var ssnYear = "";
        	var nowYear = new Date().getFullYear();
        	var age = 0;
			indexNo += 1;
        	switch(num){
        	case 0:
        		tap = "#wait";
        		break;
        	case 1:
        		tap = "#hold";
        		break;
        	case 3:
        		tap = "#book";
        		break;
        	}
        	$.ajax({
        		url:"selectTreatment.p",
        		data:{num:num},
        		success:function(result){
					$.each(result, function(i, obj){
						genNum = obj.patientsPno.substring(7,8);
						ssnYear = obj.patientsPno.substring(0,2);
						if(genNum == "1" || genNum == "3") {
							gender = "남";
							if(genNum == "1"){
								age = parseInt(nowYear) - (1900 + parseInt(ssnYear));
							} else {
								age = parseInt(nowYear) - (2000 + parseInt(ssnYear));
							}
						} else {
							gender = "여";
							if(genNum == "2"){
								age = parseInt(nowYear) - (1900 + parseInt(ssnYear));
							} else {
								age = parseInt(nowYear) - (2000 + parseInt(ssnYear));
							}
						}
		        		value += "<tr>" +
									"<td>" + indexNo + "</td>" + 
									"<td>" + obj.chartNo + "</td>" + 
									"<td>" + obj.patientsName + "</td>" + 
									"<td>" + gender + "</td>" + 
									"<td>" + age + "</td>" + 
									"<td>" + obj.mo + "</td>" + 
									"<td>" + obj.Do + "</td>" + 
									"<td>" + obj.dayNote + "</td>" + 
									"<td>" + obj.adhd + "</td>" +
									"<td>" + obj.insurance + "</td>" +
									"<td>" + obj.patientsPno.substring(0,8) + "</td>" +
								 "</tr>";
								 indexNo += 1;
						$(tap + " tbody").html(value);
					});
        		},error:function(){
        			console.log("ajax 실패했삼");
        		}
        	}); 
        }
        
        
        
      
       
       
        // 조회에서 검색된 재진 환자 접수로 보내기 jQuery
        // 테이블의 Row 클릭시 값 가져오기
        $(document).on('click', "#searchResult1 tr", function(){
        	
        	var str = ""
        	var tdArr = new Array();	// 배열 선언
        	
        	// 현재 클릭된 Row(<tr>)
        	var tr = $(this);
        	var td = tr.children();
        	
        	// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        	console.log("클릭한 Row의 모든 데이터 : " + tr.text());
        	
        	// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        	td.each(function(i){
        		tdArr.push(td.eq(i).text());
        	});
        	
        	console.log("배열에 담긴 값 : " + tdArr);
        	
        	// td.eq(index)를 통해 값을 가져올 수도 있다.
        	var no = td.eq(0).text();
        	var name = td.eq(1).text();
        	var ptid = td.eq(2).text();
        	var insurance = td.eq(3).text();
        	var address = td.eq(4).text();
        	var phone = td.eq(5).text();
        	var firstvisit = td.eq(6).text();
        	var lastvisit = td.eq(7).text();
        	var lastroom = td.eq(8).text();
        	var doctor = td.eq(9).text();
        	var chainmemo = td.eq(10).text();
        	
        	$(document).ready(function() {
        	        $('#patientsName').val(name);
        	        $('#patientsPno').val(ptid);
        	        $('#insurance').val(insurance);
        	        $('#address').val(address);
        	        $('#phone').val(phone);
        	        $('#firstVisit').val(firstvisit);
        	        $('#lastVisit').val(lastvisit);
        	        $('#Do').val();
        	        $('#lastDo').val(lastroom);
        	        $('#mo').val(doctor);
        	        $('#adhd').val("재진");
        	        $('#dayNote').val();
        	        $('#chainNote').val(chainmemo);
        	    });

        	
        });
        
        
        
        // 진료관리 테이블 행 클릭 시 전용 차트넘버 담기
        var cnoPatients = "";
        $(document).on("click", "#firstmenu div table tr", function(){
        	cnoPatients = $(this).children().eq(1).text();
        	console.log(cnoPatients);
        });
        
        
        
        
        
        
        
        
        
        function btnPt(num) {
        	
        	var tap = "";
        	switch(num){
        	case 0:
        		tap = "waitBtn";
        		break;
        	case 1:
        		tap = "boryuBtn";
        		break;
        	case 3:
        		tap = "bookBtn";
        		break;
        	}
        	$.ajax({
        		url:"updatePatients.js",
        		type:"POST",
        		data:{chartNo:cnoPatients, clinicState:num},
        		success:function(result){
        			if(result > 0){
        				
	        			if(num != 5){
	        				alertify.alert("업데이트 성공");
	        				document.getElementById(tap).click();
	        				tr.remove();
	        			} else {
	        				alertify.alert("삭제 성공");
	        			}
        			} else {
        				alertify.alert("업데이트 실패");
        			}
        		},error:function(){
        			console.log("ajax 실풰");
        		}
        	}); 
        	
        }
        
        // 수납공간 차트번호 갱신하는 메소드
        var cnoReceipt = "";
        $(document).on("click", "#secondmenu div table tr", function(){
       		cnoReceipt = $(this).children().eq(8).text();
        	console.log(cnoReceipt);
        });
        
        // 수납창으로 넘어가는 메소드
        function selectBillForm(){
        	var newWindow = window.open("about:blank", "수납화면", "width=1090, height=775, resizable=no, menubar=no, status=no");
        	newWindow.location.href="selectBillForm.bf?chartNo=" + cnoReceipt;
        }
        
        // 테이블 행 선택할 수 있게 하기
        
        // datepicker 선언
        $("#datepicker").datepicker({
        	dateFormat: 'yy-mm-dd', // inputDisplayFormat 설정
        	showMonthAfterYear: true, // 년도 먼저 나오고 뒤에 월 표시
        	changeYear: true, // 콤보박스에서 년 선택 가능
        	changeMonth: true, // 콤보박스에서 월 선택 가능
        	showOn: 'both', // 버튼을 표시하고, 버튼을 누르거나 input 클릭 시 달력 표시
        	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지 경로
        	buttonImageOnly: true, // 기존의 버튼의 회색 부분 없애고, 이미지 
        	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'], // 달력의 월 부분 텍스트
        	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 달력의 월 부분 Tooltip 텍스트
        	dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 부분 텍스트
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일 부분 Tooltip 텍스트
            minDate: "-1Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        });
        
        // 초기값을 오늘 날짜로 수정
        $("#datepicker").datepicker('setDate', 'today');
        
        // 수납관리 리스트 뿌려주기
        function selectBillFormList(num){
        	var tap = "";
        	var value = "";
        	var gender = "";
        	var genNum = "";
        	var indexNo = $(this).index() + 2;
        	var ssnYear = "";
        	var nowYear = new Date().getFullYear();
        	var age = 0;
        	switch(num){
        	case 2:
        		tap = "receiptWait";
        		break;
        	case 4:
        		tap = "receiptComp";
        		break;
        	}
        	$.ajax({
        		url:"selectBillFormList.bf",
        		type:"POST",
        		data:{num:num},
        		success:function(result){
        			$.each(result, function(i, obj){
        				genNum = obj.patientsPno.substring(7,8);
						ssnYear = obj.patientsPno.substring(0,2);
        				if(genNum == "1" || genNum == "3") {
							gender = "남";
							if(genNum == "1"){
								age = parseInt(nowYear) - (1900 + parseInt(ssnYear));
							} else {
								age = parseInt(nowYear) - (2000 + parseInt(ssnYear));
							}
						} else {
							gender = "여";
							if(genNum == "2"){
								age = parseInt(nowYear) - (1900 + parseInt(ssnYear));
							} else {
								age = parseInt(nowYear) - (2000 + parseInt(ssnYear));
							}
						}
        				value += "<tr>" +
        							"<td>" + indexNo + "</td>" + 
        							"<td>" + (obj.dose + obj.checkup + obj.operation + obj.radiation) + "</td>" + 
        							"<td>" + obj.patientsName + "</td>" + 
        							"<td>" + gender + "</td>" + 
        							"<td>" + age + "</td>" + 
        							"<td>" + obj.insurance + "</td>" + 
        							"<td>" + obj.adhd + "</td>" + 
        							"<td>정형외과</td>" + 
        							"<td>" + obj.chartNo + "</td>" + 
        							"<td>" + obj.mo + "</td>" + 
        							"<td>" + (obj.dose + obj.checkup + obj.operation + obj.radiation) + "</td>"; 
        				if(tap == "receiptWait"){
        					value += "<td>" + "</td>" + 
        							 "<td>" + "</td>" + 
        							 "<td>" + "</td>" + 
        							 "<td>" + "</td>" +
									 "<td>" + "</td>" + 
									 "<td>" + "</td>" +
									 "</tr>";
        				} else {
       						 value += "<td>" + "</td>" + 
							 		  "<td>" + "</td>" + 
       							      "</tr>";
        				}
        				indexNo += 1;
        				$("#"+tap + "Tab" + " tbody").html(value);
        			});
        		},error:function(){
        			console.log("ajax 통신 실패");
        		}
        	});
        	
        }
        
    </script>




</body>
</html>