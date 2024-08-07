import 'package:flutter/material.dart';
import 'package:salesindia/repository/screen/product_details/pro_details_screen.dart';
import 'package:salesindia/repository/screen/profile/profile_screen.dart';

import 'cart_screen/cart_screen.dart';
import 'home/homescreen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> pages = [
    HomeScreen(),
    ProDetailsScreen(),
    Center(
      child: Text("favorite"),
    ),
    CartScreen(),
    ProfileScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      ///Floating action button
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedIndex = 0;
          setState(() {});
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        child: const ImageIcon(
          AssetImage("assets/icon/ic_home.png"),
          size: 26,
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.grey,
        shape: CircularNotchedRectangle(),
        height: 70,
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                print(selectedIndex);
                selectedIndex = 1;
                setState(() {});
              },
              icon: const ImageIcon(
                AssetImage("assets/icon/ic_appsadd.png"),
                size: 30,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                selectedIndex = 2;
                setState(() {});
                print(selectedIndex);
              },
              icon: ImageIcon(
                AssetImage("assets/icon/ic_heart.png"),
                size: 30,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                selectedIndex = 3;
                setState(() {});
                print(selectedIndex);
              },
              icon: const ImageIcon(
                AssetImage("assets/icon/ic_cart-minus.png"),
                size: 30,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 4;
                  print(selectedIndex);
                });
              },
              icon: const Icon(
                Icons.account_circle,
                size: 35,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
