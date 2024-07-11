import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'cart_screen.dart';


class ProDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Ionicons.arrow_back, size: 20),
            style: IconButton.styleFrom(backgroundColor: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Ionicons.share_social,
                  size: 20,
                ),
                style: IconButton.styleFrom(backgroundColor: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Ionicons.heart_outline,
                  size: 20,
                ),
                style: IconButton.styleFrom(backgroundColor: Colors.white)),
          ],
          backgroundColor: Color(0xffe5e5e5)),
      backgroundColor: Color(0xffe5e5e5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/images/subcatlog/Img_blu1.jpg',
                fit: BoxFit.fitHeight,
              ),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffe5e5e5)),
            ),
            Stack(children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 520,
                width: double.infinity,
                decoration: BoxDecoration(
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
                        Text('Wireless Earbuds',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        Text('Price \$ 220',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(22)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Ionicons.star,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '4.5 ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '  [320 Reviwe]',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          'Color',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                        Container(
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
                              child: Center(
                                  child: Text(
                                'Description',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Text('Specification',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                            Text(
                              'Reviews ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                              "Small headphones in each ear. Also called 'earbuds,' earphones stay put by resting inside the ear or by being inserted slightly into the ear canal or with hooks that wrap around the ear. Another variation is an earphone that clips onto the earlobe. ",
                              style: TextStyle(fontSize: 18),
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
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(22)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Ionicons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              '1',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Icon(
                              Ionicons.add,
                              color: Colors.white,
                              size: 20,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen()));
                          },
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
