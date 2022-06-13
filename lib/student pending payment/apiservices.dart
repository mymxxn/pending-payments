import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pendingpayment/constant.dart';
import 'package:pendingpayment/student%20pending%20payment/model.dart';

Future<Stdpendingpaymentsmodel?> stdpendingpaymnetsjson() async {
  final resp = await http
      .post(Uri.parse(Api.baseurl + Api.stdpendingpayments), headers: {
    "${Api.mainapikey}": "e94c47090d4dd82a67415eb099a5a3fb",
  }, body: {
    Api.stdid: "141"
  });
  // final response = await http.get(Uri.parse(Api.baseurl +
  //     'accountant_login?email=accountant@erisn.com&password=Admin@123'));
  if (resp.statusCode == 200) {
    print('dfgfhghjghjghg$resp');
    final decoded = jsonDecode(resp.body);
    // print(resp.body);

    return Stdpendingpaymentsmodel.fromJson(json.decode(resp.body));
  } else {
    throw Exception('Failed to load data');
  }
}
