class ChickOutModel {
  String? employee;
  String? checkIn;
  bool? isCheckedInLate;
  bool? isCheckedOutEarly;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ChickOutModel(
      {this.employee,
      this.checkIn,
      this.isCheckedInLate,
      this.isCheckedOutEarly,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ChickOutModel.fromJson(Map<String, dynamic> json) {
    employee = json['employee'];
    checkIn = json['checkIn'];
    isCheckedInLate = json['isCheckedInLate'];
    isCheckedOutEarly = json['isCheckedOutEarly'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }


}