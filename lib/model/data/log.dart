class Log {
  final DateTime dateTime;
  final String state;
  final String errorMessage;

  Log({
    required this.dateTime,
    required this.state,
    required this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime,
      'state': state,
      'errorMessage': errorMessage,
    };
  }

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      dateTime: map['dateTime'],
      state: map['state'],
      errorMessage: map['errorMessage'],
    );
  }
}
