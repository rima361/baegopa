package com.spring.hungry.model;

import lombok.Data;

@Data
public class Menu {
    private Long menuId;
    private Long restaurantId;
    private String menuName;
    private Long price;
}