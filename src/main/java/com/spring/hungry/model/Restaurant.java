package com.spring.hungry.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Restaurant {
	private long restaurantId;
	private long categoryId = 0;
	private String title;
	private String description;
	private String categoryName;
	private String tel;
	private String address;
	private String deliveryYn;
	private int rating;
	private String imgUrl;
	private String useYn;
	private Timestamp creationDate;
	private long createdBy;
	private Timestamp lastUpdateDate;
	private long lastUpdateBy;
	private List<HashTagMapping> hashTagList = new ArrayList<HashTagMapping>();
	private List<Menu> menuList = new ArrayList<Menu>();

	public String getAddress() {
		if (this.address == null || this.address == "") {
			return "맛집입니다.";
		}
		return this.address;
	}

	public String getImgUrl() {
		if (this.imgUrl == null || "".equals(this.imgUrl)) {
			return "/img/default.png";
		}

		if (this.imgUrl != null && this.imgUrl.contains("type=")) {
			return this.imgUrl.split("type=")[0];
		}
		return this.imgUrl;
	}
}