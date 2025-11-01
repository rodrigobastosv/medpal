extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullNorEmpty => this != null && this!.isNotEmpty;
}
