abstract class PaymentMethod {
  final String _id;
  final String _name;
  final String _iconPath;

  PaymentMethod({
    required String id,
    required String name,
    required String iconPath,
  })  : _id = id,
        _name = name,
        _iconPath = iconPath;

  String get id => _id;
  String get name => _name;
  String get iconPath => _iconPath;
}
