class RegisterModel {
  final int statusCode;
  final bool status;
  final String message;
  final UserData userData;

  RegisterModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.userData,
  });

  factory RegisterModel.fromJson( Map<String, dynamic> json) {
    return RegisterModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      userData: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String photo;

  UserData(
      {required this.id,
        required this.name,
        required this.email,
        required this.address,
        required this.phone,
        required this.photo,});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      photo: json['photo'],
    );
  }
}
