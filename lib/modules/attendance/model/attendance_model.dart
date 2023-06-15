class AttendanceModel {
  String? sId;
  String? employee;
  String? checkIn;
  bool? isCheckedInLate;
  bool? isCheckedOutEarly;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? checkOut;
  int? workingHoursMileseconds;
  String? workingHours;

  AttendanceModel(
      {this.sId,
      this.employee,
      this.checkIn,
      this.isCheckedInLate,
      this.isCheckedOutEarly,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.checkOut,
      this.workingHoursMileseconds,
      this.workingHours});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    employee = json['employee'];
    checkIn = json['checkIn'];
    isCheckedInLate = json['isCheckedInLate'];
    isCheckedOutEarly = json['isCheckedOutEarly'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    checkOut = json['checkOut'];
    workingHoursMileseconds = json['workingHoursMileseconds'];
    workingHours = json['workingHours'];
  }

}