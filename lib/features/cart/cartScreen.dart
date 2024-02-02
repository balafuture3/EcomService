import 'dart:ui';

import 'package:ecomservice/features/cart/bloc/cart_bloc.dart';
import 'package:ecomservice/features/favourites/bloc/favourites_bloc.dart';
import 'package:ecomservice/model/PlaceOrderRequest.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../network/urlConstants.dart';
import '../../utils/button.dart';
import '../../utils/ratings.dart';
import '../../utils/router.dart';
import '../dashboard/bloc/dash_bloc.dart';
import 'bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> datalist = [];
  FocusNode _promoFocus = FocusNode();
  TextEditingController _promoController = TextEditingController();
  @override
  void initState() {
    context.read<CartBloc>().add(CartInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.response != null
              ? state.response!.data!.isNotEmpty
                  ? Colors.grey.shade200
                  : Colors.white
              : Colors.white,
          body: Container(
            height: height,
            width: width,
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: width,
                      padding: EdgeInsets.only(top: 40, bottom: 10, left: 10),
                      child: Text(
                        Strings.bag,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                        textAlign: TextAlign.start,
                      )),
                  state.response != null
                      ? state.response!.data!.isNotEmpty
                          ? Column(
                              children: [
                                Container(
                                    color: Colors.grey.shade200,
                                    height: MediaQuery.of(context).size.height /
                                        1.8,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView(
                                      children: [
                                        if (state.response != null)
                                          for (int i = 0;
                                              i < state.response!.data!.length;
                                              i++)
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.productdetail,
                                                    arguments: state.response!
                                                        .data![i].productId);
                                              },
                                              child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 20,
                                                        left: 20,
                                                        right: 20),
                                                    width: width,
                                                    height: 100,
                                                    child: Row(children: [
                                                      Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10)),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(UrlConstants
                                                                          .imageurl +
                                                                      state
                                                                          .response!
                                                                          .data![
                                                                              i]
                                                                          .image!
                                                                          .split(
                                                                              ";")[0]),
                                                                  fit: BoxFit.fill),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 8,
                                                          child: Container(
                                                            color: Colors.white,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                5),
                                                                    child: Text(
                                                                      state
                                                                          .response!
                                                                          .data![
                                                                              i]
                                                                          .productName!,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade800,
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                    )),
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5),
                                                                  child: Text(
                                                                    "\u{20B9}${double.parse(state.response!.data![i].price!)}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade600,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w800,
                                                                        fontSize:
                                                                            11),
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                                if (state
                                                                        .itemcount !=
                                                                    null)
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                5),
                                                                    child: Row(
                                                                      children: [
                                                                        InkWell(
                                                                            onTap: state.itemcount![i] != 1
                                                                                ? () {
                                                                                    context.read<CartBloc>().add(ItemDecreaseEvent(state.itemcount![i] - 1, i, state.response!.data![i].productId!));
                                                                                  }
                                                                                : () {},
                                                                            child: Container(
                                                                                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                                                                                  BoxShadow(
                                                                                    color: Colors.grey,
                                                                                    offset: Offset(0.0, 1.0), //(x,y)
                                                                                    blurRadius: 6.0,
                                                                                  ),
                                                                                ]),
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  color: Colors.grey.shade800,
                                                                                ))),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child: Text(state
                                                                              .itemcount![i]
                                                                              .toString()),
                                                                        ),
                                                                        InkWell(
                                                                            onTap:
                                                                                () {
                                                                              context.read<CartBloc>().add(ItemIncreaseEvent(state.itemcount![i] + 1, i, state.response!.data![i].productId!));
                                                                            },
                                                                            child: Container(
                                                                                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                                                                                  BoxShadow(
                                                                                    color: Colors.grey,
                                                                                    offset: Offset(0.0, 1.0), //(x,y)
                                                                                    blurRadius: 6.0,
                                                                                  ),
                                                                                ]),
                                                                                child: Icon(
                                                                                  Icons.add,
                                                                                  color: Colors.grey.shade800,
                                                                                ))),
                                                                      ],
                                                                    ),
                                                                  )
                                                              ],
                                                            ),
                                                          ))
                                                    ]),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 20, right: 20),
                                                    child: PopupMenuButton<int>(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                      itemBuilder: (context) =>
                                                          [
                                                        // popupmenu item 1
                                                        PopupMenuItem(
                                                          onTap: () {
                                                            context
                                                                .read<
                                                                    CartBloc>()
                                                                .add(FavouriteAddEvent(
                                                                    state
                                                                        .response!
                                                                        .data![
                                                                            i]
                                                                        .productId,
                                                                    i));
                                                          },
                                                          value: 1,
                                                          child: Material(
                                                              child: Text(Strings
                                                                  .addtofavourites)),
                                                        ),
                                                        // popupmenu item 2
                                                        PopupMenuItem(
                                                          onTap: () {
                                                            context
                                                                .read<
                                                                    CartBloc>()
                                                                .add(RemoveCartEvent(
                                                                    state
                                                                        .response!
                                                                        .data![
                                                                            i]
                                                                        .productId,
                                                                    i));
                                                          },
                                                          value: 2,
                                                          child: Material(
                                                              child: Text(Strings
                                                                  .deletefromlist)),
                                                        ),
                                                      ],
                                                      offset: Offset(40, 20),
                                                      color: Colors.white,
                                                      icon: Icon(
                                                        Icons.more_vert,
                                                        color: Colors
                                                            .grey.shade800,
                                                      ),
                                                      elevation: 2,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                        // ListTile(title: Text(state.response!.data![i].name!),)
                                      ],
                                    )),
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      padding: EdgeInsets.only(left: 20),
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextField(
                                        readOnly: true,
                                        keyboardType: TextInputType.none,
                                        onTap: () {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30),
                                                          topRight:
                                                              Radius.circular(
                                                                  30))),
                                              context: context,
                                              builder: (dialogcontext) {
                                                return Container(
                                                  height: height / 1.75,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: BlocProvider.value(
                                                    value: context
                                                        .watch<CartBloc>(),
                                                    child: BlocBuilder<CartBloc,
                                                        CartState>(
                                                      builder:
                                                          (context, state) {
                                                        return Scaffold(
                                                          backgroundColor: Colors.transparent,
                                                          body: Container(
                                                            child: SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: <Widget>[
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            top: 14,
                                                                            bottom:
                                                                                32),
                                                                    height: 6,
                                                                    width: 60,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .grey,
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(6))),
                                                                  ),
                                                                  Stack(
                                                                    alignment: Alignment
                                                                        .centerRight,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                12),
                                                                        padding: EdgeInsets
                                                                            .only(
                                                                                left:
                                                                                    20),
                                                                        width:
                                                                            width,
                                                                        decoration: BoxDecoration(
                                                                            color: Colors
                                                                                .white,
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10))),
                                                                        child:
                                                                            TextField(
                                                                          onChanged:
                                                                              (val) {
                                                                            if(state
                                                                                .promoResponse!
                                                                                .data!
                                                                                .where((element) => element.description == val).isEmpty)
                                                                            context
                                                                                .read<CartBloc>()
                                                                                .add(PromoAddEvent(val,""));
                                                                            else
                                                                            context
                                                                                .read<CartBloc>()
                                                                                .add(PromoAddEvent(val,state
                                                                                .promoResponse!
                                                                                .data!
                                                                                .where((element) => element.description == val).first.percent));
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            hintText:
                                                                                "Enter promo code",
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                          controller:
                                                                              _promoController,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right:
                                                                                8.0),
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              25,
                                                                          child:
                                                                              IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              bool valid = state
                                                                                  .promoResponse!
                                                                                  .data!
                                                                                  .where((element) => element.description == _promoController.text)
                                                                                  .isNotEmpty;


                                                                              print(
                                                                                  valid);
                                                                              if (valid) {
                                                                                context
                                                                                    .read<CartBloc>()
                                                                                    .add(PromoValidation(valid==true?1:2));
                                                                                showSnackBar(
                                                                                    dialogcontext,
                                                                                    "Promo Code Applied Successfully",
                                                                                    Colors.teal);
                                                                                _promoFocus.unfocus();
                                                                                Navigator.pop(dialogcontext);
                                                                              }
                                                                              else
                                                                                showSnackBar(
                                                                                    dialogcontext,
                                                                                    "Invalid Promo Code",
                                                                                    Colors.red);
                                                                            },
                                                                            icon: Icon(
                                                                                Icons.navigate_next),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  ListTile(
                                                                    title: new Text(
                                                                      'Your Promo Code',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w800),
                                                                    ),
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        height / 3,
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child: Column(
                                                                          children: [
                                                                            for (int i =
                                                                                    0;
                                                                                i < state.promoResponse!.data!.length;
                                                                                i++)
                                                                              Container(
                                                                                margin: EdgeInsets.only(
                                                                                    top: 20,
                                                                                    left: 20,
                                                                                    right: 20),
                                                                                width:
                                                                                    width,
                                                                                height:
                                                                                    100,
                                                                                child:
                                                                                    Row(children: [
                                                                                  Expanded(
                                                                                      flex: 4,
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        child:Container(
                                                                                            alignment: Alignment.center,

                                                                                            child: Center(
                                                                                                child: Text(
                                                                                              "${state.promoResponse!.data![i].percent!}%",
                                                                                              style: TextStyle(color:state.promoResponse!.data![i].image!.split(";")[0] != "" ?Colors.grey.shade600:Colors.grey.shade600, fontWeight: FontWeight.w800, fontSize: 25),
                                                                                            )),

                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.grey.withOpacity(0.1),
                                                                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                                                                          image: state.promoResponse!.data![i].image!.split(";")[0] != "" ? DecorationImage(image: NetworkImage(UrlConstants.imageurl + state.promoResponse!.data![i].image!.split(";")[0]),opacity: 0.2, fit: BoxFit.fill) : null,
                                                                                        ),
                                                                                      ))),
                                                                                  Expanded(
                                                                                      flex: 8,
                                                                                      child: Container(
                                                                                        color: Colors.white,
                                                                                        padding: EdgeInsets.all(10),
                                                                                        child: Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                                padding: EdgeInsets.only(top: 5),
                                                                                                child: Text(
                                                                                                  state.promoResponse!.data![i].name!,
                                                                                                  style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w800),
                                                                                                )),
                                                                                            Container(
                                                                                              padding: EdgeInsets.only(top: 5),
                                                                                              child: Text(
                                                                                                "${state.promoResponse!.data![i].description!}",
                                                                                                style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w800, fontSize: 11),
                                                                                                maxLines: 1,
                                                                                                overflow: TextOverflow.ellipsis,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      )),
                                                                                  Expanded(
                                                                                      flex: 4,
                                                                                      child: Container(
                                                                                        height: double.infinity,
                                                                                        width: double.infinity,
                                                                                        color: Colors.white,
                                                                                        child: Center(
                                                                                            child: Button(
                                                                                          Strings.apply,
                                                                                          true,
                                                                                          textColor: Colors.white,
                                                                                          color: Colors.red,
                                                                                          onPressed: () {
                                                                                            context.read<CartBloc>().add(PromoAddEvent(state.promoResponse!.data![i].description,state.promoResponse!.data![i].percent));
                                                                                          },
                                                                                        )),
                                                                                      )),
                                                                                ]),
                                                                                decoration:
                                                                                    BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                ),
                                                                              ),
                                                                          ]),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Enter promo code",
                                          border: InputBorder.none,
                                        ),
                                        controller: _promoController,
                                        focusNode: _promoFocus,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: state.promovalid==1?IconButton(
                                        onPressed: () {

                                          context.read<CartBloc>().add(PromoValidation(0));
                                          context.read<CartBloc>().add(PromoAddEvent(
                                            "",""
                                          ));
                                        },
                                        icon: Icon(Icons.clear)):CircleAvatar(
                                        radius: 25,
                                        child: IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.navigate_next,color: Colors.white,),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                ListTile(
                                  title: Text("Total Amount"),
                                  trailing: Text("\u{20B9}${state.promoPercent==null||state.promoPercent==""?state.total:(state.total-((state.total*double.parse(state.promoPercent??"0"))/100))}"),
                                ),
                                Button(
                                  Strings.checkout,
                                  true,
                                  textColor: Colors.white,
                                  color: Colors.red,
                                  onPressed: () {
                                    List<Details> list = [];
                                    for(int j=0;j<state.response!.data!.length;j++) {
                                      print(state.response!.data![j]
                                          .sizeVarient ?? "");
                                      print(state.response!.data![j]
                                          .colorVarient ?? "");
                                      list.add(Details(
                                          productId: state.response!.data![j]
                                              .productId!,
                                          quantity: state.itemcount![j],
                                          price: state.response!.data![j]
                                              .price!,
                                          productName: state.response!.data![j]
                                              .productName!,
                                          image: state.response!.data![j]
                                              .image!,
                                          sizeVarient: state.response!.data![j]
                                              .sizeVarient ?? "",
                                          colorVarient: state.response!.data![j]
                                              .colorVarient ?? ""));
                                    }
                                    Navigator.pushNamed(context, AppRoutes.checkout,arguments: [list,state.promovalid,state.promoPercent==null||state.promoPercent==""?state.total:(state.total-((state.total*double.parse(state.promoPercent??"0"))/100)),state.promocode,state.promoPercent]);
                                  },
                                ),
                              ],
                            )
                          : Container(
                              height: height / 1.5,
                              child: Center(
                                  child: Container(
                                height: 150,
                                width: 150,
                                child: Image.asset(
                                  'assets/download.png',
                                ),
                              )),
                            )
                      : Container()
                ],
              ),
            )),
          ),
        );
      },
      listener: (BuildContext context, CartState state) {
        _promoController.text = state.promocode ?? "";
        print(state.itemcount);
        if (state.message != null && state.message != "") if (!state.result)
          showSnackBar(context, state.message!, Colors.red);
        else
          showSnackBar(context, state.message!, Colors.teal);


      },
    );
  }
}

void showSnackBar(BuildContext context, String text, Color color) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10))),
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'Dismiss',
      disabledTextColor: Colors.white,
      textColor: Colors.yellow,
      onPressed: () {
        //Do whatever you want
      },
    ),
    onVisible: () {
      //your code goes here
    },
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
