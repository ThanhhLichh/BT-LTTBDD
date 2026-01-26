import 'payment_method.dart';

class ApplePay extends PaymentMethod {
  ApplePay()
      : super(
    id: 'apple_pay',
    name: 'Apple Pay',
    iconPath: 'assets/images/applepay.png',
  );
}
