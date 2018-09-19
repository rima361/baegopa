package com.spring.hungry.service;

import java.io.IOException;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.spring.hungry.dao.NaverLocalDAO;
import com.spring.hungry.model.NaverLocalInfoResponse;

import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Response;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

@Service
public class NaverLocalService {
		
	private NaverLocalDAO naverLocalDAO = null;
	private final static String clientId = "D0gpzUJwLCSiAuynSUjS";
	private final static String secretKey = "w6Rv_tEXeU";
	private final static String naverUrl = "https://openapi.naver.com/";
	
	@PostConstruct
	public void initialize() {
		OkHttpClient client = new OkHttpClient.Builder().addInterceptor(new Interceptor() {
			@Override
			public Response intercept(Chain chain) throws IOException {
				//TODO Auto-generated method stub
				return chain.proceed(chain.request().newBuilder()
				.addHeader("X-Naver-Client-Id", clientId)
				.addHeader("X-Naver-Client-Secret", secretKey)
				.build());
			}
		}).build();
	
		Retrofit retrofit = new Retrofit.Builder()
			.client(client)
			.baseUrl(naverUrl)
			.addConverterFactory(JacksonConverterFactory.create())
			.build();
		naverLocalDAO = retrofit.create(NaverLocalDAO.class);
	}
	
	public NaverLocalInfoResponse get() throws IOException {
		return naverLocalDAO.getInfos("�Ǳ���������", 100).execute().body();
		
	}
}