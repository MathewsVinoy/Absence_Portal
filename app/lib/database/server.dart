import 'dart:convert';
import 'package:http/http.dart' as http;
import 'outpass.dart';

class Server {
  static const ROOT = 'http://localhost/miniproj/index.php';
  static const _GET_ALL_ACTION = 'GET_ALL';

  static Future<List<OutPass>> getdata() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_ALL_ACTION;
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

  static List<OutPass> parseResponse(String res) {
    final parsed = json.decode(res) as List<dynamic>;
    return parsed.map<OutPass>((json) => OutPass.fromJson(json)).toList();
  }
}
