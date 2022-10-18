import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/app_state_cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

bool isDark = false;
void changeAppMode(){
  isDark = !isDark;
  CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
  emit(AppChangeModeState());
  });
}

}