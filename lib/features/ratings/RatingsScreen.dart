import 'package:ecomservice/features/ratings/bloc/ratings_bloc.dart';
import 'package:ecomservice/utils/ratings.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../model/ImagePickerModel.dart';
import '../../network/urlConstants.dart';
import '../../utils/button.dart';
import '../../utils/router.dart';
import '../cart/cartScreen.dart';

class RatingsScreen extends StatefulWidget {
  final productId;
  RatingsScreen(this.productId, {super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController commentsController= TextEditingController();
  List<String> list = [];
  final _scrollController = ScrollController();
  double count = 0;
  double max = 0;

  double ratio = 0;
  @override
  void initState() {
    context.read<RatingsBloc>().add(RatingsInit(widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<RatingsBloc, RatingsState>(
      listener: (context, state) {
        print(state);
        if (state.response != null) {
          print(state.response!.data![0].image!.split(';').length);
          count = 0;
          max = 0;
          if (double.parse(state.response!.rating![0].rating5!) >
              double.parse(state.response!.rating![0].rating4!))
            max = double.parse(state.response!.rating![0].rating5!);
          else
            max = double.parse(state.response!.rating![0].rating4!);
          if (double.parse(state.response!.rating![0].rating3!) > max)
            max = double.parse(state.response!.rating![0].rating3!);
          if (double.parse(state.response!.rating![0].rating2!) > max)
            max = double.parse(state.response!.rating![0].rating2!);
          if (double.parse(state.response!.rating![0].rating1!) > max)
            max = double.parse(state.response!.rating![0].rating1!);

          for (int i = 0; i < state.response!.data!.length; i++) {
            count = count + double.parse(state.response!.data![i].ratings!);
          }
          count = count / state.response!.data!.length;
          ratio = 120 / max;
          print("Max" + max.toString());
          print("Ratio" + ratio.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: state.loading
                ? Center(child: CircularProgressIndicator())
                : Container(
                    color: Colors.grey.shade200,
                    height: MediaQuery.of(context).size.height,
                    // height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        SliverAppBar(
                          backgroundColor: Colors.grey.shade200,
                          pinned: false,
                          stretch: true,
                          leading: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        SliverLayoutBuilder(
                            builder: (BuildContext context, constraints) {
                          final scrolled = constraints.scrollOffset > 0;
                          return SliverAppBar(
                            leading:scrolled? IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios_sharp,size: 20,color: Colors.black,),):null,
                            automaticallyImplyLeading: scrolled?true:false,
                            backgroundColor: scrolled?Colors.white:Colors.grey.shade200,
                            pinned: true,
                            stretch: true,
                            title: Text(
                              Strings.review_ratings,
                              style: TextStyle(
                                  fontWeight: scrolled?FontWeight.w500:FontWeight.w800,
                                  color: Colors.black,
                                  fontSize:scrolled?16: 24),
                            ),
                          );
                        }),
                        SliverLayoutBuilder(
                          builder: (BuildContext context, constraints) {
                            final scrolled = constraints.scrollOffset > 0;
                            return SliverToBoxAdapter(
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    height: 100,
                                    width: width,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text("${count}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 25)),
                                              Text(
                                                  "${state.response!.data!.length} ratings",
                                                  style:
                                                      TextStyle(fontSize: 14))
                                            ],
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: width,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                StarRating(
                                                  onRatingChanged: (double) {},
                                                  fillcolor: Colors.amber,
                                                  starCount: 5,
                                                  rating: 5,
                                                ),
                                                StarRating(
                                                  onRatingChanged: (double) {},
                                                  fillcolor: Colors.amber,
                                                  starCount: 4,
                                                  rating: 4,
                                                ),
                                                StarRating(
                                                  onRatingChanged: (double) {},
                                                  fillcolor: Colors.amber,
                                                  starCount: 3,
                                                  rating: 3,
                                                ),
                                                StarRating(
                                                  onRatingChanged: (double) {},
                                                  fillcolor: Colors.amber,
                                                  starCount: 2,
                                                  rating: 2,
                                                ),
                                                StarRating(
                                                  onRatingChanged: (double) {},
                                                  fillcolor: Colors.amber,
                                                  starCount: 1,
                                                  rating: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: ratio *
                                                          double.parse(state
                                                              .response!
                                                              .rating![0]
                                                              .rating5!),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: ratio *
                                                          double.parse(state
                                                              .response!
                                                              .rating![0]
                                                              .rating4!),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: ratio *
                                                          double.parse(state
                                                              .response!
                                                              .rating![0]
                                                              .rating3!),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: ratio *
                                                          double.parse(state
                                                              .response!
                                                              .rating![0]
                                                              .rating2!),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 10,
                                                      width: ratio *
                                                          double.parse(state
                                                              .response!
                                                              .rating![0]
                                                              .rating1!),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  height: 10,
                                                  child: Text(
                                                    "(${state.response!.rating![0].rating5!})",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  height: 10,
                                                  child: Text(
                                                    "(${state.response!.rating![0].rating4!})",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  height: 10,
                                                  child: Text(
                                                    "(${state.response!.rating![0].rating3!})",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  height: 10,
                                                  child: Text(
                                                    "(${state.response!.rating![0].rating2!})",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  height: 10,
                                                  child: Text(
                                                    "(${state.response!.rating![0].rating1!})",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          flex: 1,
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "${state.response!.data!.where((element) => element.comments != "" && element.comments != null).length} Reviews",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        DecoratedSliver(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            // boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 5)],
                            // borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          sliver: SliverList.list(children: [
                            for (int i = 0;
                                i <
                                    state.response!.data!
                                        .where((element) =>
                                            element.comments != "" &&
                                            element.comments != null)
                                        .length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(10),
                                      width: width,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              state.response!.data!
                                                  .where((element) =>
                                                      element.comments != "" &&
                                                      element.comments != null)
                                                  .elementAt(i)
                                                  .name!
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            trailing: Text(
                                              "${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.response!.data!.where((element) => element.comments != "" && element.comments != null).elementAt(i).createdOn!))}",
                                              style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            subtitle: StarRating(
                                              onRatingChanged: (double) {},
                                              starCount: 5,
                                              rating: double.parse(state
                                                  .response!.data!
                                                  .where((element) =>
                                                      element.comments != "" &&
                                                      element.comments != null)
                                                  .elementAt(i)
                                                  .ratings!),
                                              fillcolor: Colors.amber,
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 16, right: 16),
                                              width: width,
                                              child: Text(
                                                state.response!.data!
                                                    .where((element) =>
                                                        element.comments != "" &&
                                                        element.comments != null)
                                                    .elementAt(i)
                                                    .comments!,
                                                maxLines: 5,
                                                textAlign: TextAlign.start,
                                              )),
                                          Container(
                                            height: 100,
                                            width: width,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  if (state.response!.data!
                                                          .where((element) =>
                                                              element.comments !=
                                                                  "" &&
                                                              element.comments !=
                                                                  null)
                                                          .elementAt(i)
                                                          .image !=
                                                      null)
                                                    for (int j = 0;
                                                        j <
                                                            state.response!.data!
                                                                .where((element) =>
                                                                    element.comments !=
                                                                        "" &&
                                                                    element.comments !=
                                                                        null)
                                                                .elementAt(i)
                                                                .image!
                                                                .split(';')
                                                                .length;
                                                        j++)
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            20)),
                                                            image:
                                                                DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image:
                                                                        NetworkImage(
                                                                      UrlConstants
                                                                              .imageurl +
                                                                          state
                                                                              .response!
                                                                              .data!
                                                                              .where((element) =>
                                                                                  element.comments != "" &&
                                                                                  element.comments != null)
                                                                              .elementAt(i)
                                                                              .image!
                                                                              .split(';')[j],
                                                                    ))),
                                                      ),
                                                  if (state.response!.data!
                                                          .where((element) =>
                                                              element.comments !=
                                                                  "" &&
                                                              element.comments !=
                                                                  null)
                                                          .elementAt(i)
                                                          .image !=
                                                      null)
                                                    if (state.response!.data!
                                                        .where((element) =>
                                                            element.comments !=
                                                                "" &&
                                                            element.comments !=
                                                                null)
                                                        .elementAt(i)
                                                        .image!
                                                        .split(';')
                                                        .isEmpty)
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            20)),
                                                            image: DecorationImage(
                                                                fit: BoxFit.fill,
                                                                image: NetworkImage(
                                                                  UrlConstants
                                                                          .imageurl +
                                                                      state
                                                                          .response!
                                                                          .data!
                                                                          .where((element) =>
                                                                              element.comments !=
                                                                                  "" &&
                                                                              element.comments !=
                                                                                  null)
                                                                          .elementAt(
                                                                              i)
                                                                          .image!,
                                                                ))),
                                                      ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    if (state.response!.data!
                                            .where((element) =>
                                                element.comments != "" &&
                                                element.comments != null)
                                            .elementAt(i)
                                            .profilePhoto !=
                                        null)
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              UrlConstants.imageurl +
                                                  state.response!.data!
                                                      .where((element) =>
                                                          element.comments !=
                                                              "" &&
                                                          element.comments !=
                                                              null)
                                                      .elementAt(i)
                                                      .profilePhoto!))
                                  ],
                                ),
                              )
                          ]),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 5),
                        )
                      ],
                    ),
                  ),
          ),
          floatingActionButton: FloatingActionButton.extended(onPressed: (){
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                context: context,
                builder: (dialogcontext) {
                  return Container(
                    height: height / 1.75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: BlocProvider.value(
                      value: context.watch<RatingsBloc>(),
                      child:
                          BlocConsumer<RatingsBloc, RatingsState>(
                        builder: (context, state) {
                          if(state.images!=null)
                            for(int i=0;i<state.images!.list1.length;i++)
                              print("State------"+state.images!.list1[i]);
                          return Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Container(
                              width: width,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 14, bottom: 32),
                                      height: 6,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rate this Product',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        context
                                            .read<RatingsBloc>()
                                            .ratings = rating;
                                      },
                                    ),
                                    Padding(

                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Please share your opinion \nabout product',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      margin: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextField(
                                        controller: commentsController,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                            hintText: "Comments",
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      width: width,
                                      height: 80,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            if(state.images!=null)
                                            for(int i=0;i< state.images!.list1.length;i++)
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                height: 70,width: 70,
                                                  decoration:BoxDecoration(image: DecorationImage(
                                                    image: AssetImage(state.images!.list1[i])
                                                  )),
                                                  ),
                                            InkWell(onTap: ()
                                                async {
                                                  final XFile? pickedFile =
                                                      await _picker
                                                      .pickImage(
                                                    source:
                                                    ImageSource.gallery,
                                                  );
                                                  if (pickedFile != null) {
                                                    context
                                                        .read<
                                                        RatingsBloc>()
                                                        .add(ImageAdd(Data1(list..add(pickedFile.path))));
                                                  }
                                                }, child: Container(
                                              color: Colors.white,
                                                margin: EdgeInsets.all(10),
                                                height: 70,width: 70,child:Icon(Icons.add_a_photo_outlined))),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Button("Submit", true, onPressed: ()
                                    {

                                      context.read<RatingsBloc>().add(RatingsAdd(Data1(list), commentsController.text, context
                                          .read<RatingsBloc>()
                                          .ratings, widget.productId));

                                    })
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                            listener: (BuildContext context, RatingsState state) {
                          if(state.message=="Success")
                            {
                              Navigator.pop(context);
                              showSnackBar(context, "Ratings added Successfully", Colors.green);

                            }

                          },
                      ),
                    ),
                  );
                });
          }, label: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.edit),
              ),
              Text("Write a review")
            ],
          )),
        );
      },
    );
  }
}
