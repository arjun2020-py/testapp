part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeProduct extends HomeState {
  final ApiProductResponse apiProductResponse;
  HomeProduct({required this.apiProductResponse});
}
