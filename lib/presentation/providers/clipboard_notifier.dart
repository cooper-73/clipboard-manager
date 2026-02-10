import 'dart:async';

import 'package:clipboard_manager/domain/domain.dart';
import 'package:flutter/foundation.dart';

class ClipboardNotifier extends ChangeNotifier {
  ClipboardNotifier(this._clipboardRepository);

  final ClipboardRepository _clipboardRepository;

  final List<ClipboardItem> _clipboardItems = [];
  List<ClipboardItem> get clipboardItems =>
      List.unmodifiable(_clipboardItems.reversed);

  StreamSubscription<ClipboardItem>? _subscription;

  void startListening() {
    if (_subscription != null) return;

    _subscription = _clipboardRepository.clipboardChanges().listen(
      (clipboardItem) {
        _clipboardItems.add(clipboardItem);
        notifyListeners();
      },
    );
  }

  void stopListening() {
    _subscription?.cancel();
    _subscription = null;
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }
}
