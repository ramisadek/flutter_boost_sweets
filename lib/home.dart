import 'package:flutter/material.dart';
import 'package:flutter_boost_sweets/services/add_to_fav_services.dart';
import 'package:flutter_boost_sweets/services/get_categories_service.dart';
import 'package:flutter_boost_sweets/services/get_products_service.dart';
import 'package:flutter_boost_sweets/widgets/category_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'model/categories_model.dart';
import 'model/products_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  List<CategoriesModel> categoriesList = List<CategoriesModel>();
  List<ProductsModel> productsList = List<ProductsModel>();
  bool isLoading=true;

  getCategories() async{
    categoriesList = await CategoriesService().getCategoriesService();
    productsList = await ProductsService().getProductsService();

    productsList.forEach((element) {
      print(element.title);
      print(element.image);
      print(element.category);
      print(element.price);
      print(element.fav);
      print(element.favNumber);
      print(element.rate);
      print('*************************');
    });

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        isLoading?
            Center(
              child: SpinKitRipple(
                color: Colors.blue,
                size: 50.0,
                controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
            ):
        SafeArea(
          child: Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  Text("some stupid UI here"),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        itemCount: categoriesList.length,
                        itemBuilder: (context,index) {
                          return InkWell(
                            onTap: () => FavService().addToFavServices(categoriesList[index].categoryId),
                            child: CategoryCard(
                              image: "${categoriesList[index].categoryImage}",
                              title: "${categoriesList[index].categoryTitle}",
                            ),
                          );
                        }
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}
