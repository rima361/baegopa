<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <div style="font-weight: 500; margin-top: 20px; border: 0px; text-align: center; width: 100%; font-size: 25px;">
        내 주변 맛집
        <hr style="width: 25%; margin-bottom: 4%; height: 2px; background: #666;">
    </div>
<div class="container-fluid" style="padding: 0 15%;">
    <div id="restList" class="row" style="width: 1725px;
    margin-left: auto;
    margin-right: auto;">

    </div>
<script>
    var isPageable = true;
    var page = 1;
    var template = " <a href='/restaurant/@아이디' style=\"margin-left: auto; margin-right: auto; \">" +
        "<div style=\"float: left;margin-left: 20px; margin-right: 20px; margin:30px;width: 320px;border: solid 1px #c8ced3;\">\n" +
        "            <div class=\"brand-card-header\" style=\"height: 420px; background: #fff; background-size: 100%; background-image: url('@이미지')\">\n" +
        "                <div class=\"\">\n" +
        "                    <div class=\"chart-wrapper\" style=\"text-align: center;background: #fff;height: 181px;margin-top: 240px;border-bottom: 1px solid #dadada;\">\n" +
        "                        <div class=\"starRev\" style=\"margin-top: 5%;\">\n" +
        "                                   @별" +
        "                        </div>\n" +
        "                        <div style=\"margin-top: 1%; padding: 5%;\">\n" +
        "                            <span style=\"color: #333; font-size: 18px; font-weight: 500\">@음식점</span>\n" +
        "                            <div style=\"color: #555; font-size: 12px;margin-top: 4px;text-overflow:ellipsis;\n" +
        "white-space:nowrap;\n" +
        "word-wrap:normal;overflow:hidden;\">@설명</div>\n" +
        "                        </div>\n" +
        "                        <div style=\"text-align: left;padding-left: 5%;\">\n" +
        "                           @태그  " +
        "                        </div>\n" +
        "                    </div>\n" +
        "                </div>\n" +
        "            </div>\n" +
        "        </div></a>";

    var tagTemplate = "<div style=\"font-size: 13px;padding: 2px 5px;background: #f0f0f0;font-weight: 500;color: #666; margin-left: 3%;text-overflow:ellipsis;\n" +
        "white-space:nowrap;\n" +
        "word-wrap:normal;\n" +
        "max-width:80px;" +
        "min-width:40px;float: left;\n" +
        "overflow:hidden;\">#@태그</div>";
    //var tagTemplate = "<span style=\"font-size: 13px;padding: 2px 5px; background: #ffc107; font-weight: 500;color: #f8f9fa; margin-left: 3%;\">#@태그</span>";
    var startOnTemplate = "<span class=\"starR on\">@count</span>";
    var startTemplate = "<span class=\"starR\">@count</span>";
    var query;
    var categoryId;
    var delivery;

    $(document).ready(function () {
        <c:if test="${not empty query}">
        query = '${query}'
        </c:if>
        <c:if test="${not empty categoryId}">
        //console.log("ddd")
        categoryId = '${categoryId}'
        </c:if>
        <c:if test="${not empty delivery}">
        delivery = '${delivery}'
        </c:if>

        getRestaurantList();

        /*
        	스크롤이 발생할때마다 밑에가 실행
        	문서의 전체 높이 : $(document).height()
         */
        $(document).scroll(function () {
            if (isPageable && $(window).scrollTop() + 2000 > $(document).height()) {
                getRestaurantList();
            }
        });
    });

    function searchCategory() {
        categoryId = $("select[name=category] option:selected").val();
        $("#restList").html("");
        page = 1;
        search();
    }

    function selectCategory(id) {
        categoryId = id;
        $("#restList").html("");
        page = 1;
        search();
    }

    function search() {
        query = $("#query").val();
        $("#restList").html("");
        page = 1;
        getRestaurantList();
    }


    var isSending = true;
    function getRestaurantList() {
        if (!isSending) {
            return
        }
        isSending = false;
       delivery = $("input[name=delivery]:checked").val();

        var url = "/restaurant/list.api?page=" + page;
        if (query != null && query != '') {
            url = url + "&query=" + query;
        }

        if (delivery != null && delivery != '') {
            url = url + "&delivery=" + delivery;
        }

        if (categoryId != null && categoryId != '') {
            url = url + "&categoryId=" + categoryId;
        }

        $.ajax({
            url: url,
            type: 'GET',
            dataType: "json",
            success: function (json) {
                isSending = true;
                if (json.length > 0) {
                    for (i in json) {
                        var stars = "";
                        for (var j = 0; j < json[i].rating; j++) {
                            stars = stars + startOnTemplate.replace("@count", j + 1);
                        }

                        for (var z = 0; z < 5 - json[i].rating; z++) {
                            stars = stars + startTemplate.replace("@count", 5 - z);
                        }

                        var tags = "";
                        var tagSize = 3;
                        if (3 < json[i].hashTagList.length) {
                            tagSize = 3
                        } else {
                            tagSize = json[i].hashTagList.length;
                        }

                        for (var t = 0; t < tagSize; t++) {
                            tags = tags + tagTemplate.replace("@태그", json[i].hashTagList[t].hashTagName);
                        }


                        /* 음식점 중에 설명이 없는 음식점도 있어서, 그럴경우에는 주소로 대체 */
                        var desc = json[i].description;
                        if (desc == null) desc = json[i].address;

                        var title = json[i].title;

                        if(json[i].deliveryYn == 'Y') {
                            title = title + "<div style='color: #9f191f;font-size: 13px;'>(배달 가능)</div>"
                        }
						var img = json[i].imgUrl;
						if(img == '' || img == null) {
							img = '/img/default.png'
						}
                        
                        $("#restList").append(
                            template.replace("@음식점", title).replace("@아이디", json[i].restaurantId)
                                .replace("@별", stars).replace("@태그", tags).replace("@설명", desc).replace("@이미지", img)
                        );
                    }
                    page = page + 1;
                } else {
                    isPageable = false;
                }
            }
        });
    }
</script>