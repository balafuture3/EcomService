import 'package:ecomservice/features/payment/bloc/payment_bloc.dart';
import 'package:ecomservice/utils/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/router.dart';
import '../../values/strings.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController cardno = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController expiry = TextEditingController();
  ScrollController _scollcontroller = ScrollController();

  @override
  void initState() {
    context.read<PaymentBloc>().add(PaymentInit());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<PaymentBloc, PaymentState>(
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
              Strings.payment,
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
                    controller: _scollcontroller,
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                          title: Text(
                        Strings.payment,
                        style: TextStyle(fontWeight: FontWeight.w800),
                      )),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.paymentResponse != null)
                                for (int i = 0;
                                    i < state.paymentResponse!.data!.length;
                                    i++)
                                  if(state.paymentResponse!.data![i].defaultPayment==1)
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onLongPress: ()
                                        {
                                          showSnackBar(context, "Default payment method cannot be removed", Colors.red);
                                        },
                                        child: _buildCreditCard(
                                            color: Colors.black,
                                            cardNumber: "XXXX XXXX XXXX " +
                                                state.paymentResponse!.data![i]
                                                    .cardNo!
                                                    .substring(10, 14),
                                            cardHolder: state
                                                .paymentResponse!.data![i].name!,
                                            cardExpiration: state.paymentResponse!
                                                .data![i].expiry!),
                                      ),
                                      BlocBuilder<PaymentBloc, PaymentState>(
                                        builder: (context, state) {
                                          return state.loading &&
                                                  state.selectedindex == i
                                              ? Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : CheckboxListTile(
                                                  activeColor: Colors.black,
                                                  checkColor: Colors.white,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  value: state
                                                          .paymentResponse!
                                                          .data![i]
                                                          .defaultPayment ==
                                                      1,
                                                  title: Text(Strings
                                                      .makedefaultpayment),
                                                  onChanged: (val) {
                                                    if (state
                                                            .paymentResponse!
                                                            .data![i]
                                                            .defaultPayment ==
                                                        0)
                                                      context
                                                          .read<PaymentBloc>()
                                                          .add(PaymentDefault(
                                                              state
                                                                  .paymentResponse!
                                                                  .data![i]
                                                                  .id!,
                                                              i));
                                                  },
                                                );
                                        },
                                      )
                                    ],
                                  ),
                              if (state.paymentResponse != null)
                                for (int i = 0;
                                i < state.paymentResponse!.data!.length;
                                i++)
                                  if(state.paymentResponse!.data![i].defaultPayment!=1)
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onLongPress: ()
                                          {
                                            showDialog(
                                              context: context,
                                              builder: (dialogcontext) {
                                                return
                                                  BlocProvider.value(
                                                    value: context.watch<PaymentBloc>(),
                                                child: BlocBuilder<PaymentBloc, PaymentState>(
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
                                                              PaymentBloc>()
                                                              .add(DeleteCard(
                                                              state
                                                                  .paymentResponse!
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
                                          child: _buildCreditCard(
                                              color: Colors.black,
                                              cardNumber: "XXXX XXXX XXXX " +
                                                  state.paymentResponse!.data![i]
                                                      .cardNo!
                                                      .substring(10, 14),
                                              cardHolder: state
                                                  .paymentResponse!.data![i].name!,
                                              cardExpiration: state.paymentResponse!
                                                  .data![i].expiry!),
                                        ),
                                        BlocBuilder<PaymentBloc, PaymentState>(
                                          builder: (context, state) {
                                            return state.loading &&
                                                state.selectedindex == i
                                                ? Padding(
                                              padding: const EdgeInsets.all(
                                                  10.0),
                                              child:
                                              CircularProgressIndicator(
                                                color: Colors.black,
                                              ),
                                            )
                                                : CheckboxListTile(
                                              activeColor: Colors.black,
                                              checkColor: Colors.white,
                                              controlAffinity:
                                              ListTileControlAffinity
                                                  .leading,
                                              value: state
                                                  .paymentResponse!
                                                  .data![i]
                                                  .defaultPayment ==
                                                  1,
                                              title: Text(Strings
                                                  .makedefaultpayment),
                                              onChanged: (val) {
                                                _scollcontroller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
                                                if (state
                                                    .paymentResponse!
                                                    .data![i]
                                                    .defaultPayment ==
                                                    0)
                                                  context
                                                      .read<PaymentBloc>()
                                                      .add(PaymentDefault(
                                                      state
                                                          .paymentResponse!
                                                          .data![i]
                                                          .id!,
                                                      i));
                                              },
                                            );
                                          },
                                        )
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ))),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  context: context,
                  builder: (dialogcontext) {
                    return Container(
                      height: height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: BlocProvider.value(
                        value: context.watch<PaymentBloc>(),
                        child: BlocBuilder<PaymentBloc, PaymentState>(
                          builder: (context, state) {
                            return Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Container(
                                height: height / 1.2,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 14, bottom: 10),
                                        height: 6,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6))),
                                      ),
                                      ListTile(
                                        dense: false,
                                        visualDensity: VisualDensity(
                                            horizontal: 0, vertical: -4),
                                        title: new Text(
                                          Strings.addnewcard,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16),
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
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 16,
                                            left: 16,
                                            right: 16,
                                            bottom: 16),
                                        padding: EdgeInsets.only(left: 20),
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: TextField(
                                            controller: cardno,
                                            inputFormatters: [
                                              MaskedTextInputFormatter(
                                                  mask: 'xxxx-xxxx-xxxx-xxxx',
                                                  separator: '-')
                                            ],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                labelText: Strings.cardno,
                                                labelStyle: TextStyle(
                                                    color:
                                                        Colors.grey.shade800),
                                                border: InputBorder.none,
                                                suffixIcon: Container(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.asset(
                                                      "assets/mastercard.png",
                                                    )))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        padding: EdgeInsets.only(left: 20),
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: TextField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              CardExpirationFormatter()
                                            ],
                                            controller: expiry,
                                            maxLength: 5,
                                            decoration: InputDecoration(
                                              counter: SizedBox.shrink(),
                                              labelText: Strings.expiry,
                                              hintText: "MM/YY",
                                              labelStyle: TextStyle(
                                                  color: Colors.grey.shade800),
                                              border: InputBorder.none,
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 16, left: 16, right: 16),
                                        padding: EdgeInsets.only(left: 20),
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: TextField(
                                            controller: cvv,
                                            keyboardType: TextInputType.number,
                                            maxLength: 3,
                                            decoration: InputDecoration(
                                              counter: SizedBox.shrink(),
                                              labelText: Strings.cvv,
                                              labelStyle: TextStyle(
                                                  color: Colors.grey.shade800),
                                              border: InputBorder.none,
                                            )),
                                      ),
                                      CheckboxListTile(
                                        activeColor: Colors.black,
                                        checkColor: Colors.white,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        value: state.defaultpay,
                                        title: Text(Strings.makedefaultpayment),
                                        onChanged: (val) {
                                          context
                                              .read<PaymentBloc>()
                                              .add(NewPaymentDefault(val!));
                                        },
                                      ),
                                      Button(Strings.addpayment, true,
                                          onPressed: () {

                                        context.read<PaymentBloc>().add(AddCard(
                                            name.text,
                                            cvv.text,
                                            cardno.text.replaceAll("-", " "),
                                            state.defaultpay ? 1 : 0,
                                            expiry.text));
                                        Navigator.pop(context);
                                      })
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
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

  Row _buildLogosBlock() {
    return Row(
      /*1*/
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Card _buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /* Here we are going to place the _buildLogosBlock */
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              /* Here we are going to place the Card number */
              child: Text(
                '$cardNumber',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /* Here we are going to place the _buildDetailsBlock */
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(
                  label: 'VALID THRU',
                  value: cardExpiration,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
void showSnackBar(BuildContext context, String text, Color color) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10))),
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'Dismiss',
      disabledTextColor: Colors.white,
      textColor: Colors.yellow,
      onPressed: () {
        //Do whatever you want
      },
    ),
    onVisible: () {
      //your code goes here
    },
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}