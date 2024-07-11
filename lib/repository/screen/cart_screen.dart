import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe5e5e5),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Ionicons.arrow_back, size: 20),
          style: IconButton.styleFrom(backgroundColor: Colors.white),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffe5e5e5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(22)),
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
                    child: Image.asset(
                      'assets/images/subcatlog/img_sweter.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Women Sweter',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Women Fashion',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          Text(
                            'Price \$ 70 ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              borderRadius: BorderRadius.circular(11)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Ionicons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(22)),
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
                    child: Image.asset(
                      'assets/images/subcatlog/img_swatch.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Smart Watch',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Women Fashion',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          Text(
                            'Price \$ 55 ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              borderRadius: BorderRadius.circular(11)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Ionicons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(22)),
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
                        color: Color(0xffe5e5e5),
                        borderRadius: BorderRadius.circular(11)),
                    child: Image.asset(
                      'assets/images/subcatlog/Img_blu2.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wireless Headphone',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Earbuds ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          Text(
                            'Price \$ 120 ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              borderRadius: BorderRadius.circular(11)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Ionicons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
            ),
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
                    margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(blurRadius: 2, color: Colors.grey)
                        ]),
                    child: Row(
                      children: [
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
                      children: [
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
          ],
        ),
      ),
    );
  }
}
