class LoginModel {
  final bool success;
  final String message;
  final String token;
  final UserData userData;

  LoginModel({
    required this.success,
    required this.message,
    required this.token,
    required this.userData,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'],
      message: json['message'],
      userData: UserData.fromJson(json['data']),
      token: json['token'],
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final List address;
  final dynamic phone;
  final String photo;
  final List avatar;
  final String type;
  final int companyId;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.photo,
    required this.avatar,
    required this.type,
    required this.companyId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      photo: json['photo'],
      avatar: json['avatar'] ?? [],
      type: json['type'],
      companyId: json['companyId'],
    );
  }
}
