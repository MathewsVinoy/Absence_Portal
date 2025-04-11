import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/database/server.dart';
import 'package:app/ui/color.dart';
import 'package:app/ui/custom_appbar.dart';
import 'package:app/ui/errormsg.dart';
import 'package:app/ui/on_data.dart';
import 'package:app/ui/status_test.dart';
import 'package:flutter/material.dart';

class StatusStd extends StatefulWidget {
  final Login data;
  const StatusStd({super.key, required this.data});

  @override
  State<StatusStd> createState() => _StatusStdState();
}

class _StatusStdState extends State<StatusStd> {
  late Future<List<OutPass>> futureOutPass;

  @override
  void initState() {
    super.initState();
    futureOutPass = Server.getdata(widget.data.userid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('OutPass List'),
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
                return Card(
                  color: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date: ${outPass.startDate} - ${outPass.endDate}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            statusText("Staff", outPass.staffStatus),
                            statusText("HOD", outPass.hodStatus),
                          ],
                        ),
                        const SizedBox(height: 8),
                        statusText("Warden", outPass.wardenStatus),
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
