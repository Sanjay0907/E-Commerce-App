import 'package:e_commerce_app/e_commerce_app/controller/provider/products_provider.dart';
import 'package:e_commerce_app/e_commerce_app/controller/provider/signin_provider.dart';
import 'package:e_commerce_app/signInLogic/sign_in_logic.dart';
import 'package:e_commerce_app/e_commerce_app/view/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'news_app/controller/provider/news_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<GoogleSignInProvider>(
              create: (context) => GoogleSignInProvider()),
          ChangeNotifierProvider<ProductsProvider>(
              create: (context) => ProductsProvider()),
          ChangeNotifierProvider<NewsProvider>(
              create: (context) => NewsProvider())
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInLogic(),
        ),
      );
      // return
    });
  }
}
