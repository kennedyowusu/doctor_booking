enum ScheduleStatus {
  upcoming,
  complete,
  cancel,
}

class Schedule {
  final String doctorName;
  final String specialty;
  final String doctorImage;
  final ScheduleStatus status;

  Schedule({
    required this.doctorName,
    required this.specialty,
    required this.doctorImage,
    required this.status,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      doctorName: json['doctor_name'],
      specialty: json['specialty'],
      doctorImage: json['doctor_image'],
      status: _parseStatus(json['status']),
    );
  }

  static ScheduleStatus _parseStatus(String status) {
    switch (status) {
      case 'upcoming':
        return ScheduleStatus.upcoming;
      case 'complete':
        return ScheduleStatus.complete;
      case 'cancel':
        return ScheduleStatus.cancel;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }
}

List<Schedule> schedules = [
  Schedule(
    doctorName: "Kennedy Owusu",
    specialty: "Dentist",
    doctorImage: "https://i.pravatar.cc/150?img=1",
    status: ScheduleStatus.complete,
  ),
  Schedule(
    doctorName: "John Doe",
    specialty: "Cardiology",
    doctorImage: "https://i.pravatar.cc/150?img=1",
    status: ScheduleStatus.upcoming,
  ),
  Schedule(
    doctorName: "Jane Doe",
    specialty: "Respiration",
    doctorImage: "https://i.pravatar.cc/150?img=1",
    status: ScheduleStatus.upcoming,
  ),
  Schedule(
    doctorName: "Shadrack Owusu",
    specialty: "General",
    doctorImage: "https://i.pravatar.cc/150?img=1",
    status: ScheduleStatus.cancel,
  ),
  Schedule(
    doctorName: "Kennedy Owusu",
    specialty: "Dentist",
    doctorImage: "https://i.pravatar.cc/150?img=1",
    status: ScheduleStatus.complete,
  ),
];
