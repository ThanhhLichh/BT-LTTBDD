import 'package:flutter/material.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Images',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ===== IMAGE FROM NETWORK =====
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://tuyensinhhuongnghiep.vn/upload/images/2023/09/08/truong-dai-hoc-giao-thong-van-tai-tphcm.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'https://tuyensinhhuongnghiep.vn/upload/images/2023/09/08/truong-dai-hoc-giao-thong-van-tai-tphcm.jpg',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5
                ),
              ),



              const SizedBox(height: 24),

              // ===== IMAGE FROM ASSETS =====
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/UTH-InAPP.jpg', // 👈 đổi đúng tên ảnh ông đang có
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'In app',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
