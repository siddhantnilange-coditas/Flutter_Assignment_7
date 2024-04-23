import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fakestore_api/features/products/product_data/product_data_model.dart';
import 'package:fakestore_api/features/products/product_data/product_repo.dart';
import 'package:flutter/foundation.dart';

part 'product_state.dart';
part 'product_event.dart';



class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductInitialFetchEvent>(productInitialFetchEvent);
  }

  Future<void> productInitialFetchEvent(
      ProductInitialFetchEvent event, Emitter<ProductState> emit) async {
    emit(ProductFetchingLoadingState());
    try {
      List<ProductModel> products = await ProductRepositories.fetchProducts(event.category);
      emit(ProductFetchingSuccessfulState(products: products));
    } catch (e) {
      emit(ProductFetchingErrorState());
    }
  }
}


// class ProductBloc extends Bloc<ProductBloc, ProductState> {
//   // ProductBloc() : super(ProductInitial()) {
//       ProductBloc() : super(ProductInitial()) {

//     // on<ProductInitialFetchEvent>(productInitialFetchEvent);
//         on<ProductInitialFetchEvent>(productInitialFetchEvent);

//     // on<PostAddEvent>(postAddEvent);
//   }

//   FutureOr<void> productInitialFetchEvent(
//       ProductFetchingLoadingState event, Emitter<ProductState> emit) async {
//         emit(ProductFetchingLoadingState());
//         // try{
//                   List<String>posts=await ProductRepositeries.fetchProducts();
//                   emit(ProductFetchingSuccessfulState(posts: posts));
//                   print(posts);
//         // }
//         // catch(e) {
//       // emit(PostsFetchingErrorState());
//       // log(e.toString());
//     }
//     } 
    
  