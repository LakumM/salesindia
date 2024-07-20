import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_bloc.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_event.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/font_style.dart';
import '../../widgets/cate_container.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.sizeOf(context).width;
    double mediaQueryHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: ImageIcon(
          AssetImage("assets/icon/ic_more.png"),
          size: 26,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            mSpace(),

            ///Searchbar
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: mediaQueryWidth,
                child: Center(child: cusSearchTF())),
            mSpace(),

            ///Slider Banner
            offerBanner(),
            mSpace(),

            /// Product Category
            SizedBox(height: mediaQueryHeight * 0.13, child: category()),
            mSpace(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style:
                        mFontStyle(fontWeight: FontWeight.w800, fontSize: 22),
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
            mSpace(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: mediaQueryHeight,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 40,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 7 / 9,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 230,
                  ),
                  itemBuilder: (context, index) {
                    return CateContainer();
                  },
                ),
              ),
            )
          ],
        ),
      ),

      ///Floating action button
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      extendBody: true,
      resizeToAvoidBottomInset: false,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).height * 0.026,
          child: ImageIcon(
            color: Colors.grey,
            AssetImage(
              "assets/icon/ic_search.png",
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextFormField(
            clipBehavior: Clip.antiAlias,
            style: mFontStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
            decoration: InputDecoration(
                filled: true,
                hintText: "Search..",
                contentPadding: EdgeInsets.all(14),
                fillColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            height: 30,
            color: Colors.grey,
            width: 2.4,
          ),
        ),
        SizedBox(
            width: MediaQuery.sizeOf(context).height * 0.026,
            child:
                ImageIcon(AssetImage("assets/icon/ic_options.png"), size: 26)),
      ],
    );
  }

  /// Slider Banner carousel_slider
  Widget offerBanner() {
    return Stack(alignment: Alignment.bottomCenter, children: [
      ///offer Banner
      Container(
        width: MediaQuery.sizeOf(context).width,
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is HomeLoadedState) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.catModel.length,
            itemBuilder: (context, index) {
              var item = state.catModel[index];
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
                        "assets/images/category/mobile.jpg",
                        fit: BoxFit.fill,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Center(
                        child: Text(
                      "${item.name}",
                      style:
                          mFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              );
            },
          );
        } else if (state is HomeErrorState) {
          print('${state.errorMsg}');
        }
        return Container(
          color: Colors.deepOrange,
        );
      },
    );
  }
}
