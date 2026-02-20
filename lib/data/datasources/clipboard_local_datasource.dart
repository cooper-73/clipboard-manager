import 'package:clipboard_manager/core/core.dart';
import 'package:clipboard_manager/data/data.dart';
import 'package:isar_community/isar.dart';

abstract class ClipboardLocalDatasource {
  Future<List<ClipboardItemLocal>> getClipboardItems();
  Future<void> saveClipboardItem(ClipboardItemLocal item);
}

class ClipboardLocalDatasourceImpl implements ClipboardLocalDatasource {
  const ClipboardLocalDatasourceImpl(this.isar);

  final Isar isar;

  @override
  Future<List<ClipboardItemLocal>> getClipboardItems() => isar.clipboardItems
      .where()
      .sortByCreatedAtDesc()
      .limit(kMaxClipboardItems)
      .findAll();

  @override
  Future<void> saveClipboardItem(ClipboardItemLocal item) =>
      isar.writeTxn(() async {
        await isar.clipboardItems.put(item);

        final clipboardItemsCount = await isar.clipboardItems.count();

        if (clipboardItemsCount > kMaxClipboardItems) {
          final itemsToDelete = await isar.clipboardItems
              .where()
              .sortByCreatedAt()
              .limit(clipboardItemsCount - kMaxClipboardItems)
              .findAll();

          final idsToDelete = itemsToDelete.map((e) => e.id).toList();

          await isar.clipboardItems.deleteAll(idsToDelete);
        }
      });
}
