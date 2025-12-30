import 'package:flutter/material.dart';
import '../models/payment_method.dart';
import '../models/paypal.dart';
import '../models/google_pay.dart';
import '../models/apple_pay.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? selectedMethod;

  final List<PaymentMethod> methods = [
    PayPal(),
    GooglePay(),
    ApplePay(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: selectedMethod == null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 90,
                    color: Colors.black54,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Chưa chọn phương thức",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              )
                  : Image.asset(
                selectedMethod!.iconPath,
                height: 70,
              ),
            ),
          ),

          const Divider(height: 1),


          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  ...methods.map((method) {
                    final bool isSelected = selectedMethod == method;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMethod = method;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isSelected
                                ? Colors.blue
                                : Colors.grey.shade300,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Radio<PaymentMethod>(
                              value: method,
                              groupValue: selectedMethod,
                              onChanged: (value) {
                                setState(() {
                                  selectedMethod = value;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                method.name,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Image.asset(
                              method.iconPath,
                              height: 26,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 25),


                  /// ===== NÚT CONTINUE =====
                  if (selectedMethod != null)
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
