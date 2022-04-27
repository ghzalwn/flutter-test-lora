import 'dart:convert';
import 'dart:developer';

import 'package:asklora_flutter_test/src/bloc/favorite/favorite_cubit.dart';
import 'package:asklora_flutter_test/src/models/crypto_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectOptionList extends StatefulWidget {
  final Result? result;

  const SelectOptionList({Key? key, this.result}) : super(key: key);

  @override
  State<SelectOptionList> createState() => _SelectOptionListState();
}

class _SelectOptionListState extends State<SelectOptionList> {
  late FavoriteCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<FavoriteCubit>(context);

    super.initState();
  }

  void onFavorite(context) async {
    _cubit.addToFavorite(widget.result!);
    // final List<Result> fav = jsonDecode(dataFav);

    // fav.add(result!);

    // prefs.setString('fav', jsonEncode(dataFav));
    // log('masuk');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Add To Favorite'),
        action: SnackBarAction(
          label: 'close',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Option",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            onTap: () {
              onFavorite(context);
              Navigator.pop(context);
            },
            title: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          "Add To Favorite",
                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 2),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, AppRouter.deliverySuccessScreen, arguments: DeliverySuccessArgument(bloc: bloc));
            },
            title: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "Close",
                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
