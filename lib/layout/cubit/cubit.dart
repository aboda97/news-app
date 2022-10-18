import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

import '../../shared/network/remote/dio_helper.dart';

 class NewsCubit extends Cubit<NewsState> {
  //constructor
  NewsCubit() : super(NewsInitialState());

  //object
  static NewsCubit get(context) => BlocProvider.of(context);

  //to move in the botton must create the currentIndex
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    // if(index == 1)
    //   SportsScreen();
    // if(index == 2)
    //   ScienceScreen();
    emit(NewsNavBarState());
  }

  List<dynamic> business = [];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'88e86952e1c746cea291f7f9e12aa4e6',
        }).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(NewsGetBusinessErorrState(erorr.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports(){
    emit(NewsGetBusinessLoadingState());

    if(sports.length == 0){
      DioHelper.getData(url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'88e86952e1c746cea291f7f9e12aa4e6',
          }).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((erorr){
        print(erorr.toString());
        emit(NewsGetSportsErorrState(erorr.toString()));
      });
    }
    else{
      emit(NewsGetSportsSuccessState());
    }

  }

  List<dynamic> science = [];
  void getScience(){
    emit(NewsGetBusinessLoadingState());

    if(science.length == 0){
      DioHelper.getData(url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'88e86952e1c746cea291f7f9e12aa4e6',
          }).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((erorr){
        print(erorr.toString());
        emit(NewsGetScienceErorrState(erorr.toString()));
      });
    }
    else{
      emit(NewsGetScienceSuccessState());
    }
  }
}

