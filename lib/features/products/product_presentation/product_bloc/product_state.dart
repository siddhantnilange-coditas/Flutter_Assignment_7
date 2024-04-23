// part of 'category_bloc.dart';
part of 'product_bloc.dart';


abstract class ProductState {}

abstract class ProductActionState extends ProductState {}

class ProductInitial extends ProductState {
  
}

class ProductFetchingLoadingState extends ProductState {}

class ProductFetchingErrorState extends ProductState {}

class ProductFetchingSuccessfulState extends ProductState {
  final List<ProductModel> products;
  ProductFetchingSuccessfulState({
    required this.products,
  });
}

class ProductdditionSuccessState extends ProductActionState{}


class ProductAdditionErrorState extends ProductActionState{}
