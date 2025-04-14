import 'package:app/ui/color.dart';
import 'package:flutter/widgets.dart';

Widget statusText(String role, String? status) {
  Color statusColor;
  switch (status?.toLowerCase()) {
    case "approved":
      statusColor = green;
      break;
    case "accepted":
      statusColor = green;
      break;
    case "rejected":
      statusColor = red;
      break;
    case "pending":
    default:
      statusColor = yellow;
  }
  return Row(
    children: [
      Text("$role: ",
          style: TextStyle(fontWeight: FontWeight.bold, color: black)),
      Text(status ?? 'Pending',
          style: TextStyle(color: statusColor, fontWeight: FontWeight.w600)),
    ],
  );
}
