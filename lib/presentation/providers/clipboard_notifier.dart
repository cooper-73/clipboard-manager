import 'dart:async';

import 'package:clipboard_manager/core/core.dart';
import 'package:clipboard_manager/domain/domain.dart';
import 'package:flutter/foundation.dart';

class ClipboardNotifier extends ChangeNotifier {
  ClipboardNotifier(this._clipboardRepository);

  final ClipboardRepository _clipboardRepository;

  List<ClipboardItem> _clipboardItems = [];
  List<ClipboardItem> get clipboardItems => List.unmodifiable(_clipboardItems);

  StreamSubscription<ClipboardItem>? _subscription;

  void startListening() {
    if (_subscription != null) return;

    _subscription = _clipboardRepository.clipboardChanges().listen(
      (clipboardItem) {
        // Add the clipboard item to the top of the list and remove the last
        // one if there are more than kMaxClipboardItems
        _clipboardItems = [
          clipboardItem,
          ..._clipboardItems.take(kMaxClipboardItems - 1),
        ];
        notifyListeners();
      },
    );
  }

  void stopListening() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> copyItem(String value) async {
    try {
      await _clipboardRepository.copyItem(value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }
}
