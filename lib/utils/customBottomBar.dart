import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/strings.dart';

class CustomBottomBar extends StatelessWidget {
 final int selectedIndex;
 final Color selectcolor;
 final int cartno;
  final Function() item0tap;
  final Function() item1tap;
  final Function() item2tap;
  final Function() item3tap;
  final Function() item4tap;

  CustomBottomBar({required this.selectcolor,required this.item0tap,required this.selectedIndex,required this.item1tap,required this.item2tap,required this.item3tap, required this.item4tap,this.cartno=0});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Container(
                height: 56,
                width: width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: item0tap,
                      child: selectedIndex == 0
                          ? Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Strings.category,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: selectcolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.grey,
                              ),
                              onPressed: item0tap,
                            ),
                    ),
                    InkWell(
                      onTap: item1tap,
                      child: selectedIndex == 1
                          ? Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Strings.favourite,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: selectcolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                              onPressed: item1tap,
                            ),
                    ),
                    InkWell(
                      onTap: item2tap,
                      child: selectedIndex == 2
                          ? Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Strings.home,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: selectcolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.home,
                                color: Colors.grey,
                              ),
                              onPressed: item2tap,
                            ),
                    ),
                    InkWell(
                      onTap: item3tap,
                      child: selectedIndex == 3
                          ? Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.shopping_cart,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            Strings.shoppingcart,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: selectcolor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                ),
                                // Container(
                                //   child: Text(
                                //     "10",
                                //     style: TextStyle(
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.w800),
                                //     textAlign: TextAlign.center,
                                //   ),
                                //   width: 20,
                                //   padding: EdgeInsets.all(3),
                                //   decoration: BoxDecoration(
                                //       color: Colors.pink.withOpacity(0.5),
                                //       borderRadius:
                                //           BorderRadius.all(Radius.circular(25))),
                                // )
                              ],
                            )
                          : Stack(
                              alignment: Alignment.topRight,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.grey,
                                  ),
                                  onPressed: item3tap,
                                ),
                                if(cartno>0)
                                Container(
                                              child: Text(
                                                cartno.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w800),
                                                textAlign: TextAlign.center,
                                              ),
                                              width: 20,
                                              // padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  color: Colors.red
                                                      .withOpacity(0.8),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(25))),
                                            )
                              ],
                            ),
                    ),
                    InkWell(
                      onTap: item4tap,
                      child: selectedIndex == 4
                          ? Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.profile_circled,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Strings.account,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: selectcolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                            )
                          : IconButton(
                              icon: Icon(
                                CupertinoIcons.profile_circled,
                                color: Colors.grey,
                              ),
                              onPressed: item4tap,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        // });
  }
}
