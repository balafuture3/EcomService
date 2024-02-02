import 'package:ecomservice/features/profile/bloc/profile_bloc.dart';
import 'package:ecomservice/utils/router.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../network/urlConstants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileInit());
    super.initState();
  }
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
          child:state.response!=null? Container(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 16),
                  width: width,
                  child: Text(
                    Strings.myprofile,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    UrlConstants.imageurl +
                                        state.response!.profile!.profilePhoto!)),
                            GestureDetector(
                                onTap: () async {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30))),
                                      context: context,
                                      builder: (dialogcontext) {
                                        return Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 14, bottom: 32),
                                                  height: 6,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  6))),
                                                ),
                                                InkWell(
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      final XFile? pickedFile =
                                                          await _picker
                                                              .pickImage(
                                                        source:
                                                            ImageSource.camera,
                                                      );
                                                      if (pickedFile != null)
                                                        context
                                                            .read<ProfileBloc>()
                                                            .add(ProfilePhotoChangeEvent(
                                                                pickedFile));
                                                    },
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons.camera_alt,
                                                      ),
                                                      title:
                                                          Text(Strings.camera),
                                                    )),
                                                InkWell(
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      final XFile? pickedFile =
                                                          await _picker
                                                              .pickImage(
                                                        source:
                                                            ImageSource.gallery,
                                                      );
                                                      if (pickedFile != null)
                                                        context
                                                            .read<ProfileBloc>()
                                                            .add(ProfilePhotoChangeEvent(
                                                                pickedFile));
                                                    },
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons.photo,
                                                      ),
                                                      title:
                                                          Text(Strings.gallery),
                                                    ))
                                              ],
                                            ));
                                      });
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 15,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )))
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.loginname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey.shade800,
                                      fontSize: 16),
                                ),
                                Text(
                                  Strings.loginemail,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.myorders);
                },
                child: ListTile(
                  title: Text(
                    Strings.myorder,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  ),
                  subtitle: Text("Total ${state.response!.order!.orderCount} Orders, "+Strings.ordersub,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                )),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.shipping);
                  },
                  child: ListTile(
                    title: Text(
                      Strings.shippingaddress,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                    subtitle: Text("${state.response!.shipping!.shippingCount } "+ Strings.shippingaddress,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12)),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.payment);
                  },
                  child: ListTile(
                    title: Text(
                      Strings.paymentMethods,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                    subtitle: Text("${state.response!.payment!.paymentCount} payment methods" ,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12)),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                // ListTile(
                //   title: Text(
                //     Strings.myreviews,
                //     style: TextStyle(
                //         color: Colors.grey.shade800,
                //         fontWeight: FontWeight.w800,
                //         fontSize: 16),
                //   ),
                //   // subtitle: Text(Strings.ordersub,
                //   //     style:
                //   //         TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                //   trailing: Icon(Icons.keyboard_arrow_right),
                // ),
                // ListTile(
                //   title: Text(
                //     Strings.settings,
                //     style: TextStyle(
                //         color: Colors.grey.shade800,
                //         fontWeight: FontWeight.w800,
                //         fontSize: 16),
                //   ),
                //   // subtitle: Text(Strings.ordersub,
                //   //     style:
                //   //         TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                //   trailing: Icon(Icons.keyboard_arrow_right),
                // ),
              ],
            ),
          ):Center(child: CircularProgressIndicator(),),
        ));
      },
    );
  }
}
