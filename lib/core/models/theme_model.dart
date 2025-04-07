class ThemeModel {
  final String name;
  final String link;
  final String owner;
  final String description;
  final List<String> colorScheme;

  ThemeModel({
    required this.name,
    required this.link,
    required this.owner,
    required this.description,
    required this.colorScheme,
  });


  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      name: json['name'],
      link: json['link'],
      owner: json['owner'],
      description: json['description'],
      colorScheme: List<String>.from(json['colorScheme']),
    );
  }
  
}
