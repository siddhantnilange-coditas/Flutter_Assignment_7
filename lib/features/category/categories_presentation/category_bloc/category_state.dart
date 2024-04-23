// part of 'category_bloc.dart';
part of 'category_bloc.dart';


abstract class CategoryState {}

abstract class CategoryActionState extends CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryFetchingLoadingState extends CategoryState {}

class CaFettegorychingErrorState extends CategoryState {}

class CategoryFetchingSuccessfulState extends CategoryState {
  final List<String> Category;
  CategoryFetchingSuccessfulState({
    required this.Category,
  });
}

class PostsAdditionSuccessState extends CategoryActionState{}


class PostsAdditionErrorState extends CategoryActionState{}
