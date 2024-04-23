import 'dart:async';
import 'package:fakestore_api/features/category/category_data/category_repo.dart';
import 'package:fakestore_api/features/category/category_domain/entities/data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:fakestore_api/features/products/product_presentation/product_bloc/product_bloc.dart';

part 'category_state.dart';
part 'category_events.dart';



class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryInitialFetchEvent>(categoryInitialFetchEvent);
    // on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> categoryInitialFetchEvent(
      CategoryInitialFetchEvent event, Emitter<CategoryState> emit) async {
        emit(CategoryFetchingLoadingState());
        // try{
                  List<String>Category=await CategoryRepositeries.fetchCategories();
                  emit(CategoryFetchingSuccessfulState(Category: Category));
                  print(Category);
        // }
        // catch(e) {
      // emit(PostsFetchingErrorState());
      // log(e.toString());
    }
    } 
    
  