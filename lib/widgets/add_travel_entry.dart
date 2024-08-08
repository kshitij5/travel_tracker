import 'package:flutter/material.dart';
import 'package:helloworld/models/travel_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddTravelEntryScreen extends StatefulWidget {
  @override
  _AddTravelEntryScreenState createState() => _AddTravelEntryScreenState();
}

class _AddTravelEntryScreenState extends State<AddTravelEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  String _startPoint = '';
  String _endPoint = '';
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();
  List<String> _travelMediums = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Travel Entry')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Start Point'),
                onSaved: (value) => _startPoint = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'End Point'),
                onSaved: (value) => _endPoint = value!,
              ),
              // Add more fields for start time, end time, and travel mediums
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newEntry = TravelEntry(
                      startPoint: _startPoint,
                      endPoint: _endPoint,
                      startTime: _startTime,
                      endTime: _endTime,
                      travelMediums: _travelMediums,
                    );
                    Hive.box('travelBox').add(newEntry);
                    Navigator.pop(context);

                    print(newEntry.toString());
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
