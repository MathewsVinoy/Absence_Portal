import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/get_queary.dart';
import 'package:flutter/material.dart';

class StatusSec extends StatefulWidget {
  final Login data;
  const StatusSec({super.key, required this.data});

  @override
  State<StatusSec> createState() => _StatusSecState();
}

class _StatusSecState extends State<StatusSec> {
  late Future<List<OutPass>> futureOutPass;

  @override
  void initState() {
    super.initState();
    futureOutPass = GetQueary().getSecReq();
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
