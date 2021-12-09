import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:quotey/presentation/themes/app_colors.dart';

import 'package:quotey/utils/constants.dart';
import 'package:quotey/utils/strings.dart';

import 'package:quotey/presentation/widgets/settings_card.dart';

double w, h;

class SettingsView extends StatelessWidget {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: w,
        height: h,
        child: ListView(
          children: [
            SettingsCard(
              title: 'About',
              icon: Icons.help_outline,
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=> handleAboutUs(context),
            ),
            Divider(),
            SettingsCard(
              title: 'Privacy Policy',
              icon: Icons.book_online,
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=> Navigator.pushNamed(context, policyRoute),
            ),
            Divider(),
            SettingsCard(
              title: 'Rate Us',
              icon: Icons.star,
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=>{},
            ),
            Divider(),
            SettingsCard(
              title: 'Share App',
              icon: Icons.share,
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=>{},
            ),
            Divider(),
            SettingsCard(
              title: 'Contact Us',
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=> openContactUsDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  handleAboutUs(BuildContext context) {
    showDialog(
        context: context,
        builder: (context){
          return Center(
            child: Container(
              width: 250.0,
              height: 150.0,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quotey', style: kAboutAppNameTextStyle,),
                  SizedBox(height: 10.0),
                  Text('Version: 1.0.0', style: kAppVersionTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                          onPressed: ()=> Navigator.pop(context),
                          child: Text('Close', style: kAppVersionTextStyle,)
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  openContactUsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      elevation: 4.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          )),
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
              height: 550.0,
              padding: EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Help Us Understand Your Needs/Issues'),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        hintText: 'Peter Parker',
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'abc@hello.com',
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      controller: subjectController,
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        hintText: 'Feature Suggestion, Bug Fix, Crash Report',
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        labelText: 'Message',
                        hintText: 'Share more details on the situation',
                      ),
                      maxLines: 5,
                      autocorrect: true,
                    ),
                    SizedBox(height: 20.0,),
                    ElevatedButton(
                      onPressed: ()=> sendEmail(context, nameController.text, emailController.text, subjectController.text, messageController.text),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0)),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        );
      },
    );
  }

  Future<void> sendEmail(BuildContext context, String name, String email, String subject, String message) async {
    if(name.isEmpty || email.isEmpty || subject.isEmpty || message.isEmpty) {
      Navigator.pop(context);

      final snackbar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text('All Fields are Required', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        padding: EdgeInsets.all(5.0),
        elevation: 2.0,
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
    } else {
      print(subject);
      final Email email = Email(
        body: message,
        subject: subject,
        recipients: ['joseph.ibeawuchi@gmail.com'],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    }
  }

}