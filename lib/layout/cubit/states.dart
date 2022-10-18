abstract class NewsState{}

class NewsInitialState extends NewsState{}

class NewsNavBarState extends NewsState{}

class NewsGetBusinessLoadingState extends NewsState{}

class NewsGetBusinessSuccessState extends NewsState{}

class NewsGetBusinessErorrState extends NewsState{
  //ده علشان لما يحصل ايرور ابعته
  final String erorr;

  NewsGetBusinessErorrState(this.erorr);

}

class NewsGetSportsLoadingState extends NewsState{}

class NewsGetSportsSuccessState extends NewsState{}

class NewsGetSportsErorrState extends NewsState{
  //ده علشان لما يحصل ايرور ابعته
  final String erorr;

  NewsGetSportsErorrState(this.erorr);

}

class NewsGetScienceLoadingState extends NewsState{}

class NewsGetScienceSuccessState extends NewsState{}

class NewsGetScienceErorrState extends NewsState{
  //ده علشان لما يحصل ايرور ابعته
  final String erorr;

  NewsGetScienceErorrState(this.erorr);

}


