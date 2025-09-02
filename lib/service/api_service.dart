import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String _base = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    final res = await http.get(Uri.parse('$_base/products'));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Product.fromJson(e)).toList();
    }
    throw Exception('Failed to load products (${res.statusCode})');
  }

  Future<Product> fetchProduct(int id) async {
    final res = await http.get(Uri.parse('$_base/products/$id'));
    if (res.statusCode == 200) {
      return Product.fromJson(jsonDecode(res.body));
    }
    throw Exception('Failed to load product ($id)');
  }
}
