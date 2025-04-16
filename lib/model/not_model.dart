import 'package:hive/hive.dart';


part 'not_model.g.dart';


@HiveType(typeId: 0)
class NotModel extends HiveObject {
  @HiveField(0)   
   String title;
  @HiveField(1)
   String supTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;

  NotModel({
    required this.title,
    required this.supTitle,
    required this.date,
    required this.color,
  });
}
