import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen.dart';
import '../widgets/password_field.dart';
import '../utils/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkCharcoal,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Center(
                    child: Image.asset('assets/images/logofilm.png',
                        fit: BoxFit.contain),
                  ),
                ),
                Text(
                  'Selamat Datang Kembali',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: AppTheme.offWhite,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Text(
                  'Masuk untuk melanjutkan petualangan sinematik Anda.',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.lato(color: AppTheme.lightGrey, fontSize: 16),
                ),
                const SizedBox(height: 40),
                _buildTextField(hint: 'Email', controller: _emailController),
                const SizedBox(height: 20),
                const PasswordField(),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    String userEmail = _emailController.text;
                    if (userEmail.isEmpty) {
                      userEmail = "user@gmail.com";
                    }
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            SplashScreen(userEmail: userEmail),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.mutedGold,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    'Masuk',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkCharcoal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      style: GoogleFonts.lato(color: AppTheme.offWhite),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.lato(color: AppTheme.lightGrey),
        filled: true,
        fillColor: AppTheme.darkSlate,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}
