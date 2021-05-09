String formateGenres(List<String> genres) {
    if (genres.length == 0) return '';
    var str = genres[0];
    for (int i = 1; i < genres.length; i++) {
      str = '$str | ${genres[i]}';
    }
    return str;
  }