import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotey/data/core/api_client.dart';
import 'package:quotey/data/models/category_model.dart';
import 'package:quotey/presentation/widgets/app_loader.dart';

import 'package:quotey/utils/constants.dart';

double w, h;

class CategoriesViewNoBloc extends StatefulWidget {
  @override
  _CategoriesViewNoBlocState createState() => _CategoriesViewNoBlocState();
}

class _CategoriesViewNoBlocState extends State<CategoriesViewNoBloc> {

  final APIClient client = APIClient();

  final List<CategoryModel> modeledItems = [];

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
        modeledItems.add(CategoryModel.fromJson(cat));
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
          itemCount: modeledItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemBuilder: (context, index) {
            return Container(
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
                    modeledItems[index].name,
                    style: kCategoryTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ));
          },
        ),
      ),
    );
  }

}