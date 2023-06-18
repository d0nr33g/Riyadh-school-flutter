class DayAttendaceModel {
  String? sId;
  String? employee;
  String? checkIn;
  String? checkOut;
  bool? isCheckedInLate;
  bool? isCheckedOutEarly;
  String? createdAt;
  String? updatedAt;
  int? iV;
  dynamic? workingHoursMileseconds;
  dynamic? workingHours;

  DayAttendaceModel(
      {this.sId,
      this.employee,
      this.checkIn,
      this.checkOut,
      this.isCheckedInLate,
      this.isCheckedOutEarly,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.workingHoursMileseconds,
      this.workingHours});

  DayAttendaceModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    employee = json['employee'];
    checkIn = json['checkIn'];
    checkOut = json['checkOut']??"";
    isCheckedInLate = json['isCheckedInLate'];
    isCheckedOutEarly = json['isCheckedOutEarly'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    workingHoursMileseconds = json['workingHoursMileseconds']==null?0:json['workingHoursMileseconds'];
    workingHours = json['workingHours'];
  }

}