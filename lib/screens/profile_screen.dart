import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';
import '../utils/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  final String userEmail;

  const ProfileScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    final String initial =
        userEmail.isNotEmpty ? userEmail[0].toUpperCase() : '?';

    return Scaffold(
      backgroundColor: AppTheme.darkCharcoal,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppTheme.mutedGold,
                child: Text(
                  initial,
                  style: GoogleFonts.poppins(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkCharcoal,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Anda login sebagai:',
                style: GoogleFonts.lato(
                  color: AppTheme.lightGrey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                userEmail, //ada runa juga
                style: GoogleFonts.poppins(
                  color: AppTheme.offWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout, color: AppTheme.darkCharcoal),
                label: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkCharcoal,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.mutedGold,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
