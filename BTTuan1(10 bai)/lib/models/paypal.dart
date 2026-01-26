import 'payment_method.dart';

class PayPal extends PaymentMethod {
  PayPal()
      : super(
    id: 'paypal',
    name: 'PayPal',
    iconPath: 'assets/images/paypal.png',
  );
}
