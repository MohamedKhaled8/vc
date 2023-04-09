class UpdateProfileModel {
  final int statusCode;
  final bool status;
  final String message;
  final NewUserData userData;

  UpdateProfileModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.userData,
  });

  factory UpdateProfileModel.fromJson({required Map<String, dynamic> data}) {
    return UpdateProfileModel(
      statusCode: data['statusCode'],
      status: data['status'],
      message: data['message'],
      userData: NewUserData.fromJson(data['data']),
    );
  }
}

class NewUserData {
  final int id;
  final String name;
  final String email;
  final String addressone;
  final String phone;
  final String photo;
  final List avatar;

  NewUserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.addressone,
      required this.phone,
      required this.photo,
      required this.avatar});

  factory NewUserData.fromJson(Map<String, dynamic> json) {
    return NewUserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      addressone: json['address'],
      phone: json['phone'],
      photo: json['photo'],
      avatar: json['avatar'],
    );
  }
}
