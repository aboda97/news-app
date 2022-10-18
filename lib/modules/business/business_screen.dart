import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context, state){},
      builder: (context, state){

        var listBusiness = NewsCubit.get(context).business;
        return articleBuilder(listBusiness, context);
          /* ConditionalBuilder(
            condition: listBusiness.length > 0,
            builder: (context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index)=>buildArticleItem(listBusiness[index]),
              separatorBuilder: (context, index)=>myDivider(),
              itemCount: 10,
            ),
            fallback: (context)=> Center(child: CircularProgressIndicator())
        );

           */
      },
    );
  }
}
