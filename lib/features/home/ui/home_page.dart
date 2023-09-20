import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sandbox/features/home/bloc/home_bloc_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBlocBloc homeBlocBloc = HomeBlocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBlocBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
       if(state is HomeNavigationToWishlistAction){
        print("ui navigated");
       }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("product Listing"),
            actions: [
              IconButton(onPressed: () {
                homeBlocBloc.add(HomeWishListButtonNavigationEvent());
              }, icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBlocBloc.add(HomeWishListButtonNavigationEvent());
                  }, icon: Icon(Icons.shopping_bag_outlined))
            ],
          ),
        );
      },
    );
  }
}
