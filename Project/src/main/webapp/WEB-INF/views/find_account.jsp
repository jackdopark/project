<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>아이디/비밀번호 찾기</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
    <style type="text/css">
		.find, .idresult, .pwdresult{
			width:100%;
			margin:20px 10px;
		}
		.site-btn{width:100%;}
		.checkout__input{margin-bottom:10px;}
		.btm{margin-bottom:30px;}
		h4{margin-bottom:10px !important;}
		input[type=radio]{width:15px;position: relative;top: -10px;}
		/* .find{position: relative;top: 0px;} */
		.fradio{height:30px;display: flex; justify-content: space-around;}
		/* .idresult, .pwdresult{display:none;} */
		.log_btn{display:flex;justify-content: space-between;}
    	.idresult .site-btn{width:45%;}
    </style>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
    	$(function(){
    		$(".idresult").hide();
    		$(".pwdresult").hide();
    		$("input[type=radio]").change(function(){
    			var status = $("#fid").prop("checked") ? 0 : 1;
    			
    			if(status == 0){
    				if($(".div_id").length > 0){
    					$(".div_id").remove();
    				};
    			}else{
    				if($(".div_id").length == 0){
    					$("#name").parent().prepend("<div class='checkout__input div_id'><label for='id'>아이디</label><input type='text' name='id' id='id'></div>");
    				};
    			}
    		}); //id 양식 추가하기
    		
    		$(".findfrm").submit(function(e){
    			e.preventDefault();
    			var status = $("#fid").prop("checked") ? 0 : 1;
    			//check();
    			//if(status == 1){    			
    				//id check추가
    			//}
    			
    			var d = $(this).serialize();
    			d = d + "&status=" + status;
    			$.ajax({
    				url:"findAccount.do",
    				data:d,
    				type:"POST",
    				dataType:"json",
    				success:function(r){
    					if(r.result == 0){alert("일치하는 계정이 없습니다.");}
    					else{
    						$(".find").hide();
    						if(status == 0){
    							alert("실행");
    							$(".idtext").html("<p>아이디는 ["+r.id+"] 입니다.</p>");
    							$(".idresult").show();
    						}else{
    							$("#id").val(r.id);
    							$(".pwdresult").show();
    						}//elseif
    					}//else
    			
    				}//func
    			});//ajax
    		});//find sub
    		
    		$(".findPwdChange").submit(function(e){
    			e.preventDefault();
    			
    		})//chan
    	})
    	//id, pwd 유효성 검사
    	//pwd 변경 ajax >> alert 이후 닫기
    	//id찾기 결과창의 닫기버튼 및 이전으로 버튼 작업 처리
    </script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="checkout__form find">
        	<h4>아이디/비밀번호 찾기</h4>
        	<div class="checkout__input fradio">
				<input type="radio" id="fid" name="find" checked="checked">
				<label for="fid">아이디 찾기</label>
				
				<input type="radio" id="fpwd" name="find">
				<label for="fpwd">비밀번호 찾기</label>
			</div>
            <form class="findfrm">
            	<div class="row" style="float: none; margin:0 auto;">
                	<div class="col-lg-10 col-md-6" style="float: none; margin:0 auto;">
                        <div class="checkout__input">
                            <label for="name">이름</label>
                        	<input type="text" name="name" id="name">
                        </div>
                        <div class="checkout__input btm">
                        	<label for="tel">연락처</label>
                        	<input type="text" name="tel" id="tel">
                        </div>
                        <div class="checkout__input">
	                    	<button type="submit" class="site-btn">찾기</button>
                        </div>
                	</div>
            	</div>
        	</form>
    	</div>
    	
    	<div class="checkout__form idresult">
        	<h4>아이디/비밀번호 찾기</h4>
            <div class="row" style="float: none; margin:0 auto;">
            	<div class="col-lg-10 col-md-6" style="float: none; margin:0 auto;">
                    <div class="checkout__input idtext">
                       	
                    </div>
                    <div class="checkout__input">
	                  	<button type="button" class="site-btn back">이전으로</button>
	                  	<button type="button" class="site-btn cls">닫기</button>
	                </div>
               	</div>
           	</div>
    	</div>
    	
    	<div class="checkout__form pwdresult">
        	<h4>아이디/비밀번호 찾기</h4>
            <form class="findPwdChange">
            <input type="hidden" id="id">
            	<div class="row" style="float: none; margin:0 auto;">
                	<div class="col-lg-10 col-md-6" style="float: none; margin:0 auto;">
                        <div class="checkout__input">
                            <label for="pwd">바꿀 비밀번호</label>
                        	<input type="password" name="pwd" id="pwd">
                        </div>
                        <div class="checkout__input">
                        	<label for="pwd2">비밀번호 확인</label>
                        	<input type="password" name="pwd2" id="pwd2">
                        </div>
                        <div class="checkout__input">
	                    	<button type="submit" class="site-btn">변경하기</button>
                        </div>
                	</div>
            	</div>
        	</form>
    	</div>
    	
	</div>
</div>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>