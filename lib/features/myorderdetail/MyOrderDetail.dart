import 'package:ecomservice/features/cart/cartScreen.dart';
import 'package:ecomservice/features/myorderdetail/bloc/myorderdetail_bloc.dart';
import 'package:ecomservice/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../model/ImagePickerModel.dart';
import '../../network/urlConstants.dart';
import '../../utils/button.dart';
import '../../values/strings.dart';

class MyOrderDetail extends StatefulWidget {
  final orderId;
  const MyOrderDetail(this.orderId, {super.key});

  @override
  State<MyOrderDetail> createState() => _MyOrderDetailState();
}

class _MyOrderDetailState extends State<MyOrderDetail> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController commentsController= TextEditingController();
  List<String> list = [];
  @override
  void initState() {
    context.read<MyorderdetailBloc>().add(MyOrderInit(widget.orderId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<MyorderdetailBloc, MyorderdetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            title: Text(
              Strings.orderdetail,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
            backgroundColor: Colors.white,
          ),
          body: state.response != null
              ? SafeArea(
                  child: Container(
                    height: height,
                    width: width,
                    child: Column(
                      children: [
                        ListTile(
                            dense: false,
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            title: Row(
                              children: [
                                Text(
                                  "OrderNo: ",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "ORDN${state.response?.header!.first.id}",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            trailing: Text(
                              "${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.response!.header!.first.createdOn!))}",
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w400),
                            )),
                        ListTile(
                            dense: false,
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            title:
                                state.response!.header!.first.trackingId != null
                                    ? Row(
                                        children: [
                                          Text("Tracking id:",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w400,
                                              )),
                                          Text(
                                            " ${state.response?.header!.first.trackingId}",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Text("Order status: ",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w400,
                                              )),
                                          Text(
                                            "${state.response!.header!.first.orderStatus == 0 ? Strings.tabProcessing : state.response!.header!.first.orderStatus == 1 ? Strings.tabDelivered : Strings.tabCancelled}",
                                            style: TextStyle(
                                                color: Colors.green.shade500,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                            trailing:
                                state.response!.header!.first.trackingId != null
                                    ? Text(
                                        "${state.response!.header!.first.orderStatus == 0 ? Strings.tabProcessing : state.response!.header!.first.orderStatus == 1 ? Strings.tabDelivered : Strings.tabCancelled}",
                                        style: TextStyle(
                                            color: Colors.green.shade500,
                                            fontWeight: FontWeight.w400),
                                      )
                                    : null),
                        ListTile(
                          title:
                              Text("${state.response?.details!.length} items"),
                        ),
                        for (int i = 0;
                            i < state.response!.details!.length;
                            i++)
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            width: width,
                            height: 110,
                            child: Row(children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      image: DecorationImage(
                                          image: NetworkImage(UrlConstants
                                                  .imageurl +
                                              state.response!.details![i].image!
                                                  .split(';')[0]),
                                          fit: BoxFit.fill),
                                    ),
                                  )),
                              Expanded(
                                  flex: 8,
                                  child: Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Text(
                                              state.response!.details![i]
                                                  .productName!,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.w800),
                                            )),
                                        Row(
                                          children: [
                                            if (state.response!.details![i]
                                                    .sizeVarient !=
                                                "")
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      top: 5, right: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Size: ",
                                                        style: TextStyle(
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                      ),
                                                      Text(
                                                        state
                                                            .response!
                                                            .details![i]
                                                            .sizeVarient!,
                                                        style: TextStyle(
                                                          color: Colors
                                                              .grey.shade800,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            if (state.response!.details![i]
                                                    .colorVarient !=
                                                "")
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Color: ",
                                                        style: TextStyle(
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 10,
                                                        width: 20,
                                                        color: HexColor(state
                                                            .response!
                                                            .details![i]
                                                            .colorVarient!),
                                                      )
                                                    ],
                                                  )),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Units " +
                                                    state.response!.details![i]
                                                        .quantity
                                                        .toString(),
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "\u{20B9}${double.parse(state.response!.details![i].price!)}",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade800,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 14),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // if (state
                                        //     .itemcount !=
                                        //     null)
                                        //   Container(
                                        //     margin: EdgeInsets
                                        //         .only(
                                        //         top:
                                        //         5),
                                        //     child: Row(
                                        //       children: [
                                        //         InkWell(
                                        //             onTap: state.itemcount![i] != 1
                                        //                 ? () {
                                        //               context.read<CartBloc>().add(ItemDecreaseEvent(state.itemcount![i] - 1, i, state.response!.data![i].productId!));
                                        //             }
                                        //                 : () {},
                                        //             child: Container(
                                        //                 decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                                        //                   BoxShadow(
                                        //                     color: Colors.grey,
                                        //                     offset: Offset(0.0, 1.0), //(x,y)
                                        //                     blurRadius: 6.0,
                                        //                   ),
                                        //                 ]),
                                        //                 child: Icon(
                                        //                   Icons.remove,
                                        //                   color: Colors.grey.shade800,
                                        //                 ))),
                                        //         Padding(
                                        //           padding: const EdgeInsets
                                        //               .all(
                                        //               8.0),
                                        //           child: Text(state
                                        //               .itemcount![i]
                                        //               .toString()),
                                        //         ),
                                        //         InkWell(
                                        //             onTap:
                                        //                 () {
                                        //               context.read<CartBloc>().add(ItemIncreaseEvent(state.itemcount![i] + 1, i, state.response!.data![i].productId!));
                                        //             },
                                        //             child: Container(
                                        //                 decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                                        //                   BoxShadow(
                                        //                     color: Colors.grey,
                                        //                     offset: Offset(0.0, 1.0), //(x,y)
                                        //                     blurRadius: 6.0,
                                        //                   ),
                                        //                 ]),
                                        //                 child: Icon(
                                        //                   Icons.add,
                                        //                   color: Colors.grey.shade800,
                                        //                 ))),
                                        //       ],
                                        //     ),
                                        //   )
                                      ],
                                    ),
                                  ))
                            ]),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ListTile(
                          title: Text(
                            Strings.orderinfo,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Text(Strings.shippingaddress + " : ")),
                              Expanded(
                                flex: 8,
                                child: Text(
                                    "${state.response?.header![0].address},${state.response?.header![0].city},\n${state.response?.header![0].state},${state.response?.header![0].country}",
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Text(Strings.paymentMethods + " : ")),
                              Expanded(
                                flex: 8,
                                child: Container(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Image.asset("assets/img.png"),
                                      Text(
                                        "XXXX XXXX XXXX " +
                                            state.response!.header![0].cardNo!
                                                .substring(10, 14),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Text(Strings.delivery + " : ")),
                              Expanded(
                                flex: 8,
                                child: Text("3 days, Flat \u{20B9}50",
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Text(Strings.totalAmount + " : ")),
                              Expanded(
                                flex: 8,
                                child: Text(
                                    "\u{20B9} ${state.response?.header![0].orderTotal}",
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                        if (state.response?.header![0].promoPercent != null &&
                            state.response?.header![0].promoPercent != "")
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            height: 40,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: Text(Strings.discount + " : ")),
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                      "${state.response?.header![0].promoPercent}%,using promocode ${state.response?.header![0].promoCode} ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        // if(state.response.header[0].)
                      ],
                    ),
                  ),
                )
              : Container(),
          // floatingActionButton: Button(
          //   "Rate this Product",
          //   true,
          //   onPressed: () {
          //
          //     // showModalBottomSheet(
          //     //     shape: RoundedRectangleBorder(
          //     //         borderRadius: BorderRadius.only(
          //     //             topLeft: Radius.circular(30),
          //     //             topRight: Radius.circular(30))),
          //     //     context: context,
          //     //     builder: (dialogcontext) {
          //     //       return Container(
          //     //         height: height / 1.75,
          //     //         decoration: BoxDecoration(
          //     //             borderRadius: BorderRadius.only(
          //     //                 topLeft: Radius.circular(20),
          //     //                 topRight: Radius.circular(20))),
          //     //         child: BlocProvider.value(
          //     //           value: context.watch<MyorderdetailBloc>(),
          //     //           child:
          //     //               BlocConsumer<MyorderdetailBloc, MyorderdetailState>(
          //     //             builder: (context, state) {
          //     //               if(state.images!=null)
          //     //                 for(int i=0;i<state.images!.list1.length;i++)
          //     //                   print("State------"+state.images!.list1[i]);
          //     //               return Scaffold(
          //     //                 backgroundColor: Colors.transparent,
          //     //                 body: Container(
          //     //                   width: width,
          //     //                   child: SingleChildScrollView(
          //     //                     child: Column(
          //     //                       crossAxisAlignment:
          //     //                           CrossAxisAlignment.center,
          //     //                       mainAxisSize: MainAxisSize.min,
          //     //                       children: <Widget>[
          //     //                         Container(
          //     //                           margin: EdgeInsets.only(
          //     //                               top: 14, bottom: 32),
          //     //                           height: 6,
          //     //                           width: 60,
          //     //                           decoration: BoxDecoration(
          //     //                               color: Colors.grey,
          //     //                               borderRadius: BorderRadius.all(
          //     //                                   Radius.circular(6))),
          //     //                         ),
          //     //                         Padding(
          //     //                           padding: const EdgeInsets.all(8.0),
          //     //                           child: Text(
          //     //                             'Rate this Product',
          //     //                             style: TextStyle(
          //     //                                 fontSize: 16,
          //     //                                 fontWeight: FontWeight.w600),
          //     //                           ),
          //     //                         ),
          //     //                         RatingBar.builder(
          //     //                           initialRating: 3,
          //     //                           minRating: 1,
          //     //                           direction: Axis.horizontal,
          //     //                           allowHalfRating: true,
          //     //                           itemCount: 5,
          //     //                           itemPadding: EdgeInsets.symmetric(
          //     //                               horizontal: 4.0),
          //     //                           itemBuilder: (context, _) => Icon(
          //     //                             Icons.star,
          //     //                             color: Colors.amber,
          //     //                           ),
          //     //                           onRatingUpdate: (rating) {
          //     //                             context
          //     //                                 .read<MyorderdetailBloc>()
          //     //                                 .ratings = rating;
          //     //                           },
          //     //                         ),
          //     //                         Padding(
          //     //
          //     //                           padding: const EdgeInsets.all(8.0),
          //     //                           child: Text(
          //     //                             'Please share your opinion \nabout product',
          //     //                             style: TextStyle(
          //     //                                 fontSize: 16,
          //     //                                 fontWeight: FontWeight.w600),
          //     //                             textAlign: TextAlign.center,
          //     //                           ),
          //     //                         ),
          //     //                         Container(
          //     //                           padding: const EdgeInsets.all(8.0),
          //     //                           margin: EdgeInsets.all(16),
          //     //                           decoration: BoxDecoration(
          //     //                               color: Colors.white,
          //     //                               borderRadius: BorderRadius.all(
          //     //                                   Radius.circular(10))),
          //     //                           child: TextField(
          //     //                             controller: commentsController,
          //     //                             maxLines: 3,
          //     //                             decoration: InputDecoration(
          //     //                                 hintText: "Comments",
          //     //                                 border: InputBorder.none),
          //     //                           ),
          //     //                         ),
          //     //                         Container(
          //     //                           width: width,
          //     //                           height: 80,
          //     //                           child: SingleChildScrollView(
          //     //                             scrollDirection: Axis.horizontal,
          //     //                             child: Row(
          //     //                               children: [
          //     //                                 if(state.images!=null)
          //     //                                 for(int i=0;i< state.images!.list1.length;i++)
          //     //                                   Container(
          //     //                                     margin: EdgeInsets.all(10),
          //     //                                     height: 70,width: 70,
          //     //                                       decoration:BoxDecoration(image: DecorationImage(
          //     //                                         image: AssetImage(state.images!.list1[i])
          //     //                                       )),
          //     //                                       ),
          //     //                                 InkWell(onTap: ()
          //     //                                     async {
          //     //                                       final XFile? pickedFile =
          //     //                                           await _picker
          //     //                                           .pickImage(
          //     //                                         source:
          //     //                                         ImageSource.gallery,
          //     //                                       );
          //     //                                       if (pickedFile != null) {
          //     //                                         context
          //     //                                             .read<
          //     //                                             MyorderdetailBloc>()
          //     //                                             .add(ImageAdd(Data1(list..add(pickedFile.path))));
          //     //                                       }
          //     //                                     }, child: Container(
          //     //                                   color: Colors.white,
          //     //                                     margin: EdgeInsets.all(10),
          //     //                                     height: 70,width: 70,child:Icon(Icons.add_a_photo_outlined))),
          //     //
          //     //                               ],
          //     //                             ),
          //     //                           ),
          //     //                         ),
          //     //                         SizedBox(height: 10,),
          //     //                         Button("Submit", true, onPressed: ()
          //     //                         {
          //     //
          //     //                           context.read<MyorderdetailBloc>().add(RatingsAdd(Data1(list), commentsController.text, context
          //     //                               .read<MyorderdetailBloc>()
          //     //                               .ratings, widget.orderId));
          //     //
          //     //                         })
          //     //                       ],
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               );
          //     //             },
          //     //                 listener: (BuildContext context, MyorderdetailState state) {
          //     //               if(state.message=="Success")
          //     //                 {
          //     //                   Navigator.pop(context);
          //     //                   showSnackBar(context, "Ratings added Successfully", Colors.green);
          //     //
          //     //                 }
          //     //
          //     //               },
          //     //           ),
          //     //         ),
          //     //       );
          //     //     });
          //   },
          // ),
        );
      },
    );
  }
}


