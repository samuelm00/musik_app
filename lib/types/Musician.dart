class Musician {
  Musician(String id, String name, String style, String genre, String website,
      String biography) {
    this.id = id;
    this.name = name;
    this.genre = genre;
    this.style = style;
    this.website = website;
    this.biography = biography;
    this.markedAsFovorite = false;
  }

  String id;
  String name;
  String style;
  String genre;
  String website;
  String biography;
  bool markedAsFovorite;
}
