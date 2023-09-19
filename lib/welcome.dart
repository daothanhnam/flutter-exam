class Welcome {
  String title;
  String subtitle;
  String image;
  String description;
  WelcomeModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
  });
  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'],
      description: json['description'],
    );
  }
}
