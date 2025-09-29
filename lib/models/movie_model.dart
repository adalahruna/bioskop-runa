class Movie {
  final String title;
  final String posterPath;
  final String backdropPath;
  final String genre;
  final double rating;
  final String description;

  const Movie({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.genre,
    required this.rating,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'No Title',
      posterPath: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      backdropPath: 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
      genre: 'Movie',
      rating: (json['vote_average'] as num).toDouble(),
      description: json['overview'] ?? 'No Description Available',
    );
  }
}
