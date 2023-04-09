class DeleteReviewModel {
  final int statusCode;
  final bool status;
  final String message;

  DeleteReviewModel({
    required this.statusCode,
    required this.status,
    required this.message,
  });

  factory DeleteReviewModel.fromJson( json) {
    return DeleteReviewModel(
      statusCode: json['statusCode'] ,
      status: json['status'] ,
      message: json['message'],
    );
  }
}