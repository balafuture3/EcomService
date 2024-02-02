import 'package:ecomservice/utils/router.dart';
import 'package:flutter/material.dart';

import '../../utils/button.dart';
import '../../values/strings.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/bags.png"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(Strings.ordersuccessTitle,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(Strings.ordersuccess,style: TextStyle(fontSize: 14),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/8,),
            Button(Strings.continueshopping,true, onPressed: () { Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboard, (route) => false); },)
          ],
        ),
      ),
    );
  }
}
