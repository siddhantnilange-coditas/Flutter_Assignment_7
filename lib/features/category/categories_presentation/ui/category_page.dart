import 'package:fakestore_api/features/category/categories_presentation/category_bloc/category_bloc.dart';
import 'package:fakestore_api/features/products/product_presentation/ui/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final CategoryBloc postsBloc = CategoryBloc();

  @override
  // void initState() {
  //   postsBloc.add(CategoryInitialFetchEvent());
  //   super.initState();
  // }

  @override
  Widget build(Object context) {
    return BlocProvider(
      create: (context) =>CategoryBloc()..add(CategoryInitialFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 53, 164, 255),
          title: Text('Category'),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case CategoryFetchingLoadingState:
                return const Center(child: CircularProgressIndicator());
              case CategoryFetchingSuccessfulState:
                final successState = state as CategoryFetchingSuccessfulState;

                return Container(
                  child: ListView.builder(
                    itemCount: successState.Category.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // final category = 'electornics';
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductItem(
                                        category: successState.Category[index]
                                            .toString(),
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Color.fromARGB(255, 208, 229, 246),
                            elevation: 3,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              // margin: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                // border: Border.all(
                                //   color: Colors.black,
                                //   width: 2,
                                // ),
                                // color: const Color.fromARGB(255, 208, 229, 246),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    successState.Category[index]
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
