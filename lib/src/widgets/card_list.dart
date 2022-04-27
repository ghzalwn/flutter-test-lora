import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  final Function onTapCardFunctionl;
  final String? ticker;
  const CardListWidget({Key? key, required this.onTapCardFunctionl, this.ticker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => _showModalOption(context, state.result[index]),
      onTap: () => onTapCardFunctionl(),
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // 'Ticker ${state.result[index].ticker!}',
                        'Ticker ${ticker!}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
