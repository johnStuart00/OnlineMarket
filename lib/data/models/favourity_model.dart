import 'package:hive/hive.dart';
part 'favourity_model.g.dart';

@HiveType(typeId: 0)
class Favourity_model {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String dis;
  @HiveField(3)
  String price;
  Favourity_model(
      {required this.dis,
      required this.id,
      required this.name,
      required this.price});
}
