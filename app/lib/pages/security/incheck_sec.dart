import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/accpect_reject.dart';
import 'package:app/functions/get_queary.dart';
import 'package:flutter/material.dart';

class IncheckSec extends StatefulWidget {
  final Login data;
  const IncheckSec({super.key, required this.data});

  @override
  State<IncheckSec> createState() => _IncheckSecState();
}

class _IncheckSecState extends State<IncheckSec> {
  late Future<List<OutPass>> futureOutPass;

  @override
  void initState() {
    super.initState();
    futureOutPass = GetQueary().getSecInData();
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
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        'http://mbccet.com/img_small/${outPass.admno}.jpg', // Replace with actual image URL
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error, size: 150),
                      ),
                    ),
                    title: Text('ID: ${outPass.admno}'),
                    subtitle:
                        Text('Name: ${outPass.name}\nDate: ${outPass.admno}'),
                    trailing: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await AccpectReject().secCheck(
                              'IN',
                              outPass.admno,
                              widget.data.username,
                            );
                            setState(() {
                              futureOutPass = GetQueary().getSecOutData();
                            });
                          },
                          child: Text("Accept"),
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
