import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/accpect_reject.dart';
import 'package:app/functions/get_queary.dart';
import 'package:flutter/material.dart';

class OutcheckSec extends StatefulWidget {
  final Login data;
  const OutcheckSec({super.key, required this.data});

  @override
  State<OutcheckSec> createState() => _OutcheckSecState();
}

class _OutcheckSecState extends State<OutcheckSec> {
  late Future<List<OutPass>> futureOutPass;

  @override
  void initState() {
    super.initState();
    futureOutPass = GetQueary().getSecOutData();
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
                return ListTile(
                  title: Text('ID: ${outPass.admno}'),
                  subtitle:
                      Text('Name: ${outPass.name}\nDate: ${outPass.admno}'),
                  trailing: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await AccpectReject().secCheck(
                            'OUT',
                            outPass.admno,
                            widget.data.username,
                          );
                        },
                        child: Text("Accept"),
                      ),
                    ],
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
