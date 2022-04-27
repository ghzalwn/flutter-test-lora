import 'package:asklora_flutter_test/src/bloc/crypto/crypto_cubit.dart';
import 'package:flutter/material.dart';

class LoadMoreWidget extends StatelessWidget {
  final CryptoCubit cubit;
  final String nextUrl;
  const LoadMoreWidget({Key? key, required this.cubit, required this.nextUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Color(0xffF18265)),
        onPressed: () => cubit.loadMoreListCrypto(nextUrl),
        child: Text(
          "Load More",
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
