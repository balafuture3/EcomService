import 'package:ecomservice/features/shipping/bloc/shipping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/button.dart';
import '../../utils/router.dart';
import '../../values/strings.dart';
import '../cart/cartScreen.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state1 = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController country = TextEditingController();
  @override
  void initState() {
    context.read<ShippingBloc>().add(ShippingInit());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<ShippingBloc, ShippingState>(
      listener: (context, state) {
        print(state);
        if(state.message!=null&&state.message!="") {
          print("snack : "+state.message!);
          showSnackBar(context, state.message!, Colors.teal);
        }
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
              Strings.shippingaddress,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      if(state.response!=null)
                      for(int i=0;i<state.response!.data!.length;i++)
                        Container(
                          margin: EdgeInsets.only(left:10,right: 10,top: 20),
                          child: Card(elevation:1,color:Colors.white,
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                            ,child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(title: Text("${state.response?.data![i].name}",style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w500),),

                                    trailing: GestureDetector(
                                        onTap: (
                                            )
                                        async {
                                          showDialog(
                                            context: context,
                                            builder: (dialogcontext) {
                                              return
                                                BlocProvider.value(
                                                    value: context.watch<ShippingBloc>(),
                                                    child: BlocBuilder<ShippingBloc, ShippingState>(
                                                        builder: (context, state)
                                                        {
                                                          return AlertDialog(
                                                            shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .circular(30)),
                                                            title: const Text(
                                                                Strings.deletecard),
                                                            content: const Text(Strings
                                                                .deletecardTitle),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(context)
                                                                      .pop(
                                                                      false); // Dismiss the alert
                                                                },
                                                                child: Text(Strings.no),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  context.read<
                                                                      ShippingBloc>()
                                                                      .add(DeleteAddress(
                                                                      state
                                                                          .response!
                                                                          .data![i]
                                                                          .id!));
                                                                  Navigator.pop(
                                                                      context); // Confirm exit
                                                                },
                                                                child: Text(
                                                                    Strings.yes),
                                                              ),
                                                            ],
                                                          );
                                                        }));
                                            },
                                          );
                                        },
                                        child: Icon(Icons.delete_forever,color: Colors.red,))),
                                  Padding(
                                    padding: const EdgeInsets.only(left:16.0,right: 16),
                                    child: Text("${state.response?.data![i].address},${state.response?.data![i].city},\n${state.response?.data![i].state},${state.response?.data![i].country},\n${state.response?.data![i].zipcode}"
                                      ,maxLines: 3,
                                      style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                            CheckboxListTile(
                              dense: false,
                              contentPadding: EdgeInsets.only(left: 6),
                              visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                              activeColor: Colors.blueAccent,
                              checkColor: Colors.white,
                              controlAffinity:
                              ListTileControlAffinity
                                  .leading,
                              value: state
                                  .response!
                                  .data![i]
                                  .defaultAddress ==
                                  1,
                              title: Text(Strings
                                  .makedefaultshipping),
                              onChanged: (val) {
                                // _scollcontroller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
                                if (state
                                    .response!
                                    .data![i]
                                    .defaultAddress ==
                                    0)
                                  context
                                      .read<ShippingBloc>()
                                      .add(ShippingDefault(
                                      state
                                          .response!
                                          .data![i]
                                          .id!,
                                      i));
                              },
                            )

                                ],
                              ),
                            )
                            ,),
                        ),
                    ]),
                  ))),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (dialogcontext) {
                    return BlocProvider.value(
                      value: context.watch<ShippingBloc>(),
                      child: BlocBuilder<ShippingBloc, ShippingState>(
                        builder: (context, state) {
                          return Scaffold(
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
                                Strings.addshippingaddress,
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            backgroundColor: Colors.grey.shade200,
                            body: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(
                                           16),
                                      padding: EdgeInsets.only(left: 20),
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextField(
                                          controller: name,
                                          decoration: InputDecoration(
                                              labelText: Strings.name,
                                              border: InputBorder.none,
                                              labelStyle: TextStyle(
                                                  color: Colors
                                                      .grey.shade800))),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 16,left: 16,right: 16),
                                      padding: EdgeInsets.only(left: 20),
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextField(
                                          controller: address,
                                          decoration: InputDecoration(
                                              labelText: Strings.address,
                                              border: InputBorder.none,
                                              labelStyle: TextStyle(
                                                  color: Colors
                                                      .grey.shade800))),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 16,left: 16,right: 16),
                                      padding: EdgeInsets.only(left: 20),
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextField(
                                          controller: city,
                                          decoration: InputDecoration(
                                              labelText: Strings.city,
                                              border: InputBorder.none,
                                              labelStyle: TextStyle(
                                                  color: Colors
                                                      .grey.shade800))),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 16,left: 16,right: 16),
                                      padding: EdgeInsets.only(left: 20),
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextField(
                                          controller: state1,
                                          decoration: InputDecoration(
                                              labelText: Strings.state,
                                              border: InputBorder.none,
                                              labelStyle: TextStyle(
                                                  color: Colors
                                                      .grey.shade800))),
                                    ),
                                    Container(margin: EdgeInsets.only(bottom: 16,left: 16,right: 16),
                                      padding: EdgeInsets.only(left: 20),
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextField(
                                          controller: zipcode,
                                          decoration: InputDecoration(
                                              labelText: Strings.zipcode,
                                              border: InputBorder.none,
                                              labelStyle: TextStyle(
                                                  color: Colors
                                                      .grey.shade800))),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 16,left: 16,right: 16),
                                      padding: EdgeInsets.only(left: 20),
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextField(
                                          controller: country,
                                          decoration: InputDecoration(
                                              labelText: Strings.country,
                                              border: InputBorder.none,
                                              labelStyle: TextStyle(
                                                  color: Colors
                                                      .grey.shade800))),
                                    ),
                                    Button(Strings.addshipping, true,
                                        onPressed: () {

                                          context.read<ShippingBloc>().add(AddAddress(
                                              name.text,
                                              address.text,
                                              city.text,
                                              state1.text,
                                              country.text,
                                              zipcode.text));
                                          name.text="";
                                          address.text="";
                                          city.text="";
                                          state1.text="";
                                          country.text="";
                                          zipcode.text="";
                                          Navigator.pop(context);
                                        })
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  });
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
