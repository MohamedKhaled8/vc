class DeleteAccountModel {
  final bool status;
  final String message;

  DeleteAccountModel({
    required this.status,
    required this.message,
  });

  factory DeleteAccountModel.fromJson(Map<String, dynamic> data) {
    return DeleteAccountModel(
      status: data['status'],
      message: data['message'],
    );
  }
}