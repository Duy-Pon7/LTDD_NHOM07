package com.example.shoestore.Retrofit;

import com.example.shoestore.Model.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface ProductAPI {

    RetrofitService retrofitService = new RetrofitService();
    ProductAPI productApi = retrofitService.getRetrofit().create(ProductAPI.class);
    @GET("/newproduct")
    Call<List<Product>> getNewProduct();

    @GET("bestsellers")
    Call<List<Product>> getBestSellers();
//    @FormUrlEncoded
    @GET("/search")
    Call<List<Product>> search(@Query("searchContent") String searchContent);

}
