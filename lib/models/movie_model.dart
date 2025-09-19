class Movie {
  final String title;
  final String posterPath;
  final String genre;
  final double rating;
  final String description;
//hmm
  const Movie({
    required this.title,
    required this.posterPath,
    required this.genre,
    required this.rating,
    this.description = 'belum ada.',
  });
}
