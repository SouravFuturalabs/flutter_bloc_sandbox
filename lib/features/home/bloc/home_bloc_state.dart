part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}


abstract class HomeActionState extends HomeBlocState{}

final class HomeBlocInitial extends HomeBlocState {}

class HommeLoadingState extends HomeBlocState{

}
class HomeLoadingSucessState extends HomeBlocState{
  final List<Products> productList;

  HomeLoadingSucessState({required this.productList});
  
}

class HomeErrorState extends HomeBlocState{
  
}

class HomeNavigationToWishlistAction extends HomeActionState{}

class HomeNavigationToCarttAction extends HomeActionState{}