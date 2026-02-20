import 'package:clipboard_manager/domain/domain.dart';

abstract class ClipboardRepository {
  Future<List<ClipboardItem>> getClipboardItems();
  Stream<ClipboardItem> clipboardChanges();
  Future<void> copyItem(String value);
}
