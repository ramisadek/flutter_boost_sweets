import 'package:dio/dio.dart';
import 'package:flutter_boost_sweets/model/categories_model.dart';

class CategoriesService {

  Future<List<CategoriesModel>> getCategoriesService () async{
    Response response;
    List<CategoriesModel> categoriesList = List<CategoriesModel>();
    
    try{
      response = await Dio().get("https://run.mocky.io/v3/96f46f5a-86d9-43b7-b4fd-c291f557297b");
      List data = response.data;
      data.forEach((element) {
        categoriesList.add(CategoriesModel.fromJson(element));
      });

    }
    on DioError catch(e){
      print("error in getCategoriesService => ${e.response.data}");
    }
    return categoriesList;
  }

}