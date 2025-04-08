import 'package:app/database/login.dart';
import 'package:app/database/outpass.dart';
import 'package:app/functions/requst_add.dart';
import 'package:app/ui/color.dart';
import 'package:app/ui/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomepageStd extends StatefulWidget {
  final Login data;
  const HomepageStd({super.key, required this.data});

  @override
  State<HomepageStd> createState() => _HomepageStdState();
}

class _HomepageStdState extends State<HomepageStd> {
  bool isWorkingDay = false;
  bool isHostel = true;
  TextEditingController reasonController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('Outpass Request Form'),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Student Info Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, color: primaryColor),
                          const SizedBox(width: 8),
                          Text(
                            'Student Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Text(
                        'Name: ${widget.data.username}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ID: ${widget.data.userid}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Department: ${widget.data.branch}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Semester: ${widget.data.semester}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Residence Status Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.home, color: primaryColor),
                          const SizedBox(width: 8),
                          Text(
                            'Student Status',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Using radio buttons instead of checkboxes
                      ListTile(
                        title: const Text('Day Scholar'),
                        leading: Radio(
                          activeColor: mainColor,
                          value: false,
                          groupValue: isHostel,
                          onChanged: (bool? value) {
                            setState(() {
                              isHostel = value!;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        title: const Text('Hostel Student'),
                        leading: Radio(
                          activeColor: mainColor,
                          value: true,
                          groupValue: isHostel,
                          onChanged: (bool? value) {
                            setState(() {
                              isHostel = value!;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Outpass Details Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.description, color: primaryColor),
                          const SizedBox(width: 8),
                          Text(
                            'Outpass Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Number of Days
                      TextField(
                        controller: daysController,
                        decoration: InputDecoration(
                          labelText: 'Number of Days',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon:
                              Icon(Icons.calendar_today, color: primaryColor),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: mainColor, width: 2),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),

                      const SizedBox(height: 16),

                      // Working day checkbox
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CheckboxListTile(
                          title: const Text('Is it a working day?'),
                          value: isWorkingDay,
                          activeColor: mainColor,
                          onChanged: (value) {
                            setState(() {
                              isWorkingDay = value!;
                            });
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Start Date
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.date_range, color: primaryColor),
                          title: const Text('Start Date'),
                          subtitle: Text(
                            startDate?.toString().split(' ')[0] ??
                                'Select Date',
                            style: TextStyle(
                              color: startDate != null ? black : Colors.grey,
                            ),
                          ),
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: startDate ?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: primaryColor,
                                      onPrimary: white,
                                      onSurface: black,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (picked != null) {
                              setState(() {
                                startDate = picked;
                              });
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // End Date
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.date_range, color: primaryColor),
                          title: const Text('End Date'),
                          subtitle: Text(
                            endDate?.toString().split(' ')[0] ?? 'Select Date',
                            style: TextStyle(
                              color: endDate != null ? black : Colors.grey,
                            ),
                          ),
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate:
                                  endDate ?? (startDate ?? DateTime.now()),
                              firstDate: startDate ?? DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: primaryColor,
                                      onPrimary: white,
                                      onSurface: black,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (picked != null) {
                              setState(() {
                                endDate = picked;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Reason Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.edit_note, color: primaryColor),
                          const SizedBox(width: 8),
                          Text(
                            'Reason for Going Home',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: reasonController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Please enter your reason here...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: mainColor, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Submit Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    foregroundColor: white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () async {
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
                    await requestAdding(data);
                    reasonController.clear();
                    daysController.clear();
                  },
                  child: const Text(
                    'Submit Request',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
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
