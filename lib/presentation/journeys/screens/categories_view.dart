import 'dart:math';

import 'package:flutter/material.dart';

import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/models/category_model.dart';

import 'package:quotey/presentation/widgets/app_loader.dart';

import 'package:quotey/utils/constants.dart';
import 'package:quotey/utils/strings.dart';

double w, h;

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  final APIClient client = APIClient();

  final List<CategoryModel> categoriesList = [];

  var hasData = false;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  fetchCategories() async {
    var response = await client.get(path: '/tags');
    if(response != null) {
      for (var cat in response) {
        categoriesList.add(CategoryModel.fromJson(cat));
      }
      setState(()=> hasData = true);
    } else {
      setState(()=> hasData = false);
    }
  }

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        padding: EdgeInsets.all(15.0),
        child: hasData == false
            ? AppLoader(text: 'Loading Categories...')
            : GridView.builder(
          shrinkWrap: true,
          itemCount: categoriesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: ()=> {
                Navigator.pushNamed(
                  context,
                  categoryQuotesRoute,
                  arguments: categoriesList[index].name,
                )
              },
              child: Container(
                  constraints: BoxConstraints(
                    minWidth: 250.0,
                    maxWidth: 350.0,
                    minHeight: 250.0,
                  ),
                  decoration: BoxDecoration(
                    color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      categoriesList[index].name,
                      style: kCategoryTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            );
          },
        ),
      ),
    );
  }

}