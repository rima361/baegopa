<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/header.jsp" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div style="background: #eee; padding-bottom: 50px; padding-top: 30px; ">
<div style="margin-left: auto;margin-right: auto;border: solid 1px #9999;width: 1200px;padding: 23px;background: #fff">
    <c:choose>
        <c:when test="${fav eq null}">
            <button id="islike" type="button" class="btn btn-outline-danger" onclick="favorite()" style="float: right;">
                <i class="fa fa-heart" aria-hidden="true"></i>
            </button>
            <button id="unlike" type="button" class="btn btn btn-outline-secondary" onclick="unlike(${fav.favoriteId})" style="float: right; display: none">
                <i class="fa fa-heart" aria-hidden="true"></i>
            </button>
        </c:when>
        <c:otherwise>
            <button id="unlike" type="button" class="btn btn btn-outline-secondary" onclick="unlike(${fav.favoriteId})" style="float: right;">
                <i class="fa fa-heart" aria-hidden="true"></i>
            </button>
            <button id="islike" type="button" class="btn btn-outline-danger" onclick="favorite()" style="float: right;display: none">
                <i class="fa fa-heart" aria-hidden="true"></i>
            </button>
        </c:otherwise>

    </c:choose>
   
    <div style="padding-left: 20px;text-align: center;">
        <span style="font-weight: 700; font-size: 32px;">${rest.title}
        <span style="font-weight: 400; font-size: 22px; color: #73818f;"> <c:choose>
         	<c:when test="${not empty rest.categoryName}">${rest.categoryName}</c:when>
         	<c:otherwise>기타</c:otherwise>
         </c:choose>
         </span>
        </span>
        <hr>
    </div>
       <div style="text-align: center;">
        	<img src="${rest.imgUrl}" style="width: 900px; height: 800px;"> 
        </div>
    <div style="height: 60px;"></div>
    <div style="padding-left: 20px;  line-height: 40px;">
        <div style="font-size:20px;"><i class="fa fa-map-marker" aria-hidden="true"></i><span style="margin-left:10px; font-weight: 500">${rest.address}</span></div>
          <c:choose>
            <c:when test="${rest.description eq null}">
                맛있는 음식점 입니다.
            </c:when>
            <c:otherwise>
                ${rest.description}
            </c:otherwise>
        </c:choose>
    </div>
    <div style="height: 30px;"></div>
    <div>
    	<div style="padding-left:20px;">
        <i class="fa fa-cutlery" aria-hidden="true"></i><span style="margin: 10px; font-size: 20px; font-weight: 500">메뉴판</span>
        </div>
        <div style="border: 1px solid #ccc; margin-left: 20px;margin-right: 20px; padding: 15px; margin-top: 14px;">
        	<c:if test="${rest.menuList.size() < 1}"><span style="color:red">메뉴 정보가 없습니다.</span></c:if>
            <c:forEach items="${rest.menuList}" var="menu">
                <div style="font-size: 18px; font-weight: 400;line-height: 23px;padding-top: 12px;padding-bottom: 12px;">${menu.menuName} <span style="float:right;">
                <i class="fa fa-krw" aria-hidden="true"></i>&nbsp;<fmt:formatNumber value="${menu.price}" pattern="#,###.##"/></span>
                </div>
            </c:forEach>
        </div>
    </div>
    <div style="margin: 20px;margin-top: 50px;">
        <c:forEach items="${rest.hashTagList}" var="hash">
            <button type="button" class="btn btn-warning"
                    style="font-size: 16px; border: 1px solid #eee; background: #eee; margin: 6px"
                    onclick="tagSearch('${hash.hashTagName}')">#${hash.hashTagName}</button>
        </c:forEach>
    </div>

  	
    <div style="margin: 20px;margin-top: 100px;">
    	<div style="font-size:20px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span style="margin-left:10px; font-weight:500">후기</span></div>
        <div>
            <div class="brand-card-body">
                <div id="reviewRa" class="starRev">
                    <span class="starR on">1</span> <span class="starR">2</span>
                    <span class="starR">3</span> <span class="starR">4</span>
                    <span class="starR">5</span>
                </div>
            </div>
        </div>
        <div class="form-inline">
  			<div style="width:100%; text-align: right;">
  				600자까지 가능합니다
  			</div>
            <textarea class="form-control" id="review_content" name="review_content" rows="4" cols="220" placeholder="음식후기를 남겨주세요."></textarea>
            <button type="submit" class="btn btn-primary" onclick="review_submit()" style="font-weight: 500;font-size: 19px; height: 60px; background: #ffc107; 
             margin-top: 10px; width: 100%; border: 0;">입력</button>
        </div>

        <div id="review-box" tyle="border-bottom: solid 0.05px #999; padding-bottom: 20px;">
            <c:forEach items="${reviews}" var="review">
                <div id="review_div${review.reviewId}"
                     style="margin-top: 20px; padding-bottom: 20px; padding-top: 20px;">
                    <hr/>
                    <c:choose>
                    <c:when test="${review.useYn == 'N'}">
                    <div style="color:red;">관리자에 의해 차단된 글입니다.</div>
                        <c:if test="${user.type == 'a'}">
                        <span style="font-size: 14px; color: #666; float: right;">
                                    <a href="javascript:review_show(${review.reviewId})" style="color: #545c63;"
                                       class="afont"> 보이기 </a>
                                </span>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                    <span style="font-weight: 500"> ${review.name}
						<span style="font-size: 14px; color: #666;"> 
							<fmt:formatDate value="${review.creationDate}" pattern="yyyy-MM-dd"/>
						</span>
                        <div id="star${review.reviewId}_none" class="sta" style="padding-top:20px;">
                            <c:forEach var="item" begin="1" end="5" step="1" varStatus="status">
                                <span class="starR<c:if test="${status.count <= review.rating}"> on </c:if>">${status.count}</span>
                            </c:forEach>
                        </div>
                        <div id="star${review.reviewId}_on" class="starRev" style="display: none; padding-top:20px;">
                            <c:forEach var="item" begin="1" end="5" step="1" varStatus="status">
                                <span class="starR<c:if test="${status.count <= review.rating}"> on </c:if>">${status.count}</span>
                            </c:forEach>
                        </div>
                        <c:choose>
                            <c:when test="${ review.userId == user.id }">
                                <span style="font-size: 14px; color: #666; float: right;">
                                    <a href="javascript:review_update(${review.reviewId})" style="color: #545c63;"
                                       class="afont"> 수정 </a>
                                    <a href="javascript:review_remove(${review.reviewId})" style="color: #545c63;"
                                       class="afont"> 삭제 </a>
                                </span>
                            </c:when>

                            <c:when test="${user.type == 'a'}">
                                <span style="font-size: 14px; color: #666; float: right;">
                                    <a href="javascript:review_hide(${review.reviewId})" style="color: #545c63;"
                                   class="afont"> 가리기 </a>
                                </span>
                            </c:when>
                        </c:choose>
					</span>
                    <div id="content${review.reviewId}" style="margin-top: 20px;">${review.contents}</div>
                    <div id="div${review.reviewId}" style="display: none;">
                        <textarea id="text${review.reviewId}"
                                  style="margin-top: 20px; width: 100%; border: 1px solid #ced4da; border-radius: 3px; height: 78px;"
                                  cols="9"></textarea>
                        <button type="button" class="btn btn-warning" onclick="update(${review.reviewId})"
                                style="margin-top: 20px;">저장
                        </button>
                    </div>
                    </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</div>
<%@include file="include/footer.jsp" %>

<!-- JAVASCRIPT -->
<script>
	$(document).ready(function () {
		star_update();
	})
    
    function star_update() {
        $('.starRev span').click(function () {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            return false;
        });
    }

    var favId;
    function favorite() {
        var data = {
            restaurantId: "${restId}"
        };

        $.ajax({
            url: "/favorite/save.api",
            type: 'POST',
            dataType: "json",
            processData: true,
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (data) {
                favId = data.favoriteId;
                console.log(favId)
                $("#unlike").show();
                $("#islike").hide();
            }
        });
    }

    function search() {
        var query = $("#query").val();
        location.href = "/?query=" + query;
    }

    function searchCategory() {
        location.href = "/?categoryId=" + $("select[name=category] option:selected").val();
    }

    function update(id) {
        var star = $("#star" + id + "_on span.starR.on").last().html();
        var content = escape($("#text" + id).val());

        var data = {
            rating: star,
            reviewId: id,
            contents: content
        };

        $.ajax({
            url: "/restaurant/review/update.api",
            type: 'POST',
            dataType: "json",
            processData: true,
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (data) {
                // $("#content" + id).html($("#text" + id).val());
                // $("#content" + id).show();
                // $("#div" + id).hide();
                location.reload();
            }
        });
    }

    function review_update(id) {
        $('#text' + id).val(unEscape($("#content" + id).html()));
        $("#content" + id).hide();
        $("#div" + id).show();
        $("#star" + id + "_none").hide();
        $("#star" + id + "_on").show();
    }

    function review_submit() {
        var star = $('#reviewRa span.starR.on').last().html();
        var review_content = escape($('#review_content').val());

        if (review_content.length < 1) {
            alert("리뷰를 입력해주세요.")
            return false;
        }
        
        if (review_content.length > 600) {
            alert("600자가 넘어 갔습니다.");
            return false;
        }

        var data = {
            rating: star,
            restaurantId: ${restId},
            userId: ${user.id},
            contents: review_content
        }

        var template = "<div id='review_div@리뷰'><hr /><span style=\"font-weight: 500\">@글쓴이 <span style=\"font-size: 14px; color: #666;\">@날짜</span>" +
            "@별<span style=\"font-size: 14px; color: #666; float: right;\">\n" +
            "\t\t\t\t\t\t\t\t<a href=\"javascript:review_update(@리뷰)\" style=\"color: #545c63;\" class=\"afont\"> 수정 </a> \n" +
            "\t\t\t\t\t\t\t\t<a href=\"javascript:review_remove(@리뷰)\" style=\"color: #545c63;\" class=\"afont\"> 삭제 </a>\n" +
            "\t\t\t\t\t\t\t</span></span>" +
            "<div id='content@리뷰' style='margin-top: 20px;'>@댓글내용</div>" +
            "<div id='div@리뷰' style='display: none;'>" +
            "<textarea id='text@리뷰'" +
            "style='margin-top: 20px; width: 100%; border: 1px solid #ced4da; border-radius: 3px; height: 78px;'" +
            "cols='9'></textarea>" +
            "<button type='button' class='btn btn-warning' onclick='update(@리뷰)' style='margin-top: 20px;'>저장</button></div></div>";

        var raitingTemplate = "<div id=\"star@리뷰_none\" class=\"sta\" style=\"padding-top:20px;\">@별</div>\n" +
            "\t\t\t\t\t<div id=\"star@리뷰_on\" class=\"starRev\" style=\"display: none; padding-top:20px; \">@별</div>";
        var startOnTemplate = "<span class=\"starR on\">@count</span>";
        var startTemplate = "<span class=\"starR\">@count</span>";


        var url = "/restaurant/review.api";
        $.ajax({
            url: url,
            type: 'POST',
            dataType: "json",
            processData: true,
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (data) {
                console.log(data);
                if (data.reviewId < 1) {
                    alert("이미 작성 하셨습니다.")
                } else {
                    //console.log(data);
                    var date = moment.unix(data.creationDate / 1000).format("YYYY-MM-DD");
                    //console.log(data);
                    $('#review_content').val("");
                    $('.starRev span').parent().children('span').removeClass('on');

                    var stars = "";
                    for (var j = 0; j < star; j++) {
                        stars = stars + startOnTemplate.replace("@count", j + 1);
                    }

                    for (var z = 0; z < 5 - star; z++) {
                        stars = stars + startTemplate.replace("@count", 5 - z);
                    }

                    $('#review-box').prepend(
                        template.replace("@글쓴이", data.name).replace("@날짜", date).replace(/@별/gi, raitingTemplate.replace(/@별/gi, stars))
                            .replace("@댓글내용", data.contents)
                            .replace(/@리뷰/gi, data.reviewId)
                    );
                	star_update();
                }
            }
        });
    }

    function review_remove(reviewId) {
        var url = "/restaurant/review.api?reviewId=" + reviewId;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: "json",
            processData: true,
            success: function (data) {
                $('#review_div' + reviewId).remove();
            }
        });
    }

    function tagSearch(query) {
        location.href = "/?query=" + query;
    }

    function escape(content) {
        if (content == null || content == "" || content == undefined)
            return "";
        content = content.replace(/</g, "&lt;").replace(/>/g, "&gt;");
        content = content.replace(/(?:\r\n|\r|\n|\\n)/g, '<br />');
        content = content.replace(/(javascript)/ig, "javas cript");
        content = content.replace(/\\/g, "");
        return content;
    }

    function unEscape(content) {
        if (content == null || content == "" || content == undefined)
            return "";
        content = content.replace(/&lt;/g, "<").replace(/&gt;/g, ">");
        content = content.replace(/<br>/g, '\n');
        return content;
    }

    function unlike(id) {
        if(id == null || id == undefined) {
            id = favId;
        }

        $.ajax({
            url: "/favorite/delete.api/" + id,
            type: 'GET',
            dataType: "json",
            success: function (data) {
                $("#islike").show();
                $("#unlike").hide();
            }
        });
    }
    
    function review_hide(reviewId) {
        var url = "/restaurant/review/hide.api?reviewId=" + reviewId;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: "json",
            processData: true,
            success: function (data) {
                $('#content' + reviewId).remove();
                var template = "<div id='review_div" +reviewId+ "' style='margin-top: 20px; padding-bottom: 20px; padding-top: 20px;'><hr/>" +
	                			"<div style=\"color:red;\">관리자에 의해 차단된 글입니다.</div>" +
                    " <span style=\"font-size: 14px; color: #666; float: right;\">\n" +
                    "                                    <a href=\"javascript:review_show("+reviewId+")\" style=\"color: #545c63;\"\n" +
                    "                                   class=\"afont\"> 보이기 </a>\n" +
                    "                                </span>";
                $('#review_div' + reviewId ).html(template);
            }
        });
    }

    function review_show(reviewId) {
        var url = "/restaurant/review/show.api?reviewId=" + reviewId;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: "json",
            processData: true,
            success: function (data) {
                location.reload();
            }
        });
    }

</script>