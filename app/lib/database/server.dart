import 'dart:convert';
import 'package:app/database/login.dart';
import 'package:http/http.dart' as http;
import 'outpass.dart';

class Server {
  static const ROOT = 'http://192.168.17.210/miniproj/index.php';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _GET_LOGIN_ACTION = 'GET_LOGIN';

  static Future<List<OutPass>> getdata(String query) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_ALL_ACTION;
      map['query'] = "SELECT * FROM outpasstb WHERE admno = $query";
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

  static Future<List<Login>> getLoginTable(String queary) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_LOGIN_ACTION;
      map['query'] = queary;
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
    final parsed = json.decode(res) as List<dynamic>;
    return parsed.map<OutPass>((json) => OutPass.fromJson(json)).toList();
  }

  static List<Login> parseResponseLogin(String res) {
    final parsed = json.decode(res) as List<dynamic>;
    return parsed.map<Login>((json) => Login.fromJson(json)).toList();
  }
}
