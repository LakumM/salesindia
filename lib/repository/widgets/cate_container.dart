import 'package:flutter/material.dart';
import '../utils/font_style.dart';

// ignore: must_be_immutable
class CateContainer extends StatelessWidget {
  Widget? imageAssets;
  String name;
  String price;
  CateContainer(
      {super.key,
      required this.imageAssets,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomLeft: Radius.circular(11)),
              color: Color(0xffFF660E),
            ),
            child: const ImageIcon(
              AssetImage("assets/icon/ic_heart.png"),
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: imageAssets),
            const SizedBox(height: 10),
            Text(
              name,
              style: mFontStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '\$ $price',
                  style: mFontStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List<Widget>.generate(
                      2,
                      (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepOrange,
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                  strokeAlign: 1)),
                        );
                      },
                    )),
              ],
            )
          ],
        )
      ],
    );
  }
}
