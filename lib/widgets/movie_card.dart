import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/movie_model.dart';
import '../utils/app_theme.dart';

class MoviePosterCard extends StatelessWidget {
  final Movie movie;
  final bool isFeatured;

  const MoviePosterCard({
    super.key,
    required this.movie,
    this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showMovieDetailsDialog(context, movie);
      },
      child: Container(
        width: isFeatured ? 300 : 150,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                  child: Icon(Icons.image_not_supported,
                      color: AppTheme.offWhite));
            },
          ),
        ),
      ),
    );
  }

  void _showMovieDetailsDialog(BuildContext context, Movie movie) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.darkSlate,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    movie.backdropPath,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: GoogleFonts.poppins(
                          color: AppTheme.offWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (movie.rating > 0) ...[
                            const Icon(Icons.star,
                                color: AppTheme.mutedGold, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              '${movie.rating.toStringAsFixed(1)}',
                              style: GoogleFonts.lato(
                                  color: AppTheme.mutedGold, fontSize: 16),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        movie.description,
                        style: GoogleFonts.lato(
                            color: AppTheme.lightGrey, fontSize: 14),
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.mutedGold,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Beli Tiket',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkCharcoal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
