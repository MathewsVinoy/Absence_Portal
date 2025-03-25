import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/database/server.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Login data;
  const HomePage({super.key, required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<OutPass>> futureOutPass;

  @override
  void initState() {
    super.initState();
    futureOutPass = Server.getdata(widget.data.userid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OutPass List'),
      ),
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
                    title:
                        Text('Date: ${outPass.startDate} - ${outPass.endDate}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Staff: ${outPass.staffStatus ?? 'Pending'}"),
                            Text("HOD: ${outPass.hodStatus ?? 'Pending'}"),
                          ],
                        ),
                        Text("Warden: ${outPass.wardenStatus ?? 'Pending'}"),
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
