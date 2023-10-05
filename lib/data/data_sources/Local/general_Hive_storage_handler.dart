import 'package:hive_flutter/hive_flutter.dart';

class GeneralHiveStorageHandler {
  late Box _Box;
  final String BoxName;

  GeneralHiveStorageHandler(this.BoxName);

  Future<void> init() async {
    await Hive.initFlutter();
    _Box = await Hive.openBox(BoxName);
  }

  dynamic get(String key, {dynamic defaultValue}) {
    // When no value is found, it will return the defaultValue (defaulting to false)
    return _Box.get(key, defaultValue: defaultValue);
  }

  void put(String key, dynamic value) {
    _Box.put(key, value);
  }
}

//HivePut(box name, key, value)
Future<int> HivePut(String BoxName, String key, dynamic value) async {
  try {
    final storageObject = GeneralHiveStorageHandler(BoxName);
    await storageObject.init();
    storageObject.put(key, value);

    // If database handling is successful
    return 0;
  } catch (e) {
    // If an error occurs during database handling
    print('Error: $e');
    return 1;
  }
}


//HiveGet(box name, key, default value)
Future<int> HiveGet(String BoxName, String key, bool defaultValue) async {
  try {
    final storageObject = GeneralHiveStorageHandler(BoxName);
    await storageObject.init();
    dynamic value = storageObject.get(key, defaultValue: defaultValue);

    return value;
  } catch (e) {
    // If an error occurs during database handling
    print('Error: $e');
    return 1;
  }
}
