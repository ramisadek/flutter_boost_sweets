import 'package:flutter/cupertino.dart';
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
  double _currentSliderValue = 20;

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (ctx) {
          return StatefulBuilder(
            builder: (cont,setState){
              return Container(
                height: MediaQuery.of(context).size.height  * 0.4,
                child: Center(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 100,
                    activeColor: Colors.pink,
                    divisions: 5,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              );
            },
          );
        });
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
      backgroundColor: Color(0xFF9267FD),
      appBar: AppBar(
        backgroundColor: Color(0xFF9267FD),
        title: Image.asset("assets/icons/logo.png",scale: 5,),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: null,
            icon: Image.asset("assets/icons/search.png",scale: 3,),
          )
        ],
      ),
      body:
        isLoading?
            Center(
              child: SpinKitRipple(
                color: Colors.blue,
                size: 50.0,
                controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
            ):
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                height: 120,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      image: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/06/Rainbow-Ice-Cream-14-of-16.jpg",
                      title: "ice cream",
                    ),
                    CategoryCard(
                      image: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/06/Rainbow-Ice-Cream-14-of-16.jpg",
                      title: "ice cream",
                    ),
                    CategoryCard(
                      image: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/06/Rainbow-Ice-Cream-14-of-16.jpg",
                      title: "ice cream",
                    ),
                    CategoryCard(
                      image: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/06/Rainbow-Ice-Cream-14-of-16.jpg",
                      title: "ice cream",
                    ),
                    CategoryCard(
                      image: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/06/Rainbow-Ice-Cream-14-of-16.jpg",
                      title: "ice cream",
                    ),
                    CategoryCard(
                      image: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/06/Rainbow-Ice-Cream-14-of-16.jpg",
                      title: "ice cream",
                    ),
                    CategoryCard(
                      image: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/06/Rainbow-Ice-Cream-14-of-16.jpg",
                      title: "ice cream",
                    ),CategoryCard(
                      image: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/06/Rainbow-Ice-Cream-14-of-16.jpg",
                      title: "ice cream",
                    ),

                  ],
                )
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: ()=> displayBottomSheet(context),
                          child: Icon(Icons.add,color: Colors.white,),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5),),
                        Icon(Icons.favorite_border_rounded,color: Colors.white)
                      ],
                    ),
                    Text("50 7aba w 7aba w shewaia",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Image.asset("assets/icons/card.png",scale: 3),
                    Image.asset("assets/icons/card.png",scale: 3),
                    Image.asset("assets/icons/card.png",scale: 3),
                    Image.asset("assets/icons/card.png",scale: 3),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
