import 'package:sembast/sembast.dart';

StoreRef<String, Map<String, Object?>> makeSembastStore({
  required String storeName,
}) =>
    stringMapStoreFactory.store(storeName);
