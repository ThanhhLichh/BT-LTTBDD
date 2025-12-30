import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  // Checkbox (chọn nhiều)
  bool _music = false;
  bool _sport = false;
  bool _travel = false;

  // Radio (chọn một)
  String _gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Selection',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(
          children: [

            // ===== CARD RADIO =====
            _card(
              title: 'Giới tính',
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text('Nam'),
                    value: 'male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Nữ'),
                    value: 'female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            // ===== CARD CHECKBOX =====
            _card(
              title: 'Sở thích',
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Âm nhạc'),
                    value: _music,
                    onChanged: (value) {
                      setState(() {
                        _music = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Thể thao'),
                    value: _sport,
                    onChanged: (value) {
                      setState(() {
                        _sport = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Du lịch'),
                    value: _travel,
                    onChanged: (value) {
                      setState(() {
                        _travel = value!;
                      });
                    },
                  ),
                ],
              ),
            ),


            const SizedBox(height: 20),

            // ===== RESULT =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFEFF2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Giới tính của bạn là: ${_gender == 'male' ? 'Nam' : 'Nữ'}',
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sở thích của bạn là: '
                        '${_music ? 'Âm nhạc, ' : ''}'
                        '${_sport ? 'Thể thao, ' : ''}'
                        '${_travel ? 'Du lịch' : ''}',
                    style: const TextStyle(color: Colors.black87),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  // ===== CARD WIDGET =====
  Widget _card({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFF2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
