import 'package:app/database/login.dart';
import 'package:app/database/server.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}

Future<Login> loginCheck(String email) async {
  String query =
      "SELECT userid, user_name, email, user_category, semester, branch,sub_category,h_level FROM user_details WHERE email = '$email'";

  List<Login> data = await Server.getLoginTable(query);
  if (data.isNotEmpty) {
    return data[0];
  }
  return Login(
    userid: '',
    username: '',
    email: email,
    userCategory: '',
    semester: '',
    branch: '',
    hLevel: '',
    subCategory: '',
  );
}
