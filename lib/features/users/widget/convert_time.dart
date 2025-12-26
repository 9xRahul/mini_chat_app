String lastSeenText(DateTime time) {
  final diff = DateTime.now().difference(time);

  if (diff.inMinutes < 1) return 'now';
  if (diff.inMinutes == 1) return '1 min ago';
  if (diff.inMinutes < 60) return '${diff.inMinutes} mins ago';
  if (diff.inHours == 1) return '1 hr ago';
  if (diff.inHours < 24) return '${diff.inHours} hrs ago';
  if (diff.inDays == 1) return 'yesterday';
  return '${diff.inDays} days ago';
}
