import 'package:flutter/material.dart';

class StdHome extends StatelessWidget {
  const StdHome({super.key});

  @override
  Widget build(BuildContext context) {
    String _workingDay = 'yes';
    return Scaffold(
      body: Column(
        children: [
          TextField(),
          SizedBox(height: 20),
          Text('Is it a working day?'),
          RadioListTile<String>(
            title: const Text('Yes'),
            value: 'yes',
            groupValue: _workingDay,
            onChanged: (value) {
              // setState(() {
              //   _workingDay = value!;
              // });
            },
          ),
          RadioListTile<String>(
            title: const Text('No'),
            value: 'no',
            groupValue: _workingDay,
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
