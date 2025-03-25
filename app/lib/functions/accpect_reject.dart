import 'package:app/database/server.dart';

class AccpectReject {
  Future acceptedFun(String role, String id) async {
    if (role == "Staff") {
      String queary =
          "UPDATE outpassmob SET staff_status = 'accepted' WHERE admno = '$id'";
      await Server.updateRequest(queary);
    }
    if (role == "HOD") {
      String queary =
          "UPDATE outpassmob SET hod_status = 'accepted' WHERE admno = '$id'";
      await Server.updateRequest(queary);
    }
    if (role == "Warden") {
      String queary =
          "UPDATE outpassmob SET warden_status = 'accepted' WHERE admno = '$id'";
      await Server.updateRequest(queary);
    }
  }

  Future rejectFun(String role, String id) async {
    if (role == "Staff") {
      String queary =
          "UPDATE outpassmob SET staff_status = 'rejected' WHERE admno = '$id'";
      await Server.updateRequest(queary);
    }
    if (role == "HOD") {
      String queary =
          "UPDATE outpassmob SET hod_status = 'rejected' WHERE admno = '$id'";
      await Server.updateRequest(queary);
    }
    if (role == "Warden") {
      String queary =
          "UPDATE outpassmob SET warden_status = 'rejected' WHERE admno = '$id'";
      await Server.updateRequest(queary);
    }
  }

  Future secCheck(String type, String id, String name) async {
    if (type == 'OUT') {
      String queary =
          "UPDATE outpassmob SET security_outstatus = 'accepted', out_time = CURRENT_TIMESTAMP,security_outstatus_name = '$name' WHERE admno = '$id'";
      await Server.updateRequest(queary);
    }
    if (type == 'IN') {
      String queary =
          "UPDATE outpassmob SET security_instatus = 'rejected', in_time = CURRENT_TIMESTAMP,security_instatus_name = '$name' WHERE admno = '$id'";
      await Server.updateRequest(queary);
    }
  }
}
