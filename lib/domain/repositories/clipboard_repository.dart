import 'package:clipboard_manager/domain/domain.dart';

abstract class ClipboardRepository {
  Stream<ClipboardItem> clipboardChanges();
  Future<void> copyItem(String value);
}
