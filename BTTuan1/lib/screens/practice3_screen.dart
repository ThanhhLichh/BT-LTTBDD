import 'package:flutter/material.dart';

class Practice3Screen extends StatefulWidget {
  const Practice3Screen({super.key});

  @override
  State<Practice3Screen> createState() => _Practice3ScreenState();
}

class _Practice3ScreenState extends State<Practice3Screen> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  String selectedOp = "";
  String result = "";

  void calculate() {
    if (selectedOp.isEmpty) return;

    final aText = _aController.text.trim();
    final bText = _bController.text.trim();


    if (aText.isEmpty && bText.isEmpty) {
      setState(() => result = "Vui lòng nhập đầy đủ 2 số");
      return;
    }


    if (aText.isEmpty) {
      setState(() => result = "Hãy nhập số thứ nhất");
      return;
    }

    if (bText.isEmpty) {
      setState(() => result = "Hãy nhập số thứ hai");
      return;
    }


    final a = double.tryParse(aText);
    final b = double.tryParse(bText);

    if (a == null || b == null) {
      setState(() => result = "Dữ liệu không hợp lệ");
      return;
    }

    // 4️⃣ Tính toán
    double res;

    switch (selectedOp) {
      case "+":
        res = a + b;
        break;
      case "-":
        res = a - b;
        break;
      case "*":
        res = a * b;
        break;
      case "/":
        if (b == 0) {
          setState(() => result = "Không thể chia cho 0");
          return;
        }
        res = a / b;
        break;
      default:
        return;
    }

    setState(() {
      result = res % 1 == 0
          ? res.toInt().toString()
          : res.toString();
    });

  }

  Widget buildOperatorButton(String op, Color color) {
    final bool isSelected = selectedOp == op;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOp = op;
        });
        calculate();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: Colors.black, width: 2)
              : null,
        ),
        child: Center(
          child: Text(
            op,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 200),

              const Text(
                "Thực hành 03",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _aController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Nhập số thứ nhất",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (_) {
                  if (selectedOp.isNotEmpty) calculate();
                },
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildOperatorButton("+", Colors.red),
                  buildOperatorButton("-", Colors.orange),
                  buildOperatorButton("*", Colors.deepPurple),
                  buildOperatorButton("/", Colors.black),
                ],
              ),

              const SizedBox(height: 25),

              TextField(
                controller: _bController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Nhập số thứ hai",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (_) {
                  if (selectedOp.isNotEmpty) calculate();
                },
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.isEmpty ? "Kết quả:" : "Kết quả: $result",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _aController.dispose();
    _bController.dispose();
    super.dispose();
  }
}
