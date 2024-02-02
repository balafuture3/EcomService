import 'package:ecomservice/features/categories/bloc/category_bloc.dart';
import 'package:ecomservice/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../network/urlConstants.dart';
import '../../values/strings.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    context.read<CategoryBloc>().add(CategoryInit());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(elevation:1,title: Text(Strings.allcat,style: TextStyle(color: Colors.grey.shade800,fontSize: 14),),backgroundColor: Colors.white,),
      body: SafeArea(
        child: BlocConsumer<CategoryBloc, CategoryState>(
          builder: (BuildContext context, CategoryState state) {
            print("Sele" + state.selectedindex.toString());
            if (state.response != null)
              print(state.response!.secondary!.where((element) =>
                  element.cat1id ==
                  state.response!.master![state.selectedindex].id));
            return Container(
                height: height,
                width: width,
                child: Row(children: [
                  Container(
                      height: height,
                      color: Colors.grey.shade200,
                      width: width / 5,
                      child: state.response != null
                          ? ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    context
                                        .read<CategoryBloc>()
                                        .add(CategorySelect(index));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: state.selectedindex == index? BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)):null,
                                        color: state.selectedindex == index
                                            ? Colors.white
                                            : Colors.grey.shade200),
                                    
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: width / 9,
                                          backgroundColor: Colors.grey.shade200,
                                          child: Image.network(
                                              UrlConstants.imageurl +
                                                  state.response!.master![index]
                                                      .image!),
                                        ),
                                        Text(state
                                            .response!.master![index].name!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: state.selectedindex==index?Colors.blue:Colors.grey.shade900),)
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: state.response!.master!.length,
                            )
                          : Container()),
                  if (state.response != null)
                    Container(
                      color: Colors.white,
                      height: height,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          for (int j = 0;
                              j <
                                  state.response!.secondary!
                                      .where((element) =>
                                          element.cat1id ==
                                          state.response!
                                              .master![state.selectedindex].id)
                                      .length;
                              j++)
                            Column(
                              children: [
                                Container(
                                  width: width - width / 5,
                                  child:

                                  ExpansionTile(
                                    initiallyExpanded: true,
                                    childrenPadding: EdgeInsets.all(10),
                                    tilePadding: EdgeInsets.all(10),
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: Image.network(UrlConstants
                                          .imageurl +
                                          state.response!.secondary!
                                              .where((element) =>
                                          element.cat1id ==
                                              state
                                                  .response!
                                                  .master![
                                              state.selectedindex]
                                                  .id)
                                              .elementAt(j)
                                              .image!),
                                    ),
                                    title: Text(state.response!.secondary!
                                        .where((element) =>
                                    element.cat1id ==
                                        state
                                            .response!
                                            .master![state.selectedindex]
                                            .id)
                                        .elementAt(j)
                                        .name!,style: TextStyle(color: Colors.grey.shade800,fontSize: 15,fontWeight: FontWeight.w700),),
                                    children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                height:state.response!.primary!
                                    .where((element) =>
                                (element.cat2id ==
                                    state
                                        .response!.secondary![j].id && element.cat1id == state.response!.master![state.selectedindex].id))
                                    .length>3?height/4:height/8,
                                child: GridView.count(crossAxisCount: 3,
                                children: [
                                  for (int z = 0; z <
                                    state.response!.primary!
                                        .where((element) =>
                                    (element.cat2id ==
                                        state
                                            .response!.secondary![j].id && element.cat1id == state.response!.master![state.selectedindex].id))
                                        .length;
                                z++)
                                    InkWell(
                                      onTap: ()
                                      {
                                        print(state.response?.primary![z].id);
                                        Navigator.pushNamed(context, AppRoutes.productlist,arguments: state.response!.primary!
                                            .where((element) =>
                                        (element.cat2id ==
                                            state
                                                .response!.secondary![j].id && element.cat1id == state.response!.master![state.selectedindex].id))
                                            .elementAt(z)
                                            .id );
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.grey.shade200,
                                            child:
                                          Image.network(UrlConstants
                                              .imageurl +
                                              state.response!.primary!
                                              .where((element) =>
                                          element.cat2id ==
                                              state.response!.secondary![j].id)
                                              .elementAt(z)
                                              .image!)),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                state.response!.primary!
                                                    .where((element) =>
                                                (element.cat2id ==
                                                    state
                                                        .response!.secondary![j].id && element.cat1id == state.response!.master![state.selectedindex].id))
                                                    .elementAt(z)
                                                    .name!,style: TextStyle(fontSize: 10),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          )
                                        ],
                                      ),
                                    ),



                                    ],
                                  ),
                                ),



                                // GridView.count(crossAxisCount: 3,)
                              ],
                            ))

// Text(state.response!.secondary!.where((element) => element.cat1id==state.response!.master![state.selectedindex].id).elementAt(j).name!)
                        ]),
                      ]),
                    )
                    )]));
          },
          listener: (BuildContext context, CategoryState state) {},
        ),
      ),
    );
  }
}
