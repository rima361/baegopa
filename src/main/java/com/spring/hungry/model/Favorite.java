package com.spring.hungry.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Favorite {
	private Long favoriteId;
	private Long restaurantId;
	private String title;
	private String address;
	private String useYn = "Y";
	private String imgUrl;
	private Long userId;
	private Timestamp creationDate = Timestamp.valueOf(LocalDateTime.now());

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