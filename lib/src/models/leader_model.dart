class Leaders {
  final String id;
  final int rank;
  final String user;
  final int score;
  final String image;
  final int title;

  Leaders({
    required this.id,
    required this.rank,
    required this.user,
    required this.score,
    required this.image,
    required this.title,
  });

  factory Leaders.fromJson(Map<String, dynamic> parsedJson) {
    return Leaders(
      id:   parsedJson['id'] as String,
      rank: parsedJson['rank'] as int ?? 0,
      user: parsedJson['User'] as String ?? "",
      score: parsedJson['score']['total_score'] as int ?? 0,
      image: parsedJson['image']['user_avatar'] as String ?? "",
      title: parsedJson['title_type']['title'] as int ?? 0,
    );
  }
}
