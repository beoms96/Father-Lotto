import 'package:dad_lotto/lotto_history.dart';
import 'package:dad_lotto/pick_history.dart';
import 'package:dad_lotto/today_lotto.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dad Lotto',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIdx = 0;

  final List _pages = [TodayLotto(), PickHistory(), LottoHistory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Dad Lotto',
        style: TextStyle(color: Colors.white),
      )),
      body: Center(
        child: _pages[_selectedIdx],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Colors.lightGreen,
        currentIndex: _selectedIdx,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outlined), label: '뽑기'), // 뽑기
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: '기록'), // 이력
          BottomNavigationBarItem(
              icon: Icon(Icons.sort),
              label: '역대 번호'), // 역대 당첨번호, 최대 10개까지만 보여주고
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }
}
