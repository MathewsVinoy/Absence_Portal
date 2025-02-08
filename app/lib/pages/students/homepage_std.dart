import 'package:flutter/material.dart';

class StatusStd extends StatelessWidget {
  const StatusStd({super.key});

  @override
  Widget build(BuildContext context) {
    String workingDay = 'yes';
    return Scaffold(
      body: Column(
        children: [
          TextField(),
          SizedBox(height: 20),
          Text('Is it a working day?'),
          RadioListTile<String>(
            title: const Text('Yes'),
            value: 'yes',
            groupValue: workingDay,
            onChanged: (value) {
              // setState(() {
              //   _workingDay = value!;
              // });
            },
          ),
          RadioListTile<String>(
            title: const Text('No'),
            value: 'no',
            groupValue: workingDay,
            onChanged: (value) {
              // setState(() {
              //   _workingDay = value!;
              // });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
              // final text = _textController.text;
              // final isWorkingDay = _workingDay == 'yes';
              // print('Text: $text, Working Day: $isWorkingDay');
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
