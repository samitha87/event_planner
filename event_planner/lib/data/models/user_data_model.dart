class UserDataModel {
  final String? id;
  final String? fname;
  final String? lname;
  final String? email;
  final String? password;
  final String? phone;
  final String? address;
  final String? profileImage;

  UserDataModel({this.id, this.fname, this.lname, this.email, this.password, this.phone, this.address, this.profileImage});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'profileImage': profileImage,
    };
  }
}
