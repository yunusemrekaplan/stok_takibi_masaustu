class Log {
  final DateTime dateTime;
  final String state;
  final String message;

  Log({
    required this.dateTime,
    required this.state,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime,
      'state': state,
      'message': message,
    };
  }

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      dateTime: map['dateTime'],
      state: map['state'],
      message: map['message'],
    );
  }
}
