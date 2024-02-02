import 'package:ecomservice/network/urlConstants.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Strings", () {
    expect(UrlConstants.baseurl, "http://www.balasblog.co.in/Ecom");
  });
}
