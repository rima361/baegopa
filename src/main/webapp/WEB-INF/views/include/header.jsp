<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="description"
          content="CoreUI - Open Source Bootstrap Admin Template">
    <meta name="author" content="Łukasz Holeczek">
    <meta name="keyword"
          content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
    <title>Hungry</title>
    <!-- Icons-->
    <!-- Main styles for this application-->
    <link href="/css/style.css" rel="stylesheet">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

</head>
<style>
    @import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
    :lang(ko) {
        font-family: 'Noto Sans KR', sans-serif;
    }
    .starR {
        background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
        background-size: auto 100%;
        width: 20px;
        height: 20px;
        display: inline-block;
        text-indent: -9999px;
        cursor: pointer;
    }

    .starR.on {
        background-position: 0 0;
    }

    .xBtn {
        position: absolute;
        width: 25px;
        height: 25px;
        top: 1px;
        right: 0px;
    }

    .xB:hover {
        opacity: 0.2 ;
    }

    ::placeholder {
  		font-size: 0.5em;
	}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
        crossorigin="anonymous"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://rawgit.com/moment/moment/2.2.1/min/moment.min.js"></script>

<body lang="ko"
        class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
<header class="app-header navbar" style="border-bottom: solid 1px #ddd; padding-bottom: 10px;">
    <div style=" width: 100%;">
        <a href="/" style="margin-left: 40px; font-size: 30px; color: #555555">
            <img src="/img/logo.png" style="width: 58px;    margin-top: -8px;">배고파
            <img src="/img/logo.png" style="width: 58px;margin-left: -8px; margin-top: -8px;">
        </a>
        <div style="display: flex; float: right; margin-left: 30%;">
            <div style="margin-top: 10px; display: flex; width: 120px; font-weight: 600;">
                <img src="/img/shipp.png" style="margin-left: 10px; width: 30px; height:30px ">
                <input name="delivery" type="checkbox" class="form-check" value="Y"
                       style="margin-left: 10px;margin-right: 10px;margin-top: 5px;" onclick="getRestaurantList()">
            </div>
            <select name="category" class="form-control" type="text" placeholder="category" onchange="searchCategory()"
                    style="width: 170px; margin-top: 8px; border: solid 1px #ccc; height: 35px; font-size: 12px;">
                <option value="">카테고리 전체</option>
                <c:forEach items="${categoryList}" var="c">
                    <option value="${c.categoryId}" <c:if test="${categoryId == c.categoryId}"> selected </c:if>>${c.name}</option>
                </c:forEach>
            </select> 
            <input id="query" class="form-control" type="text" placeholder="음식점명이나 태그명을 입력해주세요" value="${query}" style="margin-left: 2%; width: 250px; margin-top: 8px; border: solid 1px #ccc; height: 35px;"/>
            <a href="javascript:search()"  onkeyup="search()" style="margin-left: 1%; border: 0; margin-top: 8px; height: 34px; font-size: 14px;">
                <img src="/img/dot.png" style="margin-left: 10px; width: 30px;">
            </a>
            <a href="/logout"
               style="margin-left: 1%; border: 0; margin-top: 8px; height: 34px; font-size: 14px;">
                <img src="/img/out.png" style="margin-left: 10px; width: 30px;">
            </a>
        </div>
    </div>
</header>
<div class="app-body">
    <main class="main" style="margin-left: 0px;">