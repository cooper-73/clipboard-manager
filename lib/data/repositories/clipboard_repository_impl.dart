import 'dart:async';

import 'package:clipboard_manager/core/core.dart';
import 'package:clipboard_manager/data/data.dart';
import 'package:clipboard_manager/domain/domain.dart';
import 'package:flutter/services.dart';

class ClipboardRepositoryImpl implements ClipboardRepository {
  ClipboardRepositoryImpl(this._channel, this._localDatasource);

  final ClipboardEventChannel _channel;
  final ClipboardLocalDatasource _localDatasource;

  @override
  Future<List<ClipboardItem>> getClipboardItems() async {
    final clipboardItems = await _localDatasource.getClipboardItems();

    return clipboardItems.map((item) => item.toDomain()).toList();
  }

  @override
  Stream<ClipboardItem> clipboardChanges() {
    return _channel.stream
        .map(ClipboardItem.fromMap)
        .distinct((a, b) => a.text == b.text)
        .asyncMap((clipboardItem) async {
          await _localDatasource.saveClipboardItem(
            ClipboardItemLocalX.fromDomain(clipboardItem),
          );

          return clipboardItem;
        });
  }

  @override
  Future<void> copyItem(String value) =>
      Clipboard.setData(ClipboardData(text: value));
}
