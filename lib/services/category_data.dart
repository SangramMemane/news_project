import '../models/category_model.dart';

List<CategoryModel> getCategoryData(){
  List<CategoryModel> list = [];

  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.categoryImage = "images/splash_pic.jpeg";
  list.add(categoryModel);

  CategoryModel categoryEntertainment = new CategoryModel();
  categoryEntertainment.categoryName = "Entertainment";
  categoryEntertainment.categoryImage = "images/splash_pic.jpeg";
  list.add(categoryEntertainment);

  CategoryModel health = new CategoryModel();
  health.categoryName = "Health";
  health.categoryImage = "images/splash_pic.jpeg";
  list.add(health);

  CategoryModel Science = new CategoryModel();
  Science.categoryName = "Science";
  Science.categoryImage = "images/splash_pic.jpeg";
  list.add(Science);

  CategoryModel Sports = new CategoryModel();
  Sports.categoryName = "Sports";
  Sports.categoryImage = "images/splash_pic.jpeg";
  list.add(Sports);

  print(list.length);

  return list;

}