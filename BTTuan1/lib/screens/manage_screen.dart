import 'package:flutter/material.dart';
import '../models/library.dart';
import '../models/book.dart';

class ManageScreen extends StatefulWidget {
  final Library library;
  const ManageScreen({super.key, required this.library});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  late final TextEditingController staffController;

  @override
  void initState() {
    super.initState();
    staffController = TextEditingController(text: widget.library.currentStaff.name);
    widget.library.addListener(_refresh);
  }

  void _refresh() => setState(() {});

  @override
  void dispose() {
    widget.library.removeListener(_refresh);
    staffController.dispose();
    super.dispose();
  }

  Future<void> _showAddBookDialog() async {
    final c = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Thêm sách"),
        content: TextField(
          controller: c,
          decoration: const InputDecoration(hintText: "Nhập tên sách"),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Hủy")),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, c.text.trim()),
            child: const Text("Thêm"),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      widget.library.addBook(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lib = widget.library;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(height: 6),
              const Text(
                "Hệ thống\nQuản lý Thư viện",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 18),

              /// ===== Nhân viên =====
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nhân viên",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: staffController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 42,
                    width: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        final name = staffController.text.trim();
                        if (name.isNotEmpty) lib.changeStaffName(name);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E5AA7),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("Đổi", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 18),

              /// ===== Danh sách sách =====
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Danh sách sách",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
              ),
              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9E9E9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: lib.books.map((Book b) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                            color: Colors.black.withOpacity(0.06),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: b.isBorrowed,
                            onChanged: (_) => lib.toggleBorrow(b),
                            activeColor: const Color(0xFFB00020), // giống màu tick đỏ mẫu
                          ),
                          Expanded(
                            child: Text(
                              b.title,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const Spacer(),

              /// ===== Nút Thêm =====
              SizedBox(
                width: 160,
                height: 44,
                child: ElevatedButton(
                  onPressed: _showAddBookDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0E5AA7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Thêm", style: TextStyle(color: Colors.white)),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
