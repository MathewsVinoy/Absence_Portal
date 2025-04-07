import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/database/server.dart';
import 'package:app/pages/staff/details_page.dart';
import 'package:app/ui/custom_appbar.dart';
import 'package:app/ui/errormsg.dart';
import 'package:app/ui/on_data.dart';
import 'package:app/ui/pending_card.dart';
import 'package:flutter/material.dart';

class HomePageStaff extends StatefulWidget {
  final Login data;
  const HomePageStaff({super.key, required this.data});

  @override
  State<HomePageStaff> createState() => _HomePageStaffState();
}

class _HomePageStaffState extends State<HomePageStaff> {
  late Future<List<OutPass>> futureOutPass;

  @override
  void initState() {
    super.initState();
    futureOutPass = Server.getStaffReq(widget.data.userid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Pending Requests"),
      body: FutureBuilder<List<OutPass>>(
        future: futureOutPass,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return errormsg(snapshot.error.toString());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return onData();
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  OutPass outPass = snapshot.data![index];
                  return PendingCard(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPageStaff(
                                      outPass: outPass,
                                      data: widget.data,
                                    )));
                      },
                      outPass: outPass);
                });
          }
        },
      ),
    );
  }
}
