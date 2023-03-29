class Post {
  final int postId;
  final String voiceUrl;
  final double voiceLength;
  final String address;
  final String text;
  final List<String> photoList;
  final bool isFavorite;
  final int favoriteCount;
  bool isExpand;

  Post({
    required this.postId,
    required this.voiceUrl,
    required this.voiceLength,
    required this.address,
    required this.text,
    required this.photoList,
    required this.isFavorite,
    required this.favoriteCount,
    this.isExpand = false,
  });

  // Serialize(직렬화)
  Map<String, dynamic> toJson() => {
        'postId': postId,
        'voiceUrl': voiceUrl,
        'voiceLength': voiceLength,
        'address': address,
        'text': text,
        'photoList': photoList,
        'isFavorite': isFavorite,
        'favoriteCount': favoriteCount,
      };

  // Deserialize(파싱?)
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      voiceUrl: json['voiceUrl'],
      voiceLength: json['voiceLength'],
      address: (json['address2'] ?? '') +
          ' ' +
          (json['address3'] ?? '') +
          ' ' +
          (json['address4'] ?? ''),
      text: json['text'],
      photoList: List.from(json['photoList']),
      isFavorite: json['isfavorite'],
      favoriteCount: json['favoriteCount'],
    );
  }
}
