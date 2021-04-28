class PenduBean {
  String article;
  String frenchWord;
  String level;
  String category1;
  String category2;
  String frenchDefinition;
  String japaneseWord;

  PenduBean({this.article, this.frenchWord, this.level, this.category1, this.category2, this.frenchDefinition, this.japaneseWord});

  @override
  String toString() {
    return 'PenduBean{article: $article, frenchWord: $frenchWord, level: $level, category1: $category1, category2: $category2, frenchDefinition: $frenchDefinition, japaneseWord: $japaneseWord}';
  }
}