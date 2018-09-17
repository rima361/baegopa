package com.spring.hungry.model;

import java.util.List;

import lombok.Data;

@Data
public class NaverLocalInfoResponse {
	private String lastBuildDate;
	private Long total;
	private Integer start;
	private Integer display;
	private List<NaverLocalInfoItem> items;
}