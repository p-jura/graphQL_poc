import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  const HiveService._();

  static Future<void> initialize({
    Iterable<TypeAdapter<dynamic>> adapters = const [],
  }) async {
    final directory = await getTemporaryDirectory();
    Hive.init(directory.path);

    for (final adapter in adapters) {
      if (!Hive.isAdapterRegistered(adapter.typeId)) {
        Hive.registerAdapter(adapter);
      }
    }
  }

  static Future<Box> openBox(String key) async {
    final Box box = await Hive.openBox(key);
    return box;
  }
}
