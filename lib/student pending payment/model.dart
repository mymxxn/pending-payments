import 'dart:convert';

Stdpendingpaymentsmodel StdpendingpaymentsmodelFromJson(String str) =>
    Stdpendingpaymentsmodel.fromJson(json.decode(str));
String StdpendingpaymentsmodelToJson(Stdpendingpaymentsmodel data) =>
    json.encode(data.toJson());

class Stdpendingpaymentsmodel {
  bool? status;
  Data? data;
  String? message;

  Stdpendingpaymentsmodel({this.status, this.data, this.message});

  Stdpendingpaymentsmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<PendingFees>? pendingFees;

  Data({this.pendingFees});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['pending_fees'] != null) {
      pendingFees = <PendingFees>[];
      json['pending_fees'].forEach((v) {
        pendingFees!.add(new PendingFees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pendingFees != null) {
      data['pending_fees'] = this.pendingFees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PendingFees {
  String? courseFeeId;
  String? feeName;
  String? installSNo;
  String? feeAmount;
  String? feeType;
  String? dueDate;
  String? sopId;
  String? pendingAmount;
  String? fineAmount;
  String? feeCompleted;
  late int payable;
  late int fine;

  PendingFees({
    this.courseFeeId,
    this.feeName,
    this.installSNo,
    this.feeAmount,
    this.feeType,
    this.dueDate,
    this.sopId,
    this.pendingAmount,
    this.fineAmount,
    this.feeCompleted,
  });

  PendingFees.fromJson(Map<String, dynamic> json) {
    courseFeeId = json['course_fee_id'];
    feeName = json['fee_name'];
    installSNo = json['install_s_no'];
    feeAmount = json['fee_amount'];
    feeType = json['fee_type'];
    dueDate = json['due_date'];
    sopId = json['sop_id'];
    pendingAmount = json['pending_amount'];
    fineAmount = json['fine_amount'];
    feeCompleted = json['fee_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_fee_id'] = this.courseFeeId;
    data['fee_name'] = this.feeName;
    data['install_s_no'] = this.installSNo;
    data['fee_amount'] = this.feeAmount;
    data['fee_type'] = this.feeType;
    data['due_date'] = this.dueDate;
    data['sop_id'] = this.sopId;
    data['pending_amount'] = this.pendingAmount;
    data['fine_amount'] = this.fineAmount;
    data['fee_completed'] = this.feeCompleted;

    return data;
  }
}
