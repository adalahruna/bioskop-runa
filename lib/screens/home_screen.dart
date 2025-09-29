import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_screen.dart';
import '../widgets/movie_card.dart';
import '../utils/app_theme.dart';
import '../models/movie_model.dart';
import '../models/coming_soon_movies.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userEmail});
  final String userEmail;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const MovieListPage(), // <-- Kita ubah ini
      const Center(
        child: Text('Halaman Tiket Saya',
            style: TextStyle(color: AppTheme.offWhite, fontSize: 24)),
      ),
      ProfileScreen(userEmail: widget.userEmail),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkCharcoal,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/images/logofilm.png', height: 32),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppTheme.offWhite),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: AppTheme.mutedGold,
              child: Text('A', style: TextStyle(color: AppTheme.darkCharcoal)),
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num_outlined), label: 'Tiket Saya'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: AppTheme.darkSlate,
        selectedItemColor: AppTheme.mutedGold,
        unselectedItemColor: AppTheme.lightGrey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final ApiService _apiService = ApiService();
  late Future<List<Movie>> _nowShowingMovies;
  late Future<List<Movie>> _comingSoonMovies;

  @override
  void initState() {
    super.initState();
    _nowShowingMovies = _apiService.getNowShowingMovies();
    _comingSoonMovies = _apiService.getComingSoonMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildMoviesSection('Sedang Tayang', _nowShowingMovies,
            isPageView: true),
        _buildMoviesSection('Akan Datang', _comingSoonMovies,
            isPageView: false),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMoviesSection(String title, Future<List<Movie>> futureMovies,
      {required bool isPageView}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 30.0, bottom: 20.0, left: 24.0, right: 24.0),
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: AppTheme.offWhite,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: isPageView ? 400 : 250,
          child: FutureBuilder<List<Movie>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.white)));
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final movies = snapshot.data!;
                return isPageView
                    ? PageView.builder(
                        controller: PageController(viewportFraction: 0.75),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MoviePosterCard(
                              movie: movies[index], isFeatured: true);
                        },
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MoviePosterCard(movie: movies[index]);
                        },
                      );
              } else {
                return const Center(
                    child: Text('Tidak ada film ditemukan',
                        style: TextStyle(color: Colors.white)));
              }
            },
          ),
        ),
      ],
    );
  }
}
