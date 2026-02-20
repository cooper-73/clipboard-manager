import 'package:clipboard_manager/domain/domain.dart';
import 'package:isar_community/isar.dart';

part 'clipboard_item_local.g.dart';

@Collection(accessor: 'clipboardItems')
class ClipboardItemLocal {
  Id id = Isar.autoIncrement;
  late String text;
  late DateTime createdAt;
}

extension ClipboardItemLocalX on ClipboardItemLocal {
  ClipboardItem toDomain() => ClipboardItem(
    text: text,
    createdAt: createdAt,
  );

  static ClipboardItemLocal fromDomain(ClipboardItem item) =>
      ClipboardItemLocal()
        ..text = item.text
        ..createdAt = item.createdAt;
}
