import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/accpect_reject.dart';
import 'package:app/pages/staff/nav_bar_staff.dart';
import 'package:flutter/material.dart';

class DetailsPageStaff extends StatelessWidget {
  final OutPass outPass;
  final Login data;
  const DetailsPageStaff({
    super.key,
    required this.outPass,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OutPass Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'http://mbccet.com/img_small/${outPass.admno}.jpg', // Replace with actual image URL
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, size: 150),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text("Name: ${outPass.name}",
                  style: const TextStyle(fontSize: 18)),
              Text("Admission No: ${outPass.admno}",
                  style: const TextStyle(fontSize: 18)),
              Text("Semester: ${outPass.sem}",
                  style: const TextStyle(fontSize: 18)),
              Text("Department: ${outPass.dept}",
                  style: const TextStyle(fontSize: 18)),
              Text("Reason: ${outPass.reason}",
                  style: const TextStyle(fontSize: 18)),
              Text("Hostel: ${outPass.hostel}",
                  style: const TextStyle(fontSize: 18)),
              Text("Number of Days: ${outPass.noDays}",
                  style: const TextStyle(fontSize: 18)),
              Text("Start Date: ${outPass.startDate}",
                  style: const TextStyle(fontSize: 18)),
              Text("End Date: ${outPass.endDate}",
                  style: const TextStyle(fontSize: 18)),
              Text("Working Day: ${outPass.workDay}",
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await AccpectReject()
                            .acceptedFun("Staff", outPass.admno);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavBarStaff(data: data)));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text(
                        "Accepet",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () async {
                        await AccpectReject().rejectFun("Staff", outPass.admno);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavBarStaff(data: data)));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text(
                        "Reject",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
