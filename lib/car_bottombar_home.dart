import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:used_car_app/controller/bottom_nav_controller.dart';

class Cars_home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Provider.of<BottomNavController>(context)
            .screens[Provider.of<BottomNavController>(context).selectedIndex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          activeColor: Colors.grey,
          elevation: 8,
          items: [
            TabItem(
                icon: Icon(
              Icons.home,
              color: Colors.black,
            )),
            TabItem(
                icon: Icon(
              Icons.search,
              color: Colors.black,
            )),
            TabItem(
              icon: Icon(Icons.menu, color: Colors.black),
            ),
          ],
          initialActiveIndex:
              Provider.of<BottomNavController>(context).selectedIndex,
          onTap: Provider.of<BottomNavController>(context, listen: false)
              .onItemTap,
        ));
  }
}
