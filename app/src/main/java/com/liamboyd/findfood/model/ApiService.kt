package com.liamboyd.findfood.model

import Business
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

//inside this interface I want to get all restaurant names in an area.
interface BusinessApi{
    @GET("businesses")
    fun getBusinesses(@Query("api_key") api_key : String) : Call<Business>
}






