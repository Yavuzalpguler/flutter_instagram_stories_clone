class StoriesPersist {
  final String id;
  final int currentIndex;

  const StoriesPersist({required this.id, required this.currentIndex});

  static StoriesPersist fromJson(Map<String, dynamic> json) {
    return StoriesPersist(
      id: json['id'] as String,
      currentIndex: json['currentIndex'] as int,
    );
  }

  Map<String, dynamic>? toJson() {
    return <String, dynamic>{
      'id': id,
      'currentIndex': currentIndex,
    };
  }
}
