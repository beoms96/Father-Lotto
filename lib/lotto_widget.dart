import 'package:flutter/material.dart';

class LottoView extends StatelessWidget {
  const LottoView({Key? key, required this.numList}) : super(key: key);

  final List<int> numList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OneLotto(curNum: numList[0]),
        OneLotto(curNum: numList[1]),
        OneLotto(curNum: numList[2]),
        OneLotto(curNum: numList[3]),
        OneLotto(curNum: numList[4]),
        OneLotto(curNum: numList[5])
      ],
    );
  }
}

Color numToColor(int num) {
  if (num >= 1 && num <= 10) {
    return Colors.yellow;
  } else if (num >= 11 && num <= 20) {
    return Colors.blue;
  } else if (num >= 21 && num <= 30) {
    return Colors.red;
  } else if (num >= 31 && num <= 40) {
    return Colors.black;
  } else {
    return Colors.green;
  }
}

class OneLotto extends StatelessWidget {
  const OneLotto({Key? key, required this.curNum}) : super(key: key);

  final int curNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        curNum.toString(),
        style: TextStyle(color: Colors.white),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration:
          BoxDecoration(color: numToColor(curNum), shape: BoxShape.circle),
    );
  }
}
