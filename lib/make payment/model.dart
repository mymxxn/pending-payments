import 'dart:convert';

Stdmakepaymentmodel StdmakepaymentmodelFromJson(String str) =>
    Stdmakepaymentmodel.fromJson(json.decode(str));
String StdmakepaymentmodelToJson(Stdmakepaymentmodel data) =>
    json.encode(data.toJson());

class Stdmakepaymentmodel {
  bool? status;
  Data? data;
  String? message;

  Stdmakepaymentmodel({this.status, this.data, this.message});

  Stdmakepaymentmodel.fromJson(Map<String, dynamic> json) {
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
  Data({Null});

  Data.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
