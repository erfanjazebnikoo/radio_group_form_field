import 'package:flutter/material.dart';
import 'package:radio_group_form_field/radio_group_form_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExampleForm(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExampleForm extends StatefulWidget {
  @override
  _ExampleFormState createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];
  final _myFormKey = GlobalKey<FormState>();

  String _message = 'Submit your item';
  bool _showVeritical = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Group Form Field Example'),
      ),
      body: SafeArea(
        child: Form(
          key: _myFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: Text("Show Vertical"),
                value: _showVeritical,
                onChanged: (value) {
                  if (mounted) {
                    setState(() {
                      _showVeritical = value!;
                    });
                  }
                },
              ),
              Divider(),
              RadioGroupFormField(
                padding: EdgeInsets.all(8),
                showVeritical: _showVeritical,
                context: context,
                items: items,
                validator: (value) =>
                    value == null ? "Select one of above items" : null,
                onSaved: (value) {
                  if (mounted) {
                    setState(() {
                      _message = items[value];
                    });
                  }
                },
              ),
              Divider(),
              ListTile(
                title: Text(_message),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (mounted) {
                          setState(() {
                            _myFormKey.currentState?.reset();
                            _message = 'Submit your item';
                          });
                        }
                      },
                      child: Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_myFormKey.currentState!.validate()) {
                          _myFormKey.currentState!.save();
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
