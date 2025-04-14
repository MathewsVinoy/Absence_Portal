import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/accpect_reject.dart';
import 'package:app/pages/warden/nav_bar_warden.dart';
import 'package:app/ui/custom_appbar.dart';
import 'package:app/ui/details_container.dart';
import 'package:flutter/material.dart';

class DetailsPageWarden extends StatelessWidget {
  final OutPass outPass;
  final Login data;
  const DetailsPageWarden({
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
            await AccpectReject().acceptedFun("Warden", outPass.admno);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => NavBarWarden(data: data)));
          },
          rejuctBtn: () async {
            await AccpectReject().rejectFun("Warden", outPass.admno);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => NavBarWarden(data: data)));
          },
        ));
  }
}
