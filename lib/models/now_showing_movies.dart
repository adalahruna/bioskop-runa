import 'movie_model.dart';

class NowShowingMovies {
  static const List<Movie> list = [
    const Movie(
      title: 'Movie Title 1',
      posterPath: 'assets/images/sbrtyg.jpg',
      genre: 'Action',
      rating: 8.5,
      description: 'Jojo peak',
    ),
    const Movie(
      title: 'Movie Title 2',
      posterPath: 'assets/images/poster_2.jpg',
      genre: 'Comedy',
      rating: 7.8,
      description:
          'Kisah lucu seorang detektif yang harus memecahkan kasus paling aneh dalam hidupnya. Siap-siap tertawa terbahak-bahak!',
    ),
    const Movie(
      title: 'Movie Title 3',
      posterPath: 'assets/images/poster_3.jpg',
      genre: 'Horror',
      rating: 8.0,
      description:
          'Film horor psikologis yang akan menghantui pikiran Anda lama setelah menonton. Jangan nonton sendirian!',
    ),
  ];
}
