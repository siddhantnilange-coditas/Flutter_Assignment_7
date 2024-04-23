part of 'product_bloc.dart';


abstract class ProductEvent{

}

class ProductInitialFetchEvent extends ProductEvent{
    ProductInitialFetchEvent({required this.category});
    final String category;
}

class ProductAddEvent extends ProductEvent{

}

// class GetProductsByCategory extends ProductEvent{

// }
