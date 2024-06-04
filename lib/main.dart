import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'result_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter FormBuilder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 0, 8, 113),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter FormBuilder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FormBuilderDropdown(
                  name: 'region',
                  decoration: InputDecoration(
                    labelText: 'Region',
                    hintText: 'Select Region',
                  ),
                  validator: FormBuilderValidators.required(),
                  items: ['A', 'B', 'C', 'D']
                      .map((region) => DropdownMenuItem(
                            value: region,
                            child: Text(region),
                          ))
                      .toList(),
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'station',
                  decoration: InputDecoration(
                    labelText: 'Station',
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                SizedBox(height: 20),
                FormBuilderDateTimePicker(
                  name: 'date',
                  inputType: InputType.date,
                  decoration: InputDecoration(
                    labelText: 'Date',
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                SizedBox(height: 20),
                FormBuilderDateTimePicker(
                  name: 'time',
                  inputType: InputType.time,
                  decoration: InputDecoration(
                    labelText: 'Time',
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                SizedBox(height: 20),
                FormBuilderDropdown(
                  name: 'available',
                  decoration: InputDecoration(
                    labelText: 'Availability',
                    hintText: 'Available: YES/NO',
                  ),
                  validator: FormBuilderValidators.required(),
                  items: ['YES', 'NO']
                      .map((availability) => DropdownMenuItem(
                            value: availability,
                            child: Text(availability),
                          ))
                      .toList(),
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'remarks',
                  decoration: InputDecoration(
                    labelText: 'Remarks',
                  ),
                  maxLines: 3,
                  validator: FormBuilderValidators.required(),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      final formData = _formKey.currentState?.value;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(formData: formData),
                        ),
                      );
                    } else {
                      print("Validation failed");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
