class AuthModel {
  Location? location;
  String? sId;
  int? oracleDBNumber;
  String? firstName;
  String? lastName;
  String? status;
  String? creationDate;
  List<String>? timeSlots;
  List<String>? groups;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? accessToken;
  String? refreshToken;

  AuthModel(
      {this.location,
      this.sId,
      this.oracleDBNumber,
      this.firstName,
      this.lastName,
      this.status,
      this.creationDate,
      this.timeSlots,
      this.groups,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.accessToken,
      this.refreshToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
    oracleDBNumber = json['oracleDBNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    status = json['status'];
    creationDate = json['creationDate'];
    timeSlots = json['timeSlots'].cast<String>();
    groups = json['groups'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

class Location {
  String? type;
  List<int>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
  }
}