import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salesindia/repository/screen/product_details/add_to_cart_bloc/addtocart_bloc.dart';
import 'package:salesindia/repository/utils/font_style.dart';

class ProDetailsScreen extends StatefulWidget {
  String? imgUrl;
  String? price;
  String? name;
  int? mProduct_id;
  ProDetailsScreen(
      {super.key, this.mProduct_id, this.name, this.price, this.imgUrl});

  @override
  State<ProDetailsScreen> createState() => ProDetailsScreenState();
}

class ProDetailsScreenState extends State<ProDetailsScreen> {
  int itemQuan = 1;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.sizeOf(context).height;
    var mediaQueryWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.share_social,
              size: 20,
            ),
            style: IconButton.styleFrom(backgroundColor: Colors.white)),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.heart_outline,
              size: 20,
            ),
            style: IconButton.styleFrom(backgroundColor: Colors.white)),
      ], backgroundColor: const Color(0xffe5e5e5)),
      backgroundColor: const Color(0xffe5e5e5),
      body: SizedBox(
        height: mediaQueryHeight * 0.98,
        child: Column(
          children: [
            Container(
              height: mediaQueryHeight * 0.26,
              width: mediaQueryWidth,
              decoration: BoxDecoration(color: Color(0xffe5e5e5)),
              child: Image.network(
                '${widget.imgUrl}',
                fit: BoxFit.fitHeight,
              ),
            ),
            SingleChildScrollView(
              child: Stack(children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  margin: const EdgeInsets.only(top: 20),
                  height: mediaQueryHeight * 0.61,
                  width: mediaQueryWidth,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.name}",
                            style: mFontStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                            ), /*TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold)*/
                          ),
                          Text('Price \$ ${widget.price}',
                              style: mFontStyle(
                                  fontWeight: FontWeight.w600, fontSize: 26)),
                          Row(
                            children: [
                              Container(
                                  height: 28,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(22)),
                                  child: rating()),
                              const Text(
                                '  [320 Reviwe]',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          const Text(
                            'Color',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 280,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.cyan, radius: 25),
                                CircleAvatar(
                                    backgroundColor: Colors.brown, radius: 25),
                                CircleAvatar(
                                    backgroundColor: Colors.orangeAccent,
                                    radius: 25),
                                CircleAvatar(
                                    backgroundColor: Colors.green, radius: 25),
                                CircleAvatar(
                                    backgroundColor: Colors.cyanAccent,
                                    radius: 25),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(22)),
                                child: const Center(
                                    child: Text(
                                  'Description',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              const Text('Specification',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                              const Text(
                                'Reviews ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "Small headphones in each ear. Also called 'earbuds,' earphones stay put by resting inside the ear or by being inserted slightly into the ear canal or with hooks that wrap around the ear. Another variation is an earphone that clips onto the earlobe. ",
                                style: mFontStyle(),
                                textAlign: TextAlign.center,
                                maxLines: 8,
                                softWrap: true),
                          ),
                        ]),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 25,
                  right: 25,
                  child: Container(
                    height: mediaQueryHeight * 0.070,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(22)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (itemQuan > 1) {
                                    itemQuan--;
                                    setState(() {});
                                  }
                                },
                                child: Text(
                                  '-',
                                  style: mFontStyle(
                                      color: Colors.white, fontSize: 26),
                                ),
                              ),
                              Text(
                                "$itemQuan",
                                style: mFontStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                child: Text(
                                  '+',
                                  style: mFontStyle(
                                      color: Colors.white, fontSize: 26),
                                ),
                                onTap: () {
                                  itemQuan++;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 40)),
                            onPressed: () {
                              BlocProvider.of<AddToCartBloc>(context).add(
                                  AddInCart(
                                      product_id: widget.mProduct_id,
                                      quantity: itemQuan));
                            },
                            child: Text(
                              'Add To Cart',
                              style: mFontStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Ionicons.star,
          size: 18,
          color: Colors.white,
        ),
        Text(
          '4.5 ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
