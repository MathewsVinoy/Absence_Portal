import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/accpect_reject.dart';
import 'package:app/pages/hod/nav_bar_hod.dart';
import 'package:app/ui/custom_appbar.dart';
import 'package:app/ui/details_container.dart';
import 'package:flutter/material.dart';

class DetailsPageHod extends StatelessWidget {
  final OutPass outPass;
  final Login data;
  const DetailsPageHod({
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
            await AccpectReject().acceptedFun("HOD", outPass.admno);

            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NavBarHod(data: data)));
          },
          rejuctBtn: () async {
            await AccpectReject().rejectFun("HOD", outPass.admno);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NavBarHod(data: data)));
          },
        ));
  }
}
