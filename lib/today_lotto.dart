import 'package:dad_lotto/lotto_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TodayLotto extends StatefulWidget {
  const TodayLotto({Key? key}) : super(key: key);

  @override
  State<TodayLotto> createState() => _TodayLottoState();
}

class _TodayLottoState extends State<TodayLotto> {
  List<List<int>> curList = [];
  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (listScrollController.hasClients) {
            final position = listScrollController.position.maxScrollExtent;
            listScrollController.animateTo(
              position,
              duration: Duration(milliseconds: 5),
              curve: Curves.easeOut,
            );
          }
          setState(() {
            curList.add(makeLottoNum());
          });
        },
        isExtended: true,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: (ListView.builder(
          controller: listScrollController,
          itemBuilder: (context, i) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [LottoView(numList: curList[i])],
            );
          },
          itemCount: curList.length)),
    );
  }
}

// 1 ~ 45 까지 겹치지 않는 로또 번호 뽑는 함수
List<int> makeLottoNum() {
  List<int> newNumList = [];

  while (newNumList.length < 6) {
    int randNum = Random().nextInt(45) + 1;
    if (!newNumList.contains(randNum)) {
      newNumList.add(randNum);
    }
  }

  newNumList.sort();
  return newNumList;
}
