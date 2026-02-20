import 'package:clipboard_manager/core/core.dart';
import 'package:clipboard_manager/domain/domain.dart';
import 'package:flutter/services.dart';

class ClipboardRepositoryImpl implements ClipboardRepository {
  ClipboardRepositoryImpl(this._channel);

  final ClipboardEventChannel _channel;

  @override
  Stream<ClipboardItem> clipboardChanges() {
    return _channel.stream
        .map(ClipboardItem.fromMap)
        .distinct((a, b) => a.text == b.text);
  }

  @override
  Future<void> copyItem(String value) =>
      Clipboard.setData(ClipboardData(text: value));
}
