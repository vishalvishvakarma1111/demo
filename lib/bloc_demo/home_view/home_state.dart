part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ErrorState extends HomeState {
  final String msg;

  ErrorState(this.msg);
}

class LoadingState extends HomeState {}

class ListLoadedState extends HomeState {
  final List<ApiResponse> list;

  ListLoadedState({required this.list});

}
class ListEmptyState extends HomeState{}

