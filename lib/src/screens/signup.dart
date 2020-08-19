import 'dart:io';
import 'package:farmer/src/bloc/auth_bloc.dart';
import 'package:farmer/src/styles/base.dart';
import 'package:farmer/src/styles/text.dart';
import 'package:farmer/src/widgets/button.dart';
import 'package:farmer/src/widgets/social_button.dart';
import 'package:farmer/src/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context); //Provider  of bloc

    if (Platform.isAndroid) {
      return Scaffold(
        body: pageBody(context, authBloc), //  injecting bloc in constructor
      );
    } else {
      return CupertinoPageScaffold(
        child: pageBody(context, authBloc),
      );
    }
  }

  Widget pageBody(BuildContext context, AuthBloc authBloc) {
    // get the bloc
    return ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/top_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
        StreamBuilder<String>(
            stream: authBloc.email,
            builder: (context, snapshot) {
              return AppTextField(
                isIOS: Platform.isIOS,
                hintText: 'Email',
                cupertinoIcon: CupertinoIcons.mail_solid,
                materialIcon: Icons.email,
                textInputType: TextInputType.emailAddress,
                errorText: snapshot.error, // use stream in the bloc
                onChanged: authBloc.changeEmail, // use stream in the bloc
              );
            }),
        StreamBuilder<String>(
            stream: authBloc.password,
            builder: (context, snapshot) {
              return AppTextField(
                isIOS: Platform.isIOS,
                hintText: 'Password',
                cupertinoIcon: IconData(0xf4c9,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFontPackage),
                materialIcon: Icons.lock,
                obscureText: true,
                errorText: snapshot.error,
                onChanged: authBloc.changePassword,
              );
            }),
        StreamBuilder<bool>(
            stream: authBloc.isValid,
            builder: (context, snapshot) {
              return AppButton(
                  buttonText: 'Signup',
                  buttonType: (snapshot.data == true)
                      ? ButtonType.LightBlue
                      : ButtonType.Disabled);
            }),
        Center(child: Text('Or', style: TextStyles.suggestion)),
        Padding(
          padding: BaseStyles.listPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppSocialButton(socialType: SocialType.Facebook),
              AppSocialButton(socialType: SocialType.Google),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(text: 'New Here?', style: TextStyles.body, children: [
            TextSpan(
                text: 'Login',
                style: TextStyles.link,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.pushNamed(context, '/login'))
          ]),
        )
      ],
    );
  }

  Widget email() {
    if (Platform.isAndroid) {
      return TextField();
    } else {
      return CupertinoTextField();
    }
  }

  Widget password() {
    if (Platform.isAndroid) {
      return TextField();
    } else {
      return CupertinoTextField();
    }
  }
}
