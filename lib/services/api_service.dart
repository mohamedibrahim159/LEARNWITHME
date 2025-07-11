class ApiResponse {
  final int status;
  final bool success;
  final String message;
  final Map<String, dynamic>? result;

  ApiResponse({
    required this.status,
    required this.success,
    required this.message,
    this.result,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] ?? 0,
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      result:
          json['result'] != null
              ? Map<String, dynamic>.from(json['result'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'message': message,
      'result': result,
    };
  }
}
