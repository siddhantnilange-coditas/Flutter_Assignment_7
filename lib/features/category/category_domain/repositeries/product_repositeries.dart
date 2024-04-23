import 'package:fakestore_api/features/products/product_data/product_data_model.dart';
 
abstract class ProductRepository {
  Future<List<String>> getAllCategories();
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getProductsByCategory(String category);
}