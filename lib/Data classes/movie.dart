class Movie {
  String? id;
  String? title;

  // DateTime? dateTime;
  static const String collectionName = 'movie';

  Movie({
    this.id = '',
    required this.title,
    // required this.dateTime,
  });

  Movie.fromFireStore(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    // dateTime = DateTime.fromMillisecondsSinceEpoch(data['dateTime']);
  }

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      // 'dateTime': dateTime?.millisecondsSinceEpoch,
    };
  }
}
