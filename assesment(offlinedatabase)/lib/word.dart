class Word {
  int id;
  String word;
  String meaning;

  Word({required this.id, required this.word, required this.meaning});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
    };
  }
}
