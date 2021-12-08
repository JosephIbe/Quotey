import 'package:flutter/material.dart';
import 'package:quotey/presentation/themes/app_colors.dart';

import 'package:quotey/utils/constants.dart';
import 'package:quotey/utils/strings.dart';

import 'package:quotey/presentation/widgets/settings_card.dart';

double w, h;

class SettingsView extends StatelessWidget {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
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
              height: 450.0,
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
                        labelText: 'Your Email',
                        hintText: 'abc@hello.com',
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        labelText: 'Your Message',
                        hintText: 'Enter Your Message or Subject',
                      ),
                      maxLines: 5,
                      autocorrect: true,
                    ),
                    SizedBox(height: 20.0,),
                    ElevatedButton(
                      onPressed: ()=>{},
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

}