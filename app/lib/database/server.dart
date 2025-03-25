import 'dart:convert';
import 'package:app/database/class_incharge.dart';
import 'package:app/database/login.dart';
import 'package:http/http.dart' as http;
import 'outpass.dart';

class Server {
  static const ROOT = 'http://192.168.136.116/miniproj/index.php';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _GET_LOGIN_ACTION = 'GET_LOGIN';
  static const _ADD_REQ = "ADD_REQ";

  static Future<List<OutPass>> getdata(String query) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_ALL_ACTION;
      map['query'] = "SELECT * FROM outpassmob WHERE admno = $query";
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        List<OutPass> list = parseResponse(response.body);
        return list;
      }
    } catch (e) {
      print(e);
      return <OutPass>[];
    }
    return <OutPass>[];
  }

  static Future<List<OutPass>> getStaffReq(String query) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_ALL_ACTION;
      map['query'] = "SELECT * FROM class_incharge WHERE userid = '$query'";

      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Raw response (1st query): ${response.body}");

      if (response.statusCode == 200) {
        List<ClassIncharge> list = parseResponseStaff(response.body);

        if (list.isEmpty) {
          print("No records found for userid: $query");
          return <OutPass>[];
        }

        ClassIncharge value = list[0];
        print("Branch: ${value.branch}, Semester: ${value.semester}");

        var map2 = <String, dynamic>{};
        map2['action'] = _GET_ALL_ACTION;
        map2['query'] =
            "SELECT * FROM outpassmob WHERE sem = '${value.semester}' AND dept = '${value.branch}' AND staff_status = 'pending'"; // ✅ Fix

        final response2 = await http.post(Uri.parse(ROOT), body: map2);

        if (response2.statusCode == 200) {
          List<OutPass> list2 = parseResponse(response2.body);
          return list2;
        }
      }
    } catch (e) {
      print("Error in getStaffReq: $e");
      return <OutPass>[];
    }
    return <OutPass>[];
  }

  static Future<List<OutPass>> getdataMain(String query) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_ALL_ACTION;
      map['query'] = query;

      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        List<OutPass> list = parseResponse(response.body);
        return list;
      }
    } catch (e) {
      print(e);
      return <OutPass>[];
    }
    return <OutPass>[];
  }

  static Future<List<OutPass>> getAllStaffReq(String query) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_ALL_ACTION;
      map['query'] = "SELECT * FROM class_incharge WHERE userid = '$query'";

      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Raw response (1st query): ${response.body}");

      if (response.statusCode == 200) {
        List<ClassIncharge> list = parseResponseStaff(response.body);

        if (list.isEmpty) {
          print("No records found for userid: $query");
          return <OutPass>[];
        }

        ClassIncharge value = list[0];
        print("Branch: ${value.branch}, Semester: ${value.semester}");

        var map2 = <String, dynamic>{};
        map2['action'] = _GET_ALL_ACTION;
        map2['query'] =
            "SELECT * FROM outpassmob WHERE sem = '${value.semester}' AND dept = '${value.branch}' AND staff_status != 'pending'"; // ✅ Fix

        final response2 = await http.post(Uri.parse(ROOT), body: map2);

        if (response2.statusCode == 200) {
          List<OutPass> list2 = parseResponse(response2.body);
          return list2;
        }
      }
    } catch (e) {
      print("Error in getStaffReq: $e");
      return <OutPass>[];
    }
    return <OutPass>[];
  }

  static Future<List<Login>> getLoginTable(String query) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_LOGIN_ACTION;
      map['query'] = query;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        List<Login> list = parseResponseLogin(response.body);
        return list;
      }
    } catch (e) {
      print(e);
      return <Login>[];
    }
    return <Login>[];
  }

  static List<OutPass> parseResponse(String res) {
    final parsed = json.decode(res);
    if (parsed is List) {
      return parsed.map<OutPass>((json) => OutPass.fromJson(json)).toList();
    }
    return [];
  }

  static List<ClassIncharge> parseResponseStaff(String res) {
    final parsed = json.decode(res);
    if (parsed is List) {
      return parsed
          .map<ClassIncharge>((json) => ClassIncharge.fromJson(json))
          .toList();
    }
    return [];
  }

  static List<Login> parseResponseLogin(String res) {
    final parsed = json.decode(res);
    if (parsed is List) {
      return parsed.map<Login>((json) => Login.fromJson(json)).toList();
    }
    return [];
  }

  static Future<String> addRequest(String query) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _ADD_REQ;
      map['query'] = query;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
      return "error";
    }
    return "";
  }

  static Future<String> updateRequest(String query) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _ADD_REQ;
      map['query'] = query;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
      return "error";
    }
    return "";
  }
}
