import 'package:flutter/material.dart';
import 'package:helloworld/models/travel_entry.dart';
import 'package:helloworld/widgets/add_travel_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box travelBox;

  @override
  void initState() {
    super.initState();
    travelBox = Hive.box('travelBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel Tracker')),
      body: ValueListenableBuilder(
        valueListenable: travelBox.listenable(),
        builder: (context, Box box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No travel entries yet.'));
          }

          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final entry = box.getAt(index) as TravelEntry;
              return ListTile(
                title: Text('${entry.startPoint} to ${entry.endPoint}'),
                subtitle:
                    Text('Duration: ${entry.travelDuration.inMinutes} minutes'),
                trailing: Text('Mediums: ${entry.travelMediums.join(', ')}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTravelEntryScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
