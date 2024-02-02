import 'package:ecomservice/features/login/bloc/login_bloc.dart';
import 'package:ecomservice/features//login/loginScreen.dart';
import 'package:ecomservice/network/dio_helper.dart';
import 'package:ecomservice/network/urlConstants.dart';
import 'package:ecomservice/repo/loginrepo.dart';
import 'package:ecomservice/utils/button.dart';
import 'package:ecomservice/utils/router.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio? dio;
  late DioAdapter dioAdapter;
//common setup for dio
  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio!);
    dio?.httpClientAdapter = dioAdapter;
    Map response = {
      "status": true,
      "message": "Success",
      "data": {
        "id": 10000,
        "name": "balatest",
        "email": "bala.future3@gmail.com",
        "mobileNumber": "7418230370",
        "categoryId": 1,
        "password": "Password@123",
        "address": "ZaminMuthur",
        "latitude": "10.67521200",
        "longitude": "76.96882200",
        "profilePhoto": "uploads/biriyani.jpg",
        "firebaseId": "1213",
        "createdBy": 10000,
        "createdOn": "2023-10-28T01:38:38.000Z",
        "updatedBy": 10000,
        "updatedOn": "2023-12-26T04:22:13.000Z",
        "deleteFlag": 0
      }
    };
    Map data = {"mobileNumber": "7418230370", "password": "Password@123"};
    dioAdapter.onPost(
        UrlConstants.loginUrl, (server) => server.reply(200, response),
        data: data);
  });

  TestWidgetsFlutterBinding.ensureInitialized();

  group('Login Test', () {
    testWidgets('Login', (WidgetTester tester)  async {
      LoginScreen login = LoginScreen();
      var app = new MediaQuery(
          data: new MediaQueryData(),
          child: MaterialApp(
              onGenerateRoute: getRoute,
              home: BlocProvider(
                  create: (context) => LoginBloc(LoginRepository(dio!)),
                  child: login)));
      await tester.pumpWidget(app);
      await tester.pump();
      expect(find.text(Strings.login), findsWidgets);
      expect(find.text(Strings.loginSubtitle), findsWidgets);
      expect(find.widgetWithText(Button, Strings.login), findsWidgets);
      expect(find.byType(Image), findsWidgets);
      expect(find.image(const AssetImage("assets/logo.png")), findsOneWidget);
      await tester.enterText(find.byKey(Key(Strings.username)), '7418230370');
      expect(find.text('7418230370'), findsOneWidget);
      expect(find.byKey(Key(Strings.password)), findsWidgets);
      await tester.enterText(find.byKey(Key(Strings.password)), 'Password@123');
      expect(find.text('Password@123'), findsWidgets);
      await tester.tap(find.widgetWithText(Button, Strings.login));
      expect(find.text(Strings.donothaveaccount), findsWidgets);
      expect(find.text(Strings.register), findsWidgets);
      expect(find.byKey(Key(Strings.register)), findsWidgets);
      await tester.pump();
      expect(find.byKey(Key(Strings.register)).hitTestable(), findsOneWidget);
      await tester.pump();
      await tester.tap(find.byKey(Key(Strings.register),),warnIfMissed: false);
      await tester.pump();
      expect(find.byKey(Key(Strings.progressbar)), findsWidgets);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text(Strings.dashboard), findsOneWidget);
      // });
    });
  });
}
