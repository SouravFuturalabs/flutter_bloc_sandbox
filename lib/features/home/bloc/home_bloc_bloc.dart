import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sandbox/data/product_data.dart';
import 'package:flutter_bloc_sandbox/features/home/models/home_products_model.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeProductFechEvent>(homeProductFechEvent);
    on<HomeCartButtonNaviagtionEvent>(homeCartButtonNaviagtionEvent);
    on<HomeWishListButtonNavigationEvent>(homeWishListButtonNavigationEvent);
  }

  Future<FutureOr<void>> homeProductFechEvent(
      HomeProductFechEvent event, Emitter<HomeBlocState> emit) async {
   emit(HommeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadingSucessState(
        productList: ProductsData.productList
            .map((e) => Products(
                id: e["id"],
                name: e["name"],
                price: e["price"],
                rating: e["rating"],
                image: e["image"]))
            .toList()));
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
