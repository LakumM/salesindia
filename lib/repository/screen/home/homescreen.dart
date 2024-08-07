import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_bloc.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_event.dart';
import 'package:salesindia/repository/screen/home/home_bloc/home_state.dart';
import 'package:salesindia/repository/screen/home/product_bloc/product_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/font_style.dart';
import '../../widgets/cate_container.dart';
import '../product_details/pro_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<String> imgList = [
    "assets/images/banner/banner.jpg",
    "assets/images/banner/D126762128_1400x800._CB569294520_.jpg",
    "assets/images/banner/D141165058_SIM_1400x800._CB569331184_.jpg",
    "assets/images/banner/D142117137_1400x800._CB569287803_.jpg",
    "assets/images/banner/D143403581_2024__1400x800._CB569229867_.jpg",
    "assets/images/banner/D143403581_2024__1400x800._CB569229867_ (1).jpg",
    "assets/images/banner/D147662287_WLD_NARZO_N61_NEWLAUNCH_catpage_1400x800._CB567467414_.jpg",
    "assets/images/banner/D147671870_IN_WLD_BAU_Redmi13_5G_1400x800._CB569294520_.jpg",
  ];
  List<String> categories = [
    "assets/images/category/appo.jpg",
    "assets/images/category/lenovo.jpg",
    "assets/images/category/iphone.jpg",
    "assets/images/category/samsung.jpg",
    "assets/images/category/mi.jpg",
    "assets/images/category/vivo.jpg"
  ];

  var activeIndex = 0;
  var controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetCategoryEvent());
    BlocProvider.of<ProductBloc>(context).add(GetProduct());
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.sizeOf(context).width;
    double mediaQueryHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const ImageIcon(
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
            cusSearchTF(),
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
                  height: mediaQueryHeight * 0.57,
                  child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                    log('this is state $state');
                    if (state is ProductLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is ProductLoadedState) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.productModel!.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 7 / 9,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 230,
                        ),
                        itemBuilder: (context, index) {
                          var products = state.productModel!.data![index];
                          return InkWell(
                            child: CateContainer(
                              name: "${products.name}",
                              price: "${products.price}",
                              imageAssets: Image.network(
                                "${products.image}",
                                height:
                                    MediaQuery.sizeOf(context).height * 0.15,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ProDetailsScreen(
                                      mProduct_id: int.parse(products.id!),
                                      name: products.name,
                                      price: products.price,
                                      imgUrl: products.image);
                                },
                              ));
                            },
                          );
                        },
                      );
                    } else if (state is ProductErrorState) {
                      print("Error : $state");
                    }
                    return Container();
                  })),
            )
          ],
        ),
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
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.13,
            /* height: MediaQuery.sizeOf(context).height * 0.03,*/
            child: const ImageIcon(
              color: Colors.grey,
              AssetImage(
                "assets/icon/ic_search.png",
              ),
              size: 27,
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.60,
            child: TextFormField(
              clipBehavior: Clip.antiAlias,
              style: mFontStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              decoration: const InputDecoration(
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
              width: 2,
            ),
          ),
          SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.13,
              child: const ImageIcon(AssetImage("assets/icon/ic_options.png"),
                  size: 26)),
        ],
      ),
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
        margin: const EdgeInsets.symmetric(horizontal: 18),
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
              imgItems,
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
          effect: const ExpandingDotsEffect(
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
            itemCount: state.categoriesModel.data!.length,
            itemBuilder: (context, index) {
              var item = state.categoriesModel.data![index];
              return Padding(
                padding: EdgeInsets.only(
                  left: 18,
                  top: 10,
                  right:
                      index == state.categoriesModel.data!.length - 1 ? 18 : 0,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        categories[index],
                        fit: BoxFit.fitHeight,
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
          print(state.errorMsg);
        }
        return Container(
          color: Colors.deepOrange,
        );
      },
    );
  }
}
