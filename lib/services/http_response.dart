import 'dart:convert';

class HttpResponse {
  final int statusCode;
  final Body body;

  const HttpResponse({
    required this.statusCode,
    required this.body,
  });

  factory HttpResponse.fromJson(statusCode, body) {
    return HttpResponse(
      statusCode: statusCode,
      body: Body.fromJson(jsonDecode(body)),
    );
  }
}

class Body {
  final String status;
  final String message;
  final data; // object type here, means 'any' type

  const Body({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}

class HttpResponseWithError {
  final int statusCode;
  final Body body;
  final raw;

  const HttpResponseWithError({
    required this.statusCode,
    required this.body,
    required this.raw,
  });

  factory HttpResponseWithError.fromJson(statusCode, body, raw) {
    return HttpResponseWithError(
      statusCode: statusCode,
      body: Body.fromJson(jsonDecode(body)),
      raw: raw,
    );
  }
}
