import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/requst_add.dart';
import 'package:flutter/material.dart';

class StatusStd extends StatefulWidget {
  final Login data;
  const StatusStd({super.key, required this.data});

  @override
  State<StatusStd> createState() => _StatusStdState();
}

class _StatusStdState extends State<StatusStd> {
  bool isWorkingDay = false;
  bool isHostel = true;
  TextEditingController reasonController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('Student Status:'),
            CheckboxListTile(
              title: const Text('Day Scholar'),
              value: !isHostel,
              onChanged: (value) {
                setState(() {
                  isHostel = !value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Hostel Student'),
              value: isHostel,
              onChanged: (value) {
                setState(() {
                  isHostel = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: daysController,
              decoration: const InputDecoration(
                labelText: 'Number of Days',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text('Is it a working day?'),
              value: isWorkingDay,
              onChanged: (value) {
                setState(() {
                  isWorkingDay = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Start Date'),
              subtitle:
                  Text(startDate?.toString().split(' ')[0] ?? 'Select Date'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: startDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked != null) {
                  setState(() {
                    startDate = picked;
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('End Date'),
              subtitle:
                  Text(endDate?.toString().split(' ')[0] ?? 'Select Date'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: endDate ?? (startDate ?? DateTime.now()),
                  firstDate: startDate ?? DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked != null) {
                  setState(() {
                    endDate = picked;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: reasonController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Reason for Going Home',
                hintText: 'Please enter your reason here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  OutPass data = OutPass(
                    name: widget.data.username,
                    admno: widget.data.userid,
                    sem: widget.data.semester,
                    dept: widget.data.branch,
                    reason: reasonController.text,
                    endDate: endDate.toString(),
                    hostel: isHostel.toString(),
                    noDays: daysController.text,
                    startDate: startDate.toString(),
                    workDay: isWorkingDay.toString(),
                  );
                  requestAdding(data);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    reasonController.dispose();
    daysController.dispose();
    super.dispose();
  }
}
