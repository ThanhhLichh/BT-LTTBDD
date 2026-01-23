import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'result_screen.dart';
import 'profile_screen.dart';
import '../services/user_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'home_screen.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> login(BuildContext context) async {
    try {
      final result = await AuthService.signInWithGoogle();

      if (result == null || result.user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Google Sign-In Failed'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

// 🔥 LƯU USER VÀO FIRESTORE
      await UserService.saveUser(user: result.user!);
      await FirebaseAnalytics.instance.logLogin(loginMethod: 'google');


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => const HomeScreen(),
        ),
      );

    } catch (e) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ResultScreen(
            success: false,
            errorMessage: 'Google Sign-In Failed',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔝 TOP CONTENT (LOGO + APP NAME)
              Column(
                children: [
                  const SizedBox(height: 80),

                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),// nền xanh nhạt
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/Logo1.jpg',
                      width: 800,
                      fit: BoxFit.contain,
                    ),
                  ),


                  const SizedBox(height: 30),

                  const Text(
                    'SmartTasks',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'A simple and efficient to-do app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              // 🔽 WELCOME + BUTTON
              Column(
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Ready to explore? Log in to get started.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () => login(context),
                      icon: Image.asset(
                        'assets/images/google_logo.png',
                        width: 20,
                      ),
                      label: const Text(
                        'SIGN IN WITH GOOGLE',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),


              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  '© UTHSmartTasks',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),


        ),
      ),
    );
  }
}
