import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/get_queary.dart';
import 'package:app/ui/color.dart';
import 'package:app/ui/custom_appbar.dart';
import 'package:app/ui/errormsg.dart';
import 'package:app/ui/on_data.dart';
import 'package:app/ui/status_test.dart';
import 'package:flutter/material.dart';

class StatusHod extends StatefulWidget {
  final Login data;
  const StatusHod({super.key, required this.data});

  @override
  State<StatusHod> createState() => _StatusHodState();
}

class _StatusHodState extends State<StatusHod> {
  late Future<List<OutPass>> futureOutPass;

  @override
  void initState() {
    super.initState();
    futureOutPass = GetQueary().getHodReq(widget.data.branch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("History"),
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
                return Card(
                  color: white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name: ${outPass.name}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black,
                              ),
                            ),
                            statusText('', outPass.staffStatus),
                          ],
                        ),
                        Text(
                          'Adm No: ${outPass.admno}',
                          style: TextStyle(
                            fontSize: 16,
                            color: black,
                          ),
                        ),
                        Text(
                          'Date: ${outPass.startDate} - ${outPass.endDate}',
                          style: TextStyle(
                            fontSize: 16,
                            color: black,
                          ),
                        ),
                      ],
                    ),
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
