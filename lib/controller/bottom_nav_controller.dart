import 'package:flutter/material.dart';

import '../navigation/Menu_accessories.dart';
import '../navigation/navigation_home.dart';
import '../navigation/search.dart';

class BottomNavController with ChangeNotifier{
  int selectedIndex =0;

  void onItemTap(index){
    selectedIndex = index;
    notifyListeners();
  }
  List<Widget> screens = [Navigation_Home(), SearchPage(), MenuPage()];
}