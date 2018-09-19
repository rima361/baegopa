<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<div class="container-fluid"
	style="padding-top: 25px; background-size: 100%; height: 530px; border-bottom: 1px solid #eee; background: #eee;">
	<div
		style="font-weight: 500; margin-top: 20px; border: 0px; text-align: center; width: 100%; font-size: 25px;">
		자주 찾는 맛집
		<hr
			style="width: 25%; margin-bottom: 4%; height: 2px; background: #666;">
	</div>
	<div class="animated fadeIn">
		<div class="row">
			<div style="width: 100%;">
				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<c:forEach items="${favList}" var="fav" varStatus="status">
							<c:if test="${status.count % 3 == 1}">
								<div
									class="carousel-item <c:if test="${status.count == 1}"> active </c:if>"
									style="width: 93%;">
									<div style="display: inline-flex; width: 100%;">
							</c:if>
							<div class="brand-card"
								style="float: left; margin-left: auto; margin-right: auto; width: 245px; border: 0;">
								<div class="brand-card-header"
									style="width: 400px; height:250px;position: relative; background-size: 100%; background-image: url('${fav.imgUrl}')">
									<a class="xB" href="/favorite/delete/${fav.favoriteId}"
										style="margin-top: -200px; margin-right: -340px; z-index: 99999">
										<img src="/img/x_btn.png" style="width: 30px; height: 30px; z-index: 999999;">
									</a>
									<div class="brand-card-body">
										<a href="/restaurant/${fav.restaurantId}"
											style="margin-left: auto; margin-right: auto;">
											<div class="chart-wrapper" style="text-align: center;">
												<div
													style="margin-top: 10%; padding: 5%; background-color: rgba(255, 255, 255, 0.6);">
													<span
														style="color: #000000; font-size: 25px; font-weight: 600;">${fav.title}</span>
													<div
														style="color: #000000; font-size: 15px; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; overflow: hidden; margin-top: 10px">
														${fav.address}</div>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
							<!-- 3의 배수이면, 리스트가 다 찼으니까 디브를 닫아버린다 -->
							<c:if
								test="${status.count % 3 == 0 or status.count == favList.size()}">
					</div>
				</div>
				</c:if>
				</c:forEach>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev" style="height: 90px; top: 80px;">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next" style="height: 90px; top: 80px;">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>

</div>
</div>