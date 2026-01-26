import 'payment_method.dart';

class GooglePay extends PaymentMethod {
  GooglePay()
      : super(
    id: 'google_pay',
    name: 'Google Pay',
    iconPath: 'assets/images/googlepay.png',
  );
}
