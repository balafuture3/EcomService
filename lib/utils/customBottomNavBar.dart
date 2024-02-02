import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  List<NavigationDestination> items;
  int currentindex;
  Function(int data) onpress;
  CustomBottomNavBar(
      {Key? key,
      required this.items,
      required this.onpress,
      required this.currentindex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        animationDuration: Duration(seconds: 1),
        // surfaceTintColor: Colors.green,
        // indicatorColor: Colors.amber,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

        // type: BottomNavigationBarType.shifting,
        // selectedIconTheme:IconThemeData(size: 35,color: Colors.red) ,
        // unselectedIconTheme:IconThemeData(size: 25,color: Colors.orange) ,
        selectedIndex: currentindex,
        onDestinationSelected: onpress,
        backgroundColor: Colors.red,
        destinations: [for (int i = 0; i < items.length; i++) items[i]]);
  }
}
