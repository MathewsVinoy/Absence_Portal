import 'package:app/database/outpass.dart';
import 'package:app/database/server.dart';

Future requestAdding(OutPass data) async {
  String query =
      "INSERT INTO outpassmob (name, admno, sem, dept, reason, endDate, hostel, noDays, startDate, workDay) VALUES ('${data.name}', '${data.admno}', '${data.sem}', '${data.dept}', '${data.reason}', '${data.endDate}', '${data.hostel}', ${data.noDays}, '${data.startDate}', ${data.workDay});";
  Server.addRequest(query);
}
