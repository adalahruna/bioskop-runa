import 'movie_model.dart';

class NowShowingMovies {
  static const List<Movie> list = [
    const Movie(
      title: 'Movie Title 1',
      posterPath: 'assets/images/poster_1.jpg',
      backdropPath: 'assets/images/poster_1.jpg',
      genre: 'Action',
      rating: 8.5,
      description: 'Deskripsi film 1.',
    ),
    const Movie(
      title: 'Movie Title 2',
      posterPath: 'assets/images/poster_2.jpg',
      backdropPath: 'assets/images/poster_2.jpg',
      genre: 'Comedy',
      rating: 7.8,
      description: 'Deskripsi film 2.',
    ),
  ];
}
