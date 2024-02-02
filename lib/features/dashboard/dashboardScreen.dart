import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomservice/features/cart/bloc/cart_bloc.dart';
import 'package:ecomservice/features/cart/cartScreen.dart';
import 'package:ecomservice/features/favourites/bloc/favourites_bloc.dart';
import 'package:ecomservice/features/favourites/favouritesScreen.dart';
import 'package:ecomservice/features/profile/bloc/profile_bloc.dart';
import 'package:ecomservice/features/profile/profileScreen.dart';
import 'package:ecomservice/model/SearchResponse.dart';
import 'package:ecomservice/features/categories/bloc/category_bloc.dart';
import 'package:ecomservice/features/categories/categoriesScreen.dart';
import 'package:ecomservice/features/dashboard/bloc/dash_bloc.dart';
import 'package:ecomservice/features/forgotpassword/bloc/forgotpassword_bloc.dart';
import 'package:ecomservice/features/forgotpassword/forgotPassScreen.dart';
import 'package:ecomservice/features/signup/bloc/signup_bloc.dart';
import 'package:ecomservice/features/signup/signupScreen.dart';
import 'package:ecomservice/repo/cartrepo.dart';
import 'package:ecomservice/repo/favouritesrepo.dart';
import 'package:ecomservice/repo/forgotpassrepo.dart';
import 'package:ecomservice/repo/profilerepo.dart';
import 'package:ecomservice/utils/router.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:searchfield/searchfield.dart';
import '../../network/dio_helper.dart';
import '../../network/urlConstants.dart';
import '../../repo/categoriesrepo.dart';
import '../../repo/signuprepo.dart';
import '../../utils/customBottomBar.dart';
import '../../utils/ratings.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  final _scrollController = ScrollController();

  var scrollpos;
  int limit = 4;
  int offset = 4;
  int page = 0;
  List<Widget> _buildScreens() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return [
      categoryScreen(),
      favouritesScreen(),
      dashScreen(),
      cartScreen(),
      profileScreen()
    ];
  }

  refreshState() {
    context.read<DashBloc>().add(DashInit(limit, page * offset));
  }

  Future<bool> _onBackPressed() async {
    bool exit = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text(Strings.loginExitApp),
          content: const Text(Strings.loginAlertDiaTitle),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Dismiss the alert
              },
              child: Text(Strings.no),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Confirm exit
              },
              child: Text(Strings.yes),
            ),
          ],
        );
      },
    );
    return exit ?? false;
  }

  @override
  void initState() {
    limit = 4;
    offset = 4;
    page = 0;
    print("Dash Init Bloc: $page");
    context.read<DashBloc>().add(DashInit(limit, page * offset));
    _scrollController.addListener(_loadMore);
    super.initState();
  }

  void _loadMore() {
    print(_scrollController.position.pixels);
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      context.read<DashBloc>().add(LoadMoreEvent(limit, page * offset));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: HexColor("F9F9F9"),
          body: BlocBuilder<DashBloc, DashState>(
            builder: (context, state) {
              return _buildScreens()[state.selectedindex];
            },
          ),
          bottomNavigationBar:
              BlocBuilder<DashBloc, DashState>(builder: (context, state) {
            return CustomBottomBar(
              selectcolor: Colors.black,
              selectedIndex: state.selectedindex,
              cartno: state.cartcount,
              item0tap: () {
                if (_scrollController.hasClients)
                  scrollpos = _scrollController.position.pixels;
                context.read<DashBloc>().add(DashBottonIndex(0));
              },
              item1tap: () {
                if (_scrollController.hasClients)
                  scrollpos = _scrollController.position.pixels;
                context.read<DashBloc>().add(DashRefresh());
                context.read<DashBloc>().add(DashBottonIndex(1));
              },
              item2tap: () {
                context.read<DashBloc>().add(DashRefresh());
                context.read<DashBloc>().add(DashBottonIndex(2));
                Future.delayed(Duration(milliseconds: 30)).then((value) {
                  _scrollController.animateTo(scrollpos,
                      duration: Duration(milliseconds: 1),
                      curve: Curves.easeIn);
                });
              },
              item3tap: () {
                if (_scrollController.hasClients)
                  scrollpos = _scrollController.position.pixels;
                context.read<DashBloc>().add(DashBottonIndex(3));
              },
              item4tap: () {
                if (_scrollController.hasClients)
                  scrollpos = _scrollController.position.pixels;
                context.read<DashBloc>().add(DashBottonIndex(4));
              },
            );
          }),
        ));
  }

  Widget dashScreen() {
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocConsumer<DashBloc, DashState>(listener: (context, state) {
          print(state);
        }, builder: (context, state) {
          late List<Widget> imageSliders;
          if (state.response != null) {
            imageSliders = state.response!.dashimages!
                .map((item) => Container(
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                    UrlConstants.imageurl +
                                        Strings.dashboard +
                                        "/" +
                                        item.image!,
                                    fit: BoxFit.fill,
                                    width: 1000.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blueAccent,
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(
                                      item.description!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ))
                .toList();
          }
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
                      // height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: CustomScrollView(
                        controller: _scrollController,
                        slivers: <Widget>[
                          SliverLayoutBuilder(
                            builder: (BuildContext context, constraints) {
                              final scrolled = constraints.scrollOffset > 0;
                              return SliverAppBar(
                                pinned: false,
                                stretch: true,
                                centerTitle: true,
                                flexibleSpace: AppBar(
                                  leading: null,
                                  title: Text(
                                    Strings.home,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: Colors.grey.shade700,
                                              )),
                                          if (state.favouritesResponse != null)
                                            if (state.favouritesResponse!.data!
                                                    .length >
                                                0)
                                              Container(
                                                child: Text(
                                                  state.favouritesResponse!
                                                      .data!.length
                                                      .toString(),
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
                                                            Radius.circular(
                                                                25))),
                                              )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.grey.shade700,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SliverToBoxAdapter(
                              child: Column(children: [
                            state.response != null
                                ? CarouselSlider(
                                    options: CarouselOptions(
                                      aspectRatio: 2.0,
                                      enlargeCenterPage: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: true,
                                    ),
                                    items: imageSliders,
                                  )
                                : Container(),
                          ])),
                          SliverLayoutBuilder(
                              builder: (BuildContext context, constraints) {
                            final scrolled = constraints.scrollOffset > 0;
                            return SliverAppBar(
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
                                      borderRadius: BorderRadius.circular(15)),
                                  margin: const EdgeInsets.only(
                                      top: 5.0, bottom: 5, left: 10, right: 10),
                                  child: SearchField<Data>(
                                    itemHeight: 50,
                                    onSearchTextChanged: (query) {
                                      // if (query.length > 2)
                                      context
                                          .read<DashBloc>()
                                          .add(DashSearch(query));
                                    },
                                    suggestionState: Suggestion.expand,
                                    onSuggestionTap: (suggestion) async {
                                      await Navigator.pushNamed(
                                          context, AppRoutes.productdetail,
                                          arguments:
                                              (suggestion.item!.productId));
                                      context
                                          .read<DashBloc>()
                                          .add(DashRefresh());
                                    },
                                    suggestions: state.searchdata?.data != null
                                        ? state.searchdata!.data!
                                            .map(
                                              (e) => SearchFieldListItem<Data>(
                                                e.name!,
                                                item: e,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0,
                                                          right: 10,
                                                          top: 5,
                                                          bottom: 5),
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(UrlConstants
                                                                    .imageurl +
                                                                e.image!.split(
                                                                    ';')[0]),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(e.name!),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList()
                                        : [],
                                    searchInputDecoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      hintText: Strings.hintsearch,
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                      border: InputBorder.none,
                                    ),
                                  ),
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
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 1,
                                      childAspectRatio: 1),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int i) {
                                  return state.response != null
                                      ? GestureDetector(
                                          onTap: () async {
                                            await Navigator.pushNamed(context,
                                                AppRoutes.productdetail,
                                                arguments: state.response!
                                                    .data![i].productId);
                                            context
                                                .read<DashBloc>()
                                                .add(DashRefresh());
                                          },
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Column(
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
                                                                    state.response!.data![i].quantity !=
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
                                                                    image: NetworkImage(UrlConstants
                                                                            .imageurl +
                                                                        state
                                                                            .response!
                                                                            .data![i]
                                                                            .image!
                                                                            .split(';')[0]))),
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
                                                                fontSize: 12),
                                                          ),
                                                        )
                                                    ],
                                                    alignment:
                                                        Alignment.topRight,
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10),
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .bottomCenter,
                                                          end: Alignment
                                                              .topCenter,
                                                          colors: [
                                                            Colors
                                                                .grey.shade300,
                                                            Colors.white,
                                                            Colors.white,
                                                          ],
                                                        ),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
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
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            8.0,
                                                                        top: 5),
                                                                child: Text(
                                                                  "${state.response!.data![i].name!}",
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
                                                                        left:
                                                                            8.0,
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
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              12,
                                                                        )),
                                                                    Text(
                                                                        "${(double.parse(state.response!.data![i].price!)).toStringAsFixed(0)}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.grey,
                                                                            decoration: TextDecoration.lineThrough)),
                                                                    Text(
                                                                        "${((double.parse(state.response!.data![i].price!)) - ((double.parse(state.response!.data![i].price!) * double.parse(state.response!.data![i].discountPercent!)) / 100)).toStringAsFixed(2)}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.blueAccent)),
                                                                  ],
                                                                ),
                                                              ),
                                                              state
                                                                          .response!
                                                                          .data?[
                                                                              i]
                                                                          .ratings !=
                                                                      null
                                                                  ? Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
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
                                                                          Text(
                                                                            "(${state.response!.data![i].ratingsCount.toString()})",
                                                                            style:
                                                                                TextStyle(color: Colors.grey),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              15),
                                                                    )
                                                            ],
                                                          ),
                                                          state.favouritesResponse !=
                                                                  null
                                                              ? InkWell(
                                                                  onTap: () {
                                                                    state.favouritesResponse!.data!.contains(state
                                                                            .response!
                                                                            .data![
                                                                                i]
                                                                            .productId)
                                                                        ? context.read<DashBloc>().add(FavouriteDeleteEvent(state
                                                                            .response!
                                                                            .data![
                                                                                i]
                                                                            .productId))
                                                                        : context.read<DashBloc>().add(FavouriteInsertEvent(state
                                                                            .response!
                                                                            .data![i]
                                                                            .productId));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    // decoration: BoxDecoration(
                                                                    //   shape: BoxShape.circle,
                                                                    //   color: Colors.white
                                                                    // ),
                                                                    // padding: const EdgeInsets.all( 8.0),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            right:
                                                                                8),
                                                                    child: state.favouritesResponse!.data!.contains(state
                                                                            .response!
                                                                            .data![
                                                                                i]
                                                                            .productId)
                                                                        ? Icon(
                                                                            Icons.favorite,
                                                                            color:
                                                                                Colors.red,
                                                                          )
                                                                        : Icon(Icons
                                                                            .favorite_border),
                                                                  ),
                                                                )
                                                              : Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child:
                                                                      SizedBox(
                                                                    height: 25,
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
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Colors.grey),
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                      "Out of stock",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white),
                                                    ))
                                            ],
                                          ),
                                        )
                                      : Container();
                                },
                                childCount: state.response != null
                                    ? state.response!.data!.length
                                    : 0,
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height / 5),
                          )
                        ],
                      ),
                    ),
                    // AppBar(
                    //   title: Text(
                    //     Strings.home,
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.w800,
                    //         color: Colors.black,
                    //         fontSize: 16),
                    //   ),
                    //   backgroundColor: Colors.white,
                    //   elevation: 0,
                    //   actions: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Icon(
                    //         Icons.favorite_border,
                    //         color: Colors.grey.shade700,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Icon(
                    //         Icons.shopping_cart,
                    //         color: Colors.grey.shade700,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // state.response != null
                    //     ? CarouselSlider(
                    //         options: CarouselOptions(
                    //           aspectRatio: 2.0,
                    //           enlargeCenterPage: true,
                    //           scrollDirection: Axis.horizontal,
                    //           autoPlay: true,
                    //         ),
                    //         items: imageSliders,
                    //       )
                    //     : Container(),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey.shade400,
                    //       borderRadius: BorderRadius.circular(15)),
                    //   margin: const EdgeInsets.all(10.0),
                    //   child: SearchField<Data>(
                    //     itemHeight: 50,
                    //     onSearchTextChanged: (query) {
                    //       if (query.length > 2)
                    //         context.read<DashBloc>().add(DashSearch(query));
                    //     },
                    //     suggestionState: Suggestion.expand,
                    //     onSuggestionTap: (suggestion) {
                    //       print(suggestion.item!.productId);
                    //     },
                    //     suggestions: state.searchdata?.data != null
                    //         ? state.searchdata!.data!
                    //             .map(
                    //               (e) => SearchFieldListItem<Data>(
                    //                 e.name!,
                    //                 item: e,
                    //                 child: Container(
                    //                   padding: const EdgeInsets.only(
                    //                       left: 10.0, right: 10, top: 5, bottom: 5),
                    //                   child: Row(
                    //                     children: [
                    //                       CircleAvatar(
                    //                         backgroundImage: NetworkImage(
                    //                             Strings.imageurl +
                    //                                 e.image!.split(';')[0]),
                    //                       ),
                    //                       SizedBox(
                    //                         width: 10,
                    //                       ),
                    //                       Text(e.name!),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             )
                    //             .toList()
                    //         : [],
                    //     searchInputDecoration: InputDecoration(
                    //       prefixIcon: Icon(Icons.search),
                    //       hintText: Strings.hintsearch,
                    //       border: InputBorder.none,
                    //     ),
                    //   ),
                    // ),
                    // state.response != null
                    //     ? Expanded(
                    //         child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: GridView.count(
                    //           crossAxisCount: 2,
                    //           crossAxisSpacing: 10,
                    //           children: [
                    //             for (int i = 0;
                    //                 i < state.response!.data!.length;
                    //                 i++)
                    //               Column(
                    //                 mainAxisAlignment: MainAxisAlignment.end,
                    //                 crossAxisAlignment: CrossAxisAlignment.center,
                    //                 children: [
                    //                   Container(
                    //                     height: MediaQuery.of(context).size.height /
                    //                         6.5,
                    //                     width: MediaQuery.of(context).size.height /
                    //                         6.5,
                    //                     decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.only(
                    //                             topLeft: Radius.circular(10),
                    //                             topRight: Radius.circular(10)),
                    //                         gradient: LinearGradient(
                    //                           begin: Alignment.topCenter,
                    //                           end: Alignment.bottomCenter,
                    //                           colors: [
                    //                             Colors.blue.shade800,
                    //                             Colors.grey.shade400,
                    //                             Colors.white,
                    //                             Colors.white,
                    //                           ],
                    //                         ),
                    //                         image: DecorationImage(
                    //                             image: NetworkImage(Strings
                    //                                     .imageurl +
                    //                                 state.response!.data![i].image!
                    //                                     .split(';')[0]))),
                    //                   ),
                    //                   Container(
                    //                       padding: EdgeInsets.only(bottom: 10),
                    //                       decoration: BoxDecoration(
                    //                         gradient: LinearGradient(
                    //                           begin: Alignment.bottomCenter,
                    //                           end: Alignment.topCenter,
                    //                           colors: [
                    //                             Colors.grey.shade300,
                    //                             Colors.white,
                    //                             Colors.white,
                    //                           ],
                    //                         ),
                    //                       ),
                    //                       width:
                    //                           MediaQuery.of(context).size.height /
                    //                               6.5,
                    //                       child: Column(
                    //                         children: [
                    //                           Text(
                    //                             "${state.response!.data![i].name!}",
                    //                             style: TextStyle(
                    //                                 fontWeight: FontWeight.w600),
                    //                           ),
                    //                           Row(
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment.center,
                    //                             children: [
                    //                               Text("Rs.",
                    //                                   style: TextStyle(
                    //                                     fontWeight: FontWeight.w400,
                    //                                     color: Colors.black,
                    //                                     fontSize: 12,
                    //                                   )),
                    //                               Text(
                    //                                   "${double.parse(state.response!.data![i].price!).toStringAsFixed(0)} ",
                    //                                   style: TextStyle(
                    //                                       fontSize: 12,
                    //                                       fontWeight:
                    //                                           FontWeight.w400,
                    //                                       color: Colors.grey,
                    //                                       decoration: TextDecoration
                    //                                           .lineThrough)),
                    //                               Text(
                    //                                   "${double.parse(state.response!.data![i].price!).toStringAsFixed(0)}",
                    //                                   style: TextStyle(
                    //                                       fontSize: 12,
                    //                                       fontWeight:
                    //                                           FontWeight.w400,
                    //                                       color:
                    //                                           Colors.blueAccent)),
                    //                             ],
                    //                           ),
                    //                         ],
                    //                       ))
                    //                 ],
                    //               )
                    //           ],
                    //         ),
                    //       ))
                    //     : Container()
                  ],
                ),
              ),
              state.loading ? CircularProgressIndicator() : Container()
            ],
          );
        }),
      ),
    );
  }

  Widget signupScreen() {
    return BlocProvider(
      create: (context) =>
          SignupBloc(SignupRepository(DioHelper().getInstance())),
      child: SignupScreen(),
    );
  }

  Widget profileScreen() {
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileRepo(DioHelper().getInstance())),
      child: const ProfileScreen(),
    );
  }

  Widget categoryScreen() {
    return BlocProvider(
      create: (context) =>
          CategoryBloc(CategoryRepository(DioHelper().getInstance())),
      child: CategoryScreen(),
    );
  }

  Widget favouritesScreen() {
    return BlocProvider(
      create: (context) =>
          FavouritesBloc(FavouritesRepository(DioHelper().getInstance())),
      child: FavouritesScreen(),
    );
  }

  Widget cartScreen() {
    return BlocProvider(
      create: (context) => CartBloc(CartRepository(DioHelper().getInstance())),
      child: CartScreen(),
    );
  }
}
