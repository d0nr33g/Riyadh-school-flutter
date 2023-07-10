class NotificationModel {
  Message? message;
  String? sId;
  String? employeeId;
  bool? isRead;
  String? createdAt;
  String? updatedAt;
  int? iV;

  NotificationModel(
      {this.message,
        this.sId,
        this.employeeId,
        this.isRead,
        this.createdAt,
        this.updatedAt,
        this.iV});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    message =
    json['message'] != null ? Message.fromJson(json['message']) : null;
    sId = json['_id'];
    employeeId = json['employeeId'];
    isRead = json['isRead'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Message {
  String? title;
  String? body;

  Message({this.title, this.body});

  Message.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

}