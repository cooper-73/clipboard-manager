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

  Future<void> init() async {
    try {
      _clipboardItems = await _clipboardRepository.getClipboardItems();

      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _startListening();
    }
  }

  void _startListening() {
    if (_subscription != null) return;

    _subscription = _clipboardRepository.clipboardChanges().listen(
      (newClipboardItem) {
        /// Updates the list of clipboard items by inserting the new item at
        /// the beginning.
        _clipboardItems = [
          newClipboardItem,
          ..._clipboardItems,
        ];

        /// If the list length exceeds [kMaxClipboardItems], it truncates the
        /// original list.
        if (kMaxClipboardItems < clipboardItems.length) {
          _clipboardItems = _clipboardItems.take(kMaxClipboardItems).toList();
        }

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
