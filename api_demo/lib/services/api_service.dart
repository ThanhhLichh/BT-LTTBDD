import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String url =
      'https://mock.apidog.com/m1/890655-872447-default/v2/product';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json =
      jsonDecode(response.body);

      final product = Product.fromJson(json);

      // 🔥 BỌC VÀO LIST
      return [product];
    } else {
      throw Exception('Failed to load product');
    }
  }
}
