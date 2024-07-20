import 'package:flutter/material.dart';
import '../utils/font_style.dart';

class CateContainer extends StatelessWidget {
  Widget? imageAssets;
  CateContainer({super.key, required this.imageAssets});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22),
                    bottomLeft: Radius.circular(11)),
                color: Color(0xffFF660E),
              ),
              child: ImageIcon(
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
              SizedBox(height: 10),
              Text(
                'HeadPhone',
                style: mFontStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '\$ 120',
                    style:
                        mFontStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List<Widget>.generate(
                        4,
                        (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
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
      ),
    );
  }
}
