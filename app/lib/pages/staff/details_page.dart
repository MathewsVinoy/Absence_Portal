import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/accpect_reject.dart';
import 'package:app/pages/staff/nav_bar_staff.dart';
import 'package:app/ui/custom_appbar.dart';
import 'package:app/ui/details_container.dart';
import 'package:flutter/material.dart';

class DetailsPageStaff extends StatelessWidget {
  final OutPass outPass;
  final Login data;

  const DetailsPageStaff({
    super.key,
    required this.outPass,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(
          'OutPass Details',
        ),
        body: DetailsContainer(
          outPass: outPass,
          acccpectBtn: () async {
            await AccpectReject().rejectFun("Staff", outPass.admno);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => NavBarStaff(data: data)));
          },
          rejuctBtn: () async {
            await AccpectReject().acceptedFun("Staff", outPass.admno);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => NavBarStaff(data: data)));
          },
        ));
  }
}
