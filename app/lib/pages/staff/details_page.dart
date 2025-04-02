import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/accpect_reject.dart';
import 'package:app/pages/staff/nav_bar_staff.dart';
import 'package:app/ui/color.dart';
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
        title: const Text('OutPass Details',
            style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
        centerTitle: true,
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
                    'http://mbccet.com/img_small/${outPass.admno}.jpg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error, size: 150, color: red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _detailText("Name", outPass.name),
              _detailText("Admission No", outPass.admno),
              _detailText("Semester", outPass.sem),
              _detailText("Department", outPass.dept),
              _detailText("Reason", outPass.reason),
              _detailText("Hostel", outPass.hostel),
              _detailText("Number of Days", outPass.noDays),
              _detailText("Start Date", outPass.startDate),
              _detailText("End Date", outPass.endDate),
              _detailText("Working Day", outPass.workDay),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionButton("Accept", green, () async {
                    await AccpectReject().acceptedFun("Staff", outPass.admno);
                    _navigateToHome(context);
                  }),
                  _actionButton("Reject", red, () async {
                    await AccpectReject().rejectFun("Staff", outPass.admno);
                    _navigateToHome(context);
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        "$label: $value",
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: black),
      ),
    );
  }

  Widget _actionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NavBarStaff(data: data)),
    );
  }
}
