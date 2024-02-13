class CountDown {
  String timeLeft(
    DateTime due,
    String finishedText, {
    String spacer = ':',
  }) {
    List<int> values = [];
    Duration _timeUntilDue = due.difference(DateTime.now());
    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil = _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secUntil = _timeUntilDue.inSeconds - (_minUntil * 60);
    // String s = _secUntil.toString().substring(_secUntil.toString().length - 2);
    // //Fixed Invalid Range Value
    String s = _secUntil.toString().length <= 2
        ? _secUntil.toString()
        : _secUntil.toString().substring(_secUntil.toString().length - 2);
    values.add(_daysUntil);
    values.add(_hoursUntil);
    values.add(_minUntil);
    values.add(int.parse(s));
    if (_timeUntilDue.inSeconds < 1) {
      return finishedText;
    }
    return values.map((v) => v.toString().padLeft(2, '0')).join(spacer);
  }
}
