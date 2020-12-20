import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavService{

  addToFavServices(int productId) async{
    Response response ;
    String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')?? "051465sdgsdsghs4#53wqt0swe4w3eswsgsdg";

    try{
      response = await Dio().post(
          "https://run.mocky.io/v3/c7f5a0aa-30cb-4e6f-a136-3f9e0d1f5bf2",
        data: {
            "token":"$token",
          "product_id":"$productId"
        }
      );
      print('***********************');
      print(response.data);
      print('***********************');
    }
    on DioError catch(e){
      print("error in AddToFavServices => ${e.response.data}");
    }
    
  }
  
}