import 'package:flutter/material.dart';
import '../models/library.dart';

class StaffScreen extends StatefulWidget {
  final Library library;
  const StaffScreen({super.key, required this.library});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  void initState() {
    super.initState();
    widget.library.addListener(_refresh);
  }

  void _refresh() => setState(() {});

  @override
  void dispose() {
    widget.library.removeListener(_refresh);
    super.dispose();
  }

  Future<void> _addUserDialog() async {
    final c = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Thêm người dùng"),
        content: TextField(
          controller: c,
          decoration: const InputDecoration(hintText: "Nhập tên người dùng"),
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
      widget.library.addUser(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lib = widget.library;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Nhân viên")),
        floatingActionButton: FloatingActionButton(
          onPressed: _addUserDialog,
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.badge),
                title: Text("Nhân viên hiện tại: ${lib.currentStaff.name}"),
              ),
              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Danh sách người dùng", style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: lib.users.length,
                  itemBuilder: (_, i) {
                    final u = lib.users[i];
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(u.name),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
