import 'package:flutter/material.dart';
import '../models/reset_password_data.dart';
import '../widgets/custom_input.dart';
import 'verify_code_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final ResetPasswordData? result;

  const ForgetPasswordScreen({super.key, this.result});

  @override
  State<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ResetPasswordData? result;

  @override
  void initState() {
    super.initState();
    result = widget.result;
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(email);
  }

  void goNext() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              VerifyCodeScreen(email: emailCtrl.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset('assets/images/Logo1.jpg', width: 100),
            const SizedBox(height: 8),
            const Text(
              'SmartTasks',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 30),
            const Text(
              'Forget Password?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your Email, we will send you a verification \n code.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),
            Form(
              key: formKey,
              child: CustomInput(
                controller: emailCtrl,
                hint: 'Your Email',
                icon: Icons.email,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Không được để trống';
                  }
                  if (!isValidEmail(v)) {
                    return 'Email không hợp lệ';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: goNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            if (result != null) ...[
              const SizedBox(height: 30),
              const Divider(),
              Text('Email: ${result!.email}'),
              Text('Code: ${result!.code}'),
              Text('Password: ${result!.password}'),
            ]
          ],
        ),
      ),
    );
  }
}
