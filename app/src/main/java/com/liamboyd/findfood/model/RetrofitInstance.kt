package com.liamboyd.findfood.model

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory


object RetrofitInstance {
    val api : BusinessApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://api.yelp.com/v3/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(BusinessApi::class.java)
    }
}