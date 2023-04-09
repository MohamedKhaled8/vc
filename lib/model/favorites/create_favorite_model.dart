class AddFavoriteModel {
  final dynamic statusCode;
  final dynamic status;
  final String message;

  AddFavoriteModel({
    required this.statusCode,
    required this.status,
    required this.message,
  });

  factory AddFavoriteModel.fromJson(Map<String, dynamic>json){
    return AddFavoriteModel(
        statusCode: json['statusCode'],
        status:  json['status'],
        message:  json['message']);
  }
}