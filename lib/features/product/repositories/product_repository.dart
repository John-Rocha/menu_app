import 'package:dio/dio.dart';
import 'package:menu_app/features/product/models/product.dart';

class ProductRepository {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'http://localhost:1337/api', headers: {
    'Authorization':
        'Bearer a58ef96ac7a9f7ef7a05edd9aa3dc777d2af81249058e7d64e8f56e4c4842726418dc1ef206810b8fabed6ce79dc0916a3a89a51c624fce1c305184bea830606c3024fac7e38dc87c0558c918440ac9879c54faf4299f1812b9e1940ec8c930e42bed619f12d6a971f8fa0a19fa64d55820b5ec018bf5505705183ff9f653741'
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
