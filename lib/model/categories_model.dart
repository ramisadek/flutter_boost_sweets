class CategoriesModel{

  int categoryId;
  String categoryImage;
  String categoryTitle;

  CategoriesModel({this.categoryId, this.categoryImage, this.categoryTitle});

  factory CategoriesModel.fromJson(Map parsedJson){
    return CategoriesModel(
      categoryId: parsedJson['id'],
      categoryTitle: parsedJson['title'],
      categoryImage:parsedJson['image'] ,
    );
  }

}