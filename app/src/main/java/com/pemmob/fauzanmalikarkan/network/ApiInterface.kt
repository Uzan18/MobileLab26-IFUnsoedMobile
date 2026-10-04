package com.pemmob.fauzanmalikarkan.network

import com.pemmob.fauzanmalikarkan.data.model.Category
import com.pemmob.fauzanmalikarkan.data.model.Product
import com.pemmob.fauzanmalikarkan.util.JualanConstants
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET

interface ApiInterface {
    @GET("data/categories.json")
    suspend fun getCategories(): List<Category>

    @GET("data/products.json")
    suspend fun getProducts(): List<Product>
}

object ApiClient {
    val instance: ApiInterface by lazy {
        Retrofit.Builder()
            .baseUrl(JualanConstants.BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(ApiInterface::class.java)
    }
}
