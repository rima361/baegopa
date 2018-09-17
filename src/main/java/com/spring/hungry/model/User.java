package com.spring.hungry.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class User {
    private Long id;
    private String name;
    private String password;
    private Timestamp creationDate;
    private String email;
    private String type;

    public String getType() {
        return this.type.toLowerCase();
    }
}
