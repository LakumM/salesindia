import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesindia/repository/screen/cart_screen/cart_bloc/view_cart_bloc.dart';
import 'package:salesindia/repository/utils/font_style.dart';

import '../../../domain/model/view_cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ViewCartBloc>(context).add(ViewInCart());
  }

  num totalAmt = 0.0;
  int itemQuant = 0;
  void getTotalAmountOfCartItems(List<ViewCartDataModel> allItems) {
    Timer(
        Duration(
          seconds: 1,
        ), () {
      totalAmt = 0.0;
      for (ViewCartDataModel eachItem in allItems) {
        totalAmt += double.parse(eachItem.price!) * eachItem.quant!;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe5e5e5),
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffe5e5e5),
      body: ListView(
        children: [
          BlocBuilder<ViewCartBloc, ViewCartState>(
            builder: (context, state) {
              if (state is ViewCartLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ViewCartErrorState) {
                return Center(
                  child: Text("${state.errorMsg}"),
                );
              } else if (state is ViewCartLoadedState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.viewCartModel!.data!.length,
                  itemBuilder: (c, index) {
                    var data = state.viewCartModel!.data![index];
                    if (index == state.viewCartModel!.data!.length - 1) {
                      getTotalAmountOfCartItems(state.viewCartModel!.data!);
                    }
                    itemQuant = data.quant!;
                    return Container(
                      width: double.infinity,
                      height:
                          MediaQuery.of(context).size.width < 900 ? 150 : 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width > 580
                                  ? 130
                                  : 120,
                              width: MediaQuery.of(context).size.width > 580
                                  ? 130
                                  : 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffe3e3e3)),
                              child: Image.network('${data.image}'),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width < 600
                                  ? 320
                                  : MediaQuery.of(context).size.width > 600 &&
                                          MediaQuery.of(context).size.width <
                                              850
                                      ? 390
                                      : 620,
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${data.name}',
                                        style: mFontStyle(
                                          fontSize: 20,
                                        )),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<ViewCartBloc>(context)
                                            .add(DeleteItemInCartEvent(
                                                cartId: data.id.toString()));
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.red,
                                      style: IconButton.styleFrom(iconSize: 28),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\u{20B9}${data.price}',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700)),
                                    Container(
                                      height: 25,
                                      width: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffe3e3e3),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (itemQuant > 1) {
                                                itemQuant--;
                                                setState(() {});
                                              }
                                            },
                                            child: Text(
                                              '-',
                                              style: mFontStyle(fontSize: 20),
                                            ),
                                          ),
                                          Text(
                                            itemQuant.toString(),
                                            style: mFontStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            child: Text(
                                              '+',
                                              style: mFontStyle(fontSize: 20),
                                            ),
                                            onTap: () {
                                              itemQuant + 1;
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),

          /// Enter Promo-code
          BlocListener<ViewCartBloc, ViewCartState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.white),
                        boxShadow: const [
                          BoxShadow(blurRadius: 2, color: Colors.grey)
                        ]),
                    child: Row(
                      children: const [
                        Flexible(
                          flex: 4,
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Color(0xffe5e5e5),
                              border: InputBorder.none,
                              hintText: 'Enter Promo Code',
                              hintStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Text(
                          'Apply',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.deepOrange),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total :',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ $totalAmt',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                      height: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total :',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ $totalAmt',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange.shade500),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*Column(
                children: [
                  ListView.builder(
                    itemCount: state.viewCartModel!.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.all(5),
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(11)),
                              child: Image.network(
                                '${state.viewCartModel!.data![index].image}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                width: 190,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Women Sweter',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Women Fashion',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey)),
                                    Text(
                                      'Price \$ 70 ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 100,
                              width: 80,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                      alignment: Alignment(1, 1),
                                      child: Icon(
                                        Icons.delete_outline_sharp,
                                        color: Colors.redAccent,
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    padding: EdgeInsets.all(2),
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Icon(
                                          Ionicons.remove,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Icon(
                                          Ionicons.add,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  /// Enter Promo-code
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 380,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 25),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: Colors.white),
                              boxShadow: const [
                                BoxShadow(blurRadius: 2, color: Colors.grey)
                              ]),
                          child: Row(
                            children: const [
                              Flexible(
                                flex: 4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffe5e5e5),
                                    border: InputBorder.none,
                                    hintText: 'Enter Promo Code',
                                    hintStyle: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Text(
                                'Apply',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.deepOrange),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Sub Total :',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$ 245',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 2,
                            height: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total :',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$ 245',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 30),
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange.shade500),
                            ))
                      ],
                    ),
                  ),
                ],
              ); */
