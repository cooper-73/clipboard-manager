import 'package:clipboard_manager/core/core.dart';
import 'package:clipboard_manager/domain/domain.dart';

class ClipboardRepositoryImpl implements ClipboardRepository {
  ClipboardRepositoryImpl(this._channel);

  final ClipboardEventChannel _channel;

  @override
  Stream<ClipboardItem> clipboardChanges() {
    return _channel.stream
        .map(ClipboardItem.fromMap)
        .distinct((a, b) => a.value == b.value);
  }
}
