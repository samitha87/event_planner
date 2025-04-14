class OrganizersModel {
  final String name;
  final String email;
  final String? image;

  OrganizersModel({required this.name, required this.email, this.image});

  factory OrganizersModel.fromJson(Map<String, dynamic> json) {
    return OrganizersModel(name: json['name'], email: json['email'], image: json['image'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'image': image};
  }
}
