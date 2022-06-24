import 'package:hive/hive.dart';

part 'icon_db_model.g.dart';

@HiveType(typeId: 0)
class IconDbModel extends HiveObject{
  @HiveField(0)
  late int size;

  @HiveField(1)
  late String colorValue;


}