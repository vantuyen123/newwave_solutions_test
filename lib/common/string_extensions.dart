extension StringExtension on String {
  String toIntelliTrim4Character() {
    return length > 4 ? substring(0, 4) : this;
  }
}
