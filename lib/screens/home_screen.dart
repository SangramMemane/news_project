import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_project/models/slider_model.dart';
import 'package:news_project/services/category_data.dart';
import 'package:news_project/services/slider_data.dart';
import 'package:news_project/utils/category_tiles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoryList = [];
  List<SliderModel> sliderList = [];
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = getCategoryData();
    sliderList = getSliderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
            Text(
              "APP",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              child: ListView.builder(
                  itemCount: categoryList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categoryList[index].categoryImage,
                      categoryName: categoryList[index].categoryName,
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: CarouselSlider.builder(itemCount: sliderList.length,
                  itemBuilder: (context, index, realIndex){
                String? image = sliderList[index].image;
                    String? name = sliderList[index].name;
                    return buildImage(image!, index, name!);
                  }, options: CarouselOptions(
                    height: 250,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason){
                      setState(() {
                        activeIndex = index;
                      });
                    }
                  ))
            ),
            SizedBox(height: 10.0,),
            getIndicator()

          ],
        ),
      ),
    );

  }

  Widget buildImage(String image, int index, String name){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:Stack(
            children:[
              Image.asset(image, fit: BoxFit.fitWidth,
                height: 250.0,
                width: MediaQuery.of(context).size.width,),
              Container(
                margin: EdgeInsets.only(top: 170),
                width: MediaQuery.of(context).size.width,
                height: 250,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))
                ),
                child: Text(name, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white

                ),),
              )
            ]
          ),
      ),
    );
  }

  Widget getIndicator() => AnimatedSmoothIndicator(activeIndex: activeIndex, count: sliderList.length,
  effect: SlideEffect(
    dotHeight: 10,
    dotWidth: 10,
    dotColor: Colors.blue
  ),);
}
