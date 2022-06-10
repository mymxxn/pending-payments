import 'package:flutter/material.dart';
import 'package:pendingpayment/student%20pending%20payment/apiservices.dart';
import 'package:pendingpayment/student%20pending%20payment/model.dart';

void main() {
  runApp(MaterialApp(
    home: Pendingpayment(),
    debugShowCheckedModeBanner: false,
  ));
}

class Pendingpayment extends StatefulWidget {
  const Pendingpayment({Key? key}) : super(key: key);

  @override
  State<Pendingpayment> createState() => _PendingpaymentState();
}

class _PendingpaymentState extends State<Pendingpayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: stdpendingpaymnetsjson(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              Stdpendingpaymentsmodel list = snapshot.data;
              print("yeaah");
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Student Id")
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(":"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(":")
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "mymoon Jaleel",
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("stdbarcode")
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
