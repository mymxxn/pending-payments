import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static const baseurl = "https://demo.blackboard.com.np/api/Accountant_api/";
  static const paymenthisurl = 'payments_by_date';
  static const accprofileurl = 'accountant_details';
  static const scanstdinfo = 'student_info';
  static const allpayments = "all_payments";
  static const scanid = "student_app_id";
  static const mainapikey = "x-api-key";
  static const stdpaymenhist = "payment_history";
  static const searchstudents = "search_students";
  static const stdpendingpayments = "pending_payments";
  static const course_id = "course_id";
  static const section_id = "section_id";
  static const stdid = "student_id";
  static const searchstdsection = "search_students_section";
  static const Searchstdresult = "search_student_result";
  static const studentname = "student_name";
  static const stdmakepayment = "make_payment";
  static const studentid = "student_id";
  static const paymenttype = "payment_type";
  static const banktransactionid = "bank_transaction_id";
  static const paymentinfofeetotalamount = "payment_info[fee_total_amount]";
  static const paymentinfopayableamount = "payment_info[payable_amount]";
  static const paymentinfodeductiontype = "payment_info[deduction_type]";
  static const paymentinfodeductionamount = "payment_info[deduction_amount]";
  static const paymentinfofineamount = "payment_info[fine_amount]";
  static const paymentinfocourseFeeId = "payment_info[courseFeeId]";
}

class Savetoken {
  static SharedPreferences? _preferences;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future savetoken(String token) async {
    // print("token $token");
    // var result = await _preferences?.setString();
    var result = await _preferences?.setString("xapikey", token);
    // print(result);
    return result;
  }

  static Future savecourseid(String courseid) async {
    print("this is  $courseid");

    var result = await _preferences?.setString("courseid", courseid);
    print("this is result $result");
    return result;
  }

  static Future savesectionid(String sectionid) async {
    print("this is  $sectionid");

    var result = await _preferences?.setString("sectionid", sectionid);
    print("this is result $result");
    return result;
  }

  static Future savename(dynamic name) async {
    print("this is  $name");

    var result = await _preferences?.setString("name", name);
    print("this is result $result");
    return result;
  }

  static Future savestdid(dynamic std_id) async {
    print("this is myms ${std_id}");

    var result = await _preferences?.setString("std_id", std_id);
    print("this is result $result");
    return result;
  }

  static gettoken() {
    return _preferences?.getString("xapikey");
  }

  static getcourseId() {
    var couseID = _preferences?.getString("courseid");
    print(couseID);

    // return _preferences?.getString("courseid");
    return couseID;
  }

  static getsectionId() {
    return _preferences?.getString("sectionid");
  }

  static getname() {
    return _preferences?.getString("name");
  }

  static getstdId() {
    var stdid = _preferences?.getString("std_id");
    print(stdid);

    // return _preferences?.getString("courseid");
    return stdid;
  }

  static delecttoken() async {
    var result = await _preferences?.remove("xapikey");
    print(result);
  }
}
