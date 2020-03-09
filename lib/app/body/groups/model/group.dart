class Group {
  String name;
  String category;
  int interestScore = 0;

  Group(this.name, this.category);

  feature() {
    this.interestScore = this.interestScore + 1;
    print('Updated interest score to ' + this.interestScore.toString());
  }
}
