import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/get_queary.dart';
import 'package:app/pages/hod/details_page.dart';
import 'package:app/ui/custom_appbar.dart';
import 'package:app/ui/errormsg.dart';
import 'package:app/ui/on_data.dart';
import 'package:app/ui/pending_card.dart';
import 'package:flutter/material.dart';

class HomePageHod extends StatefulWidget {
  final Login data;
  const HomePageHod({super.key, required this.data});

  @override
  State<HomePageHod> createState() => _HomePageHodState();
}

class _HomePageHodState extends State<HomePageHod> {
  late Future<List<OutPass>> futureOutPass;

  @override
  void initState() {
    super.initState();
    futureOutPass = GetQueary().getHodData(widget.data.branch);
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
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                OutPass outPass = snapshot.data![index];
                return PendingCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPageHod(
                                    outPass: outPass,
                                    data: widget.data,
                                  )));
                    },
                    outPass: outPass);
              },
            );
          }
        },
      ),
    );
  }
}
