import 'package:ecomservice/utils/router.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:searchfield/searchfield.dart';
import '../../model/SimilarProductResponse.dart';
import '../../network/urlConstants.dart';
import '../../utils/ratings.dart';
import 'bloc/product_list_bloc.dart';

class ProductListScreen extends StatefulWidget {
  final id;
  ProductListScreen(this.id, {super.key});

  @override
  State<ProductListScreen> createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  final _scrollController = ScrollController();
  final textEditingController = TextEditingController();
  int limit = 20;
  int offset = 20;
  int page = 0;

  String textvalue = "";

  @override
  void initState() {
    _scrollController.addListener(_loadMore);
    super.initState();
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print("loaded");
      page++;

      context
          .read<ProductListBloc>()
          .add(LoadMoreEvent(widget.id, limit, page * offset));
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProductListBloc>().add(ProductInit(widget.id, limit, page * offset));
    return Scaffold(
      backgroundColor: HexColor("F9F9F9"),
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: BlocConsumer<ProductListBloc, ProductListState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: CustomScrollView(
                                  controller: _scrollController,
                                  slivers: <Widget>[
                                    SliverLayoutBuilder(builder:
                                        (BuildContext context, constraints) {
                                      return SliverAppBar(
                                          automaticallyImplyLeading: false,
                                          backgroundColor: Colors.white,
                                          pinned: true,
                                          stretch: true,
                                          flexibleSpace: Container(
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      // Colors
                                                      //     .blue.shade800,
                                                      Colors.grey.shade300,
                                                      Colors.grey.shade200,
                                                      Colors.grey.shade300,
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              margin: const EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5,
                                                  left: 10,
                                                  right: 10),
                                              child: TextField(
                                                controller:
                                                    textEditingController,
                                                onChanged: (val) {
                                                  context
                                                      .read<ProductListBloc>()
                                                      .add(RefreshEvent(val));
                                                },
                                                decoration: InputDecoration(
                                                  prefixIcon:
                                                      Icon(Icons.search),
                                                  hintText: Strings.hintsearch,
                                                  hintStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                  border: InputBorder.none,
                                                ),
                                              )
                                              // SearchField<Data>(
                                              //   itemHeight: 50,
                                              //   onSearchTextChanged: (query) {
                                              //
                                              //   },
                                              //   suggestionState: Suggestion.expand,
                                              //   // onSuggestionTap: (suggestion) {
                                              //   //   Navigator.pushNamed(
                                              //   //       context, AppRoutes.productdetail,
                                              //   //       arguments:
                                              //   //       (suggestion.item!.productId));
                                              //   // },
                                              //   suggestions: state.response != null
                                              //       ? state.response!.data!.map(
                                              //         (e) => SearchFieldListItem<Data>(
                                              //       e.name!,
                                              //       item: e,
                                              //       child: Container(
                                              //         padding:
                                              //         const EdgeInsets.only(
                                              //             left: 10.0,
                                              //             right: 10,
                                              //             top: 5,
                                              //             bottom: 5),
                                              //         child: Row(
                                              //           children: [
                                              //             CircleAvatar(
                                              //               backgroundImage:
                                              //               NetworkImage(UrlConstants
                                              //                   .imageurl +
                                              //                   e.image!.split(
                                              //                       ';')[0]),
                                              //             ),
                                              //             SizedBox(
                                              //               width: 10,
                                              //             ),
                                              //             Text(e.name!),
                                              //           ],
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   )
                                              //       .toList()
                                              //       : [],
                                              //   searchInputDecoration: InputDecoration(
                                              //     prefixIcon: Icon(Icons.search),
                                              //     hintText: Strings.hintsearch,
                                              //     hintStyle: TextStyle(
                                              //         fontWeight: FontWeight.w400,
                                              //         fontSize: 14),
                                              //     border: InputBorder.none,
                                              //   ),
                                              // ),
                                              ));
                                    }),
                                    SliverToBoxAdapter(
                                      child: Divider(
                                        thickness: 2,
                                      ),
                                    ),
                                    DecoratedSliver(
                                      decoration: BoxDecoration(
                                        color: HexColor("F9F9F9"),
                                        // boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 5)],
                                        // borderRadius: BorderRadius.all(Radius.circular(30))
                                      ),
                                      sliver: SliverGrid.count(
                                        crossAxisCount: 2,
                                        children: [
                                          if(state.response!=null)
                                          for (int i = 0;
                                              i < state.response!.data!.length;
                                              i++)
                                            if(state.response!.data![i].name!.toLowerCase().contains(state.saerchvalue.toLowerCase()))
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.productdetail,
                                                    arguments: state.response!
                                                        .data![i].productId);
                                              },
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
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
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                10),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                10)),
                                                                    gradient: state.response!.data![i].quantity !=
                                                                                null &&
                                                                            state.response!.data![i].quantity! >
                                                                                0
                                                                        ? LinearGradient(
                                                                            begin:
                                                                                Alignment.topCenter,
                                                                            end:
                                                                                Alignment.bottomCenter,
                                                                            colors: [
                                                                              Colors.blue.shade800,
                                                                              Colors.grey.shade400,
                                                                              Colors.white,
                                                                              Colors.white,
                                                                            ],
                                                                          )
                                                                        : LinearGradient(
                                                                            begin:
                                                                                Alignment.topCenter,
                                                                            end:
                                                                                Alignment.bottomCenter,
                                                                            colors: [
                                                                              Colors.grey.shade800,
                                                                              Colors.grey.shade400,
                                                                              Colors.white,
                                                                              Colors.white,
                                                                            ],
                                                                          ),
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(UrlConstants.imageurl +
                                                                            state.response!.data![i].image!.split(';')[0]))),
                                                          ),
                                                          if (double.parse(state
                                                                  .response!
                                                                  .data![i]
                                                                  .discountPercent!) >
                                                              0)
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white
                                                                      .withOpacity(
                                                                          0.5),
                                                              child: Text(
                                                                "${state.response!.data![i].discountPercent}%",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .cyan
                                                                        .shade800,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12),
                                                              ),
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
                                                          child: Stack(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            8.0,
                                                                        top: 5),
                                                                    child: Text(
                                                                      "${state.response!.data![i].name!}",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            8.0,
                                                                        top: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            "Rs.",
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              color: Colors.black,
                                                                              fontSize: 12,
                                                                            )),
                                                                        Text(
                                                                            "${(double.parse(state.response!.data![i].price!)).toStringAsFixed(0)}",
                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.grey,
                                                                                decoration: TextDecoration.lineThrough)),
                                                                        Text(
                                                                            "${((double.parse(state.response!.data![i].price!)) - ((double.parse(state.response!.data![i].price!) * double.parse(state.response!.data![i].discountPercent!)) / 100)).toStringAsFixed(2)}",
                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.blueAccent)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  state.response!.data?[i]
                                                                              .ratings !=
                                                                          null
                                                                      ? Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 8.0),
                                                                          child:
                                                                              StarRating(
                                                                            onRatingChanged:
                                                                                (val) {
                                                                              print(val);
                                                                            },
                                                                            size:
                                                                                15,
                                                                            clickable:
                                                                                false,
                                                                            fillcolor:
                                                                                Colors.amber,
                                                                            rating: state.response!.data![i].ratings != null
                                                                                ? double.parse(state.response!.data![i].ratings!)
                                                                                : 0,
                                                                          ),
                                                                        )
                                                                      : Container(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              bottom: 15),
                                                                        )
                                                                ],
                                                              ),
                                                              state.favouritesResponse !=
                                                                      null
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () {
                                                                        state.favouritesResponse!.data!.contains(state.response!.data![i].productId)
                                                                            ? context.read<ProductListBloc>().add(FavouriteDeleteEvent(state.response!.data![i].productId))
                                                                            : context.read<ProductListBloc>().add(FavouriteInsertEvent(state.response!.data![i].productId));
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        // decoration: BoxDecoration(
                                                                        //   shape: BoxShape.circle,
                                                                        //   color: Colors.white
                                                                        // ),
                                                                        // padding: const EdgeInsets.all( 8.0),
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                8),
                                                                        child: state.favouritesResponse!.data!.contains(state.response!.data![i].productId)
                                                                            ? Icon(
                                                                                Icons.favorite,
                                                                                color: Colors.red,
                                                                              )
                                                                            : Icon(Icons.favorite_border),
                                                                      ),
                                                                    )
                                                                  : Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            25,
                                                                      ),
                                                                    )
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                  if (!(state.response!.data![i]
                                                              .quantity !=
                                                          null &&
                                                      state.response!.data![i]
                                                              .quantity! >
                                                          0))
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            color: Colors.grey),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Text(
                                                          "Out of stock",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ))
                                                ],
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                    SliverPadding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        state.loading
                            ? CircularProgressIndicator()
                            : Container()
                      ],
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
