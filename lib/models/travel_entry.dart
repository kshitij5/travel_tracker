import 'package:hive/hive.dart';

part 'travel_entry.g.dart';

@HiveType(typeId: 0)
class TravelEntry extends HiveObject {
  @HiveField(0)
  String startPoint;

  @HiveField(1)
  String endPoint;

  @HiveField(2)
  DateTime startTime;

  @HiveField(3)
  DateTime endTime;

  @HiveField(4)
  List<String> travelMediums;

  TravelEntry({
    required this.startPoint,
    required this.endPoint,
    required this.startTime,
    required this.endTime,
    required this.travelMediums,
  });

  Duration get travelDuration => endTime.difference(startTime);
}
