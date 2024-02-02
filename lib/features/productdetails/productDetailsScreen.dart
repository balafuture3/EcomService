import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomservice/features/cart/cartScreen.dart';
import 'package:ecomservice/features/dashboard/bloc/dash_bloc.dart';
import 'package:ecomservice/features/productdetails/bloc/productdetails_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';

import '../../network/urlConstants.dart';
import '../../utils/ratings.dart';
import '../../utils/router.dart';
import '../../values/strings.dart';

class ProductDetailsScreen extends StatefulWidget {
  final productId;
  ProductDetailsScreen(this.productId, {super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    context
        .read<ProductdetailsBloc>()
        .add(ProductDetailsInit(widget.productId));
    return Scaffold(
      backgroundColor: HexColor("F9F9F9"),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: BlocConsumer<ProductdetailsBloc, ProductdetailsState>(
              builder: (BuildContext context1, ProductdetailsState state) {
                late List<Widget> imageSliders;
                late List<String> imgList;
                if (state.response != null) {
                  imgList = state.response!.data!.image!.split(';');
                  imageSliders = state.response!.data!.image!
                      .split(';')
                      .map(
                        (item) => GestureDetector(
                          onDoubleTap: () {
                            showDialog(
                              context: context1,
                              builder: (BuildContext context) {
                                return Scaffold(
                                  body: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      GestureDetector(
                                        onDoubleTap: () {
                                          Navigator.pop(context1);
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: InteractiveViewer(
                                            panEnabled:
                                                false, // Set it to false
                                            boundaryMargin: EdgeInsets.all(100),
                                            minScale: 0.5,
                                            maxScale: 2,
                                            child: Image.network(
                                                UrlConstants.imageurl + item,
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.black.withOpacity(0.5),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        UrlConstants.imageurl + item,
                                      ),
                                      fit: BoxFit.contain))),
                        ),
                      )
                      .toList();
                }
                return state.response != null
                    ? Column(
                        children: [
                          Stack(
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                        onPageChanged: (index, reason) {
                                          context
                                              .read<ProductdetailsBloc>()
                                              .add(ImageChangeEvent(index));
                                        },
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.5,
                                        enableInfiniteScroll: false,
                                        enlargeCenterPage: true,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: false,
                                        reverse: false,
                                        viewportFraction: 1),
                                    items: imageSliders,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      final result = await Share.shareWithResult(
                                          'check out this product\n${state.response!.data!.name}\nhttp://43.204.56.154:8080/productdetail/${state.response!.data!.productId}');
                                      if (result.status ==
                                          ShareResultStatus.success) {
                                        print(
                                            'Thank you for sharing my website!');
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Colors.black.withOpacity(0.5),
                                        child: Icon(
                                          Icons.share,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.black.withOpacity(0.5),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          state.response!.data!.image!.split(";").length > 1
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      imgList.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () => context
                                          .read<ProductdetailsBloc>()
                                          .controller
                                          .animateToPage(entry.key),
                                      child: Container(
                                        width: state.imgeindex == entry.key
                                            ? 12
                                            : 8.0,
                                        height: 8.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.grey.shade600)
                                                .withOpacity(
                                                    state.imgeindex == entry.key
                                                        ? 0.9
                                                        : 0.4)),
                                      ),
                                    );
                                  }).toList())
                              : Container(),
                          Divider(),

                          ListTile(
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -2),
                              title: Text(
                                state.response!.data!.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.grey.shade700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Container(
                                // height: 80,
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Rs. ${((double.parse(state.response!.data!.price!)) - ((double.parse(state.response!.data!.price!) * double.parse(state.response!.data!.discountPercent!)) / 100)).toStringAsFixed(2)}",
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    (double.parse(state
                                                .response!.data!.discountPercent
                                                .toString())) >
                                            0
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${state.response!.data!.price!}",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.grey),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                "${state.response!.data!.discountPercent}% off",
                                                style: TextStyle(
                                                    color:
                                                        Colors.green.shade900),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                              subtitle: (state.response!.data!.ratings != null)
                                  ? StarRating(
                                      onRatingChanged: (val) {
                                        print(val);
                                      },
                                      size: 18,
                                      clickable: false,
                                      fillcolor: Colors.amber,
                                      rating: state.response!.data!.ratings !=
                                              null
                                          ? double.parse(
                                              state.response!.data!.ratings!)
                                          : 0,
                                    )
                                  : Text(
                                      "No ratings",
                                      style: TextStyle(color: Colors.blue),
                                    )
                              // :Container(),
                              // subtitle: Text(
                              //   state.response!.data!.description!,
                              //   style: TextStyle(),
                              //   maxLines: 3,
                              //   overflow: TextOverflow.ellipsis,
                              // ),
                              ),
                          Divider(),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            title: Text(
                              state.response!.data!.description!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.grey.shade500),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Divider(),
                          if (state.response!.data!.colors != null)
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                Strings.colors,
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          if (state.response!.data!.colors != null)
                            ListTile(
                              tileColor: HexColor("F9F9F9"),
                              // title: Text(
                              //   Strings.colors,
                              //   style: TextStyle(
                              //       color: Colors.grey.shade700,
                              //       fontWeight: FontWeight.w800),
                              // ),
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: 0),
                              subtitle: Row(
                                children: [
                                  for (int i = 0;
                                      i <
                                          state.response!.data!.colors
                                              .toString()
                                              .split(';')
                                              .length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        print(i);
                                        context
                                            .read<ProductdetailsBloc>()
                                            .add(ColorChangeEvent(i));
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              boxShadow: i == state.colorindex
                                                  ? [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1),
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade200,
                                                          spreadRadius: 2)
                                                    ]
                                                  : null,
                                              shape: BoxShape.circle,
                                              color: HexColor(state
                                                  .response!.data!.colors
                                                  .toString()
                                                  .split(';')[i]),
                                              border: i == state.colorindex
                                                  ? Border.all(
                                                      color: Colors.white,
                                                      width: 3)
                                                  : Border.all(
                                                      color: Colors.white,
                                                      width: 3),
                                            ),
                                          ),
                                          if (i == state.colorindex)
                                            Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            )
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          // ListTile(
                          //   dense: true,
                          //   visualDensity:
                          //   VisualDensity(horizontal: 0, vertical: -4),
                          //   title: Text(
                          //     "Rs. ${((double.parse(state.response!.data!.price!)) - ((double.parse(state.response!.data!.price!) * double.parse(state.response!.data!.discountPercent!)) / 100)).toStringAsFixed(2)}",
                          //     style: TextStyle(
                          //       color: Colors.grey.shade700,
                          //         fontWeight: FontWeight.w800, fontSize: 14),
                          //     maxLines: 1,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          //   subtitle: (double.parse(state
                          //       .response!.data!.discountPercent
                          //       .toString())) >
                          //       0
                          //       ? Row(
                          //     children: [
                          //       Text(
                          //         "${state.response!.data!.price!} ",
                          //         style: TextStyle(
                          //             decoration:
                          //             TextDecoration.lineThrough,
                          //             color: Colors.grey),
                          //         maxLines: 3,
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //       Text(
                          //         "${state.response!.data!.discountPercent}% off",
                          //         style: TextStyle(
                          //             color: Colors.green.shade900),
                          //         maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     ],
                          //   )
                          //       : Container(),
                          // ),
                          if (state.response!.data!.sizes != null)
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                Strings.sizes,
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          if (state.response!.data!.sizes != null)
                            ListTile(
                              tileColor: HexColor("F9F9F9"),
                              // title: Text(
                              //   Strings.sizes,
                              //   style: TextStyle(
                              //       color: Colors.grey.shade700,
                              //       fontWeight: FontWeight.w800),
                              // ),
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: 0),
                              subtitle: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  for (int i = 0;
                                      i <
                                          state.response!.data!.sizes
                                              .toString()
                                              .split(';')
                                              .length;
                                      i++)
                                    GestureDetector(
                                        onTap: () {
                                          print(i);
                                          context
                                              .read<ProductdetailsBloc>()
                                              .add(SizeChangeEvent(i));
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          margin: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            gradient: i == state.sizeindex
                                                ? LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.white,
                                                      Colors.white,
                                                      Colors.white,
                                                    ],
                                                  )
                                                : null,
                                            shape: BoxShape.rectangle,
                                            boxShadow: i == state.sizeindex
                                                ? [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        spreadRadius: 1),
                                                    BoxShadow(
                                                        color: Colors
                                                            .grey.shade200,
                                                        spreadRadius: 2)
                                                  ]
                                                : null,
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                state.response!.data!.sizes
                                                    .toString()
                                                    .split(';')[i],
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ))
                                ],
                              ),
                            ),
                          Divider(),
                          if(state.response!.data!.ratings!=null)
                          InkWell(child: ListTile(trailing:Icon(Icons.keyboard_arrow_right),title: Text("All Ratings and Reviews",style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600),)),onTap: ()
                            {
                              Navigator.pushNamed(context, AppRoutes.ratings,arguments:widget.productId);
                            },),
                          state.response1 != null
                              ? Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Similar products you may like",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      height: 400,
                                      width: MediaQuery.of(context).size.width,
                                      child: GridView.count(
                                        crossAxisCount: 2,
                                        physics: PageScrollPhysics(),
                                        children: [
                                          for (int i = 0; i < 4; i++)
                                            if (state.response1!.data![i]
                                                    .productId !=
                                                state.response!.data!.productId && (state.response1!.data![i].quantity!=null&&state.response1!.data![i].quantity!>0))
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      AppRoutes.productdetail,
                                                      arguments: state
                                                          .response1!
                                                          .data![i]
                                                          .productId);
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              7,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              5,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10)),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Colors
                                                                          .blue
                                                                          .shade800,
                                                                      Colors
                                                                          .grey
                                                                          .shade400,
                                                                      Colors
                                                                          .white,
                                                                      Colors
                                                                          .white,
                                                                    ],
                                                                  ),
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(UrlConstants
                                                                              .imageurl +
                                                                          state
                                                                              .response1!
                                                                              .data![i]
                                                                              .image!
                                                                              .split(';')[0]))),
                                                        ),
                                                        if (double.parse(state
                                                                .response1!
                                                                .data![i]
                                                                .discountPercent!) >
                                                            0)
                                                          CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white
                                                                    .withOpacity(
                                                                        0.5),
                                                            child: Text(
                                                                "${state.response1!.data![i].discountPercent}%",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .cyan
                                                                        .shade800,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                      ],
                                                      alignment:
                                                          Alignment.topRight,
                                                    ),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter,
                                                            colors: [
                                                              Colors.grey
                                                                  .shade300,
                                                              Colors.white,
                                                              Colors.white,
                                                            ],
                                                          ),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            5,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 8.0,
                                                                      top: 5),
                                                              child: Text(
                                                                "${state.response1!.data![i].name!}",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 8.0,
                                                                      top: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text("Rs.",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12,
                                                                      )),
                                                                  Text(
                                                                      "${(double.parse(state.response1!.data![i].price!)).toStringAsFixed(0)}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color: Colors
                                                                              .grey,
                                                                          decoration:
                                                                              TextDecoration.lineThrough)),
                                                                  Text(
                                                                      "${((double.parse(state.response1!.data![i].price!)) - ((double.parse(state.response1!.data![i].price!) * double.parse(state.response1!.data![i].discountPercent!)) / 100)).toStringAsFixed(2)}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.blueAccent)),
                                                                ],
                                                              ),
                                                            ),
                                                            state
                                                                        .response1!
                                                                        .data![
                                                                            i]
                                                                        .ratings !=
                                                                    null
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 8.0,
                                                                    ),
                                                                    child:
                                                                        StarRating(
                                                                      onRatingChanged:
                                                                          (val) {
                                                                        print(
                                                                            val);
                                                                      },
                                                                      size: 18,
                                                                      clickable:
                                                                          false,
                                                                      fillcolor:
                                                                          Colors
                                                                              .amber,
                                                                      rating: state.response1!.data![i].ratings !=
                                                                              null
                                                                          ? double.parse(state
                                                                              .response1!
                                                                              .data![i]
                                                                              .ratings!)
                                                                          : 0,
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            15),
                                                                  )
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          if (state.response?.data!.aboutItem != null)
                            ExpansionTile(
                              title: Text(
                                "About Item ",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              children: [
                                for (int i = 0;
                                    i <
                                        state.response!.data!.aboutItem
                                            .toString()
                                            .split(';')
                                            .length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Text(" * " +
                                        state.response!.data!.aboutItem
                                            .toString()
                                            .split(';')[i]
                                            .toString()),
                                  )
                              ],
                            ),
                          if (state.response?.data!.additionalInfo != null)
                            ExpansionTile(
                              title: Text("Additional Info ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w800)),
                              children: [
                                for (int i = 0;
                                    i <
                                        state.response!.data!.additionalInfo
                                            .toString()
                                            .split(';')
                                            .length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Text(" * " +
                                        state.response!.data!.additionalInfo
                                            .toString()
                                            .split(';')[i]
                                            .toString()),
                                  )
                              ],
                            ),
                        ],
                      )
                    : Container();
              },
              listener: (BuildContext context, ProductdetailsState state) {
                print(state.message.toString());
                if (state.addcart==1) {
                  // print("object");
                  showSnackBar(context, "Success", Colors.teal);
                  Navigator.pop(context);
                  // context.read<ProductdetailsBloc>().add(ProductDetailsInit(widget.productId));
                }
                else if (state.addcart==2)
                  showSnackBar(context, state.message!, Colors.red);
              },
            ),
          ),
        ),
      ),
      floatingActionButton:
          BlocBuilder<ProductdetailsBloc, ProductdetailsState>(
        builder: (context, state) {
          return FloatingActionButton.extended(
              onPressed: () {
                context.read<ProductdetailsBloc>().add(AddCardEvent(
                    state.response!.data!.productId,
                    state.response!.data!.quantity,
                    state.response!.data!.price,
                    state.response!.data!.name!,
                    state.response!.data!.colors != null
                        ? state.response!.data!.colors!
                            .split(';')[state.colorindex]
                        : null,
                    state.response!.data!.sizes != null
                        ? state.response!.data!.sizes!
                            .split(';')[state.sizeindex]
                        : null));
              },
              label: Row(
                children: [
                  Icon(Icons.add_shopping_cart),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add"),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
