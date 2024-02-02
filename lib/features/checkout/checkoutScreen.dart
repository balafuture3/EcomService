import 'package:ecomservice/features/checkout/bloc/checkout_bloc.dart';
import 'package:ecomservice/model/PlaceOrderRequest.dart';
import 'package:ecomservice/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/button.dart';
import '../../values/strings.dart';

class CheckoutScreen extends StatefulWidget {
  final arg;
  CheckoutScreen(this.arg, {super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    print("arg---");
    print(widget.arg);
    // for(int i=0;i<widget.arg[0].length;i++)
    //   print(widget.arg[0][i]);
    super.initState();
    context.read<CheckoutBloc>().add(InitEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
  listener: (context, state) {
    if(state is OrderSuccess)
      {
Navigator.pushNamedAndRemoveUntil(context, AppRoutes.ordersuccess, (route) => false);
      }
    // TODO: implement listener
  },
  builder: (context, state) {

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(centerTitle: true,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),),
      elevation: 0,
      title: Text(Strings.checkout,style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w800,fontSize: 15),),
      backgroundColor: Colors.white,),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 10,),
              ListTile(title: Text(Strings.shippingaddress,style: TextStyle(fontWeight: FontWeight.w800),)),
              Container(
                margin: EdgeInsets.only(left:10,right: 10),
                child: Card(elevation:1,color:Colors.white,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                  ,child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(title: Text("${state.response?.data!.where((element) => element.defaultAddress==1).first.name}",style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w500),),

                          trailing: GestureDetector(
                              onTap: (
                              )
                              async {
                                await Navigator.pushNamed(context, AppRoutes.shipping);
                                context.read<CheckoutBloc>().add(InitEvent());
                              },
                              child: Text(Strings.change,style: TextStyle(color: Colors.red),)),),
                        Padding(
                          padding: const EdgeInsets.only(left:16.0,right: 16),
                          child: Text("${state.response?.data!.where((element) => element.defaultAddress==1).first.address},${state.response?.data!.where((element) => element.defaultAddress==1).first.city},\n${state.response?.data!.where((element) => element.defaultAddress==1).first.state},${state.response?.data!.where((element) => element.defaultAddress==1).first.country},\n${state.response?.data!.where((element) => element.defaultAddress==1).first.zipcode}"
                            ,maxLines: 3,
                            style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500),
                          ),
                        ),

                      ],
                    ),
                  )
                  ,),
              ),
              SizedBox(height: 10,),
              ListTile(title: Text(Strings.payment,style: TextStyle(fontWeight: FontWeight.w800),),trailing: GestureDetector(
                  onTap: () async {
                   await Navigator.pushNamed(context, AppRoutes.payment);
                   context.read<CheckoutBloc>().add(InitEvent());
                  },
                  child: Text(Strings.change,style: TextStyle(color: Colors.red),))),
              Container(
                margin: EdgeInsets.only(left:10,right: 10),
                child: Row(
                  children: [
                    Image.asset("assets/img.png"), Text("XXXX XXXX XXXX ${state.paymentResponse?.data?.where((element) => element.defaultPayment==1).first.cardNo?.substring(10,14)}")
                  ],
                )
              )
            ],

          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height/4,
        child: Column(
          children: [
            ListTile(
              title: Text(Strings.order,style: TextStyle(fontWeight: FontWeight.w500)),trailing: Text("${widget.arg[2]}\u{20B9}"),
              dense: false,
              visualDensity:
              VisualDensity(horizontal: 0, vertical: -4),

            ),
            ListTile( title: Text(Strings.delivery,style: TextStyle(fontWeight: FontWeight.w500)),trailing: Text("50\u{20B9}"),  dense: false,
               visualDensity:
              VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile( title: Text(Strings.summary,style: TextStyle(fontWeight: FontWeight.w500)),trailing: Text("${widget.arg[2]+50}\u{20B9}"),  dense: false,
              visualDensity:
              VisualDensity(horizontal: 0, vertical: -4),
            ),
            Button(Strings.submitorder,true,onPressed: () {

              context.read<CheckoutBloc>().add(PlaceOrder(widget.arg[2]+50,state.response?.data!.where((element) => element.defaultAddress==1).first.id!,state.paymentResponse?.data?.where((element) => element.defaultPayment==1).first.id,widget.arg[0],widget.arg[3],widget.arg[4]));
            },)

          ],
        ),
      ),

    );
  },
);
  }
}
