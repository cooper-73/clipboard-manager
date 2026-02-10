extension DateTimeX on DateTime {
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 1) return '${difference.inDays} days ago';

    if (difference.inDays == 1) return 'Yesterday';

    if (difference.inHours > 0) return '${difference.inHours}h ago';

    if (difference.inMinutes > 0) return '${difference.inMinutes}m ago';

    return 'Just now';
  }
}
