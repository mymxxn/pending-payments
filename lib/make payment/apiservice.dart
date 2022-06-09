import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pendingpayment/constant.dart';
import 'package:pendingpayment/make%20payment/model.dart';

Future<Stdmakepaymentmodel?> stdmakepaymentjson(
    //  String studentid,
    String paymenttype,
    String banktransactionid,
    String paymentinfofeetotalamount,
    String paymentinfopayableamount,
    String paymentinfodeductiontype,
    String paymentinfodeductionamount,
    String paymentinfofineamount,
    String paymentinfocourseFeeId) async {
  final resp =
      await http.post(Uri.parse(Api.baseurl + Api.stdmakepayment), headers: {
    "${Api.mainapikey}": "e94c47090d4dd82a67415eb099a5a3fb",
  }, body: {
    Api.studentid: "1",
    Api.paymenttype: paymenttype,
    Api.banktransactionid: banktransactionid,
    Api.paymentinfofeetotalamount: paymentinfofeetotalamount,
    Api.paymentinfopayableamount: paymentinfopayableamount,
    Api.paymentinfodeductiontype: paymentinfodeductiontype,
    Api.paymentinfodeductionamount: paymentinfodeductionamount,
    Api.paymentinfofineamount: paymentinfofineamount,
    Api.paymentinfocourseFeeId: paymentinfocourseFeeId
  });
  // final response = await http.get(Uri.parse(Api.baseurl +
  //     'accountant_login?email=accountant@erisn.com&password=Admin@123'));
  if (resp.statusCode == 200) {
    // print('dfgfhghjghjghg$resp');
    final decoded = jsonDecode(resp.body);
    // print(resp.body);

    return Stdmakepaymentmodel.fromJson(json.decode(resp.body));
  } else {
    throw Exception('Failed to load data');
  }
}
