class Attendance {
  final String userId;
  final String date;
  final String checkIn;
  final String? checkOut;

  Attendance({
    required this.userId,
    required this.date,
    required this.checkIn,
    this.checkOut,
  });

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      userId: map['userId'],
      date: map['date'],
      checkIn: map['checkIn'],
      checkOut: map['checkOut'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'date': date,
      'checkIn': checkIn,
      'checkOut': checkOut,
    };
  }
}
