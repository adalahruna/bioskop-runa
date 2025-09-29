import 'movie_model.dart';

class ComingSoonMovies {
  static const List<Movie> list = [
    const Movie(
      title: 'Upcoming 1',
      posterPath: 'assets/images/upcoming_1.jpg',
      backdropPath: 'assets/images/upcoming_1.jpg',
      genre: 'Sci-Fi',
      rating: 0,
      description: 'Deskripsi film akan datang 1.',
    ),
    const Movie(
      title: 'Upcoming 2',
      posterPath: 'assets/images/upcoming_2.jpg',
      backdropPath: 'assets/images/upcoming_2.jpg',
      genre: 'Animation',
      rating: 0,
      description: 'Deskripsi film akan datang 2.',
    ),
  ];
}
