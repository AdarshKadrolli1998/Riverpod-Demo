import 'package:hive/hive.dart';
import 'package:riverpod_example/icon_db_model.dart';

class IconDbServices {
  static Box<IconDbModel> getSizeColor() =>
      Hive.box<IconDbModel>('IconDbModel');
}