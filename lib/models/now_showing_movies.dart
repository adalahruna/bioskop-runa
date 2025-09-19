import 'movie_model.dart';

class NowShowingMovies {
  static const List<Movie> list = [
    const Movie(
      title: 'Jojo Bizzare Adventure',
      posterPath: 'assets/images/sbrtyg.jpg',
      genre: 'Action',
      rating: 9.5,
      description: 'Jojo peak', //memang anime bagus
    ),
    const Movie(
      title: 'Movie Title 2',
      posterPath: 'assets/masihnyariposter.jpg',
      genre: 'Comedy',
      rating: 7.8,
      description: 'gatau deh',
    ),
    const Movie(
      title: 'Movie Title 3',
      posterPath: 'assets/images/masihnyariposter.jpg',
      genre: 'Horror',
      rating: 8.0,
      description: 'gatau deh',
    ),
  ];
}
