package com.spring.hungry.dao;

import org.springframework.stereotype.Component;

import com.spring.hungry.model.NaverLocalInfoResponse;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

@Component
public interface NaverLocalDAO {
	
	@GET("/v1/search/local.json")
	Call<NaverLocalInfoResponse> getInfos(@Query("query") String query, @Query("display") Integer display);
}
