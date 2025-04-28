extension StringExtension on String {
  String get toThousandString {
    final sublist = split('.');

    if (sublist[0].length > 3) {
      final firstPart = sublist[0].substring(0, sublist[0].length - 3);
      final secondPart = sublist[0].substring(sublist[0].length - 3);
      return '$firstPart,$secondPart.${sublist[1].substring(0, 2)}';
    }

    return '${sublist[0]}.${sublist[1].substring(0, 2)}';
  }
}
