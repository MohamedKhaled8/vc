class ProfileModel {
  final int statusCode;
  final bool status;
  final UserData userData;

  ProfileModel({
    required this.statusCode,
    required this.status,
    required this.userData,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      statusCode: json['statusCode'],
      status: json['status'],
      userData: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final List address;
  final int phone;
  final String photo;
  // final String NIN;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.photo,
    // required this.NIN
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'], //return with Null
      phone: json['phone'],
      photo: json['photo'],
      // NIN: json['NIN'],
    );
  }
}
