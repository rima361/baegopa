package com.spring.hungry.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Review {
	private long reviewId;
	private long restaurantId;
	private long userId;
	private String name;
	private String contents;
	private int rating;
	private String useYn;
	private Timestamp creationDate;
	private Timestamp lastUpdateDate;
}
