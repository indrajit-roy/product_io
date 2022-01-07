extension DateTimeExt on DateTime {
  Duration get timeAgo => DateTime.now().difference(this);

  String get timeAgoText {
    final t = timeAgo;
    if (t.inSeconds < 60) {
      return "${t.inSeconds} s";
    } else if (t.inMinutes < 60) {
      return "${t.inMinutes} m";
    } else if (t.inHours < 24) {
      return "${t.inHours} h";
    } else if (t.inDays < 7) {
      return "${t.inDays} d";
    } else if (t.inDays >= 7 && t.inDays <= 24) {
      return "${t.inDays / 7} w";
    }
    return "${t.inDays / 30} m";
  }
}
