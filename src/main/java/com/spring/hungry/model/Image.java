package com.spring.hungry.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Image {
    private Long imageId;
    private Long restaurantId;
    private String imgUrl;
    private Timestamp creationDate;
    private Timestamp lastUpdateDate;
}