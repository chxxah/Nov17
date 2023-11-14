<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Find ID</title>
<link href="./css/findPW.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">

	$(function(){
		$("#copyPW").hide();

		
		$("#findPWBtn").click(function(){
			let notNum = /[^0-9]/g;
			let kor = /[가-힣]/;
			let special = /[^a-zA-Z0-9가-힣]/;
			let mname = $("#mname").val();
			let mid = $("#mid").val();
			let checkMrrn = $("#firstMrrn").val() + $("#lastMrrn").val();
			let mrrn = $("#firstMrrn").val() + "-" + $("#lastMrrn").val();
			
			$("#nameInfo").text("");
			$("#idInfo").text("");
			$("#mrrnInfo").text("");
			$("#findPWInfo").text("");
			$("#findPWInfo2").text("");
			
		    if (mname == "") {
		        $("#nameInfo").text("이름을 입력해주세요.");
		        $("#nameInfo").css("color","red");
		        return;
		    }
		    
		    if (!kor.test(mname)) {
		        $("#nameInfo").text("한글만 입력 가능합니다.");
		        $("#nameInfo").css("color","red");
		        return;
		    }
		    
		    if (mid == "") {
		        $("#idInfo").text("아이디를 입력해주세요.");
		        $("#idInfo").css("color","red");
		        return;
		    }
		    
		    if (mid.length < 4) {
		        $("#idInfo").text("아이디는 4글자 이상입니다.");
		        $("#idInfo").css("color","red");
		        return;
		    }
		    
		    if (special.test(mid)) {
		        $("#idInfo").text("아이디에 특수문자는 허용되지 않습니다.");
		        $("#idInfo").css("color", "red");
		        return;
		    }
		    
		    if (checkMrrn == "") {
		        $("#mrrnInfo").text("주민번호를 입력해주세요.");
		        $("#mrrnInfo").css("color","red");
		        return;
		    }
		    
		    if(notNum.test(checkMrrn) || checkMrrn.length !== 13) {
		        $("#mrrnInfo").text("올바른 주민번호를 입력해주세요.");
		        $("#mrrnInfo").css("color","red");
		        return;
		    }
		    
		    //ajax
		    $.ajax({
                url: "./findPW",
                type: "post",
                data: {"mname": mname, "mid": mid, "mrrn" : mrrn},
                dataType: "json",
                success: function(data){
                	
                    if(data.findPW.mname != null || data.findPW.mid != null || data.findPW.mrrn !=null){
                        $("#findPWInfo").css("color","green");
                        $("#findPWInfo").html(data.findPW.mname + " 님의 비밀번호는" + data.findPW.mpw + "입니다.  ");
                        let pw = data.findPW.mpw;
                        
                        if ($("#copyPWBtn").length === 0) {
                            const copyBtn = $("<button id='copyPWBtn'>복사하기</button>");
                            $("#findPWInfo").append(copyBtn);
                            
                            copyBtn.click(function() {
                                const pwText = pw;
                                copyToClipboard(pwText);
                                alert("비밀번호가 클립보드에 복사되었습니다.");
                            });
                        }

                        function copyToClipboard(text) {
                            const textarea = document.createElement("textarea");
                            textarea.value = text;
                            document.body.appendChild(textarea);
                            textarea.select();
                            document.execCommand("copy");
                            document.body.removeChild(textarea);
                        }
                        
                      } else {
                    	    alert("일치하는 정보가 없습니다.");
                    	    $("#findPWInfo").html("<div class='form-area'><div class='form'><span>회원가입이 필요하신가요? </span><a href='./join'>&nbsp;&nbsp;회원가입 하러 가기</a></div></div>");
                    	}

                }, 
                error : function(error){
                    alert("에러가 발생했습니다." + error);
                }//에러끝
            });//ajax 끝
		}); //findIDBtn 끝
	}); //function 끝
</script>

</head>
<body>
	<header></header>
	
	<!-- 본문내용 -->
	<main>
		<div class="center-circle-area">
			<div class="center-circle">
				<div class="center-img">
					<img alt="없음" src="/img/hospital2.png" onclick="location.href='/main'">
				</div>
			</div>
		</div>	
	
		<div class="top-area">
			<p class="top-title">비밀번호가 기억나지 않으세요? 🔐</p>
		</div>
		<div class="input-area">
			<p>이름</p>
			<input type="text" id="mname" name="mname" placeholder="이름을 입력해주세요." maxlength="11">
			<p id="nameInfo" class="info" ></p>
		</div>
		<div class="input-area">
			<p>아이디</p>
			<input type="text" id="mid" name="mid" placeholder="아이디를 입력해주세요." maxlength="11">
	    	<p id="idInfo" class="info"></p>
    	</div>
   	 	<div class="input-area">
			<p>주민등록번호</p>
			<input type="text" id="firstMrrn" name="firstMrrn" maxlength="6" placeholder="960614">-
			<input type="text" id="lastMrrn" name="lastMrrn" maxlength="7" placeholder="2XXXXXX">
			<p id="mrrnInfo" class="info"></p>
			<p id="findPWInfo" class="info"></p>
			<p id="findPWInfo2" class="info"></p>
		</div>
		<button class="button" type="button" id="findPWBtn">비밀번호 찾기</button>
		<div class="bottom-area">
			<div class="bottom"><a href="./login">&nbsp;&nbsp;로그인 하러가기</a></div>
		</div>
	</main>	
</body>
</html>