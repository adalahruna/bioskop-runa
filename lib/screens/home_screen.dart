import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_screen.dart';
import '../widgets/movie_card.dart';
import '../utils/app_theme.dart';
import '../models/now_showing_movies.dart';
import '../models/coming_soon_movies.dart';

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
      MovieListPage(userEmail: widget.userEmail),
      const Center(
        child: Text('Halaman Tiket Saya', //masih belum kelar
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

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key, required this.userEmail});
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    final String userName = userEmail.split('@').first.isEmpty
        ? 'User'
        : userEmail.split('@').first;
    final String capitalizedUserName = userName.isNotEmpty
        ? userName[0].toUpperCase() + userName.substring(1)
        : "User";
    final List<String> genres = [
      'Action',
      'Comedy',
      'Horror',
      'Sci-Fi',
      'Romance',
      'Thriller',
      'Animation'
    ];

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 20.0, left: 24.0, right: 24.0),
          child: Text(
            'Selamat datang, $capitalizedUserName',
            style: GoogleFonts.lato(color: AppTheme.lightGrey, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: AppTheme.darkSlate,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Text(
                    genres[index],
                    style: GoogleFonts.poppins(
                        color: AppTheme.offWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                );
              },
            ),
          ),
        ),
        _buildSectionTitle('Sedang Tayang'),
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller:
                PageController(viewportFraction: 0.75, initialPage: 5000),
            itemCount: 10000,
            itemBuilder: (context, index) {
              final int realIndex = index % NowShowingMovies.list.length;
              return MoviePosterCard(
                movie: NowShowingMovies.list[realIndex],
                isFeatured: true,
              );
            },
          ),
        ),
        _buildSectionTitle('Akan Datang'),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: ComingSoonMovies.list.length,
            itemBuilder: (context, index) {
              return MoviePosterCard(movie: ComingSoonMovies.list[index]);
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 30.0, bottom: 20.0, left: 24.0, right: 24.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            color: AppTheme.offWhite,
            fontSize: 22,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
