import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotey/data/models/category_model.dart';

import 'package:quotey/presentation/blocs/categories/categories_bloc.dart';
import 'package:quotey/presentation/blocs/categories/categories_state.dart';

import 'package:quotey/presentation/widgets/app_loader.dart';
import 'package:quotey/presentation/widgets/failure_widget.dart';

import 'package:quotey/utils/constants.dart';

double w, h;

class CategoriesView extends StatelessWidget {

  // final categories = [
  //   'Discipline', 'Motivation', 'Inspiration',
  //   'Movie Quotes', 'Bible Verses', 'Famous Authors',
  // ];

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        padding: EdgeInsets.all(15.0),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state){
            if(state is CategoriesStateLoading){
              return AppLoader(text: 'Loading Categories');
            }
            if (state is CategoriesStateSuccess){
              return CategoriesGridView(categories: state.categoriesList);
            }
            if(state is CategoriesStateFailure) {
              return FailureWidget(reason: '');
            }
            return AppLoader(text: 'Loading Categories');
          },
        )
      )
    );
  }
}

class CategoriesGridView extends StatelessWidget {

  final List<CategoryModel> categories;
  CategoriesGridView({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0
      ),
      itemBuilder: (context, index) {
        return Container(
            constraints: BoxConstraints(
              minWidth: 150.0,
              maxWidth: 200.0,
            ),
            decoration: BoxDecoration(
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                categories[index].name,
                style: kCategoryTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            )
        );
      },
    );
  }
}