import 'dart:developer';

import 'package:asklora_flutter_test/src/bloc/crypto/crypto_cubit.dart';
import 'package:asklora_flutter_test/src/widgets/card_list.dart';
import 'package:asklora_flutter_test/src/widgets/load_more_widget.dart';
import 'package:asklora_flutter_test/src/widgets/select_option_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/crypto_response.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late CryptoCubit _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<CryptoCubit>(context);
    _bloc.getListCrypto();

    super.initState();
  }

  _showModalOption(context, Result result) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SelectOptionList(
          result: result,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Test'),
      ),
      body: BlocConsumer<CryptoCubit, CryptoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is CryptoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CryptoLoadSuccess) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.nextUrl!.isEmpty ? state.result.length : state.result.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return index == state.result.length
                          ? LoadMoreWidget(cubit: _bloc, nextUrl: state.nextUrl!)
                          : CardListWidget(
                              onTapCardFunctionl: () => _showModalOption(context, state.result[index]),
                              ticker: state.result[index].ticker!,
                            );
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
