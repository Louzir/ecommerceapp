// ignore_for_file: prefer_typing_uninitialized_variables

part of 'category_bloc.dart';

@immutable
abstract class CategoryState {
  final int? uidCategory;
  final String? nameCategory;

  const CategoryState({this.uidCategory, this.nameCategory});
}

class CategoryInitial extends CategoryState {}

class SetSelectCategoryState extends CategoryState {
  final uid;
  final category;

  const SetSelectCategoryState(this.uid, this.category)
      : super(uidCategory: uid, nameCategory: category);
}
