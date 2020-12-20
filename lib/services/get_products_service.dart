import 'package:dio/dio.dart';
import 'package:flutter_boost_sweets/model/products_model.dart';

class ProductsService{

  Future<List<ProductsModel>> getProductsService() async{
    Response response;
    List<ProductsModel> productsList = List<ProductsModel>();

    try{
      response = await Dio().get("https://run.mocky.io/v3/4be31662-7c5a-4132-8a7b-fc88a65f478f");

      List data = response.data;
      data.forEach((element) {
        productsList.add(ProductsModel.fromJson(element));
      });

    }
    on DioError catch(e){
      print("erorr in getProductsService => ${e.response.data}");
    }

    return productsList;

  }

}