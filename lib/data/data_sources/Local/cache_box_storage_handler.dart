import 'package:hive_flutter/hive_flutter.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/strings.dart';

final hiveCacheBoxProvider =
    StateNotifierProvider<StorageHandlerNotifier, StorageHandler>((ref) {
  return StorageHandlerNotifier();
});

class StorageHandler {
  late Box _cacheBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _cacheBox = await Hive.openBox(KStrings.cacheBox);
  }

  dynamic get(String key, {dynamic defaultValue}) {
    //when no value found it will return by default false
    return _cacheBox.get(key, defaultValue: defaultValue);
  }

  void put(String key, dynamic value) {
    _cacheBox.put(key, value);
  }
}

class StorageHandlerNotifier extends StateNotifier<StorageHandler> {
  StorageHandlerNotifier() : super(StorageHandler());

  Future<void> init() async {
    await state.init();
  }

  dynamic get(String key, {dynamic defaultValue}) {
    return state.get(key, defaultValue: defaultValue);
  }

  void put(String key, dynamic value) {
    state.put(key, value);
  }
}
