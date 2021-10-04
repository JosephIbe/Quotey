import 'package:flutter/material.dart';
import 'package:quotey/presentation/widgets/settings_card.dart';
import 'package:quotey/utils/constants.dart';
import 'package:quotey/utils/strings.dart';

double w, h;

class SettingsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SettingsCard(
              title: 'About',
              icon: Icons.help_outline,
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=> handleAboutUs(context),
            ),
            SettingsCard(
              title: 'Privacy Policy',
              icon: Icons.book_online,
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=> Navigator.pushNamed(context, policyRoute),
            ),
            SettingsCard(
              title: 'Rate Us',
              icon: Icons.star,
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=>{},
            ),
            SettingsCard(
              title: 'Share App',
              icon: Icons.share,
              trailingIcon: Icons.chevron_right_sharp,
              onTap: ()=>{},
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

}