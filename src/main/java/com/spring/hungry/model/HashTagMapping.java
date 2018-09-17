package com.spring.hungry.model;

import java.security.Timestamp;

import lombok.Data;

@Data
public class HashTagMapping {
    private Long hashTagMappingId;
    private Long hashTagId;
    private String hashTagName;
    private Long restaurantId;
    private Timestamp creationDate;
    private String createdBy;
    private Timestamp lastUpdateDate;
    private String lastUpdateBy;
}