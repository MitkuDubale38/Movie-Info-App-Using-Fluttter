class HourConverter {
  static String convertToHumanForm(int number) {
    final int hours = number ~/ 60;
    final int minutes = number % 60;

    if (hours == 0) {
      return '$minutes minutes';
    } else if (hours == 1) {
      return '1 hour ${minutes > 0 ? '$minutes minutes' : ''}';
    } else {
      return '$hours hours ${minutes > 0 ? '$minutes minutes' : ''}';
    }
  }
}
