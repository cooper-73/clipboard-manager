import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClipboardPane extends StatelessWidget {
  const ClipboardPane({super.key});

  @override
  Widget build(BuildContext context) {
    final clipboardItems = context.watch<ClipboardNotifier>().clipboardItems;

    if (clipboardItems.isEmpty) {
      return const EmptyClipboardHistory();
    }

    return ClipboardHistory(clipboardItems: clipboardItems);
  }
}
