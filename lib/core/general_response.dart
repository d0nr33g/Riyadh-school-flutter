class GenericResponse<T> {
  late final bool success;
  late final String message;
  late final int totalPages;
  late final int totalUnRead;
  late final int totalDocs;
  List<Error>? error;
  T? result;
  List<T>? results;

  GenericResponse(
      {Map<String, dynamic>? json,
      bool isList = false,
      required T Function(Map<String, dynamic>) fromJson}) {
    if (json != null) {
      success = json['success'] ?? true;
      totalPages = json['totalPages'] ?? 0;
      totalDocs = json['totalDocs'] ?? 0;
      totalUnRead = json['totalUnRead'] ?? 0;

      if (json['errors'] != null) {
        error = <Error>[];
        json['errors'].forEach((dynamic v) {
          error!.add(Error.fromJson(v as Map<String, dynamic>));
        });
      }

      if (json['data'] != null) {
        if (isList) {
          results = (json['data'] as List<dynamic>).map((dynamic e) {
            return fromJson(e as Map<String, dynamic>);
          }).toList();
        } else {
          result = fromJson(json['data'] as Map<String, dynamic>);
        }
      } else {
        result = fromJson(json);
      }
    } else {
      success = false;
      error = <Error>[Error(message: 'Not authorized')];
    }
  }
}

class Error {
  String message;

  Error({required this.message});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      message: json['message'],
    );
  }
}
