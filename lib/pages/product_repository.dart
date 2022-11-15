import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state/pages/product.dart';

final productProvider = StateNotifierProvider<ProductRepository, Product>((_) {
  return ProductRepository();
});

class ProductRepository extends StateNotifier<Product> {
  // 데이터
  Product fetch() {
    return Product(1, "바나나", 1000);
  }

  ProductRepository() : super(Product(1, "바나나", 1000));
}
