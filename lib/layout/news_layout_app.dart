import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/app_cubit.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayoutApp extends StatelessWidget {
  const NewsLayoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //..getBusiness انا كدا استدعيت الmethod
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(
                    Icons.search,
                  )),
                  IconButton(onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  }, icon: Icon(
                    Icons.brightness_4_outlined,
                  )),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items: cubit.bottomItems,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            );
          }),
    );
  }
}
