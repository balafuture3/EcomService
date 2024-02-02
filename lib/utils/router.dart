import 'package:ecomservice/features/cart/bloc/cart_bloc.dart';
import 'package:ecomservice/features/categories/bloc/category_bloc.dart';
import 'package:ecomservice/features/checkout/bloc/checkout_bloc.dart';
import 'package:ecomservice/features/checkout/checkoutScreen.dart';
import 'package:ecomservice/features/checkout/successScreen.dart';
import 'package:ecomservice/features/dashboard/dashboardScreen.dart';
import 'package:ecomservice/features/forgotpassword/bloc/forgotpassword_bloc.dart';
import 'package:ecomservice/features/forgotpassword/forgotPassScreen.dart';
import 'package:ecomservice/features/myorderdetail/MyOrderDetail.dart';
import 'package:ecomservice/features/myorderdetail/bloc/myorderdetail_bloc.dart';
import 'package:ecomservice/features/myorders/bloc/myorders_bloc.dart';
import 'package:ecomservice/features/payment/bloc/payment_bloc.dart';
import 'package:ecomservice/features/payment/paymentScreen.dart';
import 'package:ecomservice/features/productdetails/bloc/productdetails_bloc.dart';
import 'package:ecomservice/features/productdetails/productDetailsScreen.dart';
import 'package:ecomservice/features/profile/bloc/profile_bloc.dart';
import 'package:ecomservice/features/profile/profileScreen.dart';
import 'package:ecomservice/features/ratings/RatingsScreen.dart';
import 'package:ecomservice/features/ratings/bloc/ratings_bloc.dart';
import 'package:ecomservice/features/shipping/bloc/shipping_bloc.dart';
import 'package:ecomservice/features/shipping/shippingScreen.dart';
import 'package:ecomservice/features/signup/bloc/signup_bloc.dart';
import 'package:ecomservice/features/signup/signupScreen.dart';
import 'package:ecomservice/network/dio_helper.dart';
import 'package:ecomservice/repo/cartrepo.dart';
import 'package:ecomservice/repo/categoriesrepo.dart';
import 'package:ecomservice/repo/checkoutrepo.dart';
import 'package:ecomservice/repo/dashboardrepo.dart';
import 'package:ecomservice/repo/forgotpassrepo.dart';
import 'package:ecomservice/repo/loginrepo.dart';
import 'package:ecomservice/repo/myorderdetailrepo.dart';
import 'package:ecomservice/repo/myordersrepo.dart';
import 'package:ecomservice/repo/paymentrepo.dart';
import 'package:ecomservice/repo/productdetailrepo.dart';
import 'package:ecomservice/repo/ratingsrepo.dart';
import 'package:ecomservice/repo/shippingrepo.dart';
import 'package:ecomservice/repo/signuprepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/categories/categoriesScreen.dart';
import '../features/dashboard/bloc/dash_bloc.dart';
import '../features/login/bloc/login_bloc.dart';
import '../features/login/loginScreen.dart';
import '../features/myorders/MyOrdersScreen.dart';
import '../features/productlist/bloc/product_list_bloc.dart';
import '../features/productlist/productListScreen.dart';
import '../features/splash/bloc/splash_bloc.dart';
import '../features/splash/splash_view.dart';
import '../repo/productlist.dart';
import '../repo/profilerepo.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String login = 'login';
  static const String forgot = 'forgot';
  static const String signUp = 'signUp';
  static const String cart = 'cart';
  static const String dashboard = 'dashboard';
  static const String productdetail = 'productdetail';
  static const String productlist = 'productlist';
  static const String category = 'category';
  static const String favourites = 'favourites';
  static const String checkout = 'checkout';
  static const String shipping = 'shipping';
  static const String payment = 'payment';
  static const String ordersuccess = 'ordersuccess';
  static const String profile = 'profile';
  static const String myorders = 'myorders';
  static const String myorderdetail = 'myordersdetail';
  static const String ratings = 'ratings';
}

Route<dynamic>? getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return PageBuilder.buildSplashScreen();
    case AppRoutes.login:
      return PageBuilder.buildLoginScreen();
    case AppRoutes.dashboard:
      return PageBuilder.buildDashboardScreen();
    case AppRoutes.signUp:
      return PageBuilder.buildSignupScreen();
    case AppRoutes.forgot:
      return PageBuilder.buildForgotPassScreen();
    case AppRoutes.productdetail:
      return PageBuilder.buildProductDetailScreen(settings.arguments);
    case AppRoutes.productlist:
      return PageBuilder.buildProductListScreen(settings.arguments);
    case AppRoutes.category:
      return PageBuilder.buildCategoryScreen();
      case AppRoutes.favourites:
      return PageBuilder.buildFavouritesScreen();
    case AppRoutes.cart:
      return PageBuilder.buildCartScreen();
    case AppRoutes.checkout:
      return PageBuilder.buildCheckoutScreen(settings.arguments);
    case AppRoutes.shipping:
      return PageBuilder.buildShippingScreen();
    case AppRoutes.payment:
      return PageBuilder.buildPaymentScreen();
    case AppRoutes.ordersuccess:
      return PageBuilder.buildOrderSuccessScreen();
    case AppRoutes.profile:
      return PageBuilder.buildProfileScreen();
    case AppRoutes.myorders:
      return PageBuilder.buildMyOrdersScreen();
    case AppRoutes.myorderdetail:
      return PageBuilder.buildMyOrderDetailScreen(settings.arguments);
    case AppRoutes.ratings:
      return PageBuilder.buildRatingsScreen(settings.arguments);
  }
}

class PageBuilder {
  static Route<dynamic> buildSplashScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (context) => SplashBloc(),
              child: const SplashScreen(),
            ));
  }

  static Route<dynamic> buildLoginScreen() {
    return MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider(
            create: (context) =>
                LoginBloc(LoginRepository(DioHelper().getInstance())),
            child: LoginScreen()));
  }

  static Route<dynamic> buildDashboardScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (context) =>
                  DashBloc(DashboardRepository(DioHelper().getInstance())),
              child: DashBoardScreen(),
            ));
  }

  static Route<dynamic> buildSignupScreen() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
              create: (context) =>
                  SignupBloc(SignupRepository(DioHelper().getInstance())),
              child: SignupScreen(),
            ),

        // transitionDuration: Duration(milliseconds: 1000),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
              child: FadeTransition(
            opacity: animation,
            // scale: animation,
            // turns: animation,
            child: child,
          ));
        });
  }

  static Route<dynamic> buildForgotPassScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
        create: (context) =>
            ForgotpasswordBloc(ForgotPassRepository(DioHelper().getInstance())),
        child: ForgotPassScreen(),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> buildProductDetailScreen(arg) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          //     BlocProvider(
          //   create: (context) => ProductdetailsBloc(ProductDetailRepository(DioHelper().getInstance())),
          //   child: ProductDetailsScreen(arg),
          // ),
        //   MultiBlocProvider(
        // providers: [
          BlocProvider(
            create: (BuildContext context) => ProductdetailsBloc(
                ProductDetailRepository(DioHelper().getInstance())),
          // ),
          // BlocProvider(
          //   create: (BuildContext context) =>
          //       DashBloc(DashboardRepository(DioHelper().getInstance())),
          // ),
        // ],
        child: ProductDetailsScreen(arg),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> buildProductListScreen(arg) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
        create: (context) =>
            ProductListBloc(ProductListRepository(DioHelper().getInstance())),
        child: ProductListScreen(arg),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  static Route<dynamic> buildCategoryScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CategoryBloc(CategoryRepository(DioHelper().getInstance())),
          child: const CategoryScreen(),
        ));
  }
  static Route<dynamic> buildFavouritesScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CategoryBloc(CategoryRepository(DioHelper().getInstance())),
          child: const CategoryScreen(),
        ));
  }
  static Route<dynamic> buildCartScreen() {
    return MaterialPageRoute(
        builder: (context) =>    MultiBlocProvider(
            child: const CategoryScreen(),
            providers: [BlocProvider(
          create: (context) => CartBloc(CartRepository(DioHelper().getInstance()))),
              BlocProvider(
                create: (context) => CartBloc(CartRepository(DioHelper().getInstance())))]));
  }
  static Route<dynamic> buildShippingScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => ShippingBloc(ShippingRepo(DioHelper().getInstance())),
          child: const ShippingScreen(),
        ));
  }
  static Route<dynamic> buildCheckoutScreen(arg) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CheckoutBloc(CheckoutRepo(DioHelper().getInstance())),
          child:  CheckoutScreen(arg),
        ));
  }
  static Route<dynamic> buildPaymentScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => PaymentBloc(PaymentRepo(DioHelper().getInstance())),
          child: const PaymentScreen(),
        ));
  }
  static Route<dynamic> buildOrderSuccessScreen() {
    return MaterialPageRoute(
        builder: (context) => SuccessScreen(),
        );
  }
  static Route<dynamic> buildProfileScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => ProfileBloc(ProfileRepo(DioHelper().getInstance())),
          child: const ProfileScreen(),
        ));
  }
  static Route<dynamic> buildMyOrdersScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => MyordersBloc(MyOrdersRepo(DioHelper().getInstance())),
          child: const MyOrdersScreen(),
        ));
  }
  static Route<dynamic> buildMyOrderDetailScreen(arg) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => MyorderdetailBloc(MyOrderDetailRepo(DioHelper().getInstance())),
          child:  MyOrderDetail(arg),
        ));
  }
  static Route<dynamic> buildRatingsScreen(arg) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => RatingsBloc(RatingsRepo(DioHelper().getInstance())),
          child:  RatingsScreen(arg),
        ));
  }
}
