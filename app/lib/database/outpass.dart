class OutPass {
  String name;
  String admno;
  String sem;
  String dept;
  String reason;
  String hostel;
  String noDays;
  String startDate;
  String endDate;
  String workDay;
  String? staffStatus;
  String? hodStatus;
  String? wardenStatus;
  String? outTime;
  String? inTime;

  OutPass({
    required this.name,
    required this.admno,
    required this.sem,
    required this.dept,
    required this.reason,
    required this.endDate,
    required this.hostel,
    required this.noDays,
    required this.startDate,
    required this.workDay,
    this.staffStatus,
    this.hodStatus,
    this.wardenStatus,
    this.inTime,
    this.outTime,
  });

  factory OutPass.fromJson(Map<String, dynamic> json) {
    return OutPass(
      name: json['name'] as String,
      admno: json['admno'] as String,
      sem: json['sem'] as String,
      dept: json['dept'] as String,
      reason: json['reason'] as String,
      endDate: json['endDate'] as String,
      hostel: json['hostel'] as String,
      noDays: json['noDays'] as String,
      startDate: json['startDate'] as String,
      workDay: json['workDay'] as String,
      staffStatus: json['staff_status'] as String?,
      hodStatus: json['hod_status'] as String?,
      wardenStatus: json['warden_status'] as String?,
      inTime: json['in_time'] as String?,
      outTime: json['out_time'] as String?,
    );
  }
}
