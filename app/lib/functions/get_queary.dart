import 'package:app/database/outpass.dart';
import 'package:app/database/server.dart';

class GetQueary {
  Future<List<OutPass>> getHodData(String dept) async {
    String query =
        "SELECT * FROM outpassmob WHERE dept = '$dept' AND staff_status = 'accepted'  AND hod_status = 'pending'";
    List<OutPass> data = await Server.getdataMain(query);
    return data;
  }

  Future<List<OutPass>> getHodReq(String dept) async {
    String query =
        "SELECT * FROM outpassmob WHERE dept = '$dept' AND staff_status = 'accepted' AND hod_status != 'pending'";
    List<OutPass> data = await Server.getdataMain(query);
    return data;
  }

  Future<List<OutPass>> getWardenData() async {
    String query =
        "SELECT * FROM outpassmob WHERE hostel = 'true' AND hod_status = 'accepted'  AND warden_status = 'pending'";
    List<OutPass> data = await Server.getdataMain(query);
    return data;
  }

  Future<List<OutPass>> getWardenReq() async {
    String query =
        "SELECT * FROM outpassmob WHERE hostel = 'true' AND hod_status = 'accepted' AND warden_status != 'pending'";
    List<OutPass> data = await Server.getdataMain(query);
    return data;
  }

  Future<List<OutPass>> getSecOutData() async {
    String query =
        "SELECT * FROM outpassmob WHERE (hostel = 'true' AND warden_status = 'accepted' AND security_outstatus = 'pending') OR (hostel = 'false' AND hod_status = 'accepted' AND security_outstatus = 'pending')";
    List<OutPass> data = await Server.getdataMain(query);
    return data;
  }

  Future<List<OutPass>> getSecInData() async {
    String query =
        "SELECT * FROM outpassmob WHERE hostel = 'true' AND security_outstatus = 'accepted' AND security_instatus = 'pending'";
    List<OutPass> data = await Server.getdataMain(query);
    return data;
  }

  Future<List<OutPass>> getSecReq() async {
    String query =
        "SELECT * FROM outpassmob WHERE (hostel = 'true' AND security_instatus != 'pending' AND security_outstatus != 'pending') OR (hostel = 'false' AND security_outstatus != 'pending')";
    List<OutPass> data = await Server.getdataMain(query);
    return data;
  }
}
