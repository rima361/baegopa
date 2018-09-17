package com.spring.hungry.model.value;

import lombok.Data;

@Data
public class PagingRequest {
	private Long categoryId;
	private String query;
    private Integer pageSize = 20;
    private Integer page = 1;
    private Integer rowStart;
    private Integer rowEnd;
    private String delivery;
   
    private Integer getRowStart() {
        return (pageSize * (page - 1)) + 1;
    }

    private Integer getRowEnd() {
        return pageSize * page;
    }
}
