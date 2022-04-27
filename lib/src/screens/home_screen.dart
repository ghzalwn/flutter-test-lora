import 'dart:developer';

import 'package:asklora_flutter_test/src/bloc/crypto/crypto_cubit.dart';
import 'package:asklora_flutter_test/src/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xffF18265)),
                onPressed: () => Navigator.pushNamed(context, AppRouter.listScreen),
                child: Text(
                  "List Crypto",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xffF18265)),
                onPressed: () => Navigator.pushNamed(context, AppRouter.favoriteScreen),
                child: Text(
                  "Favorite",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
