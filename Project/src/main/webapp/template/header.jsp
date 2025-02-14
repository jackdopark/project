<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<!-- Header Section Begin -->
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i> admin@project.com</li>
							<li>테스트문구위치</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__top__right">
						<c:if test="${!login }">
							<div class="header__top__right__auth" style="margin-right: 5px;">
								<a href="login">로그인</a>
							</div>
							<div class="header__top__right__auth">
								<a href="register">회원가입</a>
							</div>
						</c:if>
						<c:if test="${login }">

							<div
								class="header__top__right__language header__top__right__auth">
								<a href="memberInfo"><i class="fa fa-user"></i> ${loginDTO.name }</a>
							</div>
							<div class="header__top__right__language">
								<div>My Page</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="memberInfo">마이페이지</a></li>
									<li><a href="#">주문목록</a></li>
									<li><a href="#">문의하기</a></li>
									<li><a href="#">공지사항</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<a href="logout.do"> 로그아웃</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="/"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul>
						<li><a href="/">Home</a></li>
						<li class="active"><a href="shopList">Shop</a></li>
						<li><a href="#">Category</a>
							<ul class="header__menu__dropdown">
								<li><a href="#">Computer</a></li>
								<li><a href="#">Smart Phone</a></li>
								<li><a href="#">Game Device</a></li>
							</ul></li>
						<li><a href="#">Service</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</nav>
			</div>
			<c:if test="${login }">
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<!--<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>-->
						<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
					</ul>
					<!-- <div class="header__cart__price">item: <span>$150.00</span></div> -->
				</div>
			</div>
			</c:if>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<!-- Header Section End -->