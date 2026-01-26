import 'package:flutter/material.dart';
import '../models/reset_password_data.dart';
import 'forget_password_screen.dart';

class ConfirmScreen extends StatefulWidget {
  final String email;
  final String code;
  final String password;

  const ConfirmScreen({
    super.key,
    required this.email,
    required this.code,
    required this.password,
  });

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  bool hidePassword = true;

  Widget buildReadOnlyInput({
    required IconData icon,
    required String value,
    bool obscure = false,
    bool showEye = false,
  }) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      obscureText: obscure,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),

        // ICON MẮT (CHỈ DÙNG CHO PASSWORD)
        suffixIcon: showEye
            ? IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
        )
            : null,

        filled: true,
        fillColor: Colors.white,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => ForgetPasswordScreen(
          result: ResetPasswordData(
            email: widget.email,
            code: widget.code,
            password: widget.password,
          ),
        ),
      ),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // BACK BUTTON
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // LOGO + NAME
              Image.asset('assets/images/Logo1.jpg', width: 100),
              const SizedBox(height: 8),
              const Text(
                'SmartTasks',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 30),

              // TITLE
              const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // DESCRIPTION
              const Text(
                'We are here to help you!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 24),

              // EMAIL
              buildReadOnlyInput(
                icon: Icons.person,
                value: widget.email,
              ),
              const SizedBox(height: 16),

              // CODE
              buildReadOnlyInput(
                icon: Icons.verified,
                value: widget.code,
              ),
              const SizedBox(height: 16),

              // PASSWORD (CÓ ICON 👁)
              buildReadOnlyInput(
                icon: Icons.lock,
                value: widget.password,
                obscure: hidePassword,
                showEye: true,
              ),

              const SizedBox(height: 40),

              // SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => submit(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
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
