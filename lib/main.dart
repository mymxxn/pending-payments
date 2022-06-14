import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pendingpayment/make%20payment/apiservice.dart';
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
  List<TextEditingController> _paycontrollers = [];

  var sf = 0;
  String? payment;
  // final _formKey = GlobalKey<FormState>();
  final selectedpendingfee = [];
  final payable = [];
  var selecteddiscoscholar = false;
  int flag = 0;
  int selectedvalue = 0;
  List<dynamic> payments = ["Cash", "Bank"];
  List<dynamic> scholarship = ["Discount", "Scholarship"];
  bool shoulShowInput = false;
  // TextEditingController payablecontroller = TextEditingController();
  // TextEditingController fineamntcontroller = TextEditingController();
  bool paymenttextfield = false;
  var totalfeeamnt = 0;
  var totalpayableamnt = 0;
  var totalfineamnt = 0;
  var totaldiscountamnt = 0;
  bool showtextpayfield = false;

  @override
  void dispose() {
    for (final payableamntcontroller in _paycontrollers) {
      payableamntcontroller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: stdpendingpaymnetsjson(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                Stdpendingpaymentsmodel list = snapshot.data;
                print("yeaah");
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  child: Column(
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
                      ),
                      ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: list.data!.pendingFees!.length,
                          itemBuilder: (context, index) {
                            print("object");
                            final payableamntcontroller =
                                TextEditingController();

                            _paycontrollers.add(payableamntcontroller);

                            print("sum $totalfeeamnt");
                            return CheckboxListTile(
                              value: selectedpendingfee.contains(index),
                              onChanged: (value) {
                                if (selectedpendingfee.contains(index)) {
                                  selectedpendingfee.remove(index); // unselect
                                  totalfeeamnt = totalfeeamnt -
                                      int.parse(
                                          "${list.data!.pendingFees![index].feeAmount}");
                                  showtextpayfield = false;
                                  // totalpayableamnt = totalpayableamnt -
                                  //     int.parse(
                                  //         "${payableamntcontroller.value}");
                                } else {
                                  selectedpendingfee.add(index); // select
                                  showtextpayfield = true;
                                  totalfeeamnt = totalfeeamnt +
                                      int.parse(
                                          "${list.data!.pendingFees![index].feeAmount}");

                                  // totalpayableamnt = totalpayableamnt +
                                  //     int.parse(
                                  //         "${payableamntcontroller.value}");
                                  print("byetch $totalpayableamnt");
                                }
                                setState(() {
                                  // // showtextpayfield = true;
                                  print("mmmmm ${payableamntcontroller.value}");
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                "${list.data?.pendingFees?[index].feeName}\t"),
                                            Text(
                                              "(${list.data!.pendingFees![index].feeType})",
                                              style: TextStyle(fontSize: 10),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Total Amount"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Fine Amount"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Due Date"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Pending Amount")
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(":"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(":"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(":"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(":")
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${list.data!.pendingFees![index].feeAmount}"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${list.data?.pendingFees?[index].fineAmount}"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${list.data?.pendingFees?[index].dueDate}"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${list.data?.pendingFees?[index].pendingAmount}")
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            TextFormField(
                                              controller: payableamntcontroller,
                                              keyboardType: showtextpayfield
                                                  ? TextInputType.number
                                                  : TextInputType.none,
                                              cursorColor: Colors.grey,
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Enter a value";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                hintText:
                                                    "Enter Payable amount*",
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            TextField(
                                              // controller: fineamntcontroller,
                                              // keyboardType:
                                              //     isKeyboardShowing
                                              //         ? TextInputType.none
                                              //         : TextInputType
                                              //             .text,
                                              cursorColor: Colors.grey,
                                              decoration: InputDecoration(
                                                hintText: "Enter Fine amount",
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField2(
                                            decoration: const InputDecoration(
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                              // border: InputBorder.none
                                            ),
                                            isExpanded: true,
                                            hint: const Text(
                                              'Select ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFFB3B1B1)),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black45,
                                            ),
                                            iconSize: 30,
                                            dropdownMaxHeight: 100,
                                            scrollbarAlwaysShow: true,
                                            //selectedItemBuilder: ,
                                            buttonHeight: 50,
                                            buttonDecoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 0.1,
                                                      color: Colors
                                                          .grey.shade300)),
                                              // color: Colors.grey[300],
                                            ),
                                            // buttonPadding:
                                            //     const EdgeInsets.only(
                                            //         left: 20, right: 10),
                                            dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            items: scholarship
                                                .map((value) =>
                                                    DropdownMenuItem<String>(
                                                      value: "$value",
                                                      // onTap: () {

                                                      // },
                                                      child: Text(
                                                        "$value",
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select .';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              if (value == "Discount") {
                                                selecteddiscoscholar = true;
                                                shoulShowInput = true;
                                              }
                                              setState(() {});
                                            },
                                            onSaved: (value) {
                                              setState(() {
                                                payment = value.toString();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
//  value: selectedpendingfee.contains(index),
//                               onChanged: (value) {
//                                 if (selectedpendingfee.contains(index)) {
//                                   selectedpendingfee.remove(index); // unselect
//                                   totalfeeamnt = totalfeeamnt -
//                                       int.parse(
//                                           "${list.data!.pendingFees![index].feeAmount}");
//                                 } else {
//                                   selectedpendingfee.add(index); // select
//                                   totalfeeamnt = totalfeeamnt +
//                                       int.parse(
//                                           "${list.data!.pendingFees![index].feeAmount}");
//                                 }
//                                 setState(() {});
//                               },
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     Transform.scale(
                                  //       scale: 1,
                                  //       child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.start,
                                  //         children: [
                                  //           Transform.translate(
                                  //             offset: const Offset(14, 0),
                                  //             child: Radio<int>(
                                  //               activeColor: Colors.blue,
                                  //               value: 1,
                                  //               groupValue: selectedvalue,
                                  //               onChanged: (value) =>
                                  //                   setState(() {
                                  //                 selectedvalue = value!;
                                  //                 shoulShowInput = true;
                                  //               }),
                                  //             ),
                                  //           ),
                                  //           const Text("Discount")
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     Transform.scale(
                                  //       scale: 1,
                                  //       child: Row(
                                  //         children: [
                                  //           Transform.translate(
                                  //             offset: const Offset(14, 0),
                                  //             child: Radio<int>(
                                  //               value: 0,
                                  //               activeColor: Colors.blue,
                                  //               groupValue: selectedvalue,
                                  //               onChanged: (value) =>
                                  //                   setState(() {
                                  //                 shoulShowInput = true;
                                  //                 selectedvalue = value!;
                                  //               }),
                                  //             ),
                                  //           ),
                                  //           const Text("Scholarship"),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  Column(
                                    children: [
                                      if (shoulShowInput == true)
                                        TextField(
                                          // controller: discountamntcontroller,
                                          // keyboardType: isKeyboardShowing
                                          //     ? TextInputType.none
                                          //     : TextInputType.text,
                                          cursorColor: Colors.grey,
                                          decoration: InputDecoration(
                                            hintText: selecteddiscoscholar
                                                ? "Enter discount"
                                                : "Enter scholarship",
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                            );
                          }),
                      Column(
                        children: [
                          if (flag == sf)
                            totalpending("$totalfeeamnt", "1000", "5500"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            pendpaytitle(),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Payment Type",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            //-----------------------it must be drop down instead of textfield-----------------------//
                                            DropdownButtonFormField2(
                                              decoration: const InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  border: InputBorder.none),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFFB3B1B1)),
                                              ),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black45,
                                              ),
                                              iconSize: 30,
                                              dropdownMaxHeight: 100,
                                              scrollbarAlwaysShow: true,
                                              buttonHeight: 35,
                                              buttonDecoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    width: 0,
                                                    color: Colors.transparent),
                                                color: Colors.grey[300],
                                              ),
                                              buttonPadding:
                                                  const EdgeInsets.only(
                                                      left: 20, right: 10),
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              items: payments
                                                  .map((value) =>
                                                      DropdownMenuItem<String>(
                                                        value: "$value",
                                                        onTap: () {
                                                          if (value == "Bank") {
                                                            paymenttextfield =
                                                                true;
                                                          }
                                                        },
                                                        child: Text(
                                                          "$value",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              validator: (value) {
                                                if (value == "Bank") {
                                                  paymenttextfield = true;
                                                }
                                                if (value == null) {
                                                  return 'Please select .';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                              onSaved: (value) {
                                                setState(() {
                                                  payment = value.toString();
                                                });
                                              },
                                            ),

                                            Column(
                                              children: [
                                                if (paymenttextfield == true)
                                                  TextField(
                                                    // controller:
                                                    //     discountcontroller,
                                                    // keyboardType:
                                                    //     isKeyboardShowing
                                                    //         ? TextInputType.none
                                                    //         : TextInputType
                                                    //             .text,
                                                    cursorColor: Colors.grey,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Enter Fine amount",
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade300),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade300),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      stdmakepaymentjson(
                                                          "paymenttype",
                                                          "banktransactionid",
                                                          "paymentinfofeetotalamount",
                                                          "paymentinfopayableamount",
                                                          "paymentinfodeductiontype",
                                                          "paymentinfodeductionamount",
                                                          "paymentinfofineamount",
                                                          "coursefeeid");
                                                    },
                                                    child: const Text("Pay"),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.blue,
                                                      elevation: 3,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      minimumSize:
                                                          const Size(120, 32),
                                                    )),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Cancel"),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.grey,
                                                      elevation: 3,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      minimumSize:
                                                          const Size(120, 32),
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                              child: const Text(
                                "Pay Selected",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                minimumSize: const Size(170, 38),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

Widget totalpending(
  var totalfeeamnt,
  String totalfineamnt,
  String totaldiscount,
) {
  int? sum;
  sum = int.parse(totalfineamnt) + int.parse(totalfeeamnt);
  // sum = totalfeeamnt + totalfineamnt + totaldiscount;
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        datatotalpendingfee(totalfeeamnt, totalfineamnt, totaldiscount),
        Divider(
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [datastyle("Grand Total"), datastyle("$sum")],
          ),
        )
      ],
    ),
  );
}

Widget datatotalpendingfee(
    String totalfeeamnt, String totalfineamnt, String totaldiscount) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            datastyle("Total Fee Amount"),
            SizedBox(
              height: 5,
            ),
            datastyle("Total Fine Amount"),
            SizedBox(
              height: 5,
            ),
            datastyle("Total Discount"),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            datastyle(":"),
            SizedBox(
              height: 5,
            ),
            datastyle(":"),
            SizedBox(
              height: 5,
            ),
            datastyle(":")
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            datastyle(totalfeeamnt),
            SizedBox(
              height: 5,
            ),
            datastyle(totalfineamnt),
            SizedBox(
              height: 5,
            ),
            datastyle(totaldiscount),
          ],
        )
      ],
    ),
  );
}

Widget datastyle(String txt) {
  return Text(
    txt,
    style: const TextStyle(fontSize: 16),
  );
}

Widget pendpaytitle() {
  return const Text(
    "Fee Payment",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  );
}

// void Addition(var a, var b) {
//   int c;
//   c = a + b;
//   print("Result:$c");
// }
