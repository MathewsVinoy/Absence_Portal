import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/database/server.dart';
import 'package:app/functions/accpect_reject.dart';
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
      body: FutureBuilder<List<OutPass>>(
        future: futureOutPass,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                OutPass outPass = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text('ID: ${outPass.admno}'),
                    subtitle:
                        Text('Name: ${outPass.name}\nDate: ${outPass.endDate}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
