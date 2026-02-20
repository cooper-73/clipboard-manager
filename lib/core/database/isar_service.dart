import 'package:clipboard_manager/data/data.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  const IsarService._(this.isar);

  final Isar isar;

  static Future<IsarService> init() async {
    final dir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open(
      [ClipboardItemLocalSchema],
      directory: dir.path,
    );

    return IsarService._(isar);
  }
}
