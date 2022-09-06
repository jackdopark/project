<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!login }">
	<script>
		alert("회원만 이용 가능합니다.");
		location.href="login";
	</script>
</c:if>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

        <style type="text/css">
    	.blog__sidebar__item h4, .blog__sidebar__item ul li{
    		padding-left:10px;
    	}
    </style>
</head>

<body>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<jsp:include page="/template/bar.jsp"></jsp:include>
	<jsp:include page="/template/preloader.jsp"></jsp:include>
	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><a href="memberInfo" style="color:white;">My Page</a></h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>My Info</h4>
                            <ul>
                            	<li><a href="#">장바구니</a></li>
                                <li><a href="#">주문목록/배송조회</a></li>
                                <li><a href="updateMember">개인정보 확인/수정</a></li>
                                <li><a href="updatePwd">비밀번호 변경</a></li>
                                <li><a href="#">등급 혜택</a></li>
                                <li><a href="#">문의 내역</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="row" style="width:60%;">
					<div class="col-lg-12 col-md-12 col-sm-12" style="height:">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">OO월의 등급 </a></h5>
								<p>이번달 사용금액 - OO원</p>
								<p>다음 등급까지 남은 금액</p>
								<p>OOOO년 예상 등급</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">장바구니</a></h5>
								<ul>
									<li>asd</li>	
									<li>asd</li>	
									<li>asd</li>	
								</ul>
								<a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">주문/배송</a></h5>
								<ul>
									<li>asd</li>	
									<li>asd</li>	
									<li>asd</li>	
								</ul>
								<a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">내 문의내역</a></h5>
								<ul>
									<li>asd</li>	
									<li>asd</li>	
									<li>asd</li>	
								</ul>
								<p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
								<a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
							</div>
						</div>
					</div>
<!-- 기본틀					
 					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img src="img/blog/blog-2.jpg" alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
								<a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
							</div>
						</div>
					</div> -->
                </div><!-- row60 -->
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
   <jsp:include page="/template/footer.jsp"></jsp:include>
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