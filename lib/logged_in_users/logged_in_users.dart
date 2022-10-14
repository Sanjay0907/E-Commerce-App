import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/logged_in_users/controller/service/database_services.dart';
import 'package:e_commerce_app/logged_in_users/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'controller/sign_out_service.dart';

class LoggedInUser extends StatelessWidget {
  const LoggedInUser({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // log(user!.photoURL!);
    DataBaseServices.getUserDataFromServer();
    return Scaffold(
      appBar: AppBar(
        // leading:
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'App Users',
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: StreamBuilder<List<UserModel>>(
        stream: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data;
            return ListView(
              children: users!.map(userWidget).toList(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Opps! something went wrong'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }

  Stream<List<UserModel>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());

  Widget userWidget(UserModel user) => ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.photoUrl!),
        ),
        title: Text(user.name!),
        subtitle: Text(user.email!),
      );
}
