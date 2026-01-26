import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String hint;

  const PasswordInput({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: hide,
      validator: (v) =>
      v == null || v.isEmpty ? 'Không được để trống' : null,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            hide ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () => setState(() => hide = !hide),
        ),
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
