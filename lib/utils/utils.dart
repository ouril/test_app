class AppUtils {
  static String buildFirstLetters(String fullName) {
    final names = fullName
        .split(" ")
        .where((String element) => element != "Mrs." && element.length > 1);

    if (names.length == 2) {
      return "${names.first.substring(0, 1).toUpperCase()}${names.last.substring(0, 1).toUpperCase()}";
    }
    return names.first.substring(0, 1).toUpperCase();
  }
}
