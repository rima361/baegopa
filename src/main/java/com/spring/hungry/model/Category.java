package com.spring.hungry.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Category {
    private Long categoryId;
    private String name;
    private String useYn;
    private Timestamp creationDate = Timestamp.valueOf(LocalDateTime.now());
    private String createdBy;
}