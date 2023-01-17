import 'package:dio/dio.dart';
import 'package:menu_app/features/product/models/product.dart';

class ProductRepository {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'http://localhost:1337/api', headers: {
    'Authorization':
        'Bearer e3e138cf15a45aef7c6e287c6f41b0763f7dbe6e5bcd37481f6e10d767a70be2bbdc5eb9866cfd26e7f0ae8d6ce74437f39cd8e263e37dd321a1e34aed4e071af9f6f20ed8d5ab2b5bd8105bd1ae42f6c8c4c8eae937399418cdfcf845598ee7f634e16c062ba677e715801e7699354911f2b63ca8fe7b2108432bce979bb674'
  }));

  Future<List<Product>> getProducts() async {
    final response =
        await _dio.get('/products', queryParameters: {'populate': 'deep'});
    return List<Product>.from(response.data['data']
        .map<Product?>((json) => Product.fromJson(json))
        .where((p) => p != null)
        .toList());
  }
}
