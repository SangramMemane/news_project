import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
      //App bar Widget
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 80,
        
                //Category list code
                child: _getCategoryList(),
              ),
        
              SizedBox(
                height: 20,
              ),
        
              //Get View all breaking news text
              _getViewAllBreakingNewsText(),
        
              //Get breaking news
              _getBreakingNews(),
        
              SizedBox(
                height: 10.0,
              ),
        
              //Get Indicator code for Breaking news slider
              Center(child: _getIndicator()),
        
              SizedBox(
                height: 20,
              ),
        
              //Get Trending news and view all text for Trending news
              _getTrendingNewsAndViewAllText(),
        
              SizedBox(
                height: 10,
              ),
        
              //Get Trending News list
              _getTrendingNewsList(),
        
              SizedBox(
                height: 10,
              ),
        
              //Get Trending News list
              _getTrendingNewsList(),
        
              SizedBox(
                height: 10,
              ),
        
              //Get Trending News list
              _getTrendingNewsList()
            ],
          ),
        ),
      ),
    );
  }

  //App bar
  AppBar _getAppBar() => AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
            Text(
              "App",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0,
      );

  //Category list
  Widget _getCategoryList() => ListView.builder(
      itemCount: categoryList.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryTile(
          image: categoryList[index].categoryImage,
          categoryName: categoryList[index].categoryName,
        );
      });

  //Get View all breaking news text
  Widget _getViewAllBreakingNewsText() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Breaking News",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "View All",
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
      );

  //Get Breaking news list for slider
  Widget _getBreakingNews() => Container(
      child: CarouselSlider.builder(
          itemCount: sliderList.length,
          itemBuilder: (context, index, realIndex) {
            String? image = sliderList[index].image;
            String? name = sliderList[index].name;
            return _buildImage(image!, index, name!);
          },
          options: CarouselOptions(
              height: 250,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              })));

  //Build Image for Breaking news slider
  Widget _buildImage(String image, int index, String name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(children: [
          Image.asset(
            image,
            fit: BoxFit.fitWidth,
            height: 250.0,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: EdgeInsets.only(top: 170),
            width: MediaQuery.of(context).size.width,
            height: 250,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }

  //Indicator code for Breaking news
  Widget _getIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliderList.length,
        effect: SlideEffect(dotHeight: 10, dotWidth: 10, dotColor: Colors.blue),
      );

  //Get Trending news and view all text for Trending news list
  Widget _getTrendingNewsAndViewAllText() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Trending News",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "View All",
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
      );

  Widget _getTrendingNewsList() => Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/splash_pic.jpeg",
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "I am trending news so far and this is my title",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "I am trending news so far and this is my subtitle",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
