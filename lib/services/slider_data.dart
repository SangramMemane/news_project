import 'package:news_project/models/slider_model.dart';

List<SliderModel> getSliderData(){
  List<SliderModel> slides = [];

  SliderModel sliderModel = new SliderModel();
  sliderModel.name = "I am the first headline";
  sliderModel.image = "images/splash_pic.jpeg";
  slides.add(sliderModel);

  SliderModel second = new SliderModel();
  second.name = "I am the second headline";
  second.image = "images/splash_pic.jpeg";
  slides.add(second);

  SliderModel third = new SliderModel();
  third.name = "I am the third headline";
  third.image = "images/splash_pic.jpeg";
  slides.add(third);


  return slides;
}