import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final Map<String, dynamic>? formData;

  ResultPage({this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Submission Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Region: ${formData?['region']}'),
            Text('Station: ${formData?['station']}'),
            Text('Date: ${formData?['date']}'),
            Text('Time: ${formData?['time']}'),
            Text('Available: ${formData?['available']}'),
            Text('Remarks: ${formData?['remarks']}'),
          ],
        ),
      ),
    );
  }
}
