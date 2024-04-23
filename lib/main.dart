
import 'package:fakestore_api/features/category/categories_presentation/category_bloc/category_bloc.dart';
import 'package:fakestore_api/features/category/categories_presentation/ui/category_page.dart';
import 'package:fakestore_api/features/products/product_presentation/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main()async{
  runApp( MultiBlocProvider(
    providers: [
      // BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()..add(CategoryInitialFetchEvent())),
      // BlocProvider<ProductBloc>(create: (context) => ProductBloc()..add(ProductInitialFetchEvent())),
      // BlocProvider<AllProductBloc>(create: (context) => AllProductBloc()..add(AllProductInitialFetchEvent())),

    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryPage(),
    );
  }
}