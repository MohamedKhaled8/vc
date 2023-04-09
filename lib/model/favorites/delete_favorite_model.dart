class DeleteFavoriteModel {
  final int statusCode;
  final bool status;
  final String message;

  DeleteFavoriteModel({
    required this.statusCode,
    required this.status,
    required this.message,
  });

  factory DeleteFavoriteModel.fromJson(Map<String, dynamic> json) {
    return DeleteFavoriteModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
    );
  }

}
