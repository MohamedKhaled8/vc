class DeleteService {
  final int statusCode;
  final bool status;
  final String message;

  DeleteService({
    required this.statusCode,
    required this.status,
    required this.message,
  });

  factory DeleteService.fromJson(Map<String, dynamic> json) {
    return DeleteService(
      statusCode: json['statusCode'] ,
      status: json['status'] ,
      message: json['message'],
    );
  }
}