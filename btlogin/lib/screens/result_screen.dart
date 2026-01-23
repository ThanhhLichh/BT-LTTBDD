import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class ResultScreen extends StatelessWidget {
  final bool success;
  final String? email;
  final String? errorMessage;

  const ResultScreen({
    super.key,
    required this.success,
    this.email,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: success ? Colors.green[100] : Colors.red[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                success ? 'Success!' : 'Google Sign-In Failed',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: success ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 8),

              if (success) ...[
                Text(
                  'Hi $email\nWelcome to UTHSmartTasks',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // 🔴 LOGOUT BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await AuthService.signOut();

                      // quay về login screen
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ] else ...[
                Text(
                  errorMessage ?? 'Login error',
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
