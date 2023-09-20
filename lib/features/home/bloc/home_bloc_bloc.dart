import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeCartButtonNaviagtionEvent>(homeCartButtonNaviagtionEvent);
    on<HomeWishListButtonNavigationEvent>(homeWishListButtonNavigationEvent);
  }

  FutureOr<void> homeCartButtonNaviagtionEvent(
      HomeCartButtonNaviagtionEvent event, Emitter<HomeBlocState> emit) {
        print("cart navigation button clicked");
        emit(HomeNavigationToCarttAction());
      }

  FutureOr<void> homeWishListButtonNavigationEvent(
      HomeWishListButtonNavigationEvent event, Emitter<HomeBlocState> emit) {
        print("wishlist navigation button clicked");
        emit(HomeNavigationToWishlistAction());
      }
}
