part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeProductWishListButtonClicked extends HomeBlocEvent{}

class HomeProductCartButtonClicked extends HomeBlocEvent{}

class HomeWishListButtonNavigationEvent extends HomeBlocEvent{}

class HomeCartButtonNaviagtionEvent extends HomeBlocEvent{}