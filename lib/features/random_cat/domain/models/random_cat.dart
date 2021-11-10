class RandomCat {
  const RandomCat({
    required this.url,
  });

  factory RandomCat.fromJson(Map<String, dynamic> json) {
    return RandomCat(
      url: json['url'] as String,
    );
  }
  final String url;

  @override
  String toString() {
    return 'RandomCat{url: $url}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RandomCat &&
          runtimeType == other.runtimeType &&
          url == other.url);

  @override
  int get hashCode => url.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }
}
