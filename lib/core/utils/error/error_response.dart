class ErrorResponse {
  final String? status;
  final String? code;
  final String? message;

  ErrorResponse({this.status = 'SUCCESS', this.code = '0000', this.message = ''});

  @override
  String toString() {
    return 'ErrorResponse{status: $status, code: $code, message: $message}';
  }
}
