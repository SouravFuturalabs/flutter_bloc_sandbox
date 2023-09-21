import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sandbox/features/home/bloc/home_bloc_bloc.dart';
import 'package:flutter_bloc_sandbox/features/home/ui/widgets/products_listTile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBlocBloc homeBlocBloc = HomeBlocBloc();
  @override
  void initState() {
    // TODO: implement initState
    homeBlocBloc.add(HomeProductFechEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBlocBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigationToWishlistAction) {
          print("ui navigated");
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HommeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadingSucessState:
            final homeLoadingSucessState = state as HomeLoadingSucessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text("product Listing"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBlocBloc.add(HomeWishListButtonNavigationEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBlocBloc.add(HomeWishListButtonNavigationEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                itemCount: homeLoadingSucessState.productList.length,
                itemBuilder: (context, index) {
                return ProductsListTimeWidget(products: homeLoadingSucessState.productList[index],);
              }),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Something e=went wrong"),
              ),
            );
          default:
            return Scaffold(
              body: Center(
                child: Text("Erorr"),
              ),
            );
        }
      },
    );
  }
}
