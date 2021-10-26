import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotey/data/models/authors_model.dart';

import 'package:quotey/presentation/blocs/authors/authors_bloc.dart';
import 'package:quotey/presentation/blocs/authors/authors_event.dart';
import 'package:quotey/presentation/blocs/authors/authors_state.dart';

import 'package:quotey/presentation/widgets/app_loader.dart';
import 'package:quotey/presentation/widgets/failure_widget.dart';

import 'package:quotey/utils/constants.dart';
import 'package:quotey/utils/strings.dart';

double w, h;

class AuthorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        padding: EdgeInsets.all(15.0),
        child: BlocConsumer<AuthorsBloc, AuthorsState>(
          listener: (context, state){

            if(state is AuthorsStateFailure) {
              SnackBar snackbar = SnackBar(content: Text('Could Not Fetch Data Right Now'));
              Scaffold.of(context).showSnackBar(snackbar);
            }

            if(state is AuthorsStateSuccess) {
              SnackBar snackbar = SnackBar(content: Text('Authors Loaded'));
              Scaffold.of(context).showSnackBar(snackbar);
            }

          },
          builder: (context, state){
            if(state is AuthorsStateFailure) {
              return FailureWidget(reason: state.reason);
            }

            if(state is AuthorsStateSuccess) {
              print(state.authorsList.length);
              return AuthorsGrid(authors: state.authorsList);
            }

            return AppLoader(text: 'Retrieving Authors...',);
          },
        )
      ),
    );
  }
}

class AuthorsGrid extends StatelessWidget {

  final List<AuthorsModel> authors;
  AuthorsGrid({@required this.authors});

  final oldList = [];

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    oldList.addAll(authors);

    print(oldList.length);

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) => _onScrollNotification(notification, context),
        child: GridView.builder(
          controller: controller,
          shrinkWrap: true,
          itemCount: authors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: ()=> {
                Navigator.pushNamed(
                  context,
                  authorQuotesRoute,
                  arguments: authors[index],
                )
              },
              child: Container(
                  constraints: BoxConstraints(
                    minWidth: 250.0,
                    maxWidth: 350.0,
                    minHeight: 250.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.accents[Random().nextInt(Colors.accents.length)],
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      authors[index].name,
                      style: kCategoryTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            );
          },
        ),
      ),

      // child: LazyLoadScrollView(
      //   onEndOfPage: ()=> BlocProvider.of<AuthorsBloc>(context).add(GetAllAuthorsEvent()),
      //   scrollOffset: 100,
      //   child: GridView.builder(
      //     controller: ScrollController(keepScrollOffset: true),
      //     shrinkWrap: true,
      //     itemCount: authors.length,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
      //     itemBuilder: (context, index) {
      //       return InkWell(
      //         onTap: ()=> {
      //           Navigator.pushNamed(
      //             context,
      //             authorQuotesRoute,
      //             arguments: authors[index],
      //           )
      //         },
      //         child: Container(
      //             constraints: BoxConstraints(
      //               minWidth: 250.0,
      //               maxWidth: 350.0,
      //               minHeight: 250.0,
      //             ),
      //             decoration: BoxDecoration(
      //               color:
      //               Colors.accents[Random().nextInt(Colors.accents.length)],
      //               borderRadius: BorderRadius.all(Radius.circular(15.0)),
      //             ),
      //             padding: EdgeInsets.all(10.0),
      //             child: Center(
      //               child: Text(
      //                 authors[index].name,
      //                 style: kCategoryTitleTextStyle,
      //                 textAlign: TextAlign.center,
      //               ),
      //             )
      //         ),
      //       );
      //     },
      //   ),
      // )
    );
  }

  bool _onScrollNotification(ScrollNotification notif, BuildContext context) {
    if (notif is ScrollEndNotification &&
        controller.position.extentAfter == 0) {
      context.read<AuthorsBloc>().add(GetAuthorsEvent());
    }
    return false;
  }

}