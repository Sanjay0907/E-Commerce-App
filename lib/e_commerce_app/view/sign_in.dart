import 'package:e_commerce_app/e_commerce_app/controller/provider/signin_provider.dart';
import 'package:e_commerce_app/e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/e_commerce_app/utils/textStyle.dart';
import 'package:e_commerce_app/e_commerce_app/widgets/custom_paint/signin_custom_paint.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../constant/spacing/spacing.dart';
import '../widgets/button/auth_button.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          blueShade1,
          purpleShade1,
          purpleShade1,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Scaffold(
          backgroundColor: transparent,
          appBar: AppBar(
            backgroundColor: transparent,
            elevation: 0,
            centerTitle: true,
            title: Text('LOGIN', style: heading1White),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 80.h,
                width: 100.w,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(
                          100.w,
                          (100.w * 2.0)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: SignInCustomPaint(),
                    ),
                    TextInputField(
                      text: 'Email',
                      position: 5,
                    ),
                    TextInputField(
                      text: 'Password',
                      position: 18,
                    ),
                    Positioned(
                      top: 38.h,
                      right: 7.w,
                      child: Container(
                        height: 8.h,
                        width: 8.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: greenShade2),
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.arrowRight,
                          size: 3.h,
                          color: white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 13.h,
                      child: SizedBox(
                          width: 100.w,
                          child: Text(
                            'OR\n Login with Social Media',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    Positioned(
                      bottom: 4.h,
                      child: SizedBox(
                        width: 100.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AuthButton(
                              icon: FontAwesomeIcons.facebookF,
                              backgroundColor: blueShade1,
                              onTap: () {},
                            ),
                            sizedBoxWS,
                            AuthButton(
                              icon: FontAwesomeIcons.google,
                              backgroundColor: red,
                              onTap: () {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogin();
                              },
                            ),
                            sizedBoxWS,
                            AuthButton(
                              icon: FontAwesomeIcons.twitter,
                              backgroundColor: blue,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class TextInputField extends StatelessWidget {
  String text;
  double position;
  TextInputField({Key? key, required this.text, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.h,
      // right: 5.w,
      child: Container(
        height: 10.h,
        width: 90.w,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        // color: deepOrange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16, color: black),
            ),
            Container(
                height: 7.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                    border: Border.all(color: greyShade1, width: 1)),
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: text, hintStyle: TextStyle(color: greyShade1)),
                ))
          ],
        ),
      ),
    );
  }
}
