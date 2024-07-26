extension OrEmpty on String? {
  String orEmpty() => this ?? '-';
}
