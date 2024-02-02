import 'package:ecomservice/features/myorders/bloc/myorders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../utils/router.dart';
import '../../values/strings.dart';


class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({ super.key });

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: Strings.tabDelivered,height: 30,),
    Tab(text: Strings.tabProcessing,height: 30,),
    Tab(text: Strings.tabCancelled,height: 30,),
  ];

  late TabController _tabController;

  @override
  void initState() {
    context.read<MyordersBloc>().add(MyOrdersInit());
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyordersBloc, MyordersState>(
      listener: (context, state) {
        print(state);
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade200,
            title: Text(Strings.myorder, style: TextStyle(
                color: Colors.grey.shade800, fontWeight: FontWeight.w800),),
            bottom: TabBar(padding: EdgeInsets.all(10),
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
              tabs: myTabs,
            ),
          ),
          body: state.response!=null?TabBarView(
            controller: _tabController,
            children: [
              state.response!.data!.where((element) => element.orderStatus==1).isNotEmpty?
              ListView(children: [
                for(int i=0;i<state.response!.data!.length;i++)
                  if(state.response!.data![i].orderStatus==1)
                    Container(
                      margin: EdgeInsets.only(left:10,right: 10,top: 20),
                      child: Card(elevation:1,color:Colors.white,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                        ,child:Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(title: Text("OrderNo: ORDN${state.response?.data![i].id}",style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w800),),

                                  trailing: GestureDetector(
                                      onTap: (
                                          )
                                      async {
                                      },
                                      child:  Text("${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.response!.data![i].createdOn!))}",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w400),))),
                              Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16,top: 10,bottom: 10),
                                child: Row(
                                  children: [
                                    Text(Strings.trackingNumber,
                                        style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                    Text(": ${state.response?.data![i].trackingId}",
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16,top: 10,bottom: 10),
                                child: Row(
                                  children: [
                                Text(Strings.totalAmount,
                                  style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                    Text(": \u{20B9}${state.response?.data![i].orderTotal}",
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16),
                                child: Row(
                                  children: [
                                    Text(Strings.quantity,
                                        style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                    Text(":${state.response?.data![i].itemCount}",
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(leading: OutlinedButton(onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.myorderdetail,arguments: state.response?.data![i].id);
                              }, child: Text(Strings.details,style: TextStyle(color: Colors.black),), style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                              ),),
                                  trailing: GestureDetector(
                                      onTap: (
                                          )
                                      async {
                                      },
                                      child:  Text(Strings.tabDelivered,style: TextStyle(color: Colors.green.shade500,fontWeight: FontWeight.w400),))),


                            ],
                          ),
                        )
                        ,),
                    ),
              ]):Center(child: Text(Strings.noDeliveredOrders),),
              state.response!.data!.where((element) => element.orderStatus==0).isNotEmpty?
              ListView(children: [
              for(int i=0;i<state.response!.data!.length;i++)
                if(state.response!.data![i].orderStatus==0)

                  Container(
                    margin: EdgeInsets.only(left:10,right: 10,top: 20),
                    child: Card(elevation:1,color:Colors.white,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                      ,child:Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(title: Text("OrderNo: ORDN${state.response?.data![i].id}",style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w800),),

                                trailing: Text("${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.response!.data![i].createdOn!))}",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w400),)),
                            Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16,top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Text(Strings.trackingNumber,
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                  Text(": ${state.response?.data![i].trackingId}",
                                    style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16,top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Text(Strings.totalAmount,
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                  Text(": \u{20B9}${state.response?.data![i].orderTotal}",
                                    style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16),
                              child: Row(
                                children: [
                                  Text(Strings.quantity,
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                  Text(":${state.response?.data![i].itemCount}",
                                    style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(leading: OutlinedButton(onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.myorderdetail,arguments: state.response?.data![i].id);
                            }, child: Text(Strings.details,style: TextStyle(color: Colors.black),), style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                            ),),
                                trailing: GestureDetector(
                                    onTap: (
                                        )
                                    async {
                                    },
                                    child:  Text(Strings.tabProcessing,style: TextStyle(color: Colors.green.shade500,fontWeight: FontWeight.w400),))),


                          ],
                        ),
                      )
                      ,),
                  ),],):Center(child: Text(Strings.nopendingOrders),),
              state.response!.data!.where((element) => element.orderStatus==2).isNotEmpty?
              ListView(children: [
              for(int i=0;i<state.response!.data!.length;i++)
                if(state.response!.data![i].orderStatus==1)
                  Container(
                    margin: EdgeInsets.only(left:10,right: 10,top: 20),
                    child: Card(elevation:1,color:Colors.white,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                      ,child:Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(title: Text("OrderNo: ORDN${state.response?.data![i].id}",style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w800),),

                                trailing: GestureDetector(
                                    onTap: (
                                        )
                                    async {
                                    },
                                    child:  Text("${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.response!.data![i].createdOn!))}",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w400),))),
                            Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16,top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Text(Strings.trackingNumber,
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                  Text(": ${state.response?.data![i].trackingId}",
                                    style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16,top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Text(Strings.totalAmount,
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                  Text(": \u{20B9}${state.response?.data![i].orderTotal}",
                                    style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16),
                              child: Row(
                                children: [
                                  Text(Strings.quantity,
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500)),
                                  Text(":${state.response?.data![i].itemCount}",
                                    style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(leading: OutlinedButton(onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.myorderdetail,arguments: state.response?.data![i].id);
                            }, child: Text(Strings.details,style: TextStyle(color: Colors.black),), style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                            ),),
                                trailing: Text(Strings.tabCancelled,style: TextStyle(color: Colors.green.shade500,fontWeight: FontWeight.w400),)),


                          ],
                        ),
                      )
                      ,),
                  ),
              ],):Center(child: Text(Strings.nocancelledOrders),)
            ],
          ):Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
