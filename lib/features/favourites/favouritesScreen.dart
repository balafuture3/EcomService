import 'package:ecomservice/features/favourites/bloc/favourites_bloc.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/urlConstants.dart';
import '../../utils/ratings.dart';
import '../../utils/router.dart';
import '../dashboard/bloc/dash_bloc.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<String> datalist = [];
  @override
  void initState() {
    context.read<FavouritesBloc>().add(FavouritesInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<FavouritesBloc, FavouritesState>(
          builder: (context, state) {

            return Container(
                height: height,
                width: width,
                child: Container(
                    color:state.response != null?state.response!.data!.isNotEmpty? Colors.grey.shade200:Colors.white:Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CustomScrollView(slivers: <Widget>[
                      SliverAppBar(
                        actions: [
                          // IconButton(
                          //   onPressed: () {
                          //     if (state.response != null) {
                          //       datalist.clear();
                          //       for (int i = 0;
                          //           i < state.response!.data!.length;
                          //           i++)
                          //         datalist.add(state.response!.data![i].name!);
                          //     }
                          //
                          //     showSearch(
                          //         context: context,
                          //         delegate: CustomSearchDelegate(datalist));
                          //   },
                          //   icon: const Icon(
                          //     Icons.search,
                          //     color: Colors.black,
                          //   ),
                          // )
                        ],
                        backgroundColor: Colors.white,
                        pinned: true,
                        snap: false,
                        floating: false,
                        expandedHeight: 150.0,
                        flexibleSpace: FlexibleSpaceBar(
                          titlePadding: EdgeInsets.only(bottom: 15, left: 10),
                          title: Text(
                            Strings.favourite,
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w800),
                          ),

                          // background:
                          // state.response!=null?
                          // Image.network(
                          //   UrlConstants
                          //       .imageurl +
                          //       state.response!.data![0].image!.split(";")[0],
                          //   fit: BoxFit.fill,
                          // ):null,
                        ),
                      ),
                      SliverList.list(children: [
                        if (state.response != null)
                          for (int i = 0; i < state.response!.data!.length; i++)
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, AppRoutes.productdetail,arguments: state.response!.data![i].productId);
                              },
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        width: width,
                                        height: 100,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            UrlConstants
                                                                    .imageurl +
                                                                state
                                                                    .response!
                                                                    .data![i]
                                                                    .image!
                                                                    .split(
                                                                        ";")[0]),
                                                        fit: BoxFit.fill),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state.response!.data![i]
                                                          .category!,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10),
                                                    ),
                                                    Container(
                                                        padding: EdgeInsets.only(
                                                            top: 5),
                                                        child: Text(
                                                          state.response!.data![i]
                                                              .name!,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey.shade800,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        )),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.only(top: 5),
                                                      child: Text(
                                                        "\u{20B9}${((double.parse(state.response!.data![i].price!)) - ((double.parse(state.response!.data![i].price!) * double.parse(state.response!.data![i].discountPercent!)) / 100)).toStringAsFixed(2)}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey.shade600,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 11),
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    (double.parse(state
                                                                .response!
                                                                .data![i]
                                                                .discountPercent
                                                                .toString())) >
                                                            0
                                                        ? Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${state.response!.data![i].price!}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize: 10),
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              Text(
                                                                "${state.response!.data![i].discountPercent}% off",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green
                                                                        .shade900,
                                                                    fontSize: 10),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          )
                                                        : Container(),
                                                    (state.response!.data![i]
                                                                .ratings !=
                                                            null)
                                                        ? StarRating(
                                                            onRatingChanged:
                                                                (val) {
                                                              print(val);
                                                            },
                                                            size: 15,
                                                            clickable: false,
                                                            fillcolor:
                                                                Colors.amber,
                                                            rating: state
                                                                        .response!
                                                                        .data![i]
                                                                        .ratings !=
                                                                    null
                                                                ? double.parse(
                                                                    state
                                                                        .response!
                                                                        .data![i]
                                                                        .ratings!)
                                                                : 0,
                                                          )
                                                        : StarRating(
                                                            onRatingChanged:
                                                                (val) {
                                                              print(val);
                                                            },
                                                            size: 15,
                                                            clickable: false,
                                                            fillcolor:
                                                                Colors.amber,
                                                            rating: 0,
                                                          )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: state.closeloading && state.id ==i
                                            ?  Container(
                                                margin: EdgeInsets.only(
                                                    right: 10, top: 10),
                                                height: 20,
                                                width: 20,
                                                child: CircularProgressIndicator(
                                                  color: Colors.brown,
                                                )):IconButton(
                                            onPressed: () {
                                              context
                                                  .read<FavouritesBloc>()
                                                  .add(FavouritesDelete(i,state
                                                  .response!
                                                  .data![i]
                                                  .productId));
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              size: 20,
                                            ))
                                            ,
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration:BoxDecoration(
                                            boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                            color: Colors.brown.shade700,
                                            shape: BoxShape.circle)
                                        ,
                                    margin: EdgeInsets.only(right: 10),
                                    child:
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            IconButton(
                                                onPressed:  !state.addproductloading? () {

            if (state.response!.data![i]
                .colors ==
            null &&
            state.response!.data![i]
                .sizes ==
            null)
              {
            context
                .read<FavouritesBloc>()
                .add(AddCardEvent(i,
            state.response?.data![i]
                .productId,
            1,
            state.response!.data![i]
                .price,
            state.response!.data![i]
                .name!,
            null,
            null));
            context.read<DashBloc>().add(DashRefresh());
            }
                                                  else {
                                                    showSnackBar(context, "This has has different sizes or colors, so please choose that", Colors.teal);
                                                    Navigator.pushNamed(context,
                                                        AppRoutes.productdetail,
                                                        arguments: (state
                                                            .response!
                                                            .data![i]
                                                            .productId));
                                                  }
                                                }:null,
                                                icon: Icon(
                                                  Icons.add_shopping_cart_outlined,
                                                  color: Colors.white,
                                                  size: 20,
                                                )),
                                            if(state.addproductloading && state.id == i)
                                            CircularProgressIndicator(color: Colors.white,)
                                          ],
                                        ),
                                  )
                                ],
                              ),
                            )
                        // ListTile(title: Text(state.response!.data![i].name!),)
                      ]),
                      if (state.response != null)
                      if(state.response!.data!.isEmpty)
            SliverToBoxAdapter(
                        child: Container(
                          height: height/1.5,
                          child: Center(child:  Container(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              'assets/download.png',
                            ),
                          )),
                        ),
                      )
                    ])));
          }, listener: (BuildContext context, FavouritesState state) {
          if(state.message!=null&&state.message!="")
            if(!state.result)
            showSnackBar(context,state.message!,Colors.red);
          else
              showSnackBar(context,state.message!,Colors.teal);
        },
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(this.searchTerms);
// Demo list to show querying
  List<String> searchTerms;

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
void showSnackBar(BuildContext context,String text,Color color) {


  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft:Radius.circular(10) )),
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'Dismiss',
      disabledTextColor: Colors.white,
      textColor: Colors.yellow,
      onPressed: () {
        //Do whatever you want
      },
    ),
    onVisible: (){
      //your code goes here
    },
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}