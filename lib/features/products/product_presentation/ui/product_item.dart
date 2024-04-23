import 'package:fakestore_api/features/products/product_presentation/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.category});
  final String category;
  //  print(successState.posts[index].toString())
  final ProductBloc productBloc = ProductBloc();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (_) =>
          ProductBloc()..add(ProductInitialFetchEvent(category: category)),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 53, 164, 255),
            title: Text('Products'),
          ),
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case ProductFetchingLoadingState():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ProductFetchingSuccessfulState:
                  final productSuccessState =
                      state as ProductFetchingSuccessfulState;
                  return Container(
                    child: ListView.builder(
                        itemCount: productSuccessState.products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 15.0, right: 15.0),
                            child: Card(
                              // color: Color.fromRGBO(182, 255, 251, 1),
                              elevation: 5.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    width: 2,
                                  ),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 208, 255, 249),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            productSuccessState
                                                .products[index].image,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        productSuccessState
                                            .products[index].title,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Container(
                                    //       child: Text(
                                    //     productSuccessState
                                    //         .products[index].category
                                    //         .toUpperCase(),
                                    //     style: TextStyle(fontSize: 20),
                                    //   )),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            // color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 193, 193, 193),
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Description',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  productSuccessState
                                                      .products[index]
                                                      .description,
                                                  style:
                                                      const TextStyle(fontSize: 20),
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),

                              // Text(productSuccessState.products[index].image),
                              // Text(productSuccessState.products[index].rating.rate.toString()),
                              //  print(productSuccessState.products[index].toString()),
                            ),
                          );
                        }),
                  );
                default:
                  return const SizedBox();
              }
            },
          )),
    );
  }
}
