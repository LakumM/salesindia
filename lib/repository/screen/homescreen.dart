import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/ListData/main_catgory.dart';
import '../utils/font_style.dart';
import '../widgets/cate_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<String> imgList = [
    "assets/images/banner/img_banner.jpg",
    "assets/images/banner/img_banner.png",
    "assets/images/banner/imagesPINK.jpg",
    "assets/images/banner/images.jpg",
    "assets/images/banner/img_banner.jpg",
    "assets/images/banner/img_banner.png",
  ];
  var activeIndex = 0;
  var controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ImageIcon(
            AssetImage("assets/icon/ic_more.png"),
            size: 26,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ImageIcon(
              AssetImage("assets/icon/ic_bell (1).png"),
              size: 26,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ///Searchbar
          Center(child: cusSearchTF()),
          mSpace(),

          ///Slider Banner
          offerBanner(),
          mSpace(),

          /// Product Category
          category(),
          mSpace(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Special For You",
                  style: mFontStyle(fontWeight: FontWeight.w800, fontSize: 22),
                ),
                Text(
                  "See all",
                  style: mFontStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 500,
            width: double.infinity,
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 7 / 8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return CateContainer();
              },
            ),
          )
        ],
      ),

      ///Floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        child: ImageIcon(
          AssetImage("assets/icon/ic_home.png"),
          size: 24,
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.grey,
        shape: CircularNotchedRectangle(),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageIcon(
                AssetImage("assets/icon/ic_appsadd.png"),
                size: 26,
                color: Colors.grey,
              ),
              ImageIcon(
                AssetImage("assets/icon/ic_heart.png"),
                size: 26,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              ImageIcon(
                AssetImage("assets/icon/ic_cart-minus.png"),
                size: 26,
                color: Colors.grey,
              ),
              ImageIcon(
                AssetImage("assets/icon/ic_adminalt.png"),
                size: 26,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        notchMargin: 5,
      ),
    );
  }

  Widget mSpace({double height = 20}) {
    return SizedBox(
      height: height,
    );
  }

  /// Search Bar
  Widget cusSearchTF() {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
      child: Row(
        children: [
          ImageIcon(
            color: Colors.grey,
            AssetImage(
              "assets/icon/ic_search.png",
            ),
            size: 22,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.63,
            child: TextField(
              style: mFontStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Search..",
                  contentPadding: EdgeInsets.all(14),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 30,
              color: Colors.grey,
              width: 2.4,
            ),
          ),
          ImageIcon(
            AssetImage("assets/icon/ic_options.png"),
            size: 24,
          ),
        ],
      ),
    );
  }

  /// Slider Bannerscarousel_slider
  Widget offerBanner() {
    return Stack(alignment: Alignment.bottomCenter, children: [
      ///offer Banner
      Container(
        height: MediaQuery.sizeOf(context).height * 0.24,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
        child: CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              activeIndex = index;
              setState(() {});
            },
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: imgList.map((imgItems) {
            return Image.asset(
              "$imgItems",
              fit: BoxFit.fill,
              width: double.infinity,
            );
          }).toList(),
        ),
      ),

      ///indicator Viewer
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: imgList.length,
          effect: ExpandingDotsEffect(
              dotHeight: 7,
              dotWidth: 7,
              radius: 3,
              spacing: 8,
              expansionFactor: 2,
              activeDotColor: Colors.black),
        ),
      ),
    ]);
  }

  /// Product Main category
  Widget category() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: MainCatgory().catPro.length,
        itemBuilder: (context, index) {
          var item = MainCatgory().catPro;
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
              right: index == imgList.length - 1 ? 20 : 0,
            ),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    "${item[index]['catImg']}",
                    fit: BoxFit.fill,
                    width: 80,
                    height: 80,
                  ),
                ),
                Center(
                    child: Text(
                  "${item[index]['catName']}",
                  style: mFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
