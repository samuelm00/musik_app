class Album {
  Album(String title, String imgUrl, String year, String genre,
      String description) {
    this.title = title;
    this.imgUrl = imgUrl;
    this.year = int.parse(year);
    this.genre = genre;
    this.description = description;
  }

  String title;
  String imgUrl;
  int year;
  String genre;
  String description;
}
