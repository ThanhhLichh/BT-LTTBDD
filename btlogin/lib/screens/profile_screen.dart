import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import '../services/remote_config_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime? _selectedDob;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDob = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 32),

            // 🟢 AVATAR
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : const AssetImage('assets/images/avatar.png')
                      as ImageProvider,
            ),

            const SizedBox(height: 32),

            _buildField(
              label: 'Name',
              value: user?.displayName ?? 'Unknown',
            ),

            const SizedBox(height: 16),

            _buildField(
              label: 'Email',
              value: user?.email ?? '',
            ),

            const SizedBox(height: 16),

            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _pickDate(context),
              child: _buildField(
                label: 'Date of Birth',
                value: _selectedDob == null
                    ? 'Select date'
                    : _formatDate(_selectedDob!),
                hasDropdown: true,
              ),
            ),

            const Spacer(),

            // 🔴 TEST CRASH (REMOTE CONFIG)
            if (RemoteConfigService.showTestCrashButton)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseCrashlytics.instance.crash();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text(
                    'Test Crash',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

            const SizedBox(height: 12),

            // 🔴 LOGOUT BUTTON (CUỐI MÀN)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  await AuthService.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required String value,
    bool hasDropdown = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              if (hasDropdown)
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
