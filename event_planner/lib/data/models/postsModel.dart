class PostsModel {
  final String title;
  final String description;
  final String image;

  PostsModel({required this.title, required this.description, required this.image});

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(title: json['title'], description: json['description'], image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
    };
  }
}
