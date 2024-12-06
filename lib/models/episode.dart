class Episode {
  final int id;
  String title;
  String body;

  Episode({required this.id, required this.title, required this.body});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Update the episode's title and body
  void update(String newTitle, String newBody) {
    title = newTitle;
    body = newBody;
  }
}
