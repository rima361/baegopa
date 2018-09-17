<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp" %>
<main class="main">

	<ol class="breadcrumb">
		<li class="breadcrumb-item">즐겨찾기</li>
	</ol>
	<div class="container-fluid">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-sm-6 col-lg-3">
					<div class="card text-white bg-info">
						<div class="card-body pb-0" style="margin-top: -10px;  margin-right: -5px;">
							<div style="width: 45px;float: right;background: #f63c3a;text-align: center;">삭제</div>
							<button class="btn btn-transparent p-0 float-right" type="button">
								<i class="icon-location-pin"></i>
							</button>
							<div></div>
						</div>
						<div class="chart-wrapper mt-3 mx-3" style="height:70px;">
							<canvas class="chart" id="card-chart2" height="70"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item">음식점 리스트</li>
	</ol>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6 col-lg-3">
				<div class="brand-card">
					<div class="brand-card-header bg-facebook">
						<i class="fa fa-facebook"></i>
						<div class="chart-wrapper">
							<canvas id="social-box-chart-1" height="90"></canvas>
						</div>
					</div>
					<div class="brand-card-body">
						<div>
							<div class="text-value">89k</div>
							<div class="text-uppercase text-muted small">friends</div>
						</div>
						<div>
							<div class="text-value">459</div>
							<div class="text-uppercase text-muted small">feeds</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%--<%@include file="include/footer.jsp" %>--%>